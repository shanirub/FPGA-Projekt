----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:47:21 02/04/2020 
-- Design Name: 
-- Module Name:    bin_hex - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bin_hex is
	Port ( 	A0A1A2A3 : in  STD_LOGIC_VECTOR(3 downto 0);
				A4A5A6A7 : in  STD_LOGIC_VECTOR(3 downto 0);
				SEG0A, SEG0B, SEG0C, SEG0D, SEG0E, SEG0F, SEG0G : out  STD_LOGIC;
				SEG1A, SEG1B, SEG1C, SEG1D, SEG1E, SEG1F, SEG1G : out  STD_LOGIC);
end bin_hex;

architecture Behavioral of bin_hex is

signal OUTS0 : STD_LOGIC_VECTOR(6 downto 0);
signal OUTS1 : STD_LOGIC_VECTOR(6 downto 0);

begin
  with A0A1A2A3 select
			-- "abcdefg"  Balkenbezeichnung 7-Segment
  	OUTS0 <= "1111110" when "0000",
				"0110000" when "0001",
				"1101101" when "0010",
				"1111001" when "0011",
				"0110011" when "0100",
				"1011011" when "0101",
				"1011111" when "0110",
				"1110000" when "0111",
				"1111111" when "1000",
				"1111011" when "1001",
				"1110111" when "1010",
				"0011111" when "1011",
				"1001110" when "1100",
				"0111101" when "1101",
				"1001111" when "1110",
				"1000111" when others;	-- the "others" clause is used in place
												-- of "1111" for reasons explained later
  SEG0A <= OUTS0(6); SEG0B <= OUTS0(5); SEG0C <= OUTS0(4); SEG0D <= OUTS0(3);
  SEG0E <= OUTS0(2); SEG0F <= OUTS0(1); SEG0G <= OUTS0(0);  

  with A4A5A6A7 select
			-- "abcdefg"  Balkenbezeichnung 7-Segment
  	OUTS1 <= "1111110" when "0000",
				"0110000" when "0001",
				"1101101" when "0010",
				"1111001" when "0011",
				"0110011" when "0100",
				"1011011" when "0101",
				"1011111" when "0110",
				"1110000" when "0111",
				"1111111" when "1000",
				"1111011" when "1001",
				"1110111" when "1010",
				"0011111" when "1011",
				"1001110" when "1100",
				"0111101" when "1101",
				"1001111" when "1110",
				"1000111" when others;	-- the "others" clause is used in place
												-- of "1111" for reasons explained later
  SEG1A <= OUTS1(6); SEG1B <= OUTS1(5); SEG1C <= OUTS1(4); SEG1D <= OUTS1(3);
  SEG1E <= OUTS1(2); SEG1F <= OUTS1(1); SEG1G <= OUTS1(0);

end Behavioral;

