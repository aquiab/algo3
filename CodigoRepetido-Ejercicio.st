!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'aa 9/26/2022 22:53:46'!
millisecondsToRun: aBlock isSmallerThan: numberOfMilliseconds
	^(Time millisecondsToRun: aBlock) < (numberOfMilliseconds * millisecond)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'aa 9/26/2022 23:23:31'!
running: aBlock shouldRaise: anError andAssert: assertions
	self should: aBlock 	raise: anError.
	^assertions value.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'aa 9/26/2022 22:48:46'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	customerBook := CustomerBook new.
	
	self assert: (self millisecondsToRun: [customerBook addCustomerNamed: 'John Lennon'] isSmallerThan: 50).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'aa 9/27/2022 00:39:07'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	customerBook := CustomerBook createWithCustomers: #('Paul McCartney').
	
	self assert: (self millisecondsToRun:  [customerBook removeCustomerNamed: 'Paul McCartney'] isSmallerThan: 100).
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'aa 9/27/2022 00:09:02'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'aa 9/27/2022 00:43:44'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook createWithCustomers: #('John Lennon').
	
	self running: [ customerBook removeCustomerNamed: 'Paul McCartney'. ] shouldRaise: NotFound andAssert: [
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: 'John Lennon').
	]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'aa 9/27/2022 00:44:42'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := CustomerBook createWithCustomers: #('Paul McCartney').
	customerBook suspendCustomerNamed: 'Paul McCartney'.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: 'Paul McCartney').
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'aa 9/27/2022 00:46:40'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := CustomerBook createWithCustomers: #('Paul McCartney').
	
	customerBook suspendCustomerNamed: 'Paul McCartney'.
	customerBook removeCustomerNamed: 'Paul McCartney'.
	
	self assert: customerBook isEmpty.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: 'Paul McCartney').


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'aa 9/27/2022 00:47:04'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook createWithCustomers: #('John Lennon').
	
	self running: [ customerBook suspendCustomerNamed: 'Ringo Starr'. ] shouldRaise: CantSuspend andAssert: 	[
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: 'John Lennon').
	]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'aa 9/27/2022 00:47:28'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook |
			
	customerBook := CustomerBook createWithCustomers: #('John Lennon').
	customerBook suspendCustomerNamed: 'John Lennon'.
	
	self running: [ customerBook suspendCustomerNamed: 'John Lennon'. ] shouldRaise: CantSuspend andAssert: [
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: 'John Lennon').
	]
	
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'aa 9/26/2022 21:04:27'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'BAU 9/25/2022 11:18:31'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'BAU 9/25/2022 18:33:16'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'aa 9/26/2022 20:55:29'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent: [ suspended remove: aName ifAbsent: [ ^NotFound signal ] ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'aa 9/26/2022 20:58:34'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent: [^CantSuspend signal].
	suspended add: aName.
	
! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!CustomerBook class methodsFor: 'as yet unclassified' stamp: 'aa 9/27/2022 00:33:44'!
createWithCustomers: customersList
	| customerBook |
	customerBook := self new.
	customersList do: [ :customer | customerBook addCustomerNamed: customer ].
	^ customerBook.
! !
