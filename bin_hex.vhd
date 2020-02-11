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

entity bin_system is
	Port ( 	A : in  STD_LOGIC_VECTOR(5 downto 0); -- 6bit = 4 bit Nummer + 2 bit Funktion Auswahl
			SEG0A, SEG0B, SEG0C, SEG0D, SEG0E, SEG0F, SEG0G : out  STD_LOGIC); -- 7 bit, Ausgabe in 7-Segment Anzeige als Leds
		
end bin_system;

architecture Behavioral of bin_system is

-- 7-Segment Ziffern
constant seg_wert_0 : std_logic_vector(6 downto 0) := "1111110";
constant seg_wert_1 : std_logic_vector(6 downto 0) := "0110000";
constant seg_wert_2 : std_logic_vector(6 downto 0) := "1101101";
constant seg_wert_3 : std_logic_vector(6 downto 0) := "1111001";
constant seg_wert_4 : std_logic_vector(6 downto 0) := "0110011";
constant seg_wert_5 : std_logic_vector(6 downto 0) := "1011011";
constant seg_wert_6 : std_logic_vector(6 downto 0) := "1011111";
constant seg_wert_7 : std_logic_vector(6 downto 0) := "1110000";
constant seg_wert_8 : std_logic_vector(6 downto 0) := "1111111";
constant seg_wert_9 : std_logic_vector(6 downto 0) := "1111011";
constant seg_wert_error : std_logic_vector(6 downto 0) := "1000111";

-- 2-Segment Binary System
constant bcd : std_logic_vector(1 downto 0) := "00";
constant aiken : std_logic_vector(1 downto 0) := "01";
constant gray : std_logic_vector(1 downto 0) := "10";
constant excess_3 : std_logic_vector(1 downto 0) := "11";




signal OUTS0 : STD_LOGIC_VECTOR(6 downto 0);

begin
  with A select -- 4bit code + 2bit funktion
  		OUTS0 <=	"seg_wert_0" when "0000" & bcd,
				"seg_wert_1" when "0001" & bcd,
				"seg_wert_2" when "0010" & bcd,
				"seg_wert_3" when "0011" & bcd,
				"seg_wert_4" when "0100" & bcd,
				"seg_wert_5" when "0101" & bcd,
				"seg_wert_6" when "0110" & bcd,
				"seg_wert_7" when "0111" & bcd,
				"seg_wert_8" when "1000" & bcd,
				"seg_wert_9" when "1001" & bcd,
	
				"seg_wert_0" when "0000" & aiken,
				"seg_wert_1" when "0001" & aiken,
				"seg_wert_2" when "0010" & aiken,
				"seg_wert_3" when "0011" & aiken,
				"seg_wert_4" when "0100" & aiken,
				"seg_wert_5" when "1011" & aiken,
				"seg_wert_6" when "1100" & aiken,
				"seg_wert_7" when "1101" & aiken,
				"seg_wert_8" when "1110" & aiken,
				"seg_wert_9" when "1111" & aiken,
	
				"seg_wert_0" when "0011" & excess_3,
				"seg_wert_1" when "0100" & excess_3,
				"seg_wert_2" when "0101" & excess_3,
				"seg_wert_3" when "0110" & excess_3,
				"seg_wert_4" when "0111" & excess_3,
				"seg_wert_5" when "1000" & excess_3,
				"seg_wert_6" when "1001" & excess_3,
				"seg_wert_7" when "1010" & excess_3,
				"seg_wert_8" when "1011" & excess_3,
				"seg_wert_9" when "1100" & excess_3,
	
				"seg_wert_0" when "0000" & gray,
				"seg_wert_1" when "0001" & gray,
				"seg_wert_2" when "0011" & gray,
				"seg_wert_3" when "0010" & gray,
				"seg_wert_4" when "0110" & gray,
				"seg_wert_5" when "0111" & gray,
				"seg_wert_6" when "0101" & gray,
				"seg_wert_7" when "0100" & gray,
				"seg_wert_8" when "1100" & gray,
				"seg_wert_9" when "1101" & gray,

			
				"seg_wert_error" when others;	-- the "others" clause: shows an error
				
  SEG0A <= OUTS0(6); SEG0B <= OUTS0(5); SEG0C <= OUTS0(4); SEG0D <= OUTS0(3);
  SEG0E <= OUTS0(2); SEG0F <= OUTS0(1); SEG0G <= OUTS0(0);  



end Behavioral;

