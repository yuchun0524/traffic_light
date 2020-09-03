library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pass            : in     vl_logic;
        recount         : in     vl_logic;
        count           : out    vl_logic_vector(10 downto 0)
    );
end counter;
