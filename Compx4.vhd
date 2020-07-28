library ieee;
use ieee.std_logic_1164.all;

entity Compx4 is
port (
      inputA: in std_logic_vector (3 downto 0);
  inputB: in std_logic_vector (3 downto 0);
  results: out std_logic_vector(2 downto 0)
  );
  
end entity Compx4;

architecture design of Compx4 is

component singlecmp port (
      A, B: in std_logic;
  sout : out std_logic_vector(2 downto 0)
  );
end component;

signal bit1, bit2, bit3, bit4 : std_logic_vector(2 downto 0);

begin

inst1: singlecmp port map (inputA(3), inputB(3), bit1);

inst2: singlecmp port map (inputA(2), inputB(2), bit2);

inst3: singlecmp port map (inputA(1), inputB(1), bit3);

inst4: singlecmp port map (inputA(0), inputB(0), bit4);

--- result(0) is A > B
--- result(1) is A = B
--- result(2) is A < B

results(0) <= bit1(0) or (bit1(1) and bit2(0)) or (bit1(1) and bit2(1) and bit3(0)) or (bit1(1) and bit2(1) and bit3(1) and bit4(0));

results(1) <= bit1(1) and bit2(1) and bit3(1) and bit4(1);

results(2) <= bit1(2) or (bit1(1) and bit2(2)) or (bit1(1) and bit2(1) and bit3(2)) or (bit1(1) and bit2(1) and bit3(1) and bit4(2));

end design;