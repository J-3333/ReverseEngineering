# Case Swap Assembly Program

## Author
**Name:** Jamie Yong Wei Ng <br>
**Student Number:** C00290917

## License
This project is licensed under the **GNU General Public License (GPLv3)**.  
See [GPL-3.0 License](https://www.gnu.org/licenses/gpl-3.0.html) for details.

## Project Description
This is a **32-bit x86 Assembly program** that reads a string from the user and converts **uppercase letters to lowercase** and **lowercase letters to uppercase** while ignoring non-printable characters.
This project will read a string (max 23 characters) from the user, swap the case of alphabetic characters and outputs the modified string.


## Instructions on producing an executable
This program is written in **NASM (Netwide Assembler)** and runs on **Linux (x86-32 architecture).**
To produce an executable:
```sh

# 1. Assemble the program into an object file
nasm -f elf32 swapcase.asm -o  swapcase.o

# 2. Link the object file to create an executable
ld -m elf_i386 swapcase.o    

# 3. Run the executable
./a.out

Example:
Enter text: (Max 23 characters): Hello JOE!
After Case Swapping:hELLO joe!

```



## Issues/Notes
1. The program swaps the case of alphabetic characters (A-Z, a-z) while keeping non-alphabetic characters unchanged."
2. Limited to 23 characters, as defined in the buffer size.
3. If an empty input is given, the program may not behave as expected.
4. The program relies on Linux system calls, so it will not work on Windows without a Linux emulator like WSL (Windows Subsystem for Linux).
