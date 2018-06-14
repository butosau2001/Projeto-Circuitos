library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Datapath is
port (CLOCK: in std_logic;
	A: in std_logic_vector(9 downto 0);
	R1: in std_logic;
	R2: in std_logic;
	E1: in std_logic;
	E2: in std_logic;
	E3: in std_logic;
	E5: in std_logic;
	tempo: out std_logic_vector(4 downto 0);
	p: out std_logic_vector(4 downto 0);
	end_round: out std_logic;
	end_game: out std_logic;
	sw_error: out std_logic;
	end_time: out std_logic);
end Datapath;

architecture circuito of Datapath is
signal  n, notN, count: std_logic_vector (3 downto 0);
signal s, t std_logic_vector(4 downto 0);
signal m, memory: std_logic_vector(9 downto 0);

component Timer is
port (isPlay: in std_logic;
		CLOCK: in std_logic;
		relogio: in std_logic_vector(4 downto 0);
		Q: out std_logic_vector(4 downto 0)
		);
end component;

component ROM is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(9 downto 0) );
end component;

begin

s<= "00101" when E3 = '1' else "00000";
s<= "00101" when E1 = '1' else "00000";
R: Timer port map (E1, CLOCK, s, t);
end_time <= '1' when t = "00000" else '0';
tempo <= t

n <= "0000" when R2 = '1' and R1 = '0' else
	n + 1 when R1 = '1' and R2 = '0';
end_round <= '1' when n <= "1010" else '0';
	
MEM: ROM port map (A(9 downto 6), m);
memory <= m when E2 = '1' else "0000000000";
end_game <= '1' when A(9 downto 0) = memory else '0';

notN <= (not n) + 1;
p <= x"1A" + notN when E5 = '1' else "00000";

count <= A(9) + A(8) + A(7) + A(6) + A(5) + A(4) + A(3) + A(2) + A(1) + A(0);
sw_error <= '0' when count = "0100" else '1';
end circuito; 

	
