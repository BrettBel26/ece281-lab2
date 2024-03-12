----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 11:19:21 AM
-- Design Name: 
-- Module Name: sevenSegDecoder_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenSegDecoder_TB is
    Port ( i_D : in STD_LOGIC_VECTOR (3 downto 0);
           o_S : out STD_LOGIC_VECTOR (6 downto 0));
end sevenSegDecoder_TB;

architecture test_bench of sevenSegDecoder_tb is 

	-- Component Declaration	
  component sevenSegDecoder is
	port(
        i_D : in STD_LOGIC_VECTOR (3 downto 0);
        o_S : out STD_LOGIC_VECTOR (6 downto 0)
	);	
  end component;

  
  signal i_sw : std_logic_vector (3 downto 0);
  signal o_seg: std_logic_vector (6 downto 0);
    
begin
	-- PORT MAPS ----------------------------------------
	sevenSegDecoder_inst : sevenSegDecoder port map (
		i_D     => i_sw,
		o_S     => o_seg
	);
	-----------------------------------------------------
	
	-- PROCESSES ----------------------------------------	
	-- Test plan process
	-- Testing each combination of i_A and i_B (4 total)
	test_process : process 
	begin
	    i_sw <= x"0"; wait for 10 ns;
    assert o_seg = "1000000" report "bad x0" severity failure;
    	i_sw <= x"1"; wait for 10 ns;
    assert o_seg = "1111001" report "bad x1" severity failure;
    	i_sw <= x"2"; wait for 10 ns;
    assert o_seg = "0100100" report "bad x2" severity failure;
    	i_sw <= x"3"; wait for 10 ns;
    assert o_seg = "0110000" report "bad x3" severity failure;
    	i_sw <= x"4"; wait for 10 ns;
    assert o_seg = "0011001" report "bad x4" severity failure;
    	i_sw <= x"5"; wait for 10 ns;
    assert o_seg = "0010010" report "bad x5" severity failure;
    	i_sw <= x"6"; wait for 10 ns;
    assert o_seg = "0000010" report "bad x6" severity failure;
    	i_sw <= x"7"; wait for 10 ns;
    assert o_seg = "1111000" report "bad x7" severity failure;
    	i_sw <= x"8"; wait for 10 ns;
    assert o_seg = "0000000" report "bad x8" severity failure;
    	i_sw <= x"9"; wait for 10 ns;
    assert o_seg = "0011000" report "bad x9" severity failure;
    	i_sw <= x"A"; wait for 10 ns;
    assert o_seg = "0001000" report "bad xA" severity failure;
    	i_sw <= x"B"; wait for 10 ns;
    assert o_seg = "0000011" report "bad xB" severity failure;
    	i_sw <= x"C"; wait for 10 ns;
    assert o_seg = "0100111" report "bad xC" severity failure;
    	i_sw <= x"D"; wait for 10 ns;
    assert o_seg = "0100001" report "bad xD" severity failure;
    	i_sw <= x"E"; wait for 10 ns;
    assert o_seg = "0000110" report "bad xE" severity failure;
    	i_sw <= x"F"; wait for 10 ns;
    assert o_seg = "0001110" report "bad xF" severity failure;
            
		wait; -- wait forever
		
	end process;	
	-----------------------------------------------------	
	
end test_bench;
