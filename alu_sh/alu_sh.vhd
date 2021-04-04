library ieee;
use ieee.std_logic_1164.all;

entity alu_sh is
    port(F_BUS,FL_BUS,FR_BUS:in std_logic;
         i:in std_logic_vector(7 downto 0);
         c,z:out std_logic;
         o:out std_logic_vector(7 downto 0));
end alu_sh;

architecture one of alu_sh is
begin
    process(F_BUS,FL_BUS,FR_BUS,i)
    begin
        if(F_BUS='1' and FL_BUS='0' and FR_BUS='0') then
            o <= i;
            c <= '0';
            if(i(7 downto 0)="00000000") then
                z <= '1';
            else
                z <= '0';
            end if;
        elsif(F_BUS='0' and FL_BUS='1' and FR_BUS='0') then
            o <= i(6 downto 0) & '0';
            c <= i(7);
            if(i(6 downto 0)="0000000") then
                z <= '1';
            else
                z <= '0';
            end if;
        elsif(F_BUS='0' and FL_BUS='0' and FR_BUS='1') then
            o <= '0' & i(7 downto 1);
            c <= i(0);
            if(i(7 downto 1)="0000000") then
                z <= '1';
            else
                z <= '0';
            end if;
        else
            c <= 'Z';
            z <= 'Z';
            o <= "ZZZZZZZZ";
        end if;
    end process;
end one;