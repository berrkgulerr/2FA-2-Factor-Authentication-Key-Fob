module b16toBCD (
	input [15:0] to_display,
	input enable,
	output [3:0] D5,	
	output [3:0] D4,	
	output [3:0] D3,	
	output [3:0] D2,	
	output [3:0] D1	
);
reg[3:0] i5;
reg[3:0] i4;
reg[3:0] i3;
reg[3:0] i2;
reg[3:0] i1;

always@(*)begin
	if(enable==1)begin
		if(to_display >= 60000)
			i5=6;
		else if(to_display >= 50000)
			i5=5;
		else if(to_display >= 40000)
			i5=4;
		else if(to_display >= 30000)
			i5=3;
		else if(to_display >= 20000)
			i5=2;
		else if(to_display >= 10000)
			i5=1;
		else
			i5 = 0;
			
		if((to_display - (i5*10000)) >= 9000)
			i4=9;
		else if((to_display - (i5*10000)) >= 8000)
			i4=8;
		else if((to_display - (i5*10000)) >= 7000)
			i4=7;
		else if((to_display - (i5*10000)) >= 6000)
			i4=6;
		else if((to_display - (i5*10000)) >= 5000)
			i4=5;
		else if((to_display - (i5*10000)) >= 4000)
			i4=4;
		else if((to_display - (i5*10000)) >= 3000)
			i4=3;
		else if((to_display - (i5*10000)) >= 2000)
			i4=2;
		else if((to_display - (i5*10000)) >= 1000)
			i4=1;
		else
			i4=0;
		
		if((to_display - (i5*10000) - (i4*1000)) >= 900)
			i3=9;
		else if((to_display - (i5*10000) - (i4*1000)) >= 800)
			i3=8;
		else if((to_display - (i5*10000) - (i4*1000)) >= 700)
			i3=7;
		else if((to_display - (i5*10000) - (i4*1000)) >= 600)
			i3=6;
		else if((to_display - (i5*10000) - (i4*1000)) >= 500)
			i3=5;
		else if((to_display - (i5*10000) - (i4*1000)) >= 400)
			i3=4;
		else if((to_display - (i5*10000) - (i4*1000)) >= 300)
			i3=3;
		else if((to_display - (i5*10000) - (i4*1000)) >= 200)
			i3=2;
		else if((to_display - (i5*10000) - (i4*1000)) >= 100)
			i3=1;
		else
			i3=0;
		
		if((to_display - (i5*10000) - (i4*1000) - (i3*100)) >= 90)
			i2=9;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100)) >= 80)
			i2=8;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100)) >= 70)
			i2=7;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100)) >= 60)
			i2=6;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100)) >= 50)
			i2=5;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100)) >= 40)
			i2=4;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100)) >= 30)
			i2=3;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100)) >= 20)
			i2=2;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100)) >= 10)
			i2=1;
		else 
			i2=0;
		
		if((to_display - (i5*10000) - (i4*1000) - (i3*100) - (i2*10)) >= 9)
			i1=9;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100) - (i2*10)) >= 8)
			i1=8;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100) - (i2*10)) >= 7)
			i1=7;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100) - (i2*10)) >= 6)
			i1=6;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100) - (i2*10)) >= 5)
			i1=5;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100) - (i2*10)) >= 4)
			i1=4;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100) - (i2*10)) >= 3)
			i1=3;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100) - (i2*10)) >= 2)
			i1=2;
		else if((to_display - (i5*10000) - (i4*1000) - (i3*100) - (i2*10)) >= 1)
			i1=1;
		else
			i1=0;
	end
	else if(enable==0)begin
		i5=15;
		i4=15;
		i3=15;
		i2=15;
		i1=15;
	end
end

assign D5=i5;
assign D4=i4;
assign D3=i3;
assign D2=i2;
assign D1=i1;


endmodule
