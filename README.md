# CS303_Logic&Digital-System-Design
A simple elevator control system that can be implemented on an FPGA (Field Programmable Gate Array) device. This elevator system is a term project for the course "CS303: Logic & Digital System Design" in Sabanci University.

The users can control the elevator using the buttons and switches of the FPGA board they are using. The status of the elevator can also be observed from the LEDs and the seven-segment display in the board. The Verilog code for this project was implemented on a Nexys A7 FPGA board. The simulator that was used for the project was Xilinx Vivado 2018.2 Design Tool.

# How To Use
In the directory "CS303_Logic-Digital-System-Design\project_files", you can find a PDF detailing the objectives of the project titled "CS303_Term_Project_Fall_2022_23". In the same directory, the reference manual for the Nexys A7 FPGA board can be found. The files with the ".v" extension are to be used as the source files for the module, and the file with the ".xdc" extension can be used as the constraint file. Depending on the FPGA board to be utilized, the constraint file must be modified with the switch, LED, and the button names to be used. After adding these files to the simulator, the bitstream file can be generated and implemented. The folder titled "elevator_project" must be copied into the projects folder of the simulator.

For the explanation of the code and the steps we took, the PDF file titled "CS303_ProjectReport_ualtinbas" can be accessed. Thanks to Can Baltalı for his contributions.
