!classDefinition: #MarsRoverTests category: 'EJ6'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'rover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EJ6'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 14:24:00'!
setUp
	rover := MarsRover conX: 0 conY: 0 apuntandoHacia: Norte.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/1/2022 20:09:07'!
test01RoverComienzaEnElOrigen
	
	self assert: rover x equals: 0.
	self assert: rover y equals: 0.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 22:18:00'!
test02RoverComienzaApuntandoAlNorte
	
	self assert: rover direccion equals: Norte.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/1/2022 20:09:26'!
test03RoverRecibeComandoVacioYSeQUedaEnElMismoLugar

	rover mover: ''.
	self assert: rover x equals: 0.
	self assert: rover y equals: 0.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/2/2022 23:27:07'!
test04RoverAvanzaApuntandoHaciaElNorte

	rover mover: 'f'.
	self assert: rover x equals: 0.
	self assert: rover y equals: 1.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/2/2022 23:45:14'!
test05RoverRetrocedeApuntandoHaciaElNorte

	rover mover: 'b'.
	self assert: rover x equals: 0.
	self assert: rover y equals: -1.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 22:18:14'!
test06RoverRotaALaDerechaYApuntaHaciaElEste

	rover mover: 'r'.
	self assert: rover direccion equals: Este.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 22:18:18'!
test07RoverRotaDosVecesALaDerechaYApuntaHaciaElSur

	rover mover: 'rr'.
	self assert: rover direccion equals: Sur.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 22:18:22'!
test08RoverRotaTresVecesALaIzquierdaYApuntaHaciaElEste

	rover mover: 'lll'.
	self assert: rover direccion equals: Este.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 01:16:14'!
test09RoverRotaHaciaLaDerechaYAvanzaApuntandoHaciaElEste

	rover mover: 'rf'.
	self assert: rover x equals: 1.
	self assert: rover y equals: 0.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 01:16:29'!
test10RoverRotaHaciaLaDerechaYAvanzaApuntandoHaciaElOeste

	rover mover: 'rrrff'.
	self assert: rover x equals: -2.
	self assert: rover y equals: 0.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 01:17:05'!
test11RoverRotaHaciaLaIzquierdaYAvanzaApuntandoHaciaElEste

	rover mover: 'lllff'.
	self assert: rover x equals: 2.
	self assert: rover y equals: 0.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 01:20:09'!
test12RoverRetrocedeApuntandoHaciaElNorte

	rover mover: 'b'.
	self assert: rover x equals: 0.
	self assert: rover y equals: -1.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 00:08:52'!
test13RoverRotaHaciaLaDerechaYRetrocedeApuntandoHaciaElEste

	rover mover: 'rb'.
	self assert: rover x equals: -1.
	self assert: rover y equals: 0.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 00:08:54'!
test14RoverRecibeUnComandoDesconocidoYNoRealizaMasMovimientos

	rover mover: 'rbKrff'.
	self assert: rover x equals: -1.
	self assert: rover y equals: 0.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 00:09:39'!
test15RoverRotaCuatroVecesYAvanza

	rover mover: 'rrrrfffffffb'.
	self assert: rover x equals: 0.
	self assert: rover y equals: 6.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 14:41:40'!
test16RoverArrancaEnX2Y4ApuntandoHaciaElOesteRotaYRetrocede
	rover := MarsRover conX: 2 conY: 4 apuntandoHacia: Oeste.
	rover mover: 'rfff'.
	self assert: rover x equals: 2.
	self assert: rover y equals: 7.! !


!classDefinition: #Direccion category: 'EJ6'!
Object subclass: #Direccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EJ6'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Direccion class' category: 'EJ6'!
Direccion class
	instanceVariableNames: ''!

!Direccion class methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 22:44:23'!
anterior
	
	self subclassResponsibility! !

!Direccion class methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:03:49'!
avanzar
	
	self subclassResponsibility! !

!Direccion class methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:03:51'!
retroceder
	
	self subclassResponsibility! !

!Direccion class methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 22:44:21'!
siguiente
	
	self subclassResponsibility! !


!classDefinition: #Este category: 'EJ6'!
Direccion subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EJ6'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Este class' category: 'EJ6'!
Este class
	instanceVariableNames: ''!

!Este class methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 00:07:29'!
anterior
	^Norte! !

!Este class methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:34:08'!
avanzar: unaPosicion
	unaPosicion moverHaciaLaDerecha ! !

!Este class methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:34:16'!
retroceder: unaPosicion
	unaPosicion moverHaciaLaIzquierda! !

!Este class methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 00:07:31'!
siguiente
	^Sur! !


!classDefinition: #Norte category: 'EJ6'!
Direccion subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EJ6'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Norte class' category: 'EJ6'!
Norte class
	instanceVariableNames: ''!

!Norte class methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 00:07:34'!
anterior
	^Oeste! !

!Norte class methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:34:35'!
avanzar: unaPosicion
	unaPosicion moverHaciaArriba! !

!Norte class methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:34:30'!
retroceder: unaPosicion
	unaPosicion moverHaciaAbajo ! !

!Norte class methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 00:07:37'!
siguiente
	^Este! !


!classDefinition: #Oeste category: 'EJ6'!
Direccion subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EJ6'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oeste class' category: 'EJ6'!
Oeste class
	instanceVariableNames: ''!

!Oeste class methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 00:07:41'!
anterior
	^Sur! !

!Oeste class methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:49:48'!
avanzar: unaPosicion
	unaPosicion moverHaciaLaIzquierda ! !

!Oeste class methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:49:59'!
retroceder: unaPosicion
	unaPosicion moverHaciaLaDerecha! !

!Oeste class methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 00:07:43'!
siguiente
	^Norte! !


!classDefinition: #Sur category: 'EJ6'!
Direccion subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EJ6'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sur class' category: 'EJ6'!
Sur class
	instanceVariableNames: ''!

!Sur class methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 00:07:46'!
anterior
	^Este! !

!Sur class methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:48:39'!
avanzar: unaPosicion
	unaPosicion moverHaciaAbajo! !

!Sur class methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:49:14'!
retroceder: unaPosicion
	unaPosicion moverHaciaArriba! !

!Sur class methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 00:07:48'!
siguiente
	^Oeste! !


!classDefinition: #MarsRover category: 'EJ6'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EJ6'!

!MarsRover methodsFor: 'coordenadas' stamp: 'aa 11/4/2022 00:06:36'!
direccion
	^ direccion! !

!MarsRover methodsFor: 'coordenadas' stamp: 'aa 11/1/2022 20:19:42'!
x
	^ posicion x! !

!MarsRover methodsFor: 'coordenadas' stamp: 'aa 11/1/2022 20:19:49'!
y
	^ posicion y! !


!MarsRover methodsFor: 'movimiento' stamp: 'aa 11/3/2022 23:52:27'!
mover: unosComandos
	unosComandos do: [ :comando | 
		'fbrl' indexOf: comando startingAt: 1 ifAbsent: [^ self] .
		comando = $f ifTrue: [ direccion avanzar: posicion ].
		comando = $b ifTrue: [ direccion retroceder: posicion ].
		comando = $r ifTrue: [ direccion := direccion siguiente ].
		comando = $l ifTrue: [ direccion := direccion anterior ].
	]! !


!MarsRover methodsFor: 'initialization' stamp: 'aa 11/4/2022 14:23:37'!
conX: coordenadaX conY: coordenadaY apuntandoHacia: unaDireccion
	posicion := Posicion conX: coordenadaX conY: coordenadaY.
	direccion := unaDireccion. ! !

!MarsRover methodsFor: 'initialization' stamp: 'aa 11/3/2022 23:27:57'!
initialize
	posicion := Posicion new.
	direccion := Norte.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'EJ6'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 14:22:42'!
conX: coordenadaX conY: coordenadaY apuntandoHacia: unaDireccion
	^ self new conX: coordenadaX conY: coordenadaY apuntandoHacia: unaDireccion.! !


!classDefinition: #Posicion category: 'EJ6'!
Object subclass: #Posicion
	instanceVariableNames: 'punto'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EJ6'!

!Posicion methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 14:19:48'!
conX: coordenadaX conY: coordenadaY
	punto := coordenadaX@coordenadaY! !

!Posicion methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:19:15'!
initialize
	punto := 0@0! !

!Posicion methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:31:18'!
moverHaciaAbajo
	punto := punto + (0@-1)! !

!Posicion methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:31:30'!
moverHaciaArriba
	punto := punto + (0@1)! !

!Posicion methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:31:40'!
moverHaciaLaDerecha
	punto := punto + (1@0)! !

!Posicion methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:31:58'!
moverHaciaLaIzquierda
	punto := punto + (-1@0)! !

!Posicion methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:56:03'!
x
	^ punto x! !

!Posicion methodsFor: 'as yet unclassified' stamp: 'aa 11/3/2022 23:57:39'!
y
	^ punto y! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Posicion class' category: 'EJ6'!
Posicion class
	instanceVariableNames: ''!

!Posicion class methodsFor: 'as yet unclassified' stamp: 'aa 11/4/2022 14:22:02'!
conX: coordenadaX conY: coordenadaY 
	^ self new conX: coordenadaX conY: coordenadaY! !
