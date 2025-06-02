connect -url tcp:127.0.0.1:3121
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys A7 -100T 210292AA7B67A"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys A7 -100T 210292AA7B67A"} -index 0
dow C:/Users/lab1/Desktop/project_microblaze_nexys/project_microblaze_nexys.sdk/testowy_proj1_bsp_xgpio_example_1/Debug/testowy_proj1_bsp_xgpio_example_1.elf
bpadd -addr &main
