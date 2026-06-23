Class {
	#name : 'FamixAngularComponentImporter',
	#superclass : 'FamixAngularTypesImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'instance creation' }
FamixAngularComponentImporter >> basicCreateFrom: aTSClass [

	^ FamixAngularComponent new
		  name: aTSClass name;
		  implementingClass: aTSClass; 
		  yourself
]

{ #category : 'as yet unclassified' }
FamixAngularComponentImporter >> decoratorName [ 
	^ '@Component'
]

{ #category : 'as yet unclassified' }
FamixAngularComponentImporter >> fillMetadata: aComponent [

	aComponent ast ifNotNil: [ :ast |
		aComponent selector:
			(self readDecoratorArgument: 'selector' in: ast) ]
]
