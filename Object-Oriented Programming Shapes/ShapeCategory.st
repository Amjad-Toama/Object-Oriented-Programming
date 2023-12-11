Object subclass: #MyShape
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ShapeCategory'!

!MyShape methodsFor: 'accessing' stamp: 'a 12/26/2022 01:11'!
area
	^ self subclassResponsibility! !

!MyShape methodsFor: 'accessing' stamp: 'a 12/26/2022 01:11'!
perimeter
	^ self subclassResponsibility! !


!MyShape methodsFor: 'testing' stamp: 'a 12/26/2022 01:11'!
isMyRectangle
	^ false! !

!MyShape methodsFor: 'testing' stamp: 'a 12/26/2022 01:12'!
isMySquare
	^ false! !

!MyShape methodsFor: 'testing' stamp: 'a 12/26/2022 01:12'!
isMyTriangle
	^ false! !


MyShape subclass: #MyRectangle
	instanceVariableNames: 'width height'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ShapeCategory'!

!MyRectangle methodsFor: 'accessing' stamp: 'a 12/26/2022 01:14'!
area
	^ width * height! !

!MyRectangle methodsFor: 'accessing' stamp: 'a 12/26/2022 01:15'!
perimeter
	^ (2 * width) + (2 * height)! !


!MyRectangle methodsFor: 'comparing' stamp: 'a 12/26/2022 01:15'!
= aRectangle
	(self class = aRectangle class) ifFalse: [ ^false ].
	^ ((width = aRectangle width and: height = aRectangle height) or:
	(width = aRectangle height and: height = aRectangle width))
	
	! !


!MyRectangle methodsFor: 'printing' stamp: 'a 12/26/2022 01:20'!
printOn: aStream
	| text |
	text := self class name , ' Height is ', height , ' and Width is ', width.
	aStream nextPutAll: text.! !


!MyRectangle methodsFor: 'initialize-release' stamp: '1 12/26/2022 01:50'!
initialize
	height := 1.
	width := 2! !


!MyRectangle methodsFor: 'testing' stamp: 'a 12/26/2022 01:21'!
isMyRectangle
	^true! !


!MyRectangle methodsFor: 'setting' stamp: 'a 12/26/2022 01:18'!
height: newHeight
	(newHeight > 0) ifFalse:[
		self error: 'Dimentions must be positive.'; cr.
		^false
	].
	height := newHeight.
	^true
! !

!MyRectangle methodsFor: 'setting' stamp: 'a 12/26/2022 01:18'!
height: newHeight width: newWidth
	^ ((self height: newHeight) and: (self width: newWidth))! !

!MyRectangle methodsFor: 'setting' stamp: 'a 12/26/2022 01:18'!
width: newWidth
	(newWidth > 0) ifFalse:[
		self error: 'Dimentions must be positive.'; cr.
		^ false
	].
	width := newWidth.
	^ true
! !


!MyRectangle methodsFor: 'getting' stamp: 'a 12/26/2022 01:19'!
height
	^ height! !

!MyRectangle methodsFor: 'getting' stamp: 'a 12/26/2022 01:19'!
width
	^ width! !


TestCase subclass: #MyShapeTest
	instanceVariableNames: 'r1 r2 r3 s1 s2 s3 t1 t2 t3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ShapeCategory'!

!MyShapeTest methodsFor: 'as yet unclassified' stamp: '1 12/26/2022 16:06'!
setUp
	r1 := MyRectangle new.
	r2 := MyRectangle new.
	r3 := MyRectangle new.
	
	r1 height: 10 width: 5.
	r2 height: 2 width: 5.
	r3 height: 5 width: 10.
	
	s1 := MySquare new.
	s2 := MySquare new.
	s3 := MySquare new.
	
	s1 length: 12.
	s2 length: 4.
	s3 length: 12.
	
	t1 := MyTriangle new.
	t2 := MyTriangle new.
	t3 := MyTriangle new.
	
	t1	edgeA: 5 edgeB: 3 edgeC: 4.
	t2	edgeA: 6 edgeB: 5 edgeC: 5.
	t3	edgeA: 10 edgeB: 6 edgeC: 8.
	
	
		
		
		
		
		
		
	! !

!MyShapeTest methodsFor: 'as yet unclassified' stamp: '1 12/26/2022 16:14'!
testAccessing
	" area method tester "
	self assert: 50 equals: r1 area.
	self assert: 10 equals: r2 area.
	
	self assert: 144 equals: s1 area.
	self assert: 16 equals: s2 area.
	
	self assert: 6 equals: t1 area.
	self assert: 12 equals: t2 area.
	
	" perimeter method tester "
	self assert: 30 equals: r1 perimeter.
	self assert: 14 equals: r2 perimeter.
	self assert: 48 equals: s1 perimeter.
	self assert: 16 equals: s2 perimeter.
	self assert: 12 equals: t1 perimeter.
	self assert: 16 equals: t2 perimeter.
	
	
	! !

!MyShapeTest methodsFor: 'as yet unclassified' stamp: '1 12/26/2022 16:09'!
testComparing
	" Testing MyRectangle Comparition methods "
	self deny: r1 = r2 description: 'Identical method is wrong!!'.
	self assert: r1 = r3 description: 'Identical method is wrong!!'.
	
	" Testing MySquare Comparition methods "
	self deny: s1 = s2 description: 'Identical method is wrong!!'.
	self assert: s1 = s3 description: 'Identical method is wrong!!'.
	
	" Testing MyTriangle Comparition methods "
	self deny: t1 = t2 description: 'Identical method is wrong!!'.
	self assert: t1 = t3 description: 'Identical method is wrong!!'.
	! !

!MyShapeTest methodsFor: 'as yet unclassified' stamp: '1 12/26/2022 15:39'!
testDefinition

	self assert: r1 isMyRectangle description: 'Shape definition is wrong!!'.
	self deny: r1 isMySquare description: 'Shape definition is wrong!!'.
	self deny: r1 isMyTriangle description: 'Shape definition is wrong!!'.
	
	self assert: s1 isMySquare description: 'Shape definition is wrong!!'.
	self deny: s1 isMyRectangle description: 'Shape definition is wrong!!'.
	self deny: s1 isMyTriangle description: 'Shape definition is wrong!!'.
	
	self assert: t1 isMyTriangle description: 'Shape definition is wrong!!'.
	self deny: t1 isMySquare description: 'Shape definition is wrong!!'.
	self deny: t1 isMyRectangle description: 'Shape definition is wrong!!'.
	

! !


MyShape subclass: #MySquare
	instanceVariableNames: 'length'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ShapeCategory'!

!MySquare methodsFor: 'initialize-release' stamp: '1 12/26/2022 01:50'!
initialize
	length := 1! !


!MySquare methodsFor: 'accessing' stamp: 'a 12/26/2022 01:23'!
area
	^ length * length! !

!MySquare methodsFor: 'accessing' stamp: 'a 12/26/2022 01:23'!
perimeter
	^ length * 4! !


!MySquare methodsFor: 'printing' stamp: 'a 12/26/2022 01:24'!
printOn: aStream
	| text |
	text := self class name , ' edge length is ', length.
	aStream nextPutAll: text.! !


!MySquare methodsFor: 'comparing' stamp: 'a 12/26/2022 01:24'!
= aSquare
	(self class name = aSquare class name) ifFalse:[ ^false ].
	^ (length = aSquare length)
	! !


!MySquare methodsFor: 'testing' stamp: 'a 12/26/2022 01:24'!
isMySquare
	^ true! !


!MySquare methodsFor: 'setting' stamp: 'a 12/26/2022 01:25'!
length: newLength
	(newLength > 0) ifFalse: [
		self error: 'Dimentions must be positive.'; cr.
		^false
		].
	length := newLength.
	^ true
	! !


!MySquare methodsFor: 'getting' stamp: 'a 12/26/2022 01:24'!
length
	^ length! !


MyShape subclass: #MyTriangle
	instanceVariableNames: 'edgeA edgeB edgeC'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ShapeCategory'!

!MyTriangle methodsFor: 'setting' stamp: 'a 12/26/2022 01:30'!
edgeA: newA edgeB: newB edgeC: newC
	( newA > 0 and: newB > 0 and: newC > 0 ) ifFalse:[ ^false ].
	
	((newA + newB > newC) and:
		(newA + newC > newC) and:
		(newB + newC > newA)) ifFalse:[ ^false ].
		
	edgeA := newA.
	edgeB := newB.
	edgeC := newC.
		! !


!MyTriangle methodsFor: 'getting' stamp: 'a 12/26/2022 01:30'!
edgeA
	^ edgeA! !

!MyTriangle methodsFor: 'getting' stamp: 'a 12/26/2022 01:30'!
edgeB
	^ edgeB! !

!MyTriangle methodsFor: 'getting' stamp: 'a 12/26/2022 01:30'!
edgeC
	^ edgeC! !


!MyTriangle methodsFor: 'initialize-release' stamp: 'a 12/26/2022 01:29'!
initialize
	edgeA := 3.
	edgeB := 4.
	edgeC := 5.! !


!MyTriangle methodsFor: 'printing' stamp: 'a 12/26/2022 01:29'!
printOn: aStream
	| text |
	text := (self class name , ' 1st edge ', edgeA , ' 2nd edge ', edgeB, ' 3rd edge ' , edgeC).
	aStream nextPutAll: text.! !


!MyTriangle methodsFor: 'testing' stamp: 'a 12/26/2022 01:30'!
isMyTriangle
	^ true! !


!MyTriangle methodsFor: 'comparing' stamp: '1 12/26/2022 16:15'!
= aTriangle
	(self class name = aTriangle class name) ifFalse:[ ^false ].
	^((edgeA / aTriangle edgeA) = (edgeB / aTriangle edgeB) and: 
		(edgeA / aTriangle edgeA) = (edgeC / aTriangle edgeC) and:
		(edgeB / aTriangle edgeB) = (edgeC / aTriangle edgeC))! !


!MyTriangle methodsFor: 'accessing' stamp: 'a 12/26/2022 01:27'!
area
	| s |
	s := (edgeA  + edgeB + edgeC) / 2.
	^ (s * (s - edgeA) * (s - edgeB) * (s - edgeC)) sqrt.! !

!MyTriangle methodsFor: 'accessing' stamp: 'a 12/26/2022 01:28'!
perimeter
	^ edgeA  + edgeB + edgeC! !
