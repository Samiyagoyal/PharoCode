"
A BasicLinkedListTest is a test class for testing the behavior of BasicLinkedList
"
Class {
	#name : 'BasicLinkedListTest',
	#superclass : 'TestCase',
	#instVars : [
		'sampleList'
	],
	#category : 'LinkedList-Tests',
	#package : 'LinkedList',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasicLinkedListTest >> setUp [ 
  super setUp.
  sampleList:= BasicLinkedList new.
]

{ #category : 'tests' }
BasicLinkedListTest >> testAddElement [
  |testNode|
   testNode:= BasicLink new.
   testNode value:5.

   sampleList addLast: testNode.
   self assert: (sampleList asArray) size equals:1.
]
