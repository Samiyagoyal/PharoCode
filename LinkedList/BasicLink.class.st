Class {
	#name : 'BasicLink',
	#superclass : 'Object',
	#instVars : [
		'value',
		'nextLink'
	],
	#category : 'LinkedList',
	#package : 'LinkedList'
}

{ #category : 'accessing' }
BasicLink >> nextLink [
    ^nextLink
]

{ #category : 'accessing' }
BasicLink >> nextLink: newLink [
   nextLink:=newLink
]

{ #category : 'accessing' }
BasicLink >> value [
   ^value
]

{ #category : 'accessing' }
BasicLink >> value: newValue [
  value:=newValue
]
