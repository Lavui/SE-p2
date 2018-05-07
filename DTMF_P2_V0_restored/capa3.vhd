
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity capa3 is
port (clk    : in  std_logic;
      clk_en : in  std_logic;
		simbol : in std_logic_vector(4 downto 0 );
		enable3M: out std_logic
     );
end entity capa3;

architecture arq of capa3 is
	signal freq : std_logic_vector(7 downto 0);
	signal enb : std_logic;

begin 
	freq(0) <= l0;
	freq(1) <= l1;
	freq(2) <= l2;
	freq(3) <= l3;
	
	freq(4) <= h0;
	freq(5) <= h1;
	freq(6) <= h2;
	freq(7) <= h3;
	
		   process(clk)
           begin
			  if rising_edge(clk) and clk_en='1' then
					enable23 <= '0';
					enb <= '1';
					case freq is
						when "10000100" =>   s_c2 <= "00000"; --0
						when "00010001" =>   s_c2 <= "00001"; --1
						when "00010100" =>   s_c2 <= "00010";	--2
						when "00010010" =>   s_c2 <= "00011";	--3	
						when "00100001" =>   s_c2 <= "00100"; --4
						when "00100100" =>   s_c2 <= "00101"; --5
						when "00100010" =>   s_c2 <= "00110"; --6
						when "01000001" =>   s_c2 <= "00111"; --7
						when "01000100" =>   s_c2 <= "01000"; --8
						when "01000010" =>   s_c2 <= "01001"; --9
						
						when "00011000" =>   s_c2 <= "01010"; --A
						when "00101000" =>   s_c2 <= "01011"; --B
						when "01001000" =>   s_c2 <= "01100"; --C
						when "10001000" =>   s_c2 <= "01101"; --D
						
						when "10000001" =>   s_c2 <= "01110"; --*
						when "10000010" =>   s_c2 <= "01111"; --#
						
						when "00000000" =>   s_c2 <= "10000";--Silenci
						when others => enb <= '0';
					end case;
					enable23 <= enb;
				end if;
		   end process;		

end architecture arq;      
      
