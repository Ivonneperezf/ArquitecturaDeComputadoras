library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity divisorFrec is
    Port ( ent : in STD_LOGIC;
           rst : in STD_LOGIC;
           sal : out STD_LOGIC);
end divisorFrec;

-- Divisor de frecuencia para latarjeta nexys ddr4, cuyo reloj es de 100 Mhz, implementado para que se vea en un segundo.

architecture Behavioral of divisorFrec is
    constant maximo : integer := 49999999;
    signal temporal : std_logic;
    signal contador: integer range 0 to maximo := 0;

begin
    process(rst,ent) begin
        if (rst = '1') then
            temporal <= '0';
            contador <= 0;
        elsif rising_edge(ent) then
            if (contador = maximo) then
                temporal <= NOT(temporal);
                contador <= 0;
            else
                contador <= contador + 1;
            end if;
        end if;
    end process;    
    sal <= temporal;
end Behavioral;
