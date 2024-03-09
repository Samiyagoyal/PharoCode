Class {
	#name : 'AddElementTest',
	#superclass : 'Object',
	#instVars : [
		'sampleList'
	],
	#category : 'LinkedList-Tests',
	#package : 'LinkedList',
	#tag : 'Tests'
}

{ #category : 'initialization' }
AddElementTest >> setUp [ 
  super setUp.
  sampleList:= BasicLinkedList new.
]

{ #category : 'as yet unclassified' }
AddElementTest >> testAddElement [
  |testNode|
   testNode:= BasicLink new.
   testNode value:5.

   sampleList addLast: testNode.
   self assert: (sampleList asArray) size equals:1.
]
