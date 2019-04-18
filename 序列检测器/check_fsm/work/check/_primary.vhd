library verilog;
use verilog.vl_types.all;
entity check is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        in_put          : in     vl_logic;
        flag            : out    vl_logic;
        led             : out    vl_logic_vector(2 downto 0)
    );
end check;
