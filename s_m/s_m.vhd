library ieee;
use ieee.std_logic_1164.all;

entity s_m is
    port(CLK:in std_logic;
         SM:out std_logic);
end s_m;

architecture one of s_m is
signal SM_0:std_logic := '0';
begin
    process(CLK)
    begin
        if(CLK'event and CLK='0' )then
            SM_0 <= not SM_0;
        end if;
    end process;
    SM <= SM_0;
end one;