Class {
	#name : 'MyTodoList',
	#superclass : 'SpPresenter',
	#instVars : [
		'taskList',
		'addTaskButton',
		'addTaskText',
		'taskListPresenter'
	],
	#category : 'MyApplication',
	#package : 'MyApplication'
}

{ #category : 'initialization' }
MyTodoList >> connectPresenters [ 
  addTaskButton action: [ 
	   addTaskText text = ' ' ifFalse:[
	     taskList add: addTaskText text.
	     addTaskText text: ''].
	taskListPresenter updateList]
]

{ #category : 'initialization' }
MyTodoList >> initializeLayout [
  self layout: ( SpBoxLayout newVertical
  add: taskListPresenter;
  add: addTaskText;
  add: addTaskButton;
  spacing: 10;
  yourself)
]

{ #category : 'initialization' }
MyTodoList >> initializePresenters [

    self instantiatePresenters.
    self initializeLayout

]

{ #category : 'initialization' }
MyTodoList >> initializeWindow: aWindowPresenter [
   aWindowPresenter 
     title: 'My ToDo List';
initialExtent: 300 @ 270
]

{ #category : 'initialization' }
MyTodoList >> instantiatePresenters [
   taskList := #('Create a to-do list in Pharo') asOrderedCollection.
   taskListPresenter:= self instantiate: SpListPresenter new.
   taskListPresenter
      items: taskList;
      activateOnDoubleClick;
      whenActivatedDo: [ :itemToRemove | self removeTask: itemToRemove ].
 

    addTaskButton:= self newButton.
    addTaskButton label: 'Add Task.'.
    
    addTaskText:=self newTextInput
 
]

{ #category : 'initialization' }
MyTodoList >> removeTask: anItem [
  taskList remove: anItem selectedItem.
  taskListPresenter updateList
]
