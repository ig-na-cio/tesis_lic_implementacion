module sdram #(parameter PRINT = 1)(
    input  wire         clock,
    input  wire         cke,
    input  wire         cs_n,
    input  wire         ras_n,
    input  wire         cas_n,
    input  wire         we_n,
    input  wire  [12:0] a,
    input  wire  [1:0]  ba,
    inout  wire [15:0]  dq,
    input  wire  [1:0]  dm);

    localparam BANKS = 4;
    localparam ROWS  = 8192;
    localparam COLS  = 512;
    localparam CAS_LATENCY = 3;
    
    reg [15:0] mem [0:BANKS-1][0:ROWS-1][0:COLS-1];
    reg [12:0] open_row [0:BANKS-1]; // Direccion
    reg        row_open [0:BANKS-1]; // Estado
    
    // Comandos segun la especificacion de la IS42S16160
    // Las combinaciones de las distintas conexiones se usan para generar comandos
    // Son algunos
    
    wire cmd_valid             = (~cs_n & cke);
    wire nop                   = (cmd_valid &&  ras_n &&  cas_n &&  we_n);
    wire read                  = (cmd_valid &&  ras_n && ~cas_n &&  we_n);
    wire write                 = (cmd_valid &&  ras_n && ~cas_n && ~we_n);
    wire bank_activate         = (cmd_valid && ~ras_n &&  cas_n &&  we_n);
    wire precharge_bank        = (cmd_valid && ~ras_n &&  cas_n && ~we_n && !a[10]);
    wire precharge_all         = (cmd_valid && ~ras_n &&  cas_n && ~we_n && a[10]);
    wire auto_refresh          = (cmd_valid && ~ras_n && ~cas_n &&  we_n);
    wire mode_register_set     = (cmd_valid && ~ras_n && ~cas_n && ~we_n);
    
    
    
    
    // Es complejo escribir y leer porque se usa el mismo wire
    // Para solucionarlo usamos registros

    // Los pipes son para simular la latencia
    
    reg [15:0] read_data_pipe [0:CAS_LATENCY];
    reg        read_valid_pipe [0:CAS_LATENCY];
    
    reg [15:0] dq_out;
    reg        dq_oe; // Output enable
    
    
    assign dq = dq_oe ? dq_out : 16'bz;
    
    // Inicializacion de la memoria
    integer i, j, k;
    initial begin
        for (i = 0; i < BANKS; i = i + 1) begin
            row_open[i] = 0;
            open_row[i] = 0;
        end
        for (i = 0; i <= CAS_LATENCY; i = i + 1) begin
            read_valid_pipe[i] = 0;
            read_data_pipe[i] = 16'h0;
        end
        dq_oe = 0;
        dq_out = 16'h0;
        
        // Toda la memoria en 0s
        for (i = 0; i < BANKS; i = i + 1) begin
            for (j = 0; j < ROWS; j = j + 1) begin
                for (k = 0; k < COLS; k = k + 1) begin
                    mem[i][j][k] = 16'h0000;
                end
            end
        end
    end
    
    // Semantica de los comandos
    always @(posedge clock) begin
        if (!cke) begin
            dq_oe <= 0;
        end else begin


            // Read
            // Operacion de Lectura
            // Se efectua al final
            if (read && row_open[ba]) begin
                // Iniciar pipeline de lectura
                read_data_pipe[0] <= mem[ba][open_row[ba]][a[8:0]];
                read_valid_pipe[0] <= 1;
                if (PRINT) begin
                    $display("SDRAM: READ bank=%0d row=%0h col=%0h (Delay (latency): %0d cycles)", 
                                            ba, open_row[ba], a[8:0], CAS_LATENCY);
                end
            end 

            // Write
            // Operacion de Escritura 
            else if (write && row_open[ba]) begin
                mem[ba][open_row[ba]][a[8:0]] <= dq;
                if (PRINT) begin
                    $display("SDRAM: WRITE bank=%0d row=%0h col=%0h data=%0h", 
                         ba, open_row[ba], a[8:0], dq);
                end
            end 

            // Bank activate
            // Abre una fila adentro de un banco
            else if (bank_activate) begin
                open_row[ba] <= a;
                row_open[ba] <= 1;
                if (PRINT) begin
                    $display("SDRAM: BANK ACTIVATE bank=%0d row=%0h", ba, a);
                end
            end 
            
            // Precharge bank
            // Cierra una fila abierta en un banco
            else if (precharge_bank) begin
                row_open[ba] <= 0;
                if (PRINT) begin
                    $display("SDRAM: PRECHARGE BANK bank=%0d", ba);
                end
            end 

            // Precharge all banks
            // Cierra las filas abiertas de todos los bancos
            else if (precharge_all) begin
                for (i = 0; i < BANKS; i = i + 1)
                    row_open[i] <= 0;
                if (PRINT) begin
                    $display("SDRAM: PRECHARGE ALL BANKS");
                end
            end 

            // Auto refresh
            // Refresca la memoria, como es dinamica
            // Solo necesario en el chip real, no lo implementamos
            else if (auto_refresh) begin
                if (PRINT) begin
                    $display("SDRAM: AUTO REFRESH");
                end
            end 

            // Mode Register Set
            // Configura la SDRAM, no lo implementamos
            else if (mode_register_set) begin
                if (PRINT) begin
                    $display("SDRAM: MODE REGISTER SET reg = %0h", a);
                end
            end 
            
            else begin
                read_valid_pipe[0] <= 0;
            end
            
            // Generamos la latencia moviendo datos en el pipe
            for (i = 1; i <= CAS_LATENCY; i = i + 1) begin
                read_data_pipe[i] <= read_data_pipe[i-1];
                read_valid_pipe[i] <= read_valid_pipe[i-1];
            end
            
            // Efectuamos la lectura
            if (read_valid_pipe[CAS_LATENCY]) begin
                dq_out <= read_data_pipe[CAS_LATENCY];
                dq_oe <= 1;
                if (PRINT) begin
                    $display("SDRAM: READ OUTPUT data=%0h", read_data_pipe[CAS_LATENCY]);
                end
            end else begin
                dq_oe <= 0;
            end
        end
    end
endmodule