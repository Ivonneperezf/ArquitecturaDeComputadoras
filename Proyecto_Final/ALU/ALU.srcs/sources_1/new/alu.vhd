library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity alu is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           C : in STD_LOGIC_VECTOR (2 downto 0);
           R : out STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is
begin
    process (A, B, C) 
    begin
        case C is
            when "000" =>
                R <= std_logic_vector(unsigned(A) + unsigned(B));  -- Suma
            when "001" =>
                R <= std_logic_vector(unsigned(A) - unsigned(B));  -- Resta
            when "010" =>
                R <= A and B;  -- AND
            when "011" =>
                R <= A or B;   -- OR
            when others =>
                R <= (others => '0');  -- Salida por defecto
        end case;
    end process;
end Behavioral;
