"
A CounterTest is a test class for testing the behavior of Counter
"
Class {
	#name : 'CounterTest',
	#superclass : 'TestCase',
	#category : 'MyCounter-Tests',
	#package : 'MyCounter',
	#tag : 'Tests'
}

{ #category : 'tests' }
CounterTest >> testCreatingMyCounter [
  "A test that will check if the creation of an object MyCounter is done properly"
  |tmp|
  tmp := Counter new.
  self deny: (tmp = nil)
]

{ #category : 'tests' }
CounterTest >> testDecrementing [
  "A test that will check if method decrement is working properly.
   Test value 5. Expested result is 4."
  |counter|
  counter := Counter new.
  counter count: 5.
  counter decrement.
  self assert: (counter count = 4)
]

{ #category : 'tests' }
CounterTest >> testIncrementing [
  "A test that will check if method increment is working properly. 
    Test value 5. Expected result 6."
  |counter|
  counter := Counter new.
  counter count: 5.
  counter increment.
  self assert: (counter count = 6)
]
