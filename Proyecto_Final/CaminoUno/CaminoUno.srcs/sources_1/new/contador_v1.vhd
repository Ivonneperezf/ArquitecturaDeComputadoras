library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity contador_v1 is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           cnt_out : out STD_LOGIC_VECTOR (3 downto 0));
end contador_v1;

architecture Behavioral of contador_v1 is

signal cnt_tmp : std_logic_vector (3 downto 0) := "0000";
--Aumenta un contador de uno en uno para despues reiniciarse a cero si reset es 0
--Si reset es uno la salida siempre sera "0000"
begin
    process (clk, reset) begin
        if reset = '0' then
            if rising_edge(clk) then
                cnt_tmp <= cnt_tmp + 1;
            end if;
        else
            cnt_tmp <= "0000";
        end if;
    end process;
    cnt_out <= cnt_tmp;
end Behavioral;
