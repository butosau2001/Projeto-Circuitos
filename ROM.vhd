-----------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------------
entity ROM is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(9 downto 0) );
end entity;

architecture Rom_Arch of ROM is
  type memory is array (00 to 15) of std_logic_vector(9 downto 0);
  constant my_Rom : memory := (
	00 => "0001000111",
	01 => "1001100100",
   02 => "0010101100",
	03 => "0011110000",
	04 => "0011000110",
	05 => "1111000000",
	06 => "1010101000",
	07 => "0011100001",
	08 => "0000001111",
	09 => "0010011001",
	10 => "0000011110",
	11 => "0110000101",
	12 => "0011001001",
	13 => "1000100101",
	14 => "0001001110",
	15 => "1000100011");
begin
   process (address)
   begin
     case address is
       when "0000" => data <= my_rom(00);
       when "0001" => data <= my_rom(01);
       when "0010" => data <= my_rom(02);
       when "0011" => data <= my_rom(03);
       when "0100" => data <= my_rom(04);
       when "0101" => data <= my_rom(05);
       when "0110" => data <= my_rom(06);
       when "0111" => data <= my_rom(07);
       when "1000" => data <= my_rom(08);
       when "1001" => data <= my_rom(09);
		 when "1010" => data <= my_rom(10);
		 when "1011" => data <= my_rom(11);
		 when "1100" => data <= my_rom(12);
		 when "1101" => data <= my_rom(13);
		 when "1110" => data <= my_rom(14);
		 when "1111" => data <= my_rom(15);
       when others => data <= "0000000000";
       end case;
  end process;
end architecture Rom_Arch;
