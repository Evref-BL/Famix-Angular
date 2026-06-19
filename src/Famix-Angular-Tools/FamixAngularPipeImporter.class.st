Class {
	#name : 'FamixAngularPipeImporter',
	#superclass : 'FamixAngularDecoratedImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'instance creation' }
FamixAngularPipeImporter >> createFrom: aTSClass [  
	^ FamixAngularPipe new
		name: aTSClass name;
		implementingClass: aTSClass;
		yourself 
]

{ #category : 'as yet unclassified' }
FamixAngularPipeImporter >> decoratorName [  
	^ '@Pipe'
]
