# ATM Simulator

A simple ATM (Automated Teller Machine) simulator implemented using Flex and Bison, demonstrating lexical analysis and parsing in C.

## Features

- **User Authentication**: PIN-based login system (default PIN: 1234)
- **Account Management**: Login and logout functionality
- **Balance Inquiry**: Check current account balance
- **Withdraw Money**: Withdraw funds with insufficient balance protection
- **Deposit Money**: Deposit funds to account
- **Session Management**: Ensures operations require authentication

## Project Structure

```
atm_project/
├── atm.l          # Flex lexical analyzer specification
├── atm.y          # Bison grammar specification  
├── atm.tab.c      # Generated parser (auto-generated)
├── atm.tab.h      # Generated header file (auto-generated)
├── lex.yy.c       # Generated lexer (auto-generated)
├── Makefile       # Build configuration
└── atm            # Compiled executable
```

## Prerequisites

- GCC compiler
- Flex (lexical analyzer generator)
- Bison (parser generator)
- Make utility

### Installation on Ubuntu/Debian
```bash
sudo apt-get update
sudo apt-get install gcc flex bison make
```

### Installation on Windows
- Install MinGW or use WSL with the above commands
- Or use a development environment like Dev-C++ with Flex/Bison

## Building the Project

1. Clone or download the project files
2. Navigate to the project directory
3. Run make to build the executable:

```bash
make
```

This will:
- Generate the lexer from `atm.l`
- Generate the parser from `atm.y`
- Compile and link everything into the `atm` executable

## Usage

Run the ATM simulator:

```bash
./atm
```

### Available Commands

Once the program starts, you can use the following commands:

- `login <PIN>` - Login with PIN (default: 1234)
- `logout` - Logout from current session
- `balance` - Check current account balance
- `withdraw <amount>` - Withdraw money from account
- `deposit <amount>` - Deposit money to account

### Example Session

```
Welcome to the ATM Simulator
login 1234
Login successful.
balance
Current balance: 1000
withdraw 200
Withdrawn: 200
balance  
Current balance: 800
deposit 100
Deposited: 100
balance
Current balance: 900
logout
Logged out.
```

## Default Settings

- **Initial Balance**: 1000
- **Default PIN**: 1234
- **Login Status**: Logged out (requires authentication)

## Technical Details

### Lexical Analysis (atm.l)
- Tokenizes input commands and numbers
- Recognizes keywords: `login`, `logout`, `withdraw`, `deposit`, `balance`
- Handles numeric inputs for PIN and transaction amounts

### Grammar Rules (atm.y)
- Defines the syntax for ATM commands
- Implements business logic for each operation
- Handles authentication and session management
- Provides error handling for invalid operations

### Security Features
- PIN-based authentication required for all operations
- Session management prevents unauthorized access
- Balance validation for withdrawal operations

## Error Handling

The simulator handles various error conditions:
- Invalid PIN during login
- Attempting operations without authentication
- Insufficient balance for withdrawals
- Multiple login attempts while already logged in
- Logout attempts when not logged in

## Building from Source

The build process involves these steps:

1. **Lexer Generation**: `flex atm.l` creates `lex.yy.c`
2. **Parser Generation**: `bison -d atm.y` creates `atm.tab.c` and `atm.tab.h`
3. **Compilation**: `gcc -o atm atm.tab.c lex.yy.c -lfl`

## Cleaning Build Files

To remove generated files and executables:

```bash
make clean
```

## Extending the Project

Potential enhancements:
- Multiple user accounts with different PINs
- Transaction history logging
- Account creation functionality
- Interest calculation
- Transfer between accounts
- Configuration file for settings
- GUI interface

## Contributing

Feel free to fork this project and submit pull requests for improvements or bug fixes.

## License

This project is open source and available under the MIT License.

## Learning Resources

This project demonstrates:
- **Flex**: Lexical analysis and tokenization
- **Bison**: Context-free grammar parsing
- **C Programming**: System programming and user interaction
- **Compiler Design**: Frontend parsing techniques
- **Software Design**: Session management and state handling

Great for students learning about:
- Compiler construction
- Parsing techniques
- State machines
- Interactive command-line applications
