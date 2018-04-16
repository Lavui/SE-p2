library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity capa_2 is

port (clk    : in  std_logic;
      clk_en : in  std_logic;
      freq   : in  std_logic_vector(7  downto 0);
		o      : out  std_logic_vector(5  downto 0);
		enable23 : out  std_logic
     );
end entity capa_2;


architecture rtl of capa_2 is
signal enab : std_logic := '0';
begin 
		   process(clk)
           begin
			   if rising_edge(clk) and clk_en = '1' then
					if enab ='1' then
						enab <= '0';
					end if;
						
					if freq="00010100" then --0
						o <= "00000";
						enab <= '1';
					elsif freq="10001000" then --1
						o <= "00001";
						enab <= '1';
					elsif freq="10000100" then --2
						o <= "00010";
						enab <= '1';
					elsif freq="10000010" then --3
						o <= "00011";
						enab <= '1';
					elsif freq="01001000" then --4
						o <= "00100";
						enab <= '1';
					elsif freq="01000100" then --5
						o <= "00101";
						enab <= '1';
					elsif freq="01000010" then --6
						o <= "00110";
						enab <= '1';
					elsif freq="00101000" then --7
						o <= "00111";
						enab <= '1';
					elsif freq="00100100" then --8
						o <= "01000";
						enab <= '1';
					elsif freq="00100010" then --9
						o <= "01001";
						enab <= '1';
					elsif freq="10000001" then --A
						o <= "01010";
						enab <= '1';
					elsif freq="01000001" then --B
						o <= "01011";
						enab <= '1';
					elsif freq="00100001" then --C
						o <= "01100";
						enab <= '1';
					elsif freq="00010001" then --D
						o <= "01101";
						enab <= '1';
					elsif freq="00011000" then --*
						o <= "01110";
						enab <= '1';
					elsif freq="00010010" then --#
						o <= "01111";
						enab <= '1';
					elsif freq="00000000" then --#
						o <= "10000";
						enab <= '1';
					end if;
						enable23 <= enab;
			   end if;              
		   end process;		

end architecture rtl;      
      
