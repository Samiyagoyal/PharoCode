Class {
	#name : 'DataSeries',
	#superclass : 'OrderedDictionary',
	#instVars : [
		'name',
		'forcedIsNumerical'
	],
	#category : 'DataFrame-Core',
	#package : 'DataFrame',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
DataSeries >> divide: aCollection replaceNilsWith:anArg [
  |result|
result:=self/aCollection.
(anArg=#mean)ifTrue: [ result:=result replaceNilsWithAverage].
(anArg=#median)ifTrue: [ result:=result replaceNilsWithMedian].
(anArg=#mode)ifTrue: [ result:=result replaceNilsWithMode].
(anArg=#zero)ifTrue: [ result:=result replaceNilsWithZero].
(anArg isKindOf: Number) ifTrue: [ result:=result replaceNilsWith: anArg].

^result


]
