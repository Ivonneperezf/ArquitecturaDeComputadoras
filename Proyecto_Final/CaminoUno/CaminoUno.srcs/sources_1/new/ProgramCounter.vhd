library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ProgramCounter is
    Port ( PC_in : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           PC_out : out STD_LOGIC_VECTOR (3 downto 0));
end ProgramCounter;
------Nos ayuda a temporizar el proceso para enviar con el reloj los datos del contador------
architecture Behavioral of ProgramCounter is

signal temp_reg : std_logic_vector(3 downto 0);

begin
    process (clk) begin
        if rising_edge(clk) then
            temp_reg <= PC_in;
        end if;
    end process;
    PC_out <= temp_reg;
end Behavioral;
