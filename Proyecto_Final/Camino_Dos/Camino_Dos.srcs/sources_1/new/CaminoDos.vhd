library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CaminoDos is
    Port ( clk : in std_logic; --Para memoria de registro
           reset : in std_logic; --Para memoria de registro
           we : in std_logic; --Para memoria de registro
           en : in std_logic; --Para memoria de registro
           instruccion : in STD_LOGIC_VECTOR (31 downto 0); --Para decodificador de instrucciones
           C : in std_logic_vector (2 downto 0); --Para ALU
           Cop : out STD_LOGIC_VECTOR (5 downto 0); --Salida no usada (Decodificador de instrucciones)
           shamt : out STD_LOGIC_VECTOR (4 downto 0); --Salida no usada (Decodificador de instrucciones)
           funcion : out STD_LOGIC_VECTOR (5 downto 0)); --Salida no usada (Decodificador de instrucciones)
end CaminoDos;

architecture Behavioral of CaminoDos is

-------------COMPONENTES------------------
component DecodificadorInstrucciones is
    Port ( instruccion : in STD_LOGIC_VECTOR (31 downto 0);
           Cop : out STD_LOGIC_VECTOR (5 downto 0);
           R1 : out STD_LOGIC_VECTOR (4 downto 0);
           R2 : out STD_LOGIC_VECTOR (4 downto 0);
           R3 : out STD_LOGIC_VECTOR (4 downto 0);
           shamt : out STD_LOGIC_VECTOR (4 downto 0);
           funcion : out STD_LOGIC_VECTOR (5 downto 0));
end component;

component ControlALU is
    Port ( ALUop : in STD_LOGIC_VECTOR (1 downto 0);
           funcion : in STD_LOGIC_VECTOR (5 downto 0);
           operacion : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component PrimeroLect is port( 
    clk : in std_logic;
    we : in std_logic;
    en: in STD_LOGIC; 
    reset : in std_logic;
    addr1: in STD_LOGIC_VECTOR(4 downto 0);
    addr2: in STD_LOGIC_VECTOR(4 downto 0);
    addr3: in STD_LOGIC_VECTOR(4 downto 0); 
    input: in STD_LOGIC_VECTOR(31 downto 0);
    output1: out STD_LOGIC_VECTOR(31 downto 0);
    output2: out STD_LOGIC_VECTOR(31 downto 0));
end component;  

component alu is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           C : in STD_LOGIC_VECTOR (2 downto 0);
           R : out STD_LOGIC_VECTOR (31 downto 0));
end component;

--------------------------SEÑALES------------------------------
--DECODIFICADOR MEMORIA DE REGISTRO
signal signal_registro1 : std_logic_vector(4 downto 0);
signal signal_registro2 : std_logic_vector(4 downto 0);
signal signal_registro3 : std_logic_vector(4 downto 0);


--MEMORIA DE REGISTRO ALU
signal signal_dato1 : std_logic_vector(31 downto 0);
signal signal_dato2 : std_logic_vector(31 downto 0);

--SALIDA ALU
signal signal_alu : std_logic_vector (31 downto 0);

begin


----------------------MAPEO
Decod_instrucciones : DecodificadorInstrucciones
    port map(
        instruccion => instruccion,
        Cop => Cop,
        R1 => signal_registro1,
        R2 => signal_registro2,
        R3 => signal_registro3,
        shamt => shamt,
        funcion => funcion );
        
 Memoria_de_registros : PrimeroLect
    port map (
        clk => clk,
        we => we,
        en => en,
        reset => reset,
        addr1 => signal_registro1,
        addr2 => signal_registro2,
        addr3 => signal_registro3,
        input => signal_alu,
        output1 => signal_dato1,
        output2=> signal_dato2 );

operacion_alu : alu
    port map (
        A => signal_dato1,
        B => signal_dato2,
        C => C,
        R => signal_alu);

end Behavioral;
