# Kata ABC Blocks
Code Kata about creating words using two-sided letter blocks
# Introduction
You are given a collection of ABC blocks. There are twenty blocks with two letters on each block. A complete alphabet is guaranteed amongst all sides of the blocks.
The sample collection of blocks:  
(B O)  
(X K)  
(D Q)  
(C P)  
(N A)  
(G T)  
(R E)  
(T G)  
(Q D)  
(F S)  
(J W)  
(H U)  
(V I)  
(A N)  
(O B)  
(E R)  
(F S)  
(L Y)  
(P C)  
(Z M)
# Task
Write model that takes a string (word) and determines whether the word can be spelled with the given collection of blocks.
The rules are simple:
- Once a letter on a block is used that block cannot be used again
- Use the first block found in the collection
- The message should be case-insensitive
# Examples
- someObject canWrite: ‘A’ -> true
- someObject canWrite: 'BARK’ -> true
- someObject canWrite: 'BOOK’ —> false
- someObject canWrite: 'TREAT’ -> true
- someObject canWrite: 'COMMON’ -> false
- someObject canWrite: 'SQUAD’-> true
- someObject canWrite: 'CONFUSE’ -> true

# Bonus Track
If a word cannot be written, try with a different order of blocks. For example, with the following blocks:  
(B X)  
(B A)

- someObject canWrite: ‘BX’ should return true

