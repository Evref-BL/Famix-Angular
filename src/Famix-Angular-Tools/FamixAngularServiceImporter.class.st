Class {
	#name : 'FamixAngularServiceImporter',
	#superclass : 'FamixAngularDecoratedImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'instance creation' }
FamixAngularServiceImporter >> createFrom: aTSClass [
	^ FamixAngularService new
		name: aTSClass name;
		implementingClass: aTSClass;
		yourself
]

{ #category : 'as yet unclassified' }
FamixAngularServiceImporter >> decoratorName [ ^ '@Injectable'
]
