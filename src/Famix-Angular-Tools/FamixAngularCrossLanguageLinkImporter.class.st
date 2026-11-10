"
I am the root of the importers that create cross-language links (FamixAngularCrossLanguageLink) between the entities of an Angular model, e.g. HTML template -> TypeScript class. FamixAngularImporter runs all my concrete subclasses after the entities and relations are imported.
"
Class {
	#name : 'FamixAngularCrossLanguageLinkImporter',
	#superclass : 'Object',
	#instVars : [
		'tsModel',
		'angularModel'
	],
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'testing' }
FamixAngularCrossLanguageLinkImporter class >> isAbstract [

	^ self = FamixAngularCrossLanguageLinkImporter
]

{ #category : 'running' }
FamixAngularCrossLanguageLinkImporter >> run [

	^ self subclassResponsibility
]

{ #category : 'running' }
FamixAngularCrossLanguageLinkImporter >> tsModel: aTSModel angularModel: anAngularModel [

	tsModel := aTSModel.
	angularModel := anAngularModel
]
