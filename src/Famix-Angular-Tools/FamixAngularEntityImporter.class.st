Class {
	#name : 'FamixAngularEntityImporter',
	#superclass : 'Object',
	#instVars : [
		'tsModel',
		'angularModel'
	],
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'testing' }
FamixAngularEntityImporter class >> isAbstract [
	^ self subclasses isNotEmpty
]

{ #category : 'as yet unclassified' }
FamixAngularEntityImporter >> candidateClasses [

	^ self subclassResponsibility
]

{ #category : 'instance creation' }
FamixAngularEntityImporter >> createFrom: aTSClass [
	^ self subclassResponsibility

]

{ #category : 'running' }
FamixAngularEntityImporter >> run [
	self candidateClasses do: [ :tsClass |
		angularModel add: (self createFrom: tsClass) ]
]

{ #category : 'as yet unclassified' }
FamixAngularEntityImporter >> tsModel: aModel angularModel: anAngularModel [
	
	tsModel := aModel. 
	angularModel := anAngularModel
]
