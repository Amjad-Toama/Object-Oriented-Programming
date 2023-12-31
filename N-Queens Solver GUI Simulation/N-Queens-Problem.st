﻿Morph subclass: #Board
	instanceVariableNames: 'lastQueen solutionAmount queensMorphs squareSize boardSize animationSpeedRatio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'N-Queens-Problem'!

!Board methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 19:45'!
blackPointsList
	^ blackPointsList! !

!Board methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 20:17'!
blackedPoints: array
	blackPointsList := array! !

!Board methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/9/2023 19:44'!
size
	^ boardSize! !


!Board methodsFor: 'accessing' stamp: 'Amjad Toama 1/16/2023 22:50'!
boardSize	
	^ boardSize! !


!Board methodsFor: 'board' stamp: 'AmjadTo 1/17/2023 17:33'!
initialize
	"Default Chess board"
	self initialize: 8.
	self animationSpeedRatio: 1.
	
! !

!Board methodsFor: 'board' stamp: 'AmjadTo 1/17/2023 17:35'!
initialize: queensAmount

	super initialize.
	"Initializing Instance Variables"
	squareSize := (ImageMorph new newForm: ((ImageReadWriter formFromFileNamed: 'QueenPiece.png') magnifyBy: 0.8)) extent.
	boardSize := queensAmount.
	
	"Draw the chessboard."
	0 to: (queensAmount - 1) do: [:yCoordinate | 
		0 to: (queensAmount - 1) do: [:xCoordinate |
			| square |
			square := Morph new.
			square extent: squareSize.
			square position: xCoordinate@yCoordinate * squareSize.
			(xCoordinate + yCoordinate) odd
			ifTrue: [square color: (Color fromString: 'FFF38C').]
			ifFalse: [square color: (Color fromString: '42855B').].
			self addMorph: square.
			]
		].
	
	"Creating and Initializing the queens positions on the board."
	queensMorphs := OrderedCollection new.
	lastQueen := QueenTerminator new.
	(1 to: queensAmount)
	do: [:i |
		| queen |
		queen := (ImageMorph new newForm: ((ImageReadWriter formFromFileNamed: 'QueenPiece.png') magnifyBy: 0.8)).
		queen position: self position + (((i - 1) @ 0) * squareSize).
		queensMorphs add: queen.
		self addMorph: queen.
		lastQueen := Queen new
		setColumn: i neighbor: lastQueen board: self].
	
	self openInWorld.
	self world displayWorld.
	
! !

!Board methodsFor: 'board' stamp: 'AmjadTo 1/17/2023 16:11'!
solve
	Transcript clear.
	solutionAmount := 0.
	lastQueen firstSolution ifTrue: [
		self solutionEffect.
		solutionAmount := 1.
		Transcript show: lastQueen result printString; cr.
		[lastQueen nextSolution]
		whileTrue: [Transcript show: lastQueen result printString; cr.
			self solutionEffect.
			solutionAmount := solutionAmount + 1].
		Transcript show: 'There are ', solutionAmount, ' solutions. '; cr.
		Transcript show: 'End of Solutions. '; cr]
	ifFalse: [Transcript show: 'No Solution.'; cr]! !


!Board methodsFor: 'arrowHeads' stamp: 'AmjadTo 1/17/2023 15:07'!
diagonalAbove
	^ {(0@1) . (1@1) . (1@2)}! !

!Board methodsFor: 'arrowHeads' stamp: 'AmjadTo 1/17/2023 15:06'!
diagonalBelow
	^ {(0@2) . (1@1) . (1@2)}! !

!Board methodsFor: 'arrowHeads' stamp: 'AmjadTo 1/17/2023 15:54'!
sameRow
	^ {(0@0) . (0@1) . (1@(1/2))}! !


!Board methodsFor: 'boardAnimations' stamp: 'AmjadTo 1/17/2023 17:33'!
animationSpeedRatio: aRatio
	"Change the ratio of animation to find the solution. 0 <= ratio < 1 speed up the program
	ratio > 1 slow down the animation."
	(aRatio = nil
	or: [aRatio isNumber not]
	or: [aRatio < 0]) ifTrue: [animationSpeedRatio := 1]
	ifFalse: [animationSpeedRatio := aRatio]! !

!Board methodsFor: 'boardAnimations' stamp: 'AmjadTo 1/17/2023 17:37'!
drawQueen: aPoint threat: bPoint
	| aCircle bCircle arrow | 
	" Draw circle around queens that threaten each other, and draw arrow."
	aCircle := self threatenCircle.
	bCircle := self threatenCircle.
	arrow := self threatenArrowFrom: aPoint to: bPoint.
	
	"Set circles positions."
	aCircle position: ((self position) + ((aPoint - 1) * squareSize)).
	bCircle position: ((self position) + ((bPoint - 1) * squareSize)).
	
	self addMorph: arrow.
	self addMorph: aCircle.
	self addMorph: bCircle.
	(Delay forMilliseconds: 400 * animationSpeedRatio) wait.
	self removeMorph: aCircle.
	self removeMorph: bCircle.
	self removeMorph: arrow.
	! !

!Board methodsFor: 'boardAnimations' stamp: 'AmjadTo 1/17/2023 17:37'!
moveQueen: aColumn to: aRow
	"Update the board according to queens movements."
	(queensMorphs at: aColumn) position: (self position) + ((aColumn - 1)@(aRow - 1) * squareSize).
	(Delay forMilliseconds: 200 * animationSpeedRatio) wait.
	self world displayWorld.! !

!Board methodsFor: 'boardAnimations' stamp: 'AmjadTo 1/17/2023 17:40'!
solutionEffect
	| effect |
	"Grant green effect we solution found."
	effect := Morph new.
	effect color: (Color green alpha: 0.5).
	effect extent: (squareSize * boardSize).
	effect position: self position.
	self addMorph: effect.
	(Delay forMilliseconds: 2000) wait.
	self removeMorph: effect.! !

!Board methodsFor: 'boardAnimations' stamp: 'AmjadTo 1/17/2023 17:41'!
threatenArrowFrom: aPoint to: bPoint
	| line arrowHead headRatio aDiffCoordinate bDiffCoordinate |
	"Draw arrow"
	line := PolygonMorph new.
	line borderColor: Color black.
	line borderWidth: 3.
	
	headRatio := (squareSize / 3).
	arrowHead := PolygonMorph new.
	arrowHead setVertices: self diagonalBelow * headRatio.
	
	aDiffCoordinate := 0@0.
	bDiffCoordinate := 0@0.
	
	(aPoint y = bPoint y) ifTrue: [
		aDiffCoordinate := (0@(squareSize / 2) y).
		bDiffCoordinate := (0@(squareSize / 2) y).
		arrowHead setVertices: self sameRow * headRatio.
		]
	ifFalse: [
		(aPoint y > bPoint y) ifTrue: [
				aDiffCoordinate := (0@(squareSize y)).
				bDiffCoordinate := (0@(squareSize y)).
				arrowHead setVertices: self diagonalAbove * headRatio.
			].
		].
	
	line setVertices: {
		(self position + (aPoint * squareSize) - aDiffCoordinate).
		(self position + ((bPoint - 1) * squareSize) + bDiffCoordinate)
		}.
	
	arrowHead center: (self position + ((bPoint - 1) * squareSize) + bDiffCoordinate).
	
	line addMorph: arrowHead.
	
	^ line
	! !

!Board methodsFor: 'boardAnimations' stamp: 'AmjadTo 1/17/2023 13:23'!
threatenCircle
	| circle |
	circle := EllipseMorph new.
	circle openInWorld.
	circle extent: squareSize.
	circle borderWidth: 2.
	circle borderColor: Color red.
	circle color: Color transparent.
	^ circle! !


Object subclass: #Queen
	instanceVariableNames: 'row column neighbour board'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'N-Queens-Problem'!

!Queen methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/16/2023 22:51'!
advance
	row = board boardSize
	ifTrue: [neighbour nextSolution 
		ifFalse: [^ false].
		row := 0.
		].
	row := row + 1.
	board moveQueen: column to: row.
	^ true! !

!Queen methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/17/2023 01:07'!
canAttack: testRow x: testColumn
	| columnDifference |
	columnDifference := testColumn - column.
	((row = testRow
	or: [row + columnDifference = testRow])
	or: [row - columnDifference = testRow])
	ifTrue: [
		board drawQueen: column@row threat: testColumn@testRow.
		^ true].
	^ neighbour canAttack: testRow x: testColumn! !

!Queen methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/16/2023 21:14'!
firstSolution
	neighbour firstSolution.
	row := 1.
	board moveQueen: column to: row.
	^ (self moveToNextNonAttackedRow)! !

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

!Queen methodsFor: 'as yet unclassified' stamp: 'Amjad Toama 1/17/2023 01:07'!
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
	category: 'N-Queens-Problem'!

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
