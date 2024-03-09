Class {
	#name : 'MyTodoListApp',
	#superclass : 'SpApplication',
	#category : 'MyApplication',
	#package : 'MyApplication'
}

{ #category : 'running' }
MyTodoListApp >> start [   
  (self new: MyTodoList) open
]
