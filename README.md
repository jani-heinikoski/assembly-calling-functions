
# Calling functions in x86-64 assembly language

This small program is intended for educational purposes. It shows how calling functions in x86-64 assembly language can be implemented (without using the call, leave, and ret instructions).


## Sequence diagram

![Program execution sequence diagram](https://github.com/jani-heinikoski/assembly-calling-functions/blob/main/docs/sequencediagram.png)


## Compile and run locally

Clone the project (HTTPS)

```bash
  git clone https://github.com/jani-heinikoski/assembly-calling-functions.git
```

Go to the project directory

```bash
  cd assembly-calling-functions
```

Compile the program using GNU make

```bash
  make
```

(Can also compile with GCC)

```bash
  gcc -nostdlib calling_functions.s -o calling_functions
```

Run the executable

```bash
  ./calling_functions
```

## Assembly language specifications

**Instruction set architecture (ISA):** x86-64

**Kernel:** Linux

**Assembler:** GNU Assembler (GAS)

**Assembly language syntax:** AT&T
