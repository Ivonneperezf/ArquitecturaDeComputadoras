library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity MemoriaInstrucciones is
    Port ( clk : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (3 downto 0);
           data_out : out STD_LOGIC_VECTOR (31 downto 0));
end MemoriaInstrucciones;

architecture Behavioral of MemoriaInstrucciones is

type rom_type is array (0 to 8) of std_logic_vector (31 downto 0);
constant rom_data : rom_type := (
---------------CODIGOS DE INSTRUCCION QUE PUSIMOS----------------- 
"00000000000000011000000000000001", --SUMA      (00018001)
"00000000010000111000100000000010", --RESTA     (00438802)
"00000000100001011001000000000011", --AND       (00859003)
"00000000110001111001100000000100", --OR        (00C79804)
"00000001000010011010000000100111", --NEGB      (0109A027)
"00010001010010110000000000010101", --BEQ       (114B0015)
"00010101100011010000000000010110", --BNE       (158D0016)
"00001000000000000000000000010111", --J         (08000017)
"00000001110011111100000000101111"); --COMP2B   (01CFC02F)

begin
    process (clk) begin
        if rising_edge (clk) then
            data_out <= rom_data(conv_integer(addr));
        end if;
    end process;
end Behavioral;
