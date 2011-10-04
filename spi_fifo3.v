`timescale 1 ns/100 ps
// Version: 9.1 SP1 9.1.1.5


module spi_fifo3(
       AEMPTY,
       Q,
       DATA,
       RCLOCK,
       WCLOCK,
       clk_in,
       rst,
       clk16_out,
       RCLOCK_in
    );
output AEMPTY;
output Q;
input  DATA;
input  RCLOCK;
input  WCLOCK;
input  clk_in;
input  rst;
output clk16_out;
input RCLOCK_in;

    wire GND_net, VCC_net;
    
    VCC VCC (.Y(VCC_net));
    GND GND (.Y(GND_net));
    fifo_sync fifo_sync_0 (.DATA(DATA), .Q(Q), .WE(VCC_net), .RE(
        VCC_net), .WCLOCK(WCLOCK), .RCLOCK(RCLOCK_FIFO), .FULL(), .EMPTY(), 
        .RESET(rst), .AEMPTY(AEMPTY), .AFULL());

reg [5:0] count_clk_in;
reg [39:0] count;
reg [39:0] count_rclk;
reg count_en;
reg count_rclk_en;
reg clk16_out;

wire RCLOCK_FIFO;
assign RCLOCK_FIFO = count_rclk_en & RCLOCK_in;

always@(posedge RCLOCK_in or negedge rst)
begin
    if(!rst)
        begin
            count_rclk <= 0;
            count_rclk_en <= 0;
        end
    else
        begin
            count_rclk <= count_rclk + 1;
            if(count_rclk >= 14)
                count_rclk_en <= 1;
            else
                count_rclk_en <= 0;
        end            
end


always@(posedge clk_in or negedge rst)       
    begin
        if(!rst)
            begin
                count_clk_in <= 0;
                count <= 0;
                clk16_out <= 0;
            end
        else
            begin
                count <= count + 1;
                if( (count >= 10000) )
                    begin
                        count_clk_in <= count_clk_in + 1;
                        if(count_clk_in == 1)
                            clk16_out <= 1;
                        else if(count_clk_in == 2)
                            clk16_out <= 0;
                        else if(count_clk_in == 3)
                            clk16_out <= 1;
                        else if(count_clk_in == 4)
                            clk16_out <= 0;
                        else if(count_clk_in == 5)
                            clk16_out <= 1;
                        else if(count_clk_in == 6)
                            clk16_out <= 0;
                        else if(count_clk_in == 7)
                            clk16_out <= 1;
                        else if(count_clk_in == 8)
                            clk16_out <= 0;
                        else if(count_clk_in == 9)
                            clk16_out <= 1;
                        else if(count_clk_in == 10)
                            clk16_out <= 0;
                        else if(count_clk_in == 11)
                            clk16_out <= 1;
                        else if(count_clk_in == 12)
                            clk16_out <= 0;
                        else if(count_clk_in == 14)
                            clk16_out <= 1;
                        else if(count_clk_in == 15)
                            clk16_out <= 0;
                        else if(count_clk_in == 16)
                            clk16_out <= 1;
                        else if(count_clk_in == 17)
                            clk16_out <= 0;
                        else if(count_clk_in == 18)
                            clk16_out <= 1;
                        else if(count_clk_in == 19)
                            clk16_out <= 0;
                        else if(count_clk_in == 20)
                            clk16_out <= 1;
                        else if(count_clk_in == 21)
                            clk16_out <= 0;
                        else if(count_clk_in == 22)
                            clk16_out <= 1;
                        else if(count_clk_in == 23)
                            clk16_out <= 0;
                        else if(count_clk_in == 24)
                            clk16_out <= 1;
                        else if(count_clk_in == 25)
                            clk16_out <= 0;
                        else if(count_clk_in == 26)
                            clk16_out <= 1;
                        else if(count_clk_in == 27)
                            clk16_out <= 0;
                        else if(count_clk_in == 28)
                            clk16_out <= 1;
                        else if(count_clk_in == 29)
                            clk16_out <= 0;
                        else if(count_clk_in == 30)
                            clk16_out <= 1;
                        else if(count_clk_in == 31)
                            clk16_out <= 0;
                        else if(count_clk_in == 32)
                            clk16_out <= 1;
                        else
                            clk16_out <= 0;
                    end
            end        
    end
    
endmodule