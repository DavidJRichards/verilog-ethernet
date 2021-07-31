# XDC constraints for the Qmtech Wukong XC7100 board
# part: xc7a100tfgg676-2

# General configuration
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 2.5 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true [current_design]

# System clocks
# 50 MHz Clock definition
set_property -dict { PACKAGE_PIN M21   IOSTANDARD LVCMOS33 } [get_ports { CLOCK_50 }]; 
create_clock -name CLOCK_50_ -period 20.000 [get_ports {CLOCK_50}]

# LEDs on camera connector
set_property -dict {LOC D26  IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports {led[0]}]
set_property -dict {LOC E26  IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports {led[1]}]
set_property -dict {LOC E23  IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports {led[2]}]
set_property -dict {LOC F23  IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports {led[3]}]
set_property -dict {LOC G21  IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports {led[4]}]
set_property -dict {LOC G20  IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports {led[5]}]
set_property -dict {LOC F25  IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports {led[6]}]
set_property -dict {LOC G25  IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports {led[7]}]

set_false_path -to [get_ports {led[*]}]
set_output_delay 0 [get_ports {led[*]}]

# Reset button
set_property -dict {PACKAGE_PIN H7 IOSTANDARD LVCMOS33} [get_ports reset]

set_false_path -from [get_ports {reset}]
set_input_delay 0 [get_ports {reset}]

#pin 18 on camera connector
set_property -dict {PACKAGE_PIN D25 IOSTANDARD LVCMOS33} [get_ports clock_out]


# Push buttons
#set_property -dict {LOC AA12 IOSTANDARD LVCMOS15} [get_ports btnu]
#set_property -dict {LOC AC6  IOSTANDARD LVCMOS15} [get_ports btnl]
#set_property -dict {LOC AB12 IOSTANDARD LVCMOS15} [get_ports btnd]
#set_property -dict {LOC AG5  IOSTANDARD LVCMOS15} [get_ports btnr]
#set_property -dict {LOC G12  IOSTANDARD LVCMOS25} [get_ports btnc]

#set_false_path -from [get_ports {btnu btnl btnd btnr btnc}]
#set_input_delay 0 [get_ports {btnu btnl btnd btnr btnc}]

# Toggle switches
#set_property -dict {LOC Y29  IOSTANDARD LVCMOS25} [get_ports {sw[0]}]
#set_property -dict {LOC W29  IOSTANDARD LVCMOS25} [get_ports {sw[1]}]
#set_property -dict {LOC AA28 IOSTANDARD LVCMOS25} [get_ports {sw[2]}]
#set_property -dict {LOC Y28  IOSTANDARD LVCMOS25} [get_ports {sw[3]}]

#set_false_path -from [get_ports {sw[*]}]
#set_input_delay 0 [get_ports {sw[*]}]

# UART
#pmod J10 (upper from left)
#6 3V3
#5 Gnd
#4 RxD
#3 TxD
#2 RTS
#1 CTS
set_property -dict {LOC D5  IOSTANDARD LVCMOS33} [get_ports uart_rxd]
set_property -dict {LOC G5  IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports uart_txd]
set_property -dict {LOC G7  IOSTANDARD LVCMOS33 SLEW SLOW DRIVE 12} [get_ports uart_rts]
set_property -dict {LOC G8  IOSTANDARD LVCMOS33} [get_ports uart_cts]

set_false_path -to [get_ports {uart_txd uart_rts}]
set_output_delay 0 [get_ports {uart_txd uart_rts}]
set_false_path -from [get_ports {uart_rxd uart_cts}]
set_input_delay 0 [get_ports {uart_rxd uart_cts}]

# Gigabit Ethernet GMII PHY
set_property -dict {LOC P4   IOSTANDARD LVCMOS25} [get_ports phy_rx_clk] ;# from U37.C1 RXCLK
set_property -dict {LOC M4   IOSTANDARD LVCMOS25} [get_ports {phy_rxd[0]}] ;# from U37.B2 RXD0
set_property -dict {LOC N3   IOSTANDARD LVCMOS25} [get_ports {phy_rxd[1]}] ;# from U37.D3 RXD1
set_property -dict {LOC N4   IOSTANDARD LVCMOS25} [get_ports {phy_rxd[2]}] ;# from U37.C3 RXD2
set_property -dict {LOC P3   IOSTANDARD LVCMOS25} [get_ports {phy_rxd[3]}] ;# from U37.B3 RXD3
set_property -dict {LOC R3   IOSTANDARD LVCMOS25} [get_ports {phy_rxd[4]}] ;# from U37.C4 RXD4
set_property -dict {LOC T3   IOSTANDARD LVCMOS25} [get_ports {phy_rxd[5]}] ;# from U37.A1 RXD5
set_property -dict {LOC T4   IOSTANDARD LVCMOS25} [get_ports {phy_rxd[6]}] ;# from U37.A2 RXD6
set_property -dict {LOC T5   IOSTANDARD LVCMOS25} [get_ports {phy_rxd[7]}] ;# from U37.C5 RXD7
set_property -dict {LOC L3   IOSTANDARD LVCMOS25} [get_ports phy_rx_dv] ;# from U37.B1 RXCTL_RXDV
set_property -dict {LOC U5   IOSTANDARD LVCMOS25} [get_ports phy_rx_er] ;# from U37.D4 RXER
set_property -dict {LOC U1   IOSTANDARD LVCMOS25 SLEW FAST DRIVE 16} [get_ports phy_gtx_clk] ;# from U37.E2 TXC_GTXCLK
set_property -dict {LOC M2   IOSTANDARD LVCMOS25} [get_ports phy_tx_clk] ;# from U37.D1 TXCLK
set_property -dict {LOC R2  IOSTANDARD LVCMOS25 SLEW FAST DRIVE 16} [get_ports {phy_txd[0]}] ;# from U37.F1 TXD0
set_property -dict {LOC P1   IOSTANDARD LVCMOS25 SLEW FAST DRIVE 16} [get_ports {phy_txd[1]}] ;# from U37.G2 TXD1
set_property -dict {LOC N2  IOSTANDARD LVCMOS25 SLEW FAST DRIVE 16} [get_ports {phy_txd[2]}] ;# from U37.G3 TXD2
set_property -dict {LOC N1  IOSTANDARD LVCMOS25 SLEW FAST DRIVE 16} [get_ports {phy_txd[3]}] ;# from U37.H1 TXD3
set_property -dict {LOC M1  IOSTANDARD LVCMOS25 SLEW FAST DRIVE 16} [get_ports {phy_txd[4]}] ;# from U37.H2 TXD4
set_property -dict {LOC L2  IOSTANDARD LVCMOS25 SLEW FAST DRIVE 16} [get_ports {phy_txd[5]}] ;# from U37.H3 TXD5
set_property -dict {LOC K2  IOSTANDARD LVCMOS25 SLEW FAST DRIVE 16} [get_ports {phy_txd[6]}] ;# from U37.J1 TXD6
set_property -dict {LOC K1  IOSTANDARD LVCMOS25 SLEW FAST DRIVE 16} [get_ports {phy_txd[7]}] ;# from U37.J2 TXD7
set_property -dict {LOC T2  IOSTANDARD LVCMOS25 SLEW FAST DRIVE 16} [get_ports phy_tx_en] ;# from U37.E1 TXCTL_TXEN
set_property -dict {LOC J1   IOSTANDARD LVCMOS25 SLEW FAST DRIVE 16} [get_ports phy_tx_er] ;# from U37.F2 TXER
#set_property -dict {LOC A7   } [get_ports phy_sgmii_rx_p] ;# MGTXRXP1_117 GTXE2_CHANNEL_X0Y9 / GTXE2_COMMON_X?Y? from U37.A7 SOUT_P
#set_property -dict {LOC A8   } [get_ports phy_sgmii_rx_n] ;# MGTXRXN1_117 GTXE2_CHANNEL_X0Y9 / GTXE2_COMMON_X?Y? from U37.A8 SOUT_N
#set_property -dict {LOC A3   } [get_ports phy_sgmii_tx_p] ;# MGTXTXP1_117 GTXE2_CHANNEL_X0Y9 / GTXE2_COMMON_X?Y? from U37.A3 SIN_P
#set_property -dict {LOC A4   } [get_ports phy_sgmii_tx_n] ;# MGTXTXN1_117 GTXE2_CHANNEL_X0Y9 / GTXE2_COMMON_X?Y? from U37.A4 SIN_N
#set_property -dict {LOC G8   } [get_ports phy_sgmii_clk_p] ;# MGTREFCLK0P_117 from U2.7
#set_property -dict {LOC G7   } [get_ports phy_sgmii_clk_n] ;# MGTREFCLK0N_117 from U2.6
set_property -dict {LOC R1   IOSTANDARD LVCMOS25 SLEW SLOW DRIVE 12} [get_ports phy_reset_n] ;# from U37.K3 RESET_B
set_property -dict {LOC M6  IOSTANDARD LVCMOS25} [get_ports phy_int_n] ;# from U37.L1 INT_B # DJRM PLACEHOLDER, NOT CONNECTED
#set_property -dict {LOC J21  IOSTANDARD LVCMOS25 SLEW SLOW DRIVE 12} [get_ports phy_mdio] ;# from U37.M1 MDIO
#set_property -dict {LOC R23  IOSTANDARD LVCMOS25 SLEW SLOW DRIVE 12} [get_ports phy_mdc] ;# from U37.L3 MDC

create_clock -period 40.000 -name phy_tx_clk [get_ports phy_tx_clk]
create_clock -period 8.000 -name phy_rx_clk [get_ports phy_rx_clk]
#create_clock -period 8.000 -name phy_sgmii_clk [get_ports phy_sgmii_clk_p]

set_false_path -to [get_ports {phy_reset_n}]
set_output_delay 0 [get_ports {phy_reset_n}]
set_false_path -from [get_ports {phy_int_n}]
set_input_delay 0 [get_ports {phy_int_n}]

#set_false_path -to [get_ports {phy_mdio phy_mdc}]
#set_output_delay 0 [get_ports {phy_mdio phy_mdc}]
#set_false_path -from [get_ports {phy_mdio}]
#set_input_delay 0 [get_ports {phy_mdio}]
