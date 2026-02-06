library ieee;
use ieee.std_logic_1164.all;

entity rightShift_9bit is
    port(
        d_in                            :   in std_logic_vector(8 downto 0);
        load, GReset, enable, GClock    :   in std_logic;
        d_out                           :   out std_logic_vector(8 downto 0)
    );
end rightShift_9bit;

architecture structural of rightShift_9bit is
    signal rightShiftedData     : std_logic_vector(8 downto 0);
    signal registerData         : std_logic_vector(8 downto 0);
    signal nextState            : std_logic_vector(8 downto 0);

    component enardFF_2 is
        port(
            i_resetBar	: in	std_logic;
            i_enable	: in	std_logic;
            i_clock		: in	std_logic;
            i_d		    : in	std_logic;
            o_q     	: out	std_logic;
            o_qBar      : out   std_logic
        );
    end component;
    
    component mux2to1_9bit is
        port(
            sel     : in std_logic;
            d_in1   : in std_logic_vector(8 downto 0);
            d_in2   : in std_logic_vector(8 downto 0);
            d_out   : out std_logic_vector(8 downto 0)
        );
    end component;

    begin
    rightShiftedData <= '1' & registerData(8 downto 1);

    mux: mux2to1_9bit
        port map(
            sel     => load,
            d_in1   => d_in,
            d_in2   => rightShiftedData,
            d_out   => nextState
        );
    
    generate_ff: for i in 0 to 8 generate
        dFF: enardFF_2 
            port map(
                i_resetBar => GReset,
                i_enable   => enable,
                i_clock	   => GClock,
                i_d		   => nextState(i),
                o_q        => registerData(i),
                o_qBar     => open
            );
    end generate;

    d_out <= registerData;
end structural;