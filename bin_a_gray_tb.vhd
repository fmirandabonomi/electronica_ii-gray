-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bin_a_gray_tb is
-- vacío
end bin_a_gray_tb;

architecture arch of bin_a_gray_tb is
  constant ancho : natural := 3;
  component bin_a_gray is
    port(
      x : IN  std_logic_vector (ancho-1 downto 0);
      y : OUT std_logic_vector (ancho-1 downto 0));
  end component;
  
  signal bin  : std_logic_vector(ancho-1 downto 0);
  signal gray : std_logic_vector (ancho-1 downto 0);
  
  constant enunciado : string := "bin_a_gray debe generar un codigo gray";
  constant s_pass : string := enunciado &" [PASS]";
  constant s_fail : string := enunciado &" [FAIL]";

  -- [ref](https://hardwarecoder.com/qa/83/vhdl-function?show=85#a85)
  function count_ones (
    input: std_logic_vector
  ) return natural is
  variable counter : natural := 0;
  begin
    for index in input'range loop
      if input(index) = '1' then
        counter := counter + 1;
      end if;
    end loop;
    return counter;
  end function;

  function hdist_one (
    as: std_logic_vector;
    bs: std_logic_vector
  ) return boolean is
  begin
    if as'length /= bs'length then
      return false;
    else
      return 1 = count_ones(as xor bs);
    end if;
  end function;
  constant num_casos : natural := 2**ancho;

begin
  
  dut : bin_a_gray port map(x => bin, y => gray);
  
  process is
    type tabla  is array (0 to num_casos-1) of std_logic_vector (ancho-1 downto 0);
    variable resultados : tabla := (others => std_logic_vector(to_unsigned(0,ancho)));
    variable all_passed : boolean := true;
    variable passed     : boolean;
  begin
    for i in resultados'range loop
      bin <= std_logic_vector(to_unsigned(i,ancho));
      wait for 1 ns;
      resultados(i) := gray;
    end loop;
    for i in resultados'range loop
      if all_passed = false then
        exit;
      end if;
      for k in i+1 to resultados'length-1 loop
        if all_passed = false then
          exit;
        end if;
      	passed := (resultados(i) /= resultados(k)); 
        all_passed := passed and all_passed;
        assert passed
          report "Da el mismo codigo para "&integer'image(i)&" y "&integer'image(k)
          severity error;
      end loop;
      if i = resultados'length-1 then
        passed := hdist_one(resultados(resultados'length-1),resultados(0));
        all_passed := passed and all_passed;
      	assert passed
          report "Distancia entre codigos del primer y ultimo valor distinta de uno"
          severity error;
      else
        passed := hdist_one(resultados(i),resultados(i+1));
        all_passed := passed and all_passed;
        assert passed
          report "Distancia entre codigos para "&integer'image(i)&" y "&integer'image(i+1)&" distinta de uno"
          severity error;
      end if;
    end loop;
    if all_passed then
      report s_pass severity note;
    else
      report s_fail severity error;
    end if;
    wait;
  end process;
end arch;