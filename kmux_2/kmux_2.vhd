library ieee;
use ieee.std_logic_1164.all;

entity kmux_2 is
    port(s: in std_logic;
    i0,i1:in std_logic_vector(7 downto 0);
    o:out std_logic_vector(7 downto 0));
end kmux_2;
    
architecture one of kmux_2 is
begin
    process(s,i0,i1)
    begin
        if(s = '0')then
            o <= i0;
        else
            o <= i1;
        end if;
    end process;
end one;