library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlALU is
    Port ( ALUop : in STD_LOGIC_VECTOR (1 downto 0);
           funcion : in STD_LOGIC_VECTOR (5 downto 0);
           operacion : out STD_LOGIC_VECTOR (2 downto 0));
end ControlALU;

architecture Behavioral of ControlALU is

signal tmp : std_logic_vector (2 downto 0) := "111";

begin
    process (ALUop, funcion) begin
         case (ALUop) is
            when "11" =>
                case (funcion) is
                    when "000001" =>
                        tmp <= "000";
                    when "000010" => 
                        tmp <= "001";
                    when "000011" => 
                        tmp <= "010";
                    when "000100" => 
                        tmp <= "011";
                    when others  =>
                        tmp <= "111";
                end case;
            when others  =>
                tmp <= "111";
            end case;
    end process;
    operacion <= tmp;
end Behavioral;
