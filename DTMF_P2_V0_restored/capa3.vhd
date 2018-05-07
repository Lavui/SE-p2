
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity capa3 is
port (clk    : in  std_logic;
      clk_en : in  std_logic;
		simbol : in std_logic_vector(4 downto 0 );
		bc0,bc1,bc2,bc3 : out std_logic;
		enable3M: out std_logic
     );
end entity capa3;

architecture arq of capa3 is
	signal estat : std_logic := '0';
	signal caracter : std_logic_vector(3 downto 0):= "0000";
begin 	
		   process(clk)
           begin
			  if rising_edge(clk) and clk_en='1' then
					enable3M <= '0';
					case estat is
						when '0' =>
							if simbol /= "10000"	then
								caracter <= simbol(3 downto 0);
								enable3M <= '1';
								estat <= '1';
							end if;
						when '1' =>
							if simbol = "10000"	then
								estat <= '0';
							end if;
					end case;
				end if;
				bc0<=caracter(0);
				bc1<=caracter(1);
				bc2<=caracter(2);
				bc3<=caracter(3);
		   end process;		

end architecture arq;      
      
