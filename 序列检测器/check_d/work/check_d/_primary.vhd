library verilog;
use verilog.vl_types.all;
entity check_d is
    port(
        clk             : in     vl_logic;
        d               : in     vl_logic;
        r               : in     vl_logic;
        flag            : out    vl_logic;
        q               : out    vl_logic_vector(5 downto 0)
    );
end check_d;
