--Podemos colocar los las variables de sensores como switches para representarlos en la tarjeta

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity BombaAgua is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           LedVaso, LedBomba, LedLleno : out STD_LOGIC;
           sensor_vaso,sensor_lleno : in STD_LOGIC);
           --activar_bomba : out STD_LOGIC);
end BombaAgua;

architecture Behavioral of BombaAgua is

TYPE Bomba IS (rst,S0, S1, S2);
signal Edo_presente, Edo_siguiente : Bomba;
signal activar_bomba : std_logic;

begin

    process (clk, reset) begin
        if (reset ='1') then
            Edo_presente <= S0;
        elsif (rising_edge(clk)) then
            Edo_presente <= Edo_siguiente;
        end if;
    end process;

    process (Edo_presente,  sensor_vaso,sensor_lleno) begin
        CASE (Edo_presente) IS
            WHEN rst =>
                LedVaso <= '0'; LedBomba <= '0'; LedLleno <= '0'; activar_bomba <= '0';
                if (reset = '0') then
                    Edo_siguiente <= S0;
                else
                    Edo_siguiente <= rst;
                end if;
            WHEN S0 => --Sensor vaso
                if (sensor_vaso = '0') then
                    LedVaso <= '0'; LedBomba <= '0'; LedLleno <= '0'; activar_bomba <= '0';
                    Edo_siguiente <= S0;
                else
                    LedVaso <= '1'; LedBomba <= '0'; LedLleno <= '0'; activar_bomba <= '0';
                    Edo_siguiente <= S1;
                end if;
            WHEN S1 => --Sensor lleno
                if (sensor_lleno = '0') then
                    LedVaso <= '0'; LedBomba <= '1'; LedLleno <= '0'; activar_bomba <= '1';
                    Edo_siguiente <= S2;
                else
                    LedVaso <= '0'; LedBomba <= '0'; LedLleno <= '1';activar_bomba <= '0';
                    Edo_siguiente <= S0;
                end if;
            WHEN S2 => --Bomba
                if (sensor_lleno = '0') then
                    LedVaso <= '0'; LedBomba <= '0'; LedLleno <= '0'; activar_bomba <= '0';
                    Edo_siguiente <= S2;
                else
                    LedVaso <= '0'; LedBomba <= '1'; LedLleno <= '0'; activar_bomba <= '0';
                    Edo_siguiente <= S2;
                end if;
            
        end case;
    end process;
end Behavioral;
