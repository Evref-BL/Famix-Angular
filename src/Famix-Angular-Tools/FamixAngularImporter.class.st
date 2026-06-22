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

{ #category : 'accessing' }
FamixAngularImporter >> allClients [  
	"allWithType: keys on the concrete class, so the abstract FamixAngularAngularType
	 has no direct instances. Collect every concrete subclass instead."
	| clients |
	clients := OrderedCollection new.
	FamixAngularAngularType withAllSubclasses do: [ :cls |
		clients addAll: (angularModel allWithType: cls) ].
	^ clients
]

{ #category : 'as yet unclassified' }
FamixAngularImporter >> constructorOf: aTSClass [ 
	"Angular DI tokens are the constructor's parameters. The constructor has no
	 isConstructor flag in FamixTypeScript (THasKind replaced it), so match by name."
	^ aTSClass methods
		detect: [ :m | m name = 'constructor' ]
		ifNone: [ nil ]
]

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

	| servicesByName |
	servicesByName := Dictionary new.
	(angularModel allWithType: FamixAngularService) do: [ :service |
		servicesByName at: service name put: service ].

	self allClients do: [ :client |
		client implementingClass ifNotNil: [ :tsClass |
			(self injectedTypesOf: tsClass) do: [ :injectedType |
				servicesByName
					at: (self simpleTypeNameOf: injectedType)
					ifPresent: [ :service | client injectedServices add: service ] ] ] ]
]

{ #category : 'as yet unclassified' }
FamixAngularImporter >> injectedTypesOf: aTSClass [  
	"The declared types of the constructor parameters. ts2famix records these as
	 standalone FamixTypeScriptType entities (not linked to the class), so we
	 resolve them to services by name in importRelations."
	| ctor |
	ctor := self constructorOf: aTSClass.
	ctor ifNil: [ ^ #() ].
	^ (ctor parameters collect: [ :param | param declaredType ])
		reject: [ :type | type isNil ] 
]

{ #category : 'as yet unclassified' }
FamixAngularImporter >> simpleTypeNameOf: aType [ 
 
	| n |
	n := aType name.
	^ (n includes: $.)
		ifTrue: [ n copyAfterLast: $. ]
		ifFalse: [ n ] 
]
