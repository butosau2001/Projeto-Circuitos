library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Timer is 
	port (isPlay: in std_logic;
		CLOCK: in std_logic;
		relogio: in std_logic_vector(4 downto 0);
		Q: out std_logic_vector(4 downto 0)
		);
end Timer;

architecture circuito of Timer is
signal cont: std_logic_vector(27 downto 0);
	begin
		process(CLOCK)
		begin
		if(CLOCK'event AND CLOCK = '1' AND isPlay = '1')then
			cont <= cont + 1;
			if(cont = x"2FAF07F" AND relogio /= "00000") then
				cont <= x"0000000";
				Q <= relogio + "11111";
				
			end if;
		end if;
		end process;
end circuito;