library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EdgeDetector is
  port (
    clk         : in std_logic;
    dIn         : in std_logic;
    dOut        : out std_logic
    );
end EdgeDetector;

architecture RTL of EdgeDetector is
  -- Internal signal declaration ------------
  signal reg_shift   : std_logic_vector(1 downto 0);

begin
  --=============== body ====================
  u_edge : process(clk)
  begin
    if(clk'event AND clk = '1') then
      reg_shift         <= reg_shift(0) & dIn;
      if(reg_shift = "01") then
        dOut    <= '1';
      else
        dOut    <= '0';
      end if;
    end if;
  end process u_edge;

end RTL;
