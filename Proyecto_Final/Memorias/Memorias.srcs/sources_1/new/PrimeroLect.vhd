library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;    

entity PrimeroLect is port( 
    clk : in std_logic;
    we : in std_logic;
    en: in STD_LOGIC; 
    reset : in std_logic;
    addr1: in STD_LOGIC_VECTOR(4 downto 0);
    addr2: in STD_LOGIC_VECTOR(4 downto 0);
    addr3: in STD_LOGIC_VECTOR(4 downto 0); 
    input: in STD_LOGIC_VECTOR(31 downto 0);
    output1: out STD_LOGIC_VECTOR(31 downto 0);
    output2: out STD_LOGIC_VECTOR(31 downto 0));
end PrimeroLect; 

architecture Behavioral of PrimeroLect is
    type ram_type is array(31 downto 0) of STD_LOGIC_VECTOR(31 downto 0); 
    signal RAM: ram_type := (
        0  => X"00000000",
        1  => X"11111111",
        2  => X"22222222",
        3  => X"33333333",
        4  => X"44444444",
        5  => X"55555555",
        6  => X"66666666",
        7  => X"77777777",
        8  => X"88888888",
        9  => X"99999999",
        10 => X"AAAAAAAA",
        11 => X"BBBBBBBB",
        12 => X"CCCCCCCC",
        13 => X"DDDDDDDD",
        14 => X"EEEEEEEE",
        15 => X"FFFFFFFF",
        16 => X"0000FFFF",
        17 => X"FFFF0000",
        18 => X"12345678",
        19 => X"87654321",
        20 => X"ABCDEF01",
        21 => X"10FEDCBA",
        22 => X"0F0F0F0F",
        23 => X"F0F0F0F0",
        24 => X"55AA55AA",
        25 => X"AA55AA55",
        26 => X"DEADBEEF",
        27 => X"FEEDFACE",
        28 => X"C001C0DE",
        29 => X"BADC0FFE",
        30 => X"CAFEBABE",
        31 => X"DEADC0DE"
    ); 
    
begin
    process(clk) begin 
        if clk'event and clk = '1' then
            if reset = '1' then  -- Comprobamos el reset
                -- Inicializamos la RAM a ceros cuando reset está activo
                for i in 0 to 31 loop
                    RAM(i) <= (others => '0');
                end loop;
            elsif en = '1' then
                if we = '1' then 	
                    RAM(conv_integer(addr3)) <= input; 
                end if; 
                output1 <= RAM(conv_integer(addr1));
                output2 <= RAM(conv_integer(addr2)); 
            end if; 
        end if; 
    end process; 
end Behavioral;