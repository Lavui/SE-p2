library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity MUL is
port ( op1	  : in std_logic_vector(15 downto 0);
		 op2	  : in std_logic_vector(15 downto 0);
       result : out std_logic_vector(31 downto 0)
     );
end entity MUL;

architecture rtl of MUL is
	signal el1 : signed(15 downto 0):= to_signed(0,16); 
	signal el2 : signed(15 downto 0):= to_signed(0,16);
	signal res : signed(31 downto 0); 

	
begin 
         el1 <= signed(op1);
		   el2 <= signed(op2);	
		   res <= el1 * el2;
			result <= std_logic_vector(res);

end architecture rtl;      
      