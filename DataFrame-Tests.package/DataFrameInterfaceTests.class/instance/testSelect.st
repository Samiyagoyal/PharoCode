tests
testSelect

	DataFrame new select: [ :x :y |
   		x = 'House Stark' and:
   		y = 1
	] with: #('Allegiances' 'Death Chapter').