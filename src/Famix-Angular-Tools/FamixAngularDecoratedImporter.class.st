Class {
	#name : 'FamixAngularDecoratedImporter',
	#superclass : 'FamixAngularEntityImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'as yet unclassified' }
FamixAngularDecoratedImporter >> candidateClasses [
	^ tsModel allModelClasses select: [ :c |
		c decorators anySatisfy: [ :d | d name = self decoratorName ] ]
]

{ #category : 'as yet unclassified' }
FamixAngularDecoratedImporter >> decoratorName [
	^ self subclassResponsibility

]
