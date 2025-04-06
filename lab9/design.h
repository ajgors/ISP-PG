//-----------------------------------------------------
// A 4 bit up-counter with synchronous active high reset
// and with active high enable signal
// Example from www.asic-world.com
//-----------------------------------------------------
#include "systemc.h"

//modul
SC_MODULE(gray_counter) {
    // Porty wejœciowe i wyjœciowe
    sc_in_clk     clock;      // Clock input of the design
    sc_in<bool>   reset;      // active high, synchronous Reset input  
    sc_out<sc_uint<3>> led_o; // Wyjœcie 3-bitowe (np. pod³¹czone do diod LED)

    //------------Local Variables Here---------------------
    sc_uint<3>	q; // Zmienna przechowuj¹ca aktualny stan licznika (3 bity)

    //------------Code Starts Here-------------------------
    void grey_process() {
        // At every rising edge of clock we check if reset is active
        // Jeœli aktywny reset – zeruj licznik
        if (reset.read() == 1) {
            q = 0;
        }
        // W przeciwnym razie, przy zboczu narastaj¹cym zegara – zwiêksz licznik
        else if(clock.posedge()) { // raising_edge of clock
            q = q + 1; 
        }

        //gray = liczba ^ (liczba >> 1)
        //000, 001, 011, 010, 110, 111, 101, 100
        led_o.write(q ^ (q >> 1));
    }

    // Constructor for the counter
    // Since this counter is a positive edge trigged one,
    // We trigger the below block with respect to positive
    // edge of the clock and also when ever reset changes state
    //konstruktor modulu
    SC_CTOR(gray_counter) {
        led_o.initialize(0);
        cout << "Executing new" << endl;
        // Rejestrujemy proces "process"
        // Wra¿liwy na: zbocze narastaj¹ce zegara (posedge) oraz stan resetu
        SC_METHOD(grey_process); 
        //lista czu³oœci grey_process
        sensitive << reset.pos();
        sensitive << clock.pos(); //uruchomienie procesu przy zboczu narastaj¹cym zegara
    } // End of Constructor

}; // End of Module 
