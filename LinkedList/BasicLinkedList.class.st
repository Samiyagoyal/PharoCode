Class {
	#name : 'BasicLinkedList',
	#superclass : 'Object',
	#instVars : [
		'head',
		'tail'
	],
	#category : 'LinkedList',
	#package : 'LinkedList'
}

{ #category : 'adding' }
BasicLinkedList >> addLast: aLink [

    | link |
    link:=aLink.
    tail ifNotNil:[ tail nextLink:link].
    head ifNil: [ head:=link ].
    tail:=link.
    ^link 
]

{ #category : 'adding' }
BasicLinkedList >> asArray [ 
   | arr cur |
    arr:=OrderedCollection new.
    cur:=head.
    [ cur isNotNil ] whileTrue: [  arr add:(cur value).
	 cur :=cur nextLink. ].
^ arr
]
