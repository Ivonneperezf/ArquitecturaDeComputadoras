library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BombaAgua is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        LedVaso, LedBomba, LedLleno : out STD_LOGIC;
        sensor_vaso, sensor_lleno : in STD_LOGIC
    );
end BombaAgua;

architecture Behavioral of BombaAgua is

    TYPE Bomba IS (rst, S0, S1, S2);
    signal Edo_presente, Edo_siguiente : Bomba;

    -- Constantes de tiempo (en ciclos de reloj)
    CONSTANT timeS2 : INTEGER := 3; -- Tiempo en estado S2
    signal tempo : INTEGER range 0 to timeS2; -- Contador de tiempo

begin

    -- Proceso secuencial para manejar los cambios de estado basados en el contador de tiempo
    process (clk, reset)
    begin
        if (reset = '1') then
            Edo_presente <= S0;
            tempo <= 0;
        elsif (rising_edge(clk)) then
            if tempo = 0 then
                Edo_presente <= Edo_siguiente;
                -- Resetea el contador solo al cambiar de estado
                if Edo_siguiente = S2 then
                    tempo <= timeS2;
                else
                    tempo <= 0;
                end if;
            else
                tempo <= tempo - 1;
            end if;
        end if;
    end process;

    -- Proceso combinacional para determinar las salidas y el siguiente estado
    process (Edo_presente, sensor_vaso, sensor_lleno)
    begin
        case Edo_presente is
            when rst =>
                if reset = '0' then
                    LedVaso <= '0'; LedBomba <= '0'; LedLleno <= '0';
                    Edo_siguiente <= S0;
                else
                    LedVaso <= '0'; LedBomba <= '0'; LedLleno <= '0';
                    Edo_siguiente <= rst;
                end if;

            when S0 => -- Inicio
                if sensor_vaso = '0' then
                    LedVaso <= '0'; LedBomba <= '0'; LedLleno <= '0';
                    Edo_siguiente <= S0;
                else
                    LedVaso <= '1'; LedBomba <= '0'; LedLleno <= '0';
                    Edo_siguiente <= S1; 
                end if;
            
            when S1 => -- Llenado
                if sensor_lleno = '0' then
                    LedVaso <= '0'; LedBomba <= '1'; LedLleno <= '0';
                    Edo_siguiente <= S1; 
                else
                    LedVaso <= '0'; LedBomba <= '0'; LedLleno <= '1';
                    Edo_siguiente <= S2; -- Cambia al siguiente estado
                end if;

            when S2 => -- Finalización
                LedVaso <= '0'; LedBomba <= '0'; LedLleno <= '1';
                Edo_siguiente <= S0; -- Vuelve al inicio

        end case;
    end process;

end Behavioral;
