library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity union is
    Port ( ent : in STD_LOGIC;
           rst : in STD_LOGIC;
           reset : in STD_LOGIC;
           LedVaso : out STD_LOGIC;
           LedBomba: out STD_LOGIC;
           LedLleno : out STD_LOGIC;
           sensor_vaso : in STD_LOGIC;
           sensor_lleno : in STD_LOGIC);
end union;

architecture Behavioral of union is

component BombaAgua is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           LedVaso, LedBomba, LedLleno : out STD_LOGIC;
           sensor_vaso,sensor_lleno : in STD_LOGIC);
           --activar_bomba : out STD_LOGIC);
end component;

signal reloj : std_logic;

component divisorFrec is
    Port ( ent : in STD_LOGIC;
           rst : in STD_LOGIC;
           sal : out STD_LOGIC);
end component;

begin

    maquina_estados : BombaAgua
    port map(
        clk => reloj,
        reset => reset,
        LedVaso => LedVaso,
        LedBomba => LedBomba,
        LedLleno => LedLleno,
        sensor_vaso => sensor_vaso,
        sensor_lleno => sensor_lleno);
        
    divisor : divisorFrec
    port map(
        ent => ent,
        rst => rst,
        sal => reloj);

end Behavioral;
