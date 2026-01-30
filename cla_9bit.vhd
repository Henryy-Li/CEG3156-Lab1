library ieee;
use ieee.std_logic_1164.all;

entity cla_9bit is
    port(
        a_in    :   in std_logic_vector(8 downto 0);
        b_in    :   in std_logic_vector(8 downto 0);
        cin     :   in std_logic;
        s_out   :   out std_logic_vector(8 downto 0);
        cout    :   out std_logic
    );
end cla_9bit;

architecture structural of cla_9bit is
    signal g    : std_logic_vector(8 downto 0);
    signal p    : std_logic_vector(8 downto 0);
    signal c    : std_logic_vector(8 downto 0);

    begin
    g(0) <= a_in(0) AND b_in(0); 
    g(1) <= a_in(1) AND b_in(1); 
    g(2) <= a_in(2) AND b_in(2); 
    g(3) <= a_in(3) AND b_in(3); 
    g(4) <= a_in(4) AND b_in(4); 
    g(5) <= a_in(5) AND b_in(5); 
    g(6) <= a_in(6) AND b_in(6); 
    g(7) <= a_in(7) AND b_in(7); 
    g(8) <= a_in(8) AND b_in(8); 

    p(0) <= a_in(0) OR b_in(0);
    p(1) <= a_in(1) OR b_in(1);
    p(2) <= a_in(2) OR b_in(2);
    p(3) <= a_in(3) OR b_in(3);
    p(4) <= a_in(4) OR b_in(4);
    p(5) <= a_in(5) OR b_in(5);
    p(6) <= a_in(6) OR b_in(6);
    p(7) <= a_in(7) OR b_in(7);
    p(8) <= a_in(8) OR b_in(8);

    c(0) <= cin;
    c(1) <= g(0) OR (p(0) AND c(0));
    c(2) <= g(1) OR (p(1) AND c(1));
    c(3) <= g(2) OR (p(2) AND c(2));
    c(4) <= g(3) OR (p(3) AND c(3));
    c(5) <= g(4) OR (p(4) AND c(4));
    c(6) <= g(5) OR (p(5) AND c(5));
    c(7) <= g(6) OR (p(6) AND c(6));
    c(8) <= g(7) OR (p(7) AND c(7));
    cout <= g(8) OR (p(8) AND c(8));

    s_out(0) <= (a_in(0) XOR b_in(0)) XOR c(0);
    s_out(1) <= (a_in(1) XOR b_in(1)) XOR c(1);
    s_out(2) <= (a_in(2) XOR b_in(2)) XOR c(2);
    s_out(3) <= (a_in(3) XOR b_in(3)) XOR c(3);
    s_out(4) <= (a_in(4) XOR b_in(4)) XOR c(4);
    s_out(5) <= (a_in(5) XOR b_in(5)) XOR c(5);
    s_out(6) <= (a_in(6) XOR b_in(6)) XOR c(6);
    s_out(7) <= (a_in(7) XOR b_in(7)) XOR c(7);
    s_out(8) <= (a_in(8) XOR b_in(8)) XOR c(8);
end structural;