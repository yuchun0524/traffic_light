library verilog;
use verilog.vl_types.all;
entity traffic_control is
    generic(
        SG_light        : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        None_light1     : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        G_light1        : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        None_light2     : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        G_light2        : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        Y_light         : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1);
        R_light         : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pass            : in     vl_logic;
        count           : in     vl_logic_vector(10 downto 0);
        R               : out    vl_logic;
        G               : out    vl_logic;
        Y               : out    vl_logic;
        recount         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SG_light : constant is 1;
    attribute mti_svvh_generic_type of None_light1 : constant is 1;
    attribute mti_svvh_generic_type of G_light1 : constant is 1;
    attribute mti_svvh_generic_type of None_light2 : constant is 1;
    attribute mti_svvh_generic_type of G_light2 : constant is 1;
    attribute mti_svvh_generic_type of Y_light : constant is 1;
    attribute mti_svvh_generic_type of R_light : constant is 1;
end traffic_control;
