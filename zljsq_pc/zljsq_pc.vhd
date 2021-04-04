library ieee;
use ieee.std_logic_1164.all,ieee.std_logic_unsigned.all;

entity zljsq_pc is
    port(LD,IN_PC,CLK:in std_logic;
         i:in std_logic_vector(7 downto 0);
         o:out std_logic_vector(7 downto 0));
end zljsq_pc;

architecture one of zljsq_pc is
signal count:std_logic_vector(7 downto 0):="00000000";
begin
    process(CLK,LD,IN_PC)
    begin
        if(CLK'event and CLK = '1')then
            if(LD = '1' and IN_PC = '0')then
                count <= i;
            elsif(LD = '0' and IN_PC = '1')then
                count <= count + "00000001";
            end if;
        end if;
    end process;
    o <= count;
end one;