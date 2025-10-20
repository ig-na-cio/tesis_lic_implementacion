input_file_path = "../rtl/de0nano.v"
output_file_path = "../rtl/de0nano.v"


with open(input_file_path, 'r') as f:
    text = f.read()

# Bloques que vamos a modificar
# Existen mejores maneras

text = text.replace(
    """always @(*) begin
    builder_master <= 6'd0;
    builder_master[0] <= (builder_shared_adr[29:20] == 10'd963);
    builder_master[1] <= (builder_shared_adr[29:14] == 16'd61441);
    builder_master[2] <= (builder_shared_adr[29:14] == 1'd0);
    builder_master[3] <= (builder_shared_adr[29:10] == 17'd65536);
    builder_master[4] <= (builder_shared_adr[29:23] == 6'd32);
    builder_master[5] <= (builder_shared_adr[29:14] == 16'd61440);
end""",
    """always @(*) begin
    builder_master <= #1 6'd0;
    builder_master[0] <= #1 (builder_shared_adr[29:20] == 10'd963);
    builder_master[1] <= #1 (builder_shared_adr[29:14] == 16'd61441);
    builder_master[2] <= #1 (builder_shared_adr[29:14] == 1'd0);
    builder_master[3] <= #1 (builder_shared_adr[29:10] == 17'd65536);
    builder_master[4] <= #1 (builder_shared_adr[29:23] == 6'd32);
    builder_master[5] <= #1 (builder_shared_adr[29:14] == 16'd61440);
end"""
)

text = text.replace(
"""always @(*) begin
    builder_litedramnativeportconverter_next_state <= 1'd0;
    main_soclinux_port_cmd_payload_addr <= 24'd0;
    main_soclinux_port_cmd_payload_we <= 1'd0;
    main_soclinux_port_cmd_valid <= 1'd0;
    main_soclinux_wishbone_bridge_cmd_addr_litedramnativeportconverter_next_value1 <= 21'd0;
    main_soclinux_wishbone_bridge_cmd_addr_litedramnativeportconverter_next_value_ce1 <= 1'd0;
    main_soclinux_wishbone_bridge_cmd_count_litedramnativeportconverter_next_value0 <= 3'd0;
    main_soclinux_wishbone_bridge_cmd_count_litedramnativeportconverter_next_value_ce0 <= 1'd0;
    main_soclinux_wishbone_bridge_cmd_ready <= 1'd0;
    main_soclinux_wishbone_bridge_cmd_we_litedramnativeportconverter_next_value2 <= 1'd0;
    main_soclinux_wishbone_bridge_cmd_we_litedramnativeportconverter_next_value_ce2 <= 1'd0;
    builder_litedramnativeportconverter_next_state <= builder_litedramnativeportconverter_state;
    case (builder_litedramnativeportconverter_state)
        1'd1: begin
            main_soclinux_port_cmd_valid <= 1'd1;
            main_soclinux_port_cmd_payload_we <= main_soclinux_wishbone_bridge_cmd_we;
            main_soclinux_port_cmd_payload_addr <= ((main_soclinux_wishbone_bridge_cmd_addr * 4'd8) + main_soclinux_wishbone_bridge_cmd_count);
            if (main_soclinux_port_cmd_ready) begin
                main_soclinux_wishbone_bridge_cmd_count_litedramnativeportconverter_next_value0 <= (main_soclinux_wishbone_bridge_cmd_count + 1'd1);
                main_soclinux_wishbone_bridge_cmd_count_litedramnativeportconverter_next_value_ce0 <= 1'd1;
                if ((main_soclinux_wishbone_bridge_cmd_count == 3'd7)) begin
                    builder_litedramnativeportconverter_next_state <= 1'd0;
                end
            end
        end
        default: begin
            main_soclinux_wishbone_bridge_cmd_ready <= 1'd1;
            if (main_soclinux_wishbone_bridge_cmd_valid) begin
                main_soclinux_wishbone_bridge_cmd_count_litedramnativeportconverter_next_value0 <= 1'd0;
                main_soclinux_wishbone_bridge_cmd_count_litedramnativeportconverter_next_value_ce0 <= 1'd1;
                main_soclinux_wishbone_bridge_cmd_addr_litedramnativeportconverter_next_value1 <= main_soclinux_wishbone_bridge_cmd_payload_addr;
                main_soclinux_wishbone_bridge_cmd_addr_litedramnativeportconverter_next_value_ce1 <= 1'd1;
                main_soclinux_wishbone_bridge_cmd_we_litedramnativeportconverter_next_value2 <= main_soclinux_wishbone_bridge_cmd_payload_we;
                main_soclinux_wishbone_bridge_cmd_we_litedramnativeportconverter_next_value_ce2 <= 1'd1;
                builder_litedramnativeportconverter_next_state <= 1'd1;
            end
        end
    endcase
end""",
    """always @(*) begin
    builder_litedramnativeportconverter_next_state <= #1 1'd0;
    main_soclinux_port_cmd_payload_addr <= #1 24'd0;
    main_soclinux_port_cmd_payload_we <= #1 1'd0;
    main_soclinux_port_cmd_valid <= #1 1'd0;
    main_soclinux_wishbone_bridge_cmd_addr_litedramnativeportconverter_next_value1 <= #1 21'd0;
    main_soclinux_wishbone_bridge_cmd_addr_litedramnativeportconverter_next_value_ce1 <= #1 1'd0;
    main_soclinux_wishbone_bridge_cmd_count_litedramnativeportconverter_next_value0 <= #1 3'd0;
    main_soclinux_wishbone_bridge_cmd_count_litedramnativeportconverter_next_value_ce0 <= #1 1'd0;
    main_soclinux_wishbone_bridge_cmd_ready <= #1 1'd0;
    main_soclinux_wishbone_bridge_cmd_we_litedramnativeportconverter_next_value2 <= #1 1'd0;
    main_soclinux_wishbone_bridge_cmd_we_litedramnativeportconverter_next_value_ce2 <= #1 1'd0;
    builder_litedramnativeportconverter_next_state <= #1 builder_litedramnativeportconverter_state;
    case (builder_litedramnativeportconverter_state)
        1'd1: begin
            main_soclinux_port_cmd_valid <= #1 1'd1;
            main_soclinux_port_cmd_payload_we <= #1 main_soclinux_wishbone_bridge_cmd_we;
            main_soclinux_port_cmd_payload_addr <= #1 ((main_soclinux_wishbone_bridge_cmd_addr * 4'd8) + main_soclinux_wishbone_bridge_cmd_count);
            if (main_soclinux_port_cmd_ready) begin
                main_soclinux_wishbone_bridge_cmd_count_litedramnativeportconverter_next_value0 <= #1 (main_soclinux_wishbone_bridge_cmd_count + 1'd1);
                main_soclinux_wishbone_bridge_cmd_count_litedramnativeportconverter_next_value_ce0 <= #1 1'd1;
                if ((main_soclinux_wishbone_bridge_cmd_count == 3'd7)) begin
                    builder_litedramnativeportconverter_next_state <= #1 1'd0;
                end
            end
        end
        default: begin
            main_soclinux_wishbone_bridge_cmd_ready <= #1 1'd1;
            if (main_soclinux_wishbone_bridge_cmd_valid) begin
                main_soclinux_wishbone_bridge_cmd_count_litedramnativeportconverter_next_value0 <= #1 1'd0;
                main_soclinux_wishbone_bridge_cmd_count_litedramnativeportconverter_next_value_ce0 <= #1 1'd1;
                main_soclinux_wishbone_bridge_cmd_addr_litedramnativeportconverter_next_value1 <= #1 main_soclinux_wishbone_bridge_cmd_payload_addr;
                main_soclinux_wishbone_bridge_cmd_addr_litedramnativeportconverter_next_value_ce1 <= #1 1'd1;
                main_soclinux_wishbone_bridge_cmd_we_litedramnativeportconverter_next_value2 <= #1 main_soclinux_wishbone_bridge_cmd_payload_we;
                main_soclinux_wishbone_bridge_cmd_we_litedramnativeportconverter_next_value_ce2 <= #1 1'd1;
                builder_litedramnativeportconverter_next_state <= #1 1'd1;
            end
        end
    endcase
end"""
)

text = text.replace(
"""always @(*) begin
    builder_fsm_next_state <= 2'd0;
    main_soclinux_interface_ack <= 1'd0;
    main_soclinux_interface_dat_r <= 128'd0;
    main_soclinux_wishbone_bridge_aborted_fsm_next_value <= 1'd0;
    main_soclinux_wishbone_bridge_aborted_fsm_next_value_ce <= 1'd0;
    main_soclinux_wishbone_bridge_cmd_valid <= 1'd0;
    main_soclinux_wishbone_bridge_is_ongoing <= 1'd0;
    builder_fsm_next_state <= builder_fsm_state;
    case (builder_fsm_state)
        1'd1: begin
            main_soclinux_wishbone_bridge_is_ongoing <= 1'd1;
            main_soclinux_wishbone_bridge_aborted_fsm_next_value <= ((~main_soclinux_interface_cyc) | main_soclinux_wishbone_bridge_aborted);
            main_soclinux_wishbone_bridge_aborted_fsm_next_value_ce <= 1'd1;
            if ((main_soclinux_wishbone_bridge_wdata_valid & main_soclinux_wishbone_bridge_wdata_ready)) begin
                main_soclinux_interface_ack <= (main_soclinux_interface_cyc & (~main_soclinux_wishbone_bridge_aborted));
                builder_fsm_next_state <= 1'd0;
            end
        end
        2'd2: begin
            main_soclinux_wishbone_bridge_aborted_fsm_next_value <= ((~main_soclinux_interface_cyc) | main_soclinux_wishbone_bridge_aborted);
            main_soclinux_wishbone_bridge_aborted_fsm_next_value_ce <= 1'd1;
            if (main_soclinux_wishbone_bridge_rdata_valid) begin
                main_soclinux_interface_ack <= (main_soclinux_interface_cyc & (~main_soclinux_wishbone_bridge_aborted));
                main_soclinux_interface_dat_r <= main_soclinux_wishbone_bridge_rdata_payload_data;
                builder_fsm_next_state <= 1'd0;
            end
        end
        default: begin
            main_soclinux_wishbone_bridge_cmd_valid <= (main_soclinux_interface_cyc & main_soclinux_interface_stb);
            if (((main_soclinux_wishbone_bridge_cmd_valid & main_soclinux_wishbone_bridge_cmd_ready) & main_soclinux_interface_we)) begin
                builder_fsm_next_state <= 1'd1;
            end
            if (((main_soclinux_wishbone_bridge_cmd_valid & main_soclinux_wishbone_bridge_cmd_ready) & (~main_soclinux_interface_we))) begin
                builder_fsm_next_state <= 2'd2;
            end
            main_soclinux_wishbone_bridge_aborted_fsm_next_value <= 1'd0;
            main_soclinux_wishbone_bridge_aborted_fsm_next_value_ce <= 1'd1;
        end
    endcase
end""",
"""always @(*) begin
    builder_fsm_next_state <= #1 2'd0;
    main_soclinux_interface_ack <= #1 1'd0;
    main_soclinux_interface_dat_r <= #1 128'd0;
    main_soclinux_wishbone_bridge_aborted_fsm_next_value <= #1 1'd0;
    main_soclinux_wishbone_bridge_aborted_fsm_next_value_ce <= #1 1'd0;
    main_soclinux_wishbone_bridge_cmd_valid <= #1 1'd0;
    main_soclinux_wishbone_bridge_is_ongoing <= #1 1'd0;
    builder_fsm_next_state <= #1 builder_fsm_state;
    case (builder_fsm_state)
        1'd1: begin
            main_soclinux_wishbone_bridge_is_ongoing <= #1 1'd1;
            main_soclinux_wishbone_bridge_aborted_fsm_next_value <= #1 ((~main_soclinux_interface_cyc) | main_soclinux_wishbone_bridge_aborted);
            main_soclinux_wishbone_bridge_aborted_fsm_next_value_ce <= #1 1'd1;
            if ((main_soclinux_wishbone_bridge_wdata_valid & main_soclinux_wishbone_bridge_wdata_ready)) begin
                main_soclinux_interface_ack <= #1 (main_soclinux_interface_cyc & (~main_soclinux_wishbone_bridge_aborted));
                builder_fsm_next_state <= #1 1'd0;
            end
        end
        2'd2: begin
            main_soclinux_wishbone_bridge_aborted_fsm_next_value <= #1 ((~main_soclinux_interface_cyc) | main_soclinux_wishbone_bridge_aborted);
            main_soclinux_wishbone_bridge_aborted_fsm_next_value_ce <= #1 1'd1;
            if (main_soclinux_wishbone_bridge_rdata_valid) begin
                main_soclinux_interface_ack <= #1 (main_soclinux_interface_cyc & (~main_soclinux_wishbone_bridge_aborted));
                main_soclinux_interface_dat_r <= #1 main_soclinux_wishbone_bridge_rdata_payload_data;
                builder_fsm_next_state <= #1 1'd0;
            end
        end
        default: begin
            main_soclinux_wishbone_bridge_cmd_valid <= #1 (main_soclinux_interface_cyc & main_soclinux_interface_stb);
            if (((main_soclinux_wishbone_bridge_cmd_valid & main_soclinux_wishbone_bridge_cmd_ready) & main_soclinux_interface_we)) begin
                builder_fsm_next_state <= #1 1'd1;
            end
            if (((main_soclinux_wishbone_bridge_cmd_valid & main_soclinux_wishbone_bridge_cmd_ready) & (~main_soclinux_interface_we))) begin
                builder_fsm_next_state <= #1 2'd2;
            end
            main_soclinux_wishbone_bridge_aborted_fsm_next_value <= #1 1'd0;
            main_soclinux_wishbone_bridge_aborted_fsm_next_value_ce <= #1 1'd1;
        end
    endcase
end"""
)

with open(output_file_path, 'w') as f:
    f.write(text)

print("Listo")
