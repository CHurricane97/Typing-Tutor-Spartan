----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:24:18 05/10/2022 
-- Design Name: 
-- Module Name:    bechaw - Behavioral 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bechaw is
    Port ( X : in  STD_LOGIC_VECTOR(7 downto 0);
	Xspr : inout  STD_LOGIC_VECTOR(7 downto 0);
	Licznik : inout  STD_LOGIC_VECTOR(7 downto 0);
	Licznik2 : inout  STD_LOGIC_VECTOR(7 downto 0);
			  CHAR : out  STD_LOGIC_VECTOR(7 downto 0);
           CLK : in  STD_LOGIC;
			  CE : in STD_LOGIC;
           RST : in  STD_LOGIC;
           Y : out  STD_LOGIC;
			  Char_WE : out STD_LOGIC;
			  F0 : in STD_LOGIC);
end bechaw;

architecture Behavioral of bechaw is

type state_type is(A,B,C,D);
signal state, nextstate : state_type;

constant A1 : STD_Logic_vector(7 downto 0) := "00011100";
constant A2 : STD_Logic_vector(7 downto 0) := "01000001";

constant B1 : STD_Logic_vector(7 downto 0) := "00110010";
constant B2 : STD_Logic_vector(7 downto 0) := "01000010";

constant C1 : STD_Logic_vector(7 downto 0) := "00100001";
constant C2 : STD_Logic_vector(7 downto 0) := "01000011";

constant D1 : STD_Logic_vector(7 downto 0) := "00100011";
constant D2 : STD_Logic_vector(7 downto 0) := "01000100";

constant E1 : STD_Logic_vector(7 downto 0) := "00100100";
constant E2 : STD_Logic_vector(7 downto 0) := "01000101";

constant F1 : STD_Logic_vector(7 downto 0) := "00101011";
constant F2 : STD_Logic_vector(7 downto 0) := "01000110";

constant G1 : STD_Logic_vector(7 downto 0) := "00110100";
constant G2 : STD_Logic_vector(7 downto 0) := "01000111";

constant H1 : STD_Logic_vector(7 downto 0) := "00110011";
constant H2 : STD_Logic_vector(7 downto 0) := "01001000";

constant I1 : STD_Logic_vector(7 downto 0) := "01000011";
constant I2 : STD_Logic_vector(7 downto 0) := "01001001";

constant J1 : STD_Logic_vector(7 downto 0) := "00111011";
constant J2 : STD_Logic_vector(7 downto 0) := "01001010";

constant K1 : STD_Logic_vector(7 downto 0) := "01000010";
constant K2 : STD_Logic_vector(7 downto 0) := "01001011";

constant L1 : STD_Logic_vector(7 downto 0) := "01001011";
constant L2 : STD_Logic_vector(7 downto 0) := "01001100";

constant M1 : STD_Logic_vector(7 downto 0) := "00111010";
constant M2 : STD_Logic_vector(7 downto 0) := "01001101";

constant N1 : STD_Logic_vector(7 downto 0) := "00110001";
constant N2 : STD_Logic_vector(7 downto 0) := "01001110";

constant O1 : STD_Logic_vector(7 downto 0) := "01000100";
constant O2 : STD_Logic_vector(7 downto 0) := "01001111";

constant P1 : STD_Logic_vector(7 downto 0) := "01001101";
constant P2 : STD_Logic_vector(7 downto 0) := "01010000";

constant Q1 : STD_Logic_vector(7 downto 0) := "00010101";
constant Q2 : STD_Logic_vector(7 downto 0) := "01010001";

constant R1 : STD_Logic_vector(7 downto 0) := "00101101";
constant R2 : STD_Logic_vector(7 downto 0) := "01010010";

constant S1 : STD_Logic_vector(7 downto 0) := "00011011";
constant S2 : STD_Logic_vector(7 downto 0) := "01010011";

constant T1 : STD_Logic_vector(7 downto 0) := "00101100";
constant T2 : STD_Logic_vector(7 downto 0) := "01010100";

constant U1 : STD_Logic_vector(7 downto 0) := "00111100";
constant U2 : STD_Logic_vector(7 downto 0) := "01010101";

constant V1 : STD_Logic_vector(7 downto 0) := "00101010";
constant V2 : STD_Logic_vector(7 downto 0) := "01010110";

constant W1 : STD_Logic_vector(7 downto 0) := "00011101";
constant W2 : STD_Logic_vector(7 downto 0) := "01010111";

constant X1 : STD_Logic_vector(7 downto 0) := "00100010";
constant X2 : STD_Logic_vector(7 downto 0) := "01011000";

constant Y1 : STD_Logic_vector(7 downto 0) := "00110101";
constant Y2 : STD_Logic_vector(7 downto 0) := "01011001";

constant Z1 : STD_Logic_vector(7 downto 0) := "00011010";
constant Z2 : STD_Logic_vector(7 downto 0) := "01011010";

constant SPACE1 : STD_Logic_vector(7 downto 0) := "00101001";
constant SPACE2 : STD_Logic_vector(7 downto 0) := "00100000";

constant L00 : STD_Logic_vector(7 downto 0) := "00000000";
constant L01 : STD_Logic_vector(7 downto 0) := "00000001";
constant L02 : STD_Logic_vector(7 downto 0) := "00000010";
constant L03 : STD_Logic_vector(7 downto 0) := "00000011";
constant L04 : STD_Logic_vector(7 downto 0) := "00000100";
constant L05 : STD_Logic_vector(7 downto 0) := "00000101";
constant L06 : STD_Logic_vector(7 downto 0) := "00000110";
constant L07 : STD_Logic_vector(7 downto 0) := "00000111";
constant L08 : STD_Logic_vector(7 downto 0) := "00001000";
constant L09 : STD_Logic_vector(7 downto 0) := "00001001";
constant L10 : STD_Logic_vector(7 downto 0) := "00001010";
constant L11 : STD_Logic_vector(7 downto 0) := "00001011";
constant L12 : STD_Logic_vector(7 downto 0) := "00001100";
constant L13 : STD_Logic_vector(7 downto 0) := "00001101";
constant L14 : STD_Logic_vector(7 downto 0) := "00001110";


constant Fp: STD_Logic_vector(7 downto 0) := "11110000";

	type typearray is array (NATURAL range<>) of STD_LOGIC_VECTOR (7 downto 0);
	shared variable wordarray : typearray( 0 to 11) := (
	H1, Fp, H1, E1, Fp ,E1, L1, Fp ,L1, O1, Fp ,O1
	);
	
begin
process1: process(clk)
begin
if RST='1' then
state <= A;
elsif rising_edge(clk) then
state <=nextstate;
end if;
end process process1;


process2 : process(state, X, Xspr, CE)
begin
nextstate <=state;
if CE='1' and F0='0' then
case state is 
when A => -- z beezczynnego do B
				Licznik<='0';
				nextstate <= B;
				
when B => if X=Xspr then --sprawdzamy czy x z klawaitury to ten sam co x ozekiwany
				
				nextstate<=C;
				else nextstate <= B; 
				end if;
when C =>
				
				CHAR <= Xspr;-- znak do wyœwietlenia
				nextstate<=D;
				
				
when D => if Licznik=Licznik2 then

				nextstate<=A;
				else
				Xspr <= wordarray(Licznik+1);
				Licznik<=(Licznik+'1')
				nextstate <= B; 
				end if;

when others => nextstate <= A;				
end case;
		
end process process2 ;


Y <= '1' when state = A else '0';
Char_WE <= '1' when state = A else '0';

begin


end Behavioral;

