library ieee;
use ieee.std_logic_1164.all;

entity xuanzeqi is
    port(MADD:in std_logic_vector(1 downto 0);
         i0,i1,i2:in std_logic_vector(7 downto 0);
         o:out std_logic_vector(7 downto 0));
end xuanzeqi;

architecture one of xuanzeqi is
begin
    process(MADD,i0,i1,i2)
    begin
        if(MADD = "00")then
            o <= i0;
        elsif(MADD = "01")then
            o <= i1;
        elsif(MADD = "10")then
            o <= i2;
        else
            o <= "ZZZZZZZZ";
        end if;
    end process;
end one;