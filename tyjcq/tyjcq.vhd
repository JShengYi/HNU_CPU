library ieee;
use ieee.std_logic_1164.all,ieee.std_logic_unsigned.all;

entity tyjcq is
    port(WE,CLK:in std_logic;
         RA,WA:in std_logic_vector(1 downto 0);
         i:in std_logic_vector(7 downto 0);
         AO,BO,A_O,B_O,C_O:out std_logic_vector(7 downto 0));
end tyjcq;

architecture one of tyjcq is
signal A:std_logic_vector(7 downto 0):="01010101";
signal B:std_logic_vector(7 downto 0):="11100011";
signal C:std_logic_vector(7 downto 0):="11111111";
begin
    A_O <= A;
    B_O <= B;
    C_O <= C;
    process(WE,CLK,RA,WA,A,B,C)
    begin
		if(RA = "00") then
			AO <= A;
		elsif(RA = "01")then
			AO <= B;
		else
			AO <= C;
		end if;
		if(WA = "00") then
			BO <= A;
		elsif(WA = "01")then
			BO <= B;
		else
			BO <= C;
	    end if;
	    if(CLK'event and CLK = '1' and WE = '0')then
	        if(WA = "00")then
	            A <= i;
	        elsif(WA = "01")then
	            B <= i;
	        elsif(WA = "10")then
	            C <= i;
	        end if;
	    end if;
	end process;
end one;
	    
    