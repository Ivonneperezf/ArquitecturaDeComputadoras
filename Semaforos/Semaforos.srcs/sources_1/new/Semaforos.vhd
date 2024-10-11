library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Semaforos is
    Port (
        clk, reset : in  STD_LOGIC;
        V1, V2, A1, A2, R1, R2 : out  STD_LOGIC
    );
end Semaforos;

architecture Behavioral of Semaforos is

    -- Definición del tipo de datos enumerado para los estados del semáforo
    TYPE Semaforo IS (R1R2, V1R2, A1R2, R1V2, R1A2);
    SIGNAL Edo_presente, Edo_siguiente : Semaforo;
	 
    CONSTANT timeMax : INTEGER := 45;
    CONSTANT timeV1R2 : INTEGER := 7;
    CONSTANT timeA1R2 : INTEGER := 3;
    CONSTANT timeR1V2 : INTEGER := 7;
    CONSTANT timeR1A2 : INTEGER := 3;
    
    -- Variable temporal para contar el tiempo en cada estado
    signal tempo : INTEGER range 0 to timeMax;

begin

    process (clk, reset)
        variable cont : INTEGER range 0 to timeMax;
    begin
        if (reset ='1') then
            Edo_presente <= R1R2;
				cont := 0;
        elsif (rising_edge(clk)) then
            cont := cont + 1;
            if (cont = tempo) then
                Edo_presente <= Edo_siguiente;
                cont := 0;
            end if;
         end if;
    end process;
    
    -- Proceso para controlar el comportamiento de los semáforos
    PROCESS (Edo_presente)
    BEGIN
        CASE Edo_presente IS
            WHEN V1R2 =>
                 V1 <= '1'; V2 <= '0'; A1 <= '0'; A2 <= '0'; R1 <= '0'; R2 <= '1';
                 Edo_siguiente <= A1R2;
                 tempo <= timeA1R2;
            WHEN A1R2 =>
                 V1 <= '0'; V2 <= '0'; A1 <= '1'; A2 <= '0'; R1 <= '0'; R2 <= '1';
                 Edo_siguiente <= R1V2;
                 tempo <= timeR1V2;
            WHEN R1V2 =>
                 V1 <= '0'; V2 <= '1'; A1 <= '0'; A2 <= '0'; R1 <= '1'; R2 <= '0';
                 Edo_siguiente <= R1A2;
                 tempo <= timeR1A2;
            WHEN R1A2 =>
                 V1 <= '0'; V2 <= '0'; A1 <= '0'; A2 <= '1'; R1 <= '1'; R2 <= '0';
                 Edo_siguiente <= R1R2;
                 tempo <= timeV1R2;
			   WHEN R1R2 =>
                 V1 <= '0'; V2 <= '0'; A1 <= '0'; A2 <= '0'; R1 <= '1'; R2 <= '1';
                 Edo_siguiente <= V1R2;
					  tempo <= 1;
        END CASE;
    END PROCESS;

end Behavioral;
