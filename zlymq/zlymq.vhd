library ieee;
use ieee.std_logic_1164.all;

entity zlymq is
    port(sm:in std_logic;
		 i:in std_logic_vector(7 downto 0);
		 mova,movb,movc,alu,not0,rsr,rsl,jmp,jz,jc,in0,out0,nop,halt:out std_logic);
end zlymq;

architecture one of zlymq is
signal sum:std_logic_vector(8 downto 0);
begin
	process(sm,i)
		begin
			mova<='0';
			movb<='0';
			movc<='0';
			not0<='0';
			alu<='0';
			rsr<='0';
			rsl<='0';
			jmp<='0';
			jz<='0';
			jc<='0';
			in0<='0';
			out0<='0';
			nop<='0';
			halt<='0';
		if(sm='1')then
			if(i(7 downto 4)="1111")then
				if(i(3 downto 2)="11")then
					movb<='1';
				elsif(i(1 downto 0)="11")then
					movc<='1';
				else
					mova<='1';
				end if;
			elsif(i(7 downto 4)="1001")then
				alu<='1';
			elsif(i(7 downto 4)="0110")then
				alu<='1';
			elsif(i(7 downto 4)="1011")then
				alu<='1';
			elsif(i(7 downto 4)="0101")then
				not0<='1';
			elsif(i(7 downto 4)="1010")then
				if(i(1 downto 0)="00")then
					rsr<='1';
				elsif(i(1 downto 0)="11")then
					rsl<='1';
				end if;
			elsif(i(7 downto 4)="0001")then
				if(i(3 downto 0)="0000")then
					jmp<='1';
				elsif(i(3 downto 0)="0001")then
					jz<='1';
				elsif(i(3 downto 0)="0010")then
					jc<='1';
				end if;
			elsif(i(7 downto 4)="0010")then
				in0<='1';
			elsif(i(7 downto 4)="0100")then
				out0<='1';
			elsif(i(7 downto 0)="01110000")then
				nop<='1';
			elsif(i(7 downto 0)="10000000")then
				halt<='1';
			end if;
		end if;
	end process;
end one;