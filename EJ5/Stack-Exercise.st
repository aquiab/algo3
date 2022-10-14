!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'aa 10/14/2022 14:16:38'!
test01DeteccionSimpleOracionesMinusculas
	
	|stack finder oracionesSeleccionadas|
	
	stack := OOStack new.
	stack push: 'como estas'.
	stack push: 'algo proba'.
	stack push: 'combo'.
	stack push: 'alga'.

	finder := SentenceFinderByPrefix conStack: stack.
	oracionesSeleccionadas := finder find: 'alg'.
	
	self assert: (oracionesSeleccionadas size = 2).
	self assert: (oracionesSeleccionadas first = 'algo proba').
	self assert: (oracionesSeleccionadas last = 'alga').! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'aa 10/14/2022 14:16:52'!
test02DeteccionOracionesCapitalizadas

	|stack finder oracionesSeleccionadas|
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	finder := SentenceFinderByPrefix conStack: stack.
	oracionesSeleccionadas := finder find: 'Wint'.
	
	self assert: (oracionesSeleccionadas size = 1).
	self assert: (oracionesSeleccionadas first = 'Winter is here').
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'aa 10/14/2022 14:17:07'!
test03VerificacionStackEnOrden

	|stack finder|
	
	stack := OOStack new.
	stack push: '18'.
	stack push: '22'.
	stack push: '14'.
	
	finder := SentenceFinderByPrefix conStack: stack.
	finder find: '1'.
	
	self assert: (stack size = 3).
	self assert: (stack top = '14').
	stack pop.
	self assert: (stack top = '22').
	stack pop.
	self assert: (stack top = '18').
	
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'aa 10/14/2022 14:17:14'!
test04PrefijoMasLargoQueOraciones

	|stack finder oracionesSeleccionadas|
	
	stack := OOStack new.
	stack push: 'h'.
	stack push: 'a'.
	stack push: 'c'.
	
	finder := SentenceFinderByPrefix conStack: stack.
	oracionesSeleccionadas := finder find: 'caracteres'.
	
	self assert: (oracionesSeleccionadas size = 0).! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'aa 10/14/2022 14:17:23'!
test05PrefijoInvalido

	|stack finder|
	
	stack := OOStack new.
	stack push: 'In the sky'.
	stack push: 'the power'.
	stack push: 'dont be shy'.
	
	finder := SentenceFinderByPrefix conStack: stack.
	
	self shouldFail: [finder find: ''].
	self shouldFail: [finder find: '              '].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'aa 10/14/2022 14:17:29'!
test06FinderDeUnStackVacio

	|stack finder oracionesSeleccionadas|
	
	stack := OOStack new.
	
	finder := SentenceFinderByPrefix conStack: stack.
	oracionesSeleccionadas := finder find: 'recibir'.
	
	self assert: (oracionesSeleccionadas size = 0).
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'aa 10/14/2022 14:17:49'!
test07ObtenerDosColeccionesDeFinderSobreMismoStack

	|stack finder1 finder2 oracionesSeleccionadas1 oracionesSeleccionadas2|
	
	stack := OOStack new.
	stack push: 'Vello'.
	stack push: 'bizco'.
	stack push: 'Hola tapa'.
	stack push: 'Bello'.
	stack push: 'ola grande'.
	stack push: 'Disco'.
	stack push: 'Risco'.
	
	finder1 := SentenceFinderByPrefix conStack: stack.
	oracionesSeleccionadas1 := finder1 find: 'b'.
	
	finder2 := SentenceFinderByPrefix conStack: stack.
	oracionesSeleccionadas2 := finder2 find: 'ola g'.
	
	self assert: (stack size = 7).
	self assert: (oracionesSeleccionadas1 size = 1 and: [oracionesSeleccionadas1 first = 'bizco']).
	self assert: (oracionesSeleccionadas2 size = 1 and: [oracionesSeleccionadas2 first = 'ola grande']).
	
	

	! !


!classDefinition: #Base category: 'Stack-Exercise'!
Object subclass: #Base
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'operaciones base' stamp: 'aa 10/12/2022 23:28:43'!
anterior
	^self error: OOStack stackEmptyErrorDescription.! !

!Base methodsFor: 'operaciones base' stamp: 'aa 10/12/2022 23:29:17'!
dato
	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #Elemento category: 'Stack-Exercise'!
Object subclass: #Elemento
	instanceVariableNames: 'dato anterior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Elemento methodsFor: 'operaciones elemento' stamp: 'aa 10/12/2022 23:15:36'!
anterior
	^anterior.! !

!Elemento methodsFor: 'operaciones elemento' stamp: 'aa 10/12/2022 23:13:38'!
conDato: unDato conAnterior: elementoAnterior 
	dato := unDato.
	anterior := elementoAnterior.! !

!Elemento methodsFor: 'operaciones elemento' stamp: 'aa 10/12/2022 23:15:30'!
dato
	^dato.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Elemento class' category: 'Stack-Exercise'!
Elemento class
	instanceVariableNames: ''!

!Elemento class methodsFor: 'as yet unclassified' stamp: 'aa 10/12/2022 23:17:13'!
conDato: unDato conAnterior: elementoAnterior 
	| elemento |
	elemento := self new conDato: unDato conAnterior: elementoAnterior.
	^elemento! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'base tope size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'inicializador stack' stamp: 'aa 10/12/2022 23:21:52'!
initialize

	tope := Base new.
	size := 0.! !


!OOStack methodsFor: 'operaciones stack' stamp: 'aa 10/12/2022 23:00:25'!
isEmpty

	^tope isMemberOf: Base.! !

!OOStack methodsFor: 'operaciones stack' stamp: 'aa 10/12/2022 23:22:29'!
pop

	| antiguoTope |
	antiguoTope := tope.
	tope := antiguoTope anterior.
	size := size - 1.
	
	^antiguoTope dato.! !

!OOStack methodsFor: 'operaciones stack' stamp: 'aa 10/12/2022 23:22:14'!
push: dato

	tope := Elemento conDato: dato conAnterior: tope.
	size := size + 1.! !

!OOStack methodsFor: 'operaciones stack' stamp: 'aa 10/12/2022 23:20:32'!
top

	^tope dato.! !


!OOStack methodsFor: 'private' stamp: 'aa 10/12/2022 23:22:48'!
size

	^size.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack oracionesSeleccionadas stackAuxiliar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operaciones basicas' stamp: 'aa 10/14/2022 15:02:39'!
find: aPrefijo
	
	"Excepciones"
	(aPrefijo isEmpty) ifTrue: [self error: SentenceFinderByPrefix prefijoInvalido].
	(aPrefijo withoutSeparators isEmpty) ifTrue: [self error: SentenceFinderByPrefix prefijoInvalido].

	self aplicarAStack: [ :elemento | ((elemento findString: aPrefijo) = 1) ifTrue: [oracionesSeleccionadas addFirst: elemento] ].
	
	^oracionesSeleccionadas.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'aa 10/14/2022 15:02:14'!
aplicarAStack: unBloqueDeCodigo
	[stack isEmpty] whileFalse: [
		unBloqueDeCodigo value: stack top.
		stackAuxiliar push: stack pop.
	].
	[stackAuxiliar isEmpty] whileFalse: [
		stack push: stackAuxiliar pop.
	].! !


!SentenceFinderByPrefix methodsFor: 'inicializador' stamp: 'aa 10/14/2022 14:15:18'!
conStack: aStack

	stack := aStack.! !

!SentenceFinderByPrefix methodsFor: 'inicializador' stamp: 'BAU 10/14/2022 04:47:26'!
initialize
	
	stackAuxiliar := OOStack new.
	oracionesSeleccionadas := OrderedCollection new.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'initialization' stamp: 'aa 10/14/2022 14:15:30'!
conStack: stack
	| finder |
	finder := self new conStack: stack.
	^finder! !


!SentenceFinderByPrefix class methodsFor: 'error' stamp: 'BAU 10/14/2022 03:51:20'!
prefijoInvalido
	
	^'No ingreso un prefijo valido'.! !
