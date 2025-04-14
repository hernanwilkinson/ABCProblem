!classDefinition: #ABCProblemTest category: #'ABC Problem'!
TestCase subclass: #ABCProblemTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ABC Problem'!

!ABCProblemTest methodsFor: 'tests' stamp: 'HAW 2/14/2023 12:17:51'!
test01CanWriteOneLetterAsFirstCharInFirstBlock

	self assert: (self canWrite: 'B' with: #(($B $O)))! !

!ABCProblemTest methodsFor: 'tests' stamp: 'HAW 2/14/2023 12:17:58'!
test02CannotWriteOneLetterNotIncludedInFirstBlock

	self deny: (self canWrite: 'W' with: #(($B $O)))! !

!ABCProblemTest methodsFor: 'tests' stamp: 'HAW 2/14/2023 12:18:04'!
test03CanWriteOneLetterIncludedInFirstBlock

	self assert: (self canWrite: 'O' with: #(($B $O)))! !

!ABCProblemTest methodsFor: 'tests' stamp: 'HAW 2/14/2023 12:18:34'!
test04CanWriteOneLetterIncludedInAnyBlock

	self assert: (self canWrite: 'X' with: #(($B $O) ($X $K)))! !

!ABCProblemTest methodsFor: 'tests' stamp: 'HAW 2/14/2023 12:19:15'!
test05CannotWriteWhenOtherThanFirstLetterIsNotIncludedInBlocks

	self deny: (self canWrite: 'BW' with: #(($B $O) ($X $K)))! !

!ABCProblemTest methodsFor: 'tests' stamp: 'HAW 2/14/2023 12:20:13'!
test06RemovesUsedBlocks

	self deny: (self canWrite: 'BB' with: #(($B $O) ($X $K)))! !

!ABCProblemTest methodsFor: 'tests' stamp: 'HAW 2/14/2023 12:20:52'!
test07PassesExerciseWordsWithDefaultBlocks

	self assert: (self canWrite: 'A').
	self assert: (self canWrite: 'BARK').
	self deny: (self canWrite: 'BOOK').
	self assert: (self canWrite: 'TREAT').
	self deny: (self canWrite: 'COMMON').
	self assert: (self canWrite: 'SQUAD').
	self assert: (self canWrite: 'CONFUSE').
! !

!ABCProblemTest methodsFor: 'tests' stamp: 'HAW 10/5/2024 10:21:26'!
test08CanWriteFindingInOtherOrderForTwoBlocks

	self assert: (self canWrite: 'BA' with: #(($B $A) ($B $X)))! !

!ABCProblemTest methodsFor: 'tests' stamp: 'HAW 10/5/2024 10:21:57'!
test09CanWriteFindingInOtherOrderForMoreThanTwoBlocks

	self assert: (self canWrite: 'BAC' with: #(($B $A) ($A $C) ($C $X)))! !


!ABCProblemTest methodsFor: 'can write' stamp: 'HAW 2/14/2023 12:10:45'!
canWrite: aWord 
	
	^ABCProblem canWrite: aWord! !

!ABCProblemTest methodsFor: 'can write' stamp: 'HAW 2/14/2023 12:05:08'!
canWrite: aWord with: originalBlocks

	^ABCProblem canWrite: aWord with: originalBlocks! !


!classDefinition: #ABCProblem category: #'ABC Problem'!
Object subclass: #ABCProblem
	instanceVariableNames: 'word originalBlocks blocks'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ABC Problem'!

!ABCProblem methodsFor: 'initialization' stamp: 'HAW 10/5/2024 09:40:20'!
initializeFor: aWord with: anOriginalBlocks

	word := aWord.
	originalBlocks := OrderedCollection withAll: anOriginalBlocks.! !


!ABCProblem methodsFor: 'evaluating' stamp: 'HAW 10/5/2024 10:07:25'!
value 
	
	blocks := originalBlocks copy.
	
	[ self canWriteWord ] whileFalse: [
		self rotateBlocks.
		self hasRotatedAllBlocks ifTrue: [ ^false ]].
	
	^true

	! !


!ABCProblem methodsFor: 'evaluationg - private' stamp: 'HAW 10/5/2024 10:18:53'!
canWriteWord

	| blocksCopy |
	
	blocksCopy := blocks copy.
	
	word do: [ :aLetter | | index | 
		index := blocksCopy findFirst: [ :aBlock | aBlock includes: aLetter ].
		index = 0 ifTrue: [ ^false ].
		blocksCopy removeAt: index ].
		
	^true! !

!ABCProblem methodsFor: 'evaluationg - private' stamp: 'HAW 10/5/2024 10:07:25'!
hasRotatedAllBlocks

	^ blocks = originalBlocks! !

!ABCProblem methodsFor: 'evaluationg - private' stamp: 'HAW 10/5/2024 10:09:07'!
rotateBlocks

	blocks addLast: blocks removeFirst! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ABCProblem class' category: #'ABC Problem'!
ABCProblem class
	instanceVariableNames: ''!

!ABCProblem class methodsFor: 'instance creation' stamp: 'HAW 2/14/2023 12:07:31'!
for: aWord with: anOriginalBlocks

	^self new initializeFor: aWord with: anOriginalBlocks! !


!ABCProblem class methodsFor: 'testing' stamp: 'HAW 2/14/2023 12:12:02'!
canWrite: aWord

	^self canWrite: aWord with: self defaultBlocks! !

!ABCProblem class methodsFor: 'testing' stamp: 'HAW 2/14/2023 12:05:32'!
canWrite: aWord with: originalBlocks 
	
	^(ABCProblem for: aWord with: originalBlocks) value! !


!ABCProblem class methodsFor: 'defaults' stamp: 'HAW 2/14/2023 12:14:53'!
defaultBlocks
	
	^#(
		#($B $O) 
		#($X $K) 
		#($D $Q) 
		#($C $P) 
		#($N $A) 
		#($G $T) 
		#($R $E) 
		#($T $G) 
		#($Q $D) 
		#($F $S) 
		#($J $W) 
		#($H $U) 
		#($V $I) 
		#($A $N) 
		#($O $B) 
		#($E $R) 
		#($F $S) 
		#($L $Y) 
		#($P $C) 
		#($Z $M))! !
