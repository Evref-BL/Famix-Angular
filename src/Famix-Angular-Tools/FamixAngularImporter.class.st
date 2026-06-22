Class {
	#name : 'FamixAngularImporter',
	#superclass : 'Object',
	#instVars : [
		'tsModel',
		'angularModel'
	],
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'as yet unclassified' }
FamixAngularImporter >> entityImporters [
	^ (FamixAngularEntityImporter allSubclasses reject: [ :c | c isAbstract ])
		collect: [ :c | c new ]
]

{ #category : 'as yet unclassified' }
FamixAngularImporter >> importAngularModelFrom: aTSModel [

	tsModel := aTSModel.
	angularModel := FamixAngularModel new.
	self entityImporters do: [ :imp |
		imp
			tsModel: tsModel angularModel: angularModel;
			run ].
	self importRelations.  
	^ angularModel
]

{ #category : 'as yet unclassified' }
FamixAngularImporter >> importRelations [ 

	(FamixAngularRelationImporter allSubclasses reject: [ :c | c isAbstract ])
		do: [ :c |
			c new
				tsModel: tsModel angularModel: angularModel;
				run ] 
]
