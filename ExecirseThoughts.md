# Problem Breakdown & Design Considerations

## Initial Problem
The first problem to solve is how to partition the tests to enable an **iterative and incremental development**.  
The solution involves structuring the tests following the **minimal generalization per step**, but the meaning of "minimal" depends on the representation of blocks and the use of the collection protocol.

## Key Testing Decisions
### Block Configuration
A key point to define for testing is whether or not to configure the collection of blocks.  
**Reasons to configure them**:
1. The problem states _"sample blocks"_, implying they are not fixed.
2. Hardcoded blocks make it difficult to test all edge cases.
### Testing Paths
If we think about the problem there are two collections to iterate on: the word (a collection of chars) and the blocks.
If we use *ZOMBIES*, we have to test for zero, one and many elements on each collection, combined. So we can start doing *ZOMBIES* on the word or on the blocks
The decision will not influence the final design but how the generalization is made.
Therefor we have two possible approaches:
1. **Fixed Word Length**
    - Solve for:
        - No blocks → One block → Multiple blocks
        - For one block: check if letter is in `[first, second]` (or simplify with `includes`).
    - *Advantage*: Scales cleanly.

2. **Fixed Blocks**
    - Solve for:
        - Zero letters → One letter → Multiple letters
    - *Issue*: Removing used blocks forces multi-block handling (approach #1 seems better).

I decided to do *ZOMBIES* on the blocks because I foresee that is the inner block of both "loops", while iterating the word is the outer loop.

## Design & Implementation Options
### Block Representation
How should blocks be represented?
- **String**  
  *Challenge*: How to enforce exactly 2 alphabetic characters?
- **Array/Tuple**  
  *Same issue as strings*.
- **Dedicated Block Class**  
  *Pros*: Can enforce rules (2 uppercase letters).

### Block Removal Implementation
How to remove matched blocks?  
This is an implementation detail that affects how declarative and decoupled is the code
The decision is based on how many times do I want to go over the collection of block when I found one to remove it.

### Block Search Logic in Smalltalk
- **`detect:ifFound:ifNone:`**  
  (Traverses blocks twice)
- **`findFirst:`**  
  (Single traversal)
- **`do:` with early return (`^`)**  
  (Most efficient)

*Tradeoff*: All options mix block removal with search control.  
Separating them adds complexity without clarity.

---

## Bonus Track Consideration
One way to solved it is using recursion... 