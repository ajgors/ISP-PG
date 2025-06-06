//-----------------------------------------------------
// Testbench for the 4-bit up-counter ---------------->
// Example from www.asic-world.com (with fixes)
//-----------------------------------------------------
#include "systemc.h"
#include "design.h"
#include <iostream>

int sc_main (int argc, char* argv[]) {
  // Deklaracja sygna��w
  sc_signal<bool>   clock;
  sc_signal<bool>   reset;
  sc_signal<sc_uint<3> > led_o;
  int i = 0;

  // Connect the DUT
  // Po��czenie testbencha z modu�em
  // Tworzymy instancj� modu�u gray_counter
  // Pod��czamy porty testbencha do odpowiednich sygna��w.
  gray_counter counter("COUNTER");
  counter.clock(clock);
  counter.reset(reset);
  counter.led_o(led_o);
  
  sc_start(1, SC_NS); //Uruchamiamy symulacj� na 1 nanosekund� (rozruch).

  // Open VCD file
  sc_trace_file *wf = sc_create_vcd_trace_file("counter");
  // Dump the desired signals
  sc_trace(wf, clock, "clock");
  sc_trace(wf, reset, "reset");
  sc_trace(wf, led_o, "led_o");


  //Symulacja bez resetu(50 cykli)
  // Initialize all variables
  reset = 0;       // initial value of reset
  for (i=0;i<50;i++) {
    clock = 0;
    sc_start(1, SC_NS); //clock 0 przez 1ns
    clock = 1; 
    sc_start(1, SC_NS); //clock 1 przez 1ns
  }


  // Symulacja z resetem (50 cykli)
  //Aktywujemy reset (reset = 1).
  //W czasie tych 50 cykli licznik powinien ca�y czas by� w stanie zerowym.
  reset = 1;    // Assert the reset
  cout << "@" << sc_time_stamp() <<" Asserting reset\n" << endl;
  for (i=0;i<50;i++) {
    clock = 0; 
    sc_start(1, SC_NS);
    clock = 1; 
    sc_start(1, SC_NS);
  }


  //Symulacja normalnej pracy po resecie (500 cykli)
  reset = 0;    // De-assert the reset
  cout << "@" << sc_time_stamp() <<" De-Asserting reset\n" << endl;
  for (i=0;i<500;i++) {
    clock = 0; 
    sc_start(1, SC_NS);
    clock = 1; 
    sc_start(1, SC_NS);
  }

  //Zamkni�cie symulacji
  //Zamykamy plik VCD
  cout << "@" << sc_time_stamp() <<" Terminating simulation\n" << endl;
  sc_close_vcd_trace_file(wf);
  return 0;// Terminate simulation
}

