`timescale 1ns / 1ps

module elevator(
input clk_50hz, rst,

floor_0_p,
floor_1_p,
floor_2_p,
floor_3_p,
floor_4_p,

direction_1,
direction_2,
direction_3,

floor_0_d,
floor_1_d,
floor_2_d,
floor_3_d,
floor_4_d,

output reg led_inside_0,
led_inside_1,
led_inside_2,
led_inside_3,
led_inside_4,

led_outside_0,
led_outside_1,
led_outside_2,
led_outside_3,
led_outside_4,

led_busy,

reg [7:0] a,b,c,d,e,f,g,p
);

reg state, direction, command, count;
reg starting_floor, current_floor, final_floor;
//****Your code goes here*****//
`timescale 1ns / 1ps

module elevator(
input clk_50hz, rst,

floor_0_p,
floor_1_p,
floor_2_p,
floor_3_p,
floor_4_p,

direction_1,
direction_2,
direction_3,

floor_0_d,
floor_1_d,
floor_2_d,
floor_3_d,
floor_4_d,

output reg led_inside_0,
led_inside_1,
led_inside_2,
led_inside_3,
led_inside_4,

led_outside_0,
led_outside_1,
led_outside_2,
led_outside_3,
led_outside_4,

led_busy,

reg [7:0] a,b,c,d,e,f,g,p
);

reg state, direction, command, count;
reg starting_floor, current_floor, final_floor;

//****Your code goes here*****//
always@(posedge floor_0_p or posedge floor_1_p or posedge floor_2_p or posedge floor_3_p or posedge floor_4_p or posedge floor_0_d or posedge floor_1_d or posedge floor_2_d or posedge floor_3_d or posedge floor_4_d) begin
    command <= 1;
end

always@(posedge clk_50hz or negedge rst) begin
    if(~rst) begin
        current_floor <= 0;
        state <= "IDLE";
    end
    
    else begin
        case(state)
            "IDLE": begin
                led_busy <= 0;
                    if(command == 0) begin
                        state <= "IDLE";
                    end
                    else begin
                        if((floor_0_p == 1) || (floor_0_d == 1)) begin
                            state <= "BUSY";
                            final_floor <= 0;
                            count <= 0;
                            direction <= "DOWN";
                        end
                        
                        else if((floor_1_p == 1) || (floor_1_d == 1)) begin
                            state <= "BUSY";
                            final_floor <= 1;
                            count <= 0;
                            if(current_floor < 1)begin
                                direction <= "UP";
                            end
                            else begin
                                direction <= "DOWN";
                            end
                        end
                        
                        else if((floor_2_p == 1) || (floor_2_d == 1)) begin
                            state <= "BUSY";
                            final_floor <= 2;
                            if(current_floor < 2)begin
                                direction <= "UP";
                            end
                            else begin
                                direction <= "DOWN";
                            end
                        end
                        
                        else if((floor_3_p == 1) || (floor_3_d == 1)) begin
                            state <= "BUSY";
                            final_floor <= 3;
                            if(current_floor < 3)begin
                                direction <= "UP";
                            end
                            else begin
                                direction <= "DOWN";
                            end
                        end
                        
                        else if((floor_4_p == 1) || (floor_4_d == 1)) begin
                            state <= "BUSY";
                            final_floor <= 4;
                            if(current_floor < 1)begin
                                direction <= "UP";
                            end
                            else begin
                                direction <= "DOWN";
                            end
                        end
                    end
                end
            "BUSY": begin
                led_busy <= 1;
                    if(count == 250) begin
                        if (current_floor == final_floor) begin
                            state <= "WAIT";
                            count <= 0;
                        end
                        else if(direction == "UP")begin
                            current_floor <= current_floor + 1;
                            if((current_floor == 1) && ((floor_1_d == 1) || ((floor_1_p == 1)&&(direction_1 == 1))))begin
                                state <= "WAIT";
                                count <= 0;
                            end
                            else if((current_floor == 2) && ((floor_2_d == 1) || ((floor_2_p == 1)&&(direction_2 == 1))))begin
                                state <= "WAIT";
                                count <= 0;
                            end
                            else if((current_floor == 3) && ((floor_3_d == 1) || ((floor_3_p == 1)&&(direction_3 == 1))))begin
                                state <= "WAIT";
                                count <= 0;
                            end
                            count <= 0;
                        end

                        else if(direction == "DOWN")begin
                            current_floor <= current_floor - 1;
                            
                            if((current_floor == 1) && ((floor_1_p == 1) || ((floor_1_d == 1)&&(direction_1 == 0))))begin
                                state <= "WAIT";
                                count <= 0;
                            end
                            else if((current_floor == 2) && ((floor_2_p == 1) || ((floor_2_d == 1)&&(direction_2 == 0))))begin
                                state <= "WAIT";
                                count <= 0;
                            end
                            else if((current_floor == 3) && ((floor_3_p == 1) || ((floor_3_d == 1)&&(direction_3 == 0))))begin
                                state <= "WAIT";
                                count <= 0;
                            end
                            count <= 0;
                        end
                    end
                    else begin
                        count <= count + 1;
                    end
                end
            "WAIT": begin
                led_busy <= 1;
                    if(count == 250)begin
                        if(current_floor == final_floor)begin
                            state <= "IDLE";
                        end
                        else begin
                            state <= "BUSY";
                            count <= 0;
                        end
                    end
                    else begin
                        count <= count + 1;
                    end
                end
        endcase
    end
end

always @(posedge clk_50hz or negedge rst) begin
    if(~rst) begin
		a <= 8'b11110110;
		b <= 8'b11001110;
		c <= 8'b11001110;
		d <= 8'b11101010;
		e <= 8'b11100010;
		f <= 8'b11110010;
		g <= 8'b00100101;
		p <= 8'b11111111;	
	end
	else begin
		if(current_floor == 0) begin
			a[0] <= 0;
			b[0] <= 0;
			c[0] <= 0;
			d[0] <= 0;
			e[0] <= 0;
			f[0] <= 0;
			
			g[0] <= 1;
			p[0] <= 1;
		end
		else if(current_floor == 1) begin
			b[0] <= 0;
			c[0] <= 0;
			
			a[0] <= 1;
			d[0] <= 1;
			e[0] <= 1;
			f[0] <= 1;
			g[0] <= 1;
			p[0] <= 1;
		end
		else if(current_floor == 2) begin
			a[0] <= 0;
			b[0] <= 0;
			g[0] <= 0;
			d[0] <= 0;
			e[0] <= 0;
			
			c[0] <= 1;
			p[0] <= 1;
			f[0] <= 1;
		end
		else if(current_floor == 3) begin
			a[0] <= 0;
			b[0] <= 0;
			g[0] <= 0;
			d[0] <= 0;
			c[0] <= 0;
			
			e[0] <= 1;
			f[0] <= 1;
			p[0] <= 1;
		end
		else begin
		  f[0] <= 0;
		  g[0] <= 0;
		  b[0] <= 0;
		  c[0] <= 0;
		  
		  a[0] <= 1;
		  d[0] <= 1;
		  e[0] <= 1;
		  p[0] <= 1;
		end
		
		if(state == "IDLE")  begin
            a[7:4] <= 4'b1111;
            b[7:4] <= 4'b1100;
            c[7:4] <= 4'b1100;
            d[7:4] <= 4'b1110;
            e[7:4] <= 4'b1110;
            f[7:4] <= 4'b1111;
            g[7:4] <= 4'b0010;
            p[7:4] <= 4'b1111;
         end
         else if((state == "BUSY")&&(direction == "UP")) begin
             a[5] <= 1;
             f[5] <= 0;
             e[5] <= 0;
             d[5] <= 0;
             b[5] <= 0;
             c[5] <= 0;
             g[5] <= 1;
             p[5] <= 1;
                                 
             a[4] <= 0;
             b[4] <= 0;
             c[4] <= 1;
             d[4] <= 1;
             p[4] <= 1;
             g[4] <= 0;
             f[4] <= 0;
             e[4] <= 0;
         end
         else if((state == "BUSY")&&(direction == "DOWN")) begin
             b[5] <= 0;
             g[5] <= 0;
             e[5] <= 0;
             d[5] <= 0;
             c[5] <= 0;
             a[5] <= 1;
             f[5] <= 1;
             p[5] <= 1;
                                
                                
             a[4] <= 0;
             b[4] <= 0;
             c[4] <= 0;
             d[4] <= 0;
             e[4] <= 0;
             f[4] <= 0;
             g[4] <= 1;
             p[4] <= 1;
                        
        end
	end
 end
endmodule
//****Your code goes here*****//
endmodule