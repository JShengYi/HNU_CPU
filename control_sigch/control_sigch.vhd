library ieee;
use ieee.std_logic_1164.all;

entity control_sigch is
    port(MOVA,MOVB,MOVC,ALU,NOT0,SHL,SHR,JMP,JZ,JC,IN0,OUT0,NOP,HALT,SM,C,Z:in std_logic;
         IR:in std_logic_vector(7 downto 0);
         F_BUS,FL_BUS,FR_BUS,DL,XL,M,IN_PC,LD_PC,LD_IR,WE,EN_CZ,EN_IN,EN_OUT:out std_logic;
         S:out std_logic_vector(3 downto 0);
         MADD,RA,WA:out std_logic_vector(1 downto 0));
end control_sigch;

architecture one of control_sigch is
begin
	F_BUS <= MOVA or MOVB or ALU or NOT0;
	FL_BUS <= SHL;
	FR_BUS <= SHR;
	M <= ALU;
	WE <= not (MOVA or MOVC or ALU or NOT0 or SHL or SHR or IN0);
	EN_CZ <= ALU or NOT0 or SHL or SHR;
	S <= IR(7 downto 4);
	RA <= IR(1 downto 0);
	WA <= IR(3 downto 2);
	MADD(1) <= MOVB;
	MADD(0) <= MOVC;
	EN_IN <= IN0;
	EN_OUT <= OUT0;
    process(IR)
    begin
        if(IR = "10000000")then
            LD_IR <= '0';
            DL <= '0';
            XL <= '0';
            IN_PC <= '0';
            LD_PC <= '0';
        else
			DL <= (not SM) or MOVC;
			XL <= MOVB;
			IN_PC <= not SM;
			LD_PC <= JMP or (JZ and Z) or (JC and C); 
			LD_IR <= not SM;
        end if;
    end process;
end one;
    
    