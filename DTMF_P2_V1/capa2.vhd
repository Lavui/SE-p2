
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity capa2 is
port (clk    : in  std_logic;
      clk_en : in  std_logic;
		l0,l1,l2,l3,h0,h1,h2,h3	 : in std_logic; --now debug, later state?
		s_c2 : out std_logic_vector(4 downto 0);
		--s_c20, s_c21, s_c22, s_c23, s_c24: out std_logic;
		enable23: out std_logic
     );
end entity capa2;

architecture arq of capa2 is
	signal freq : std_logic_vector(7 downto 0);
   -- signal s_c2: std_logic_vector(4 downto 0);
	-- signal cont : integer := 0;
	
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
			  if rising_edge(clk) then
			    if clk_en = '1' then
					enable23 <= '1';
					case freq is
						when "00101000" =>   s_c2 <= "00000"; --0
						when "00010001" =>   s_c2 <= "00001"; --1
						when "00100001" =>   s_c2 <= "00010"; --2
						when "01000001" =>   s_c2 <= "00011"; --3	
						when "00010010" =>   s_c2 <= "00100"; --4
						when "00100010" =>   s_c2 <= "00101"; --5
						when "01000010" =>   s_c2 <= "00110"; --6
						when "00010100" =>   s_c2 <= "00111"; --7
						when "00100100" =>   s_c2 <= "01000"; --8
						when "01000100" =>   s_c2 <= "01001"; --9
						
						when "10000001" =>   s_c2 <= "01010"; --A
						when "10000010" =>   s_c2 <= "01011"; --B
						when "10000100" =>   s_c2 <= "01100"; --C
						when "10001000" =>   s_c2 <= "01101"; --D
						
						when "00011000" =>   s_c2 <= "01110"; --*
						when "01001000" =>   s_c2 <= "01111"; --#
						
						when "00000000" =>   s_c2 <= "10000";--Silenci
						when others => enable23 <= '0';
					end case;
				 else -- of rising edge
				   enable23 <= '0';
				 end if; -- end rising edge 	
				end if; -- end clk
		     end process;		

end architecture arq;      
      
