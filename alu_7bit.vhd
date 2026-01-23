library ieee;
use ieee.std_logic_1164.all;

entity alu_7bit is
    port(
        d_in1   :   in std_logic_vector(7 downto 0);
        d_in2   :   in std_logic_vector(7 downto 0);
        d_out   :   out std_logic_vector(7 downto 0);
    );
end alu_7bit;

