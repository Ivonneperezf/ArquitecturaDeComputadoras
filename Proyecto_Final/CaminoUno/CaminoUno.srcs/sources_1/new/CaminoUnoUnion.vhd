library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CaminoUnoUnion is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           PC_in : in STD_LOGIC_VECTOR (3 downto 0);
           data_out : out STD_LOGIC_VECTOR (31 downto 0));
end CaminoUnoUnion;

architecture Behavioral of CaminoUnoUnion is
---------------------Declaracion de los componenes-------------------------------
    component ProgramCounter 
    Port ( PC_in : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           PC_out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component contador_v1
        Port ( reset : in STD_LOGIC;
               clk : in STD_LOGIC;
               cnt_out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component MemoriaInstrucciones
        Port ( clk : in STD_LOGIC;
               addr : in STD_LOGIC_VECTOR (3 downto 0);
               data_out : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
-----------------------Señales que representan las uniones-----------------------
    signal PC_out_reg : std_logic_vector (3 downto 0);
    signal cnt_out_reg : std_logic_vector (3 downto 0);

begin
-----------------------Mapeo de entradas y salidas-----------------------------------
--Se asocian los pines de los componentes con los de la entidad de union
    registro_inst : ProgramCounter
    port map(
        clk => clk,
        PC_in => cnt_out_reg, --Salida cnt_out conecta a PC_in
        PC_out => PC_out_reg); --Salida PC_out conecta a addr

    memoria_instrucciones : MemoriaInstrucciones
    port map(
        clk => clk,
        addr => PC_out_reg, --Salida PC_out conecta a addr
        data_out => data_out);
        
    contador : contador_v1
    port map (
        clk => clk,
        reset => reset,
        cnt_out => cnt_out_reg); --Salida cnt_out conecta a PC_in
end Behavioral;
