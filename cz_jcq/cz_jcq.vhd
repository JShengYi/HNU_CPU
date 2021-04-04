library ieee;
use ieee.std_logic_1164.all;

entity cz_jcq is
    port(en,CLK,c_i,z_i:in std_logic;
         c_o,z_o:out std_logic);
end cz_jcq;

architecture one of cz_jcq is
begin
    process(en,CLK)
    begin
        if(CLK'event and CLK = '1' and en = '1')then
            c_o <= c_i;
            z_o <= z_i;
        end if;
    end process;
end one;