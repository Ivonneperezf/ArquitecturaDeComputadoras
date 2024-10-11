library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

--Se reciben las direcciones de los registros 

entity SinglePort is 
    port( 
        clk: in STD_LOGIC;
        reset : in std_logic;
        we: in STD_LOGIC; 
        addr1: in STD_LOGIC_VECTOR(4 downto 0);
        addr2: in STD_LOGIC_VECTOR(4 downto 0);
        addr3: in STD_LOGIC_VECTOR(4 downto 0); 
        input: in STD_LOGIC_VECTOR(31 downto 0);
        output1: out STD_LOGIC_VECTOR(31 downto 0);
        output2: out STD_LOGIC_VECTOR(31 downto 0));
    end SinglePort; 

architecture Behavioral of SinglePort is 

    type ram_type is array(31 downto 0) of STD_LOGIC_VECTOR(31 downto 0); 
    signal RAM: ram_type; 
    --constant RAM : ram_type := (
    --"00000000000000000000000000000000",
    --"00000000000000000000000000000001",
    --"00000000000000000000000000000010",
    --"00000000000000000000000000000011",
    --"00000000000000000000000000000100",
    --"00000000000000000000000000000101",
    --"00000000000000000000000000000110",
    --"00000000000000000000000000000111",
    --"00000000000000000000000000001000",
    --"00000000000000000000000000001001",
    --"00000000000000000000000000001010",
    --"00000000000000000000000000001011",
    --"00000000000000000000000000001100",
    --"00000000000000000000000000001101",
    --"00000000000000000000000000001110",
    --"00000000000000000000000000001111",
    --"00000000000000000000000000010000",
    --"00000000000000000000000000010001",
    --"00000000000000000000000000010010",
    --"00000000000000000000000000010011",
    --"00000000000000000000000000010100",
    --"00000000000000000000000000010101",
    --"00000000000000000000000000010110",
    --"00000000000000000000000000010111",
    --"00000000000000000000000000011000",
    --"00000000000000000000000000011001",
    --"00000000000000000000000000011010",
    --"00000000000000000000000000011011",
    --"00000000000000000000000000011100",
    --"00000000000000000000000000011101",
    --"00000000000000000000000000011110",
    --"00000000000000000000000000011111");
 --CAMBIAR MEMORIA   
begin 
    process(clk)begin 
        if reset = '0' then
            if clk'event and clk = '1' then 
                if we = '1' then 
                    RAM(conv_integer(addr3)) <= input; 
                end if; 
            end if; 
         else
            
         end if;
    end process; 
    output1 <= RAM(conv_integer(addr1));
    output2 <= RAM(conv_integer(addr2)); 
end Behavioral;