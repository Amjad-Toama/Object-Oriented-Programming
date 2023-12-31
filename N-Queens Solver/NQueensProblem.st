﻿Object subclass: #Board
	instanceVariableNames: 'lastQueen solutionAmount boardSize blackPointsList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NQueensProblem'!

!Board methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 19:45'!
blackPointsList
	^ blackPointsList! !

!Board methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 20:17'!
blackedPoints: array
	blackPointsList := array! !

!Board methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 19:43'!
initialize
	self initialize: 8! !

!Board methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 19:43'!
initialize: aSize
	boardSize := aSize.
	lastQueen := QueenTerminator new.
	(1 to: boardSize)
	do: [:i | lastQueen := Queen new
		setColumn: i neighbor: lastQueen board: self]! !

!Board methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 19:44'!
size
	^ boardSize! !

!Board methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 15:29'!
solve
	Transcript clear.
	solutionAmount := 0.
	lastQueen firstSolution ifTrue: [
		solutionAmount := 1.
		Transcript show: lastQueen result printString; cr.
		[lastQueen nextSolution]
		whileTrue: [Transcript show: lastQueen result printString; cr.
			solutionAmount := solutionAmount + 1].
		Transcript show: 'There are ', solutionAmount, ' solutions. '; cr.
		Transcript show: 'End of Solutions. '; cr]
	ifFalse: [Transcript show: 'No Solution.'; cr]! !


Object subclass: #Queen
	instanceVariableNames: 'row column neighbour board'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NQueensProblem'!

!Queen methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 20:12'!
advance
	row = board size
	ifTrue: [neighbour nextSolution 
		ifFalse: [^ false].
		row := 0].
	row := row + 1.
	^ true & (self isLegalMove)! !

!Queen methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 15:01'!
canAttack: testRow x: testColumn
	| columnDifference |
	columnDifference := testColumn - column.
	((row = testRow
	or: [row + columnDifference = testRow])
	or: [row - columnDifference = testRow])
	ifTrue: [^ true].
	^ neighbour canAttack: testRow x: testColumn! !

!Queen methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 20:18'!
firstSolution
	neighbour firstSolution.
	row := 1.
	^ (self isLegalMove) & (self moveToNextNonAttackedRow)! !

!Queen methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 21:18'!
isLegalMove
	| iteration |
	iteration := 1.
	(board blackPointsList = nil) ifTrue: [^ true].
	board blackPointsList do: [:item | (item = (row@column)) ifTrue: [
			iteration := iteration + 1.
			(iteration > board size) ifTrue: [^ false].
			(row = board size) ifTrue: [row := 0. ^false]
								ifFalse: [row := row + 1].
			]].
	^ true! !

!Queen methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 15:02'!
moveToNextNonAttackedRow
	[neighbour canAttack: row x: column]
	whileTrue: [self advance ifFalse: [^ false]].
	^ true! !

!Queen methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 15:03'!
nextSolution
	^ self advance and: [self moveToNextNonAttackedRow]! !

!Queen methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 15:00'!
result
	^ neighbour result addLast: row; yourself! !

!Queen methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 15:01'!
setColumn: aColumn neighbor: aQueen
	column := aColumn.
	neighbour := aQueen! !

!Queen methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 19:43'!
setColumn: aColumn neighbor: aQueen board: aBoard
	column := aColumn.
	neighbour := aQueen.
	board := aBoard! !


Object subclass: #QueenTerminator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NQueensProblem'!

!QueenTerminator methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 14:57'!
canAttack: testRow x: testColumn
	^ false! !

!QueenTerminator methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 14:58'!
firstSolution
	^ true! !

!QueenTerminator methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 14:58'!
nextSolution
	^ false! !

!QueenTerminator methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 14:58'!
result
	^ OrderedCollection new! !
