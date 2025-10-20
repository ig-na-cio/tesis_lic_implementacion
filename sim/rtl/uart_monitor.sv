module uart_monitor #(
    parameter CLK_FREQUENCY  = 50_000_000,  // Frecuencia del clock en Hz
    parameter BAUD_RATE = 115200       // Baud Rate
)(
    input  logic clk,
    input  logic uart_tx
);

    // Cantidad de ciclos por bit
    localparam integer BIT_TICKS = CLK_FREQUENCY / BAUD_RATE;

    typedef enum logic [2:0] {
        IDLE,
        START,
        DATA,
        STOP
    } state_t;

    state_t state = IDLE;
    integer tick_counter = 0;
    integer bit_index = 0;
    byte received_byte = 8'h00;

    always_ff @(posedge clk) begin
        case (state)
            IDLE: begin
                // Estado habitual de espera
                if (uart_tx == 0) begin // detecta start bit
                    state <= START;
                    tick_counter <= BIT_TICKS / 2; // muestreo en el medio
                end
            end

            START: begin
                // Inicializamos los contadores y pasamos a DATA
                if (tick_counter == 0) begin
                    tick_counter <= BIT_TICKS - 1;
                    bit_index <= 0;
                    state <= DATA;
                end else
                    tick_counter <= tick_counter - 1;
            end

            DATA: begin
                // Guardamos la transmicion bit a bit
                if (tick_counter == 0) begin 
                    received_byte[bit_index] <= uart_tx; 
                    tick_counter <= BIT_TICKS - 1;
                    bit_index <= bit_index + 1;

                    // Ya esta el byte completo
                    if (bit_index == 7)
                        state <= STOP; 
                end else
                    tick_counter <= tick_counter - 1;
            end

            STOP: begin
                // Ya tenemos el byte en received_byte
                if (tick_counter == 0) begin
                    // Mostrar byte recibido
                    if (received_byte >= 32 && received_byte < 127)
                        $display("UART RX: '%s' (0x%02h)", received_byte, received_byte);
                    else
                        $display("UART RX: No imprimible (0x%02h) ", received_byte);

                    state <= IDLE; // Volvemos a estar esperando
                end else
                    tick_counter <= tick_counter - 1;
            end
        endcase
    end

endmodule