library verilog;
use verilog.vl_types.all;
entity debounce is
    generic(
        NUMBER          : vl_logic_vector(0 to 23) := (Hi0, Hi0, Hi1, Hi1, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi1, Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        NBITS           : integer := 24
    );
    port(
        clk             : in     vl_logic;
        key_i           : in     vl_logic;
        key_o           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of NUMBER : constant is 1;
    attribute mti_svvh_generic_type of NBITS : constant is 1;
end debounce;
