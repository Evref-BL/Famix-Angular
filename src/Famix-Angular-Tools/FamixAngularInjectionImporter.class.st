Class {
	#name : 'FamixAngularInjectionImporter',
	#superclass : 'FamixAngularCrossLanguageLinkImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'accessing' }
FamixAngularInjectionImporter >> allAngularTypes [

	^ FamixAngularType withAllSubclasses flatCollect: [ :cls |
		  angularModel allWithType: cls ]
]

{ #category : 'as yet unclassified' }
FamixAngularInjectionImporter >> constructorOf: aTSClass [   
	^ aTSClass methods
		detect: [ :m | m name = 'constructor' ]
		ifNone: [ nil ] 
]

{ #category : 'as yet unclassified' }
FamixAngularInjectionImporter >> injectedTypesOf: aTSClass [ 
	"Declared types of the constructor parameters; resolved to services by name in #run."
	| ctor |
	ctor := self constructorOf: aTSClass.
	ctor ifNil: [ ^ #() ].
	^ (ctor parameters collect: [ :param | param declaredType ])
		reject: [ :type | type isNil ] 
]

{ #category : 'running' }
FamixAngularInjectionImporter >> run [

	| servicesByName |
	servicesByName := Dictionary new.
	(angularModel allWithType: FamixAngularService) do: [ :service |
		servicesByName at: service name put: service ].

	self allAngularTypes do: [ :client |
		client implementingClass ifNotNil: [ :tsClass |
			(self injectedTypesOf: tsClass) do: [ :injectedType |
				servicesByName
					at: (self simpleNameOf: injectedType )
					ifPresent: [ :service | client injectedServices add: service ] ] ] ]
]

{ #category : 'accessing' }
FamixAngularInjectionImporter >> simpleNameOf: aType [  
	| n |
	n := aType name.
	^ (n includes: $.) ifTrue: [ n copyAfterLast: $. ] ifFalse: [ n ] 
]
