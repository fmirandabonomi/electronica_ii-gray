-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity bin_a_gray is
  port(
    x : IN  std_logic_vector (2 downto 0);
    y : OUT std_logic_vector (2 downto 0));
end bin_a_gray;

architecture arch of bin_a_gray is
begin
  with x select -- Completar la tabla
    y <=  "000" when o"0",
          "000" when o"1",
          "000" when o"2",
          "000" when o"3",
          "000" when o"4",
          "000" when o"5",
          "000" when o"6",
          "000" when others; -- 7
end arch;