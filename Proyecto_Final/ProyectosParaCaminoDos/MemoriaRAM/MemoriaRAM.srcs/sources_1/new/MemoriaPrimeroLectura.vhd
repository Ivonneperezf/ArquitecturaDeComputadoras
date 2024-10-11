library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity MemoriaPrimeroLectura is
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC;
           en : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (4 downto 0);
           di : in STD_LOGIC_VECTOR (31 downto 0);
           do : out STD_LOGIC_VECTOR (31 downto 0));
end MemoriaPrimeroLectura;

architecture Behavioral of MemoriaPrimeroLectura is

type ram_type is array(31 downto 0) of STD_LOGIC_VECTOR(31 downto 0); 
signal RAM: ram_type; 


begin
    process(clk) begin  
        if rising_edge(clk) then 
            if en = '1' then 
                if we = '1' then 	
                    RAM(conv_integer(addr)) <= di; 
                end if; 
                do <= RAM(conv_integer(addr)); 
            end if; 
        end if; 
    end process; 
end Behavioral;
