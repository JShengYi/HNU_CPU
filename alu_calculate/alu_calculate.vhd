library ieee;
use ieee.std_logic_1164.all,ieee.std_logic_unsigned.all;

entity alu_calculate is
    port(a,b: in std_logic_vector(7 downto 0);
         s: in std_logic_vector(3 downto 0);
         m: in std_logic;
         r: out std_logic_vector(7 downto 0);
         c,z: out std_logic);
end alu_calculate;

architecture one of alu_calculate is
signal a0:std_logic_vector(8 downto 0);
signal b0:std_logic_vector(8 downto 0);
signal c0:std_logic_vector(8 downto 0);
begin
    a0 <= '0' & a;
    b0 <= '0' & b;
    c0 <= a0 + b0;
    process(a0,b0,c0,a,b,s,m)
	begin 
		if( m='1' and s="1001") then
			r <= c0(7 downto 0);
			c <= c0(8);
			if( c0(7 downto 0) = "00000000") then
				z <= '1';
			else
				z <= '0';
			end if;
		elsif( m='1' and s="0110") then
			if( a>b ) then
				r <= a-b;
				c <= '0';
				z <= '0';
			elsif( a<b ) then
				r <= b-a;
				c <= '1';
				z <= '0';
			else
				r <= a-b;
				c <= '0';
				z <= '1';
			end if;
		elsif( m='1' and s="1110") then
			r <= a and b;
			c <= '0';
			if( (a and b) = "00000000") then
				z <= '1';
			else
				z <= '0';
			end if;
		elsif( m='0' and s="0101") then
			r <= not b;
			c <= '0';
			if( b="11111111" ) then
				z <= '1';
			else
				z <= '0';
			end if;
		elsif( m='0' and s="1010") then
			r <= b;
			c <= '0';
			if( b="00000000" ) then
				z <= '1';
			else
				z <= '0';
			end if;
	    else
			r <= a;
			c <= '0';
			if( a="00000000" ) then
				z <= '1';
			else
				z <= '0';
			end if;
		end if;
    end process;
end one;