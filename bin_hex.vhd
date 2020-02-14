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

signal OUTS0 : STD_LOGIC_VECTOR(6 downto 0);


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

begin
  with A select -- 4bit code + 2bit funktion
  		OUTS0 <=	seg_wert_0 when bcd & "0000",
				seg_wert_1 when bcd & "0001",
				seg_wert_2 when bcd & "0010",
				seg_wert_3 when bcd & "0011",
				seg_wert_4 when bcd & "0100",
				seg_wert_5 when bcd & "0101",
				seg_wert_6 when bcd & "0110",
				seg_wert_7 when bcd & "0111",
				seg_wert_8 when bcd & "1000",
				seg_wert_9 when bcd & "1001",
	
				seg_wert_0 when aiken & "0000",
				seg_wert_1 when aiken & "0001",
				seg_wert_2 when aiken & "0010",
				seg_wert_3 when aiken & "0011",
				seg_wert_4 when aiken & "0100",
				seg_wert_5 when aiken & "1011",
				seg_wert_6 when aiken & "1100",
				seg_wert_7 when aiken & "1101",
				seg_wert_8 when aiken & "1110",
				seg_wert_9 when aiken & "1111",
	
				seg_wert_0 when excess_3 & "0011",
				seg_wert_1 when excess_3 & "0100",
				seg_wert_2 when excess_3 & "0101",
				seg_wert_3 when excess_3 & "0110",
				seg_wert_4 when excess_3 & "0111",
				seg_wert_5 when excess_3 & "1000",
				seg_wert_6 when excess_3 & "1001",
				seg_wert_7 when excess_3 & "1010",
				seg_wert_8 when excess_3 & "1011",
				seg_wert_9 when excess_3 & "1100",
	
				seg_wert_0 when gray & "0000",
				seg_wert_1 when gray & "0001",
				seg_wert_2 when gray & "0011",
				seg_wert_3 when gray & "0010",
				seg_wert_4 when gray & "0110",
				seg_wert_5 when gray & "0111",
				seg_wert_6 when gray & "0101",
				seg_wert_7 when gray & "0100",
				seg_wert_8 when gray & "1100",
				seg_wert_9 when gray & "1101",

			
				seg_wert_error when others;	-- the "others" clause: shows an error
				
  SEG0A <= OUTS0(6); SEG0B <= OUTS0(5); SEG0C <= OUTS0(4); SEG0D <= OUTS0(3);
  SEG0E <= OUTS0(2); SEG0F <= OUTS0(1); SEG0G <= OUTS0(0);  



end Behavioral;
