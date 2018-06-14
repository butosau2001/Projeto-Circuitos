library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Jogo is
port (	SW: in std_logic_vector (9 downto 0);
	KEY: in std_logic_vector(3 downto 0);
	CLOCK_50: in std_logic_vector;
	LEDR: out std_logic_vector (9 downto 0);
	HEX0: out std_logic_vector(6 downto 0);
	HEX1: out std_logic_vector(6 downto 0);
	HEX2: out std_logic_vector(6 downto 0);
	HEX3: out std_logic_vector(6 downto 0);
	HEX4: out std_logic_vector(6 downto 0);
	HEX5: out std_logic_vector(6 downto 0)
	);

architecture circuito of Jogo is
type STATES is (start, play, setup, waitSW, check, next_round, result);
signal Eatual, Pestado: STATES;
	
	component ROM is
	port (address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(9 downto 0));
	end component;
	
	component ButtonSync is
	port(KEY0, KEY1, KEY2, KEY3, CLK: in std_logic;
		BTN0, BTN1, BTN2, BTN3: out std_logic);
	end component;
	
	
	process (CLOCK_50, KEY(0))
	begin
		if (KEY(0) = '0') then
			EAtual <= inicio;
		elsif (CLOCK_50'event AND CLOCK_50 = '1') then
			EAtual <= PEstado;
		end if;
	end process;
	
	process(Eatual)
	begin
		
