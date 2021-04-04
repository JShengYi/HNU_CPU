library ieee;
use ieee.std_logic_1164.all;

entity zljcq_ir is
    port(LD,CLK:in std_logic;
         i:in std_logic_vector(7 downto 0);
         o:out std_logic_vector(7 downto 0));
end zljcq_ir;

architecture one of zljcq_ir is
signal o_store:std_logic_vector(7 downto 0):="00000000";
begin
    process(LD,CLK)
    begin
        if(CLK'event and CLK = '1' and LD = '1')then
		    o_store <= i;
		end if;
    end process;
    o <= o_store;
end one;
        