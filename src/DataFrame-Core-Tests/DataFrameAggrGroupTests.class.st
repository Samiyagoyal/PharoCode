Class {
	#name : #DataFrameAggrGroupTests,
	#superclass : #TestCase,
	#instVars : [
		'df'
	],
	#category : #'DataFrame-Tests'
}

{ #category : #initialization }
DataFrameAggrGroupTests >> setUp [

	df := DataFrame fromRows:
		#((16.99 1.01 'Female' 'No' 'Sun' 'Dinner' 2)
		  (10.34 1.66 'Male' 'No' 'Sun' 'Dinner' 3)
		  (21.01 3.5 'Male' 'No' 'Sun' 'Dinner' 3)
		  (23.68 3.31 'Male' 'No' 'Sun' 'Dinner' 2)
		  (24.59 3.61 'Female' 'No' 'Sun' 'Dinner' 4)).
		
	df columnNames: #('total_bill' 'tip' 'sex' 'smoker' 'day' 'time' 'size').
]

{ #category : #initialization }
DataFrameAggrGroupTests >> testAggregateAverage [

	| expected actual |
	
	expected := #(20.79 18.3433) asDataSeries.
	expected keys: #(Female Male).
	
	actual := (df group: #total_bill by: #sex) average.
	
	self assert: actual closeTo: expected.
]

{ #category : #initialization }
DataFrameAggrGroupTests >> testAggregateMax [

	| expected actual |
	
	expected := #(24.59 23.68) asDataSeries.
	expected keys: #(Female Male).
	
	actual := (df group: #total_bill by: #sex) max.
	
	self assert: actual equals: expected.
]

{ #category : #initialization }
DataFrameAggrGroupTests >> testAggregateMin [

	| expected actual |
	
	expected := #(16.99 10.34) asDataSeries.
	expected keys: #(Female Male).
	
	actual := (df group: #total_bill by: #sex) min.
	
	self assert: actual equals: expected.
]

{ #category : #initialization }
DataFrameAggrGroupTests >> testDataFrameGroupedPrintOn [

	| expected actual |
	
	expected := String new writeStream.
	expected
		nextPutAll: 'a DataFrameGrouped'; cr;
		nextPutAll: 'Female: a DataFrame (2@6)'; cr;
		nextPutAll: 'Male: a DataFrame (3@6)'.
	expected := expected contents.
	
	actual := String new writeStream.
	(df groupBy: #sex) printOn: actual.
	actual := actual contents.
	
	self assert: actual equals: expected.
]

{ #category : #initialization }
DataFrameAggrGroupTests >> testDataSeriesGroupedPrintOn [

	| expected actual |
	
	expected := String new writeStream.
	expected
		nextPutAll: 'a DataSeriesGrouped'; cr;
		nextPutAll: ('Female: a DataSeries [2 items]: ', 21.01 class name); cr;
		nextPutAll: ('Male: a DataSeries [3 items]: ', 21.01 class name).
	expected := expected contents.
	
	actual := String new writeStream.
	(df group: #total_bill by: #sex) printOn: actual.
	actual := actual contents.
	
	self assert: actual equals: expected.
]

{ #category : #tests }
DataFrameAggrGroupTests >> testGroupSeriesBySeries [

	| femaleGroup maleGroup expectedSeries actualSeries |
	
	femaleGroup := #(16.99 24.59) asDataSeries.
	maleGroup := #(10.34 21.01 23.68) asDataSeries.
	
	expectedSeries := { femaleGroup . maleGroup } asDataSeries.
	expectedSeries keys: #('Female' 'Male').
	
	actualSeries := (df group: #total_bill by: #sex) groups.
	
self assert: actualSeries equals: expectedSeries.
]