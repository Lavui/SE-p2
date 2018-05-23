--6 MULT
--3 CONDITIONALS
--WE LOSS ONE SAMPLE

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity BP_v1 is
generic (a_int :  integer range -32768 to 32767 := 437);
port (clk    : in  std_logic;
      clk_en : in  std_logic;
      x      : in  std_logic_vector(7  downto 0);
      X_dft  : out std_logic_vector(31 downto 0);
		test	 : out std_logic; --now debug, later state?
		enable12: out std_logic
--		el1	 : out std_logic_vector(15 downto 0);
--		el2	 : out std_logic_vector(15 downto 0);
--      Xo_32  : in std_logic_vector(31 downto 0)
     );
end entity BP_v1;

architecture rtl of BP_v1 is

   signal x8  : signed(8 downto 0);-- it is 9 bits !!!
	--signal x8  : signed(7 downto 0);
	signal s1_16 : signed(15 downto 0):= to_signed(0,16); 
	signal s2_16 : signed(15 downto 0):= to_signed(0,16); 
	signal a_s1_16 : signed(15 downto 0):= to_signed(0,16); 
	signal a_s1_32 : signed(31 downto 0); 
	signal sn_16 : signed(15 downto 0); 
	signal n : unsigned(7 downto 0):= to_unsigned(0,8);
	signal n_sub : unsigned(7 downto 0):= to_unsigned(0,8); 

	signal X_32 : signed(31 downto 0); 
	
	
	constant a : signed(15 downto 0):=to_signed(a_int,16);
	constant threshold : signed(31 downto 0):=to_signed(1e6,32);
	
	-- variables proces multiplicador
	signal el1 : signed(15 downto 0):= to_signed(0,16); 
	signal el2 : signed(15 downto 0):= to_signed(0,16);
	signal Xo_32 : signed(31 downto 0); 
	
begin 
		   --input
			x8 <= signed('0' & x);-- it is 9 bits !!!
			--x8 <= signed(not(x(7)) & x(6 downto 0));
			
			--GOERTZEL FILTER
		   --Multiply and obtain a 32 bit result
		   a_s1_32 <= s1_16 * a;
		   --Extract the 16 meaningful bits
		   a_s1_16 <= a_s1_32(23 downto 8);
		   --Perform addition
		   sn_16 <= x8 + a_s1_16 - s2_16;

			--DFT COMPUTATION
--		   X_32 <= s1_16*s1_16 + s2_16*s2_16 -a_s1_16*s2_16;

		   Xo_32 <= el1 * el2;
			
		   process(clk)
           begin
			   if rising_edge(clk) then
					if clk_en = '1' then -- rebem mostra
							enable12 <= '0';
							test <= '0';
							n <= n + 1;
							s1_16 <= sn_16;
							s2_16 <= s1_16;
						elsif n = 195 then
							case to_integer(n_sub) is
								when 0 =>
												X_32 <= to_signed(0,32);
												el1 <= s1_16;
												el2 <= s1_16;
												n_sub <= n_sub + 1;		
								when 1 =>
												X_32 <= X_32 + Xo_32;
												el1 <= s2_16;
												el2 <= s2_16;
												n_sub <= n_sub + 1;	
								when 2 =>
												X_32 <= X_32 + Xo_32;
												el1 <= -a_s1_16;
												el2 <= s2_16;
												n_sub <= n_sub + 1;
								when 3 =>
												X_32 <= X_32 + Xo_32;											
												n_sub <= n_sub + 1;
								when 4 =>
												n <= to_unsigned(0,8);
												n_sub <= to_unsigned(0,8);
												s1_16 <= to_signed(0,16);
												s2_16 <= to_signed(0,16); --provem
												X_dft <= std_logic_vector(X_32);
												enable12 <= '1';
												if X_32 > threshold then
													test <= '1';
												else
													test <= '0';
												end if;
								when others =>
												null;
							end case;
	--						enable12 <= '0';
	--						s1_16 <= resize(x8,16);
	--						s2_16 <= to_signed(0,16);
					end if; -- clk_en
			   end if; -- rising edge           
		   end process;	
		
--	process(el1, el2)
--	begin
--			   Xo_32 <= el1 * el2;
--
--	end process;

end architecture rtl;      
      
