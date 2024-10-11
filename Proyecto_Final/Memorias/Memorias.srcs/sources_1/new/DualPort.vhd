library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DualPort is 
    port( 
        clk, we: in STD_LOGIC; 
        addr1: in STD_LOGIC_VECTOR(4 downto 0); 
        addr2: in STD_LOGIC_VECTOR(4 downto 0); 
        di: in STD_LOGIC_VECTOR(31 downto 0); 
        do1: out STD_LOGIC_VECTOR(31 downto 0); 
        do2: out STD_LOGIC_VECTOR(31 downto 0)); 
    end DualPort;

architecture Behavioral of DualPort is 

    type ram_type is array(31 downto 0) of STD_LOGIC_VECTOR(31 downto 0); 
    signal RAM: ram_type; 

begin 
    process(clk)begin 
        if clk'event and clk = '1' then
            if we = '1' then 
                RAM(conv_integer(addr1)) <= di; 
            end if; 
        end if; 
    end process; 
    do1 <= RAM(conv_integer(addr1)); 
    do2 <= RAM(conv_integer(addr2)); 
end Behavioral;