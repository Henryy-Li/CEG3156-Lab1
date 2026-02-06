library ieee;
use ieee.std_logic_1164.all;

entity mux4to1_9bit is
    port(
        sel     : in std_logic_vector(1 downto 0);
        d_in1   : in std_logic_vector(8 downto 0);
        d_in2   : in std_logic_vector(8 downto 0);
        d_in3   : in std_logic_vector(8 downto 0);
        d_in4   : in std_logic_vector(8 downto 0);
        d_out   : out std_logic_vector(8 downto 0)
    );
end mux4to1_9bit;

architecture structural of mux4to1_9bit is
    signal not_sel  : std_logic_vector(1 downto 0);     -- Complemented select signal value.
    signal selected : std_logic_vector(3 downto 0);     -- Combination of sel signals indicate the selected option in the MUX.
    
    signal temp1    : std_logic_vector(8 downto 0);     -- Intermediate value to check if d_in1 was selected.
    signal temp2    : std_logic_vector(8 downto 0);      
    signal temp3    : std_logic_vector(8 downto 0);     
    signal temp4    : std_logic_vector(8 downto 0);     

    begin
    not_sel(0) <= NOT(sel(0));
    not_sel(1) <= NOT(sel(1));
    selected(0) <= not_sel(1) AND not_sel(0);
    selected(1) <= not_sel(1) AND sel(0);
    selected(2) <= sel(1) AND not_sel(0);
    selected(3) <= sel(1) AND sel(0);

    gen_sel0: for i in 0 to 8 generate
        temp1(i) <= d_in1(i) AND selected(0);
    end generate;

    gen_sel1: for i in 0 to 8 generate
        temp2(i) <= d_in2(i) AND selected(1);
    end generate;

    gen_sel2: for i in 0 to 8 generate
        temp3(i) <= d_in3(i) AND selected(2);
    end generate;
    
    gen_sel3: for i in 0 to 8 generate
        temp4(i) <= d_in4(i) AND selected(3);
    end generate;

    gen_output: for i in 0 to 8 generate
        d_out(i) <= temp1(i) OR temp2(i) OR temp3(i) OR temp4(i);
    end generate;

end structural;