library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity DecodificadorInstrucciones is
    Port ( instruccion : in STD_LOGIC_VECTOR (31 downto 0);
           Cop : out STD_LOGIC_VECTOR (5 downto 0);
           R1 : out STD_LOGIC_VECTOR (4 downto 0);
           R2 : out STD_LOGIC_VECTOR (4 downto 0);
           R3 : out STD_LOGIC_VECTOR (4 downto 0);
           shamt : out STD_LOGIC_VECTOR (4 downto 0);
           funcion : out STD_LOGIC_VECTOR (5 downto 0));
end DecodificadorInstrucciones;

architecture Behavioral of DecodificadorInstrucciones is

begin

    Cop <= instruccion(31 downto 26);   --6 bits
    R1 <= instruccion(25 downto 21);    --5 bits
    R2 <= instruccion(20 downto 16);    --5 bits
    R3 <= instruccion (15 downto 11);   --5 bits
    shamt <= instruccion (10 downto 6); --5 bits
    funcion <= instruccion (5 downto 0);--6 bits

end Behavioral;
