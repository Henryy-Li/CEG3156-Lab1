library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_8bit is
    port(
        sel     : in std_logic;
        d_in1   : in std_logic_vector(7 downto 0);
        d_in2   : in std_logic_vector(7 downto 0);
        d_out   : out std_logic_vector(7 downto 0)
    );
end mux2to1_8bit;

architecture structural of mux2to1_8bit is
    signal not_sel  : std_logic;                        -- Complemented select signal value.
    signal temp1    : std_logic_vector(7 downto 0);     -- Intermediate value to check if d_in1 was selected.
    signal temp2    : std_logic_vector(7 downto 0);     -- Intermediate value to check if d_in2 was selected.

    begin
    not_sel <= NOT(sel);

    temp1(7) <= d_in1(7) AND not_sel;
    temp1(6) <= d_in1(6) AND not_sel;
    temp1(5) <= d_in1(5) AND not_sel;
    temp1(4) <= d_in1(4) AND not_sel;
    temp1(3) <= d_in1(3) AND not_sel;
    temp1(2) <= d_in1(2) AND not_sel;
    temp1(1) <= d_in1(1) AND not_sel;
    temp1(0) <= d_in1(0) AND not_sel;

    temp2(7) <= d_in2(7) AND sel;
    temp2(6) <= d_in2(6) AND sel;
    temp2(5) <= d_in2(5) AND sel;
    temp2(4) <= d_in2(4) AND sel;
    temp2(3) <= d_in2(3) AND sel;
    temp2(2) <= d_in2(2) AND sel;
    temp2(1) <= d_in2(1) AND sel;
    temp2(0) <= d_in2(0) AND sel;

    d_out(7) <= temp1(7) OR temp2(7);
    d_out(6) <= temp1(6) OR temp2(6);
    d_out(5) <= temp1(5) OR temp2(5);
    d_out(4) <= temp1(4) OR temp2(4);
    d_out(3) <= temp1(3) OR temp2(3);
    d_out(2) <= temp1(2) OR temp2(2);
    d_out(1) <= temp1(1) OR temp2(1);
    d_out(0) <= temp1(0) OR temp2(0);

end structural;