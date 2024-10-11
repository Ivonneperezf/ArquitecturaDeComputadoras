library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity NoCambio is 
    port( 
        clk, we, en: in STD_LOGIC; 
        addr: in STD_LOGIC_VECTOR(4 downto 0);
        di: in STD_LOGIC_VECTOR(31 downto 0);
        do: out STD_LOGIC_VECTOR(31 downto 0));
    end NoCambio; 

architecture Behavioral of NoCambio is 

    type ram_type is array(31 downto 0) of STD_LOGIC_VECTOR(31 downto 0); 
    signal RAM: ram_type; 
    
begin 
    process(clk) begin 
        if clk'event and clk = '1' then 
            if en = '1' then 
                if we = '1' then 
                    RAM(conv_integer(addr)) <= di; 
                else 
                    do <= RAM(conv_integer(addr));
                end if; 
            end if; 
        end if; 
    end process; 
end Behavioral;