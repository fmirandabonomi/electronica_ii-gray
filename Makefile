ifeq ($(suffix $(SHELL)),.exe)
	rm = del
else
	rm = rm
endif

params = --std=08 
cf = work-obj08.cf 
all : $(cf)
	ghdl -m $(params) bin_a_gray_tb
	ghdl -r $(params) bin_a_gray_tb
 $(cf) : *.vhd
	ghdl -i $(params) *.vhd
clean : 
	ghdl clean
	$(rm) $(cf) *.o bin_a_gray_tb.exe
