Class {
	#name : 'MyExampleSetTest',
	#superclass : 'TestCase',
	#instVars : [
		'full',
		'empty'
	],
	#category : 'MySetTest',
	#package : 'MySetTest'
}

{ #category : 'running' }
MyExampleSetTest >> setUp [ 
super setUp.
empty:= Set new.
full:= Set with:5 with:6.
]

{ #category : 'tests' }
MyExampleSetTest >> testIncludes [
    self assert: (full includes:5).
    self assert: (full includes:6).
    self assert: (empty includes: 5) not
]

{ #category : 'tests' }
MyExampleSetTest >> testOccurences [

  self assert: (empty occurrencesOf: 0) equals:0.
  self assert: (full occurrencesOf:5) equals:1.
  full add:5.
  self assert:(full occurrencesOf:5) equals:1
]

{ #category : 'tests' }
MyExampleSetTest >> testRemove [
  full remove:6.
  self assert: (full includes:6).
  self deny: (full includes:5).
]
