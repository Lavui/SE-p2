
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity capa3 is
port (clk    : in  std_logic;
      clk_en : in  std_logic;
		simbol : in std_logic_vector(4 downto 0); -- bit 4 indica silenci; bits 3 a 0 indiquen digit
		bc0,bc1,bc2,bc3 : out std_logic;
		enable3M: out std_logic
     );
end entity capa3;

architecture arq of capa3 is
   type T_estat is (S_silenci, S_digit);
	signal estat: t_estat := S_silenci;
begin 	
		   process(clk,simbol)
           begin
			  if rising_edge(clk) then
			    if clk_en='1' then
					case estat is
						when S_digit =>
							if simbol(4) ='1'	then -- QUAN DETECTA SILENCI
								estat <= S_silenci;
								enable3M <= '0';
							end if;
						when S_silenci =>
							if simbol(4) = '0' then -- QUAN NO DETECTA SILENCI
								bc0<=simbol(0);
								bc1<=simbol(1);
								bc2<=simbol(2);
								bc3<=simbol(3);
								enable3M <='1';
								estat <= S_digit;
							end if;
					end case;
				else
			       enable3M <= '0';	
				end if; -- end rising edge
			   end if; -- end clk
		   end process;		

end architecture arq;      
      
