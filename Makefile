ERL_INCLUDE_PATH= \
	$(shell elixir -e ":code.root_dir() |> Path.join(\"/usr/include\") |> IO.puts")

C_SRC_OUTPUT ?= priv/nif_compare.so

all:
	gcc -fPIC -I$(ERL_INCLUDE_PATH) -dynamiclib -undefined dynamic_lookup -o $(C_SRC_OUTPUT) c_src/nif_comparator.c c_src/comparator.c

clean: 
	@rm -fv $(C_SRC_OUTPUT) priv/compare.o
