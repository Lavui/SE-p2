
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity capa3 is
port (clk    : in  std_logic;
      clk_en : in  std_logic;
		simbol : in std_logic_vector(4 downto 0);
		bc0,bc1,bc2,bc3 : out std_logic;
		enable3M: out std_logic
     );
end entity capa3;

architecture arq of capa3 is
   type T_estat is (S_silenci, S_digit);
	signal estat: t_estat := S_silenci;
	signal enb : std_logic := '0';
begin 	
		   process(clk)
           begin
			  if rising_edge(clk) and clk_en='1' then
					case estat is
						when S_digit =>
							if simbol(4) ='1'	then
								estat <= S_silenci;
								enb <= '0';
							end if;
						when S_silenci =>
							if simbol(4) = '0' then -- QUAN NO DETECTA SILENCI
								bc0<=simbol(0);
								bc1<=simbol(1);
								bc2<=simbol(2);
								bc3<=simbol(3);
								enb <='1';
								estat <= S_digit;
							end if;
					end case;
					enable3M <= enb;
				end if; -- end rising edge and clk
		   end process;		

end architecture arq;      
      
