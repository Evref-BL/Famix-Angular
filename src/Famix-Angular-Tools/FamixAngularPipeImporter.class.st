Class {
	#name : 'FamixAngularPipeImporter',
	#superclass : 'FamixAngularTypesImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'instance creation' }
FamixAngularPipeImporter >> basicCreateFrom: aTSClass [

	^ FamixAngularPipe new
		  name: aTSClass name;
		  implementingClass: aTSClass;
		  yourself
]

{ #category : 'as yet unclassified' }
FamixAngularPipeImporter >> decoratorName [  
	^ '@Pipe'
]

{ #category : 'as yet unclassified' }
FamixAngularPipeImporter >> fillMetadata: aPipe [
	aPipe ast ifNotNil: [ :ast |
		aPipe pipeName: (self readDecoratorArgument: 'name' in: ast) ]
]
