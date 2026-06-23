Class {
	#name : 'FamixAngularRelationImporter',
	#superclass : 'Object',
	#instVars : [
		'tsModel',
		'angularModel'
	],
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'testing' }
FamixAngularRelationImporter class >> isAbstract [  
	^ self = FamixAngularRelationImporter 
]

{ #category : 'as yet unclassified' }
FamixAngularRelationImporter >> allAngularTypes [

	^ FamixAngularType withAllSubclasses flatCollect: [ :cls |
		  angularModel allWithType: cls ]
]

{ #category : 'running' }
FamixAngularRelationImporter >> run [ 
	^ self subclassResponsibility
]

{ #category : 'as yet unclassified' }
FamixAngularRelationImporter >> simpleNameOf: aType [  
	| n |
	n := aType name.
	^ (n includes: $.) ifTrue: [ n copyAfterLast: $. ] ifFalse: [ n ] 
]

{ #category : 'as yet unclassified' }
FamixAngularRelationImporter >> tsModel: aTSModel angularModel: anAngularModel [
	tsModel := aTSModel.
	angularModel := anAngularModel
]
