Class {
	#name : 'FamixAngularTypesImporter',
	#superclass : 'FamixAngularEntityImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'as yet unclassified' }
FamixAngularTypesImporter >> basicCreateFrom: aTSClass [
    ^ self subclassResponsibility
]

{ #category : 'as yet unclassified' }
FamixAngularTypesImporter >> candidateClasses [
	^ tsModel allModelClasses select: [ :c |
		c decorators anySatisfy: [ :d | d name = self decoratorName ] ]
]

{ #category : 'instance creation' }
FamixAngularTypesImporter >> createFrom: aTSClass [

	| entity anchor |
	entity := self basicCreateFrom: aTSClass.
	anchor := aTSClass sourceAnchor.
	anchor ifNotNil: [
		entity ast: (FASTTypeScriptParser new parse: anchor sourceText) ].
	self fillMetadata: entity.              
	^ entity
]

{ #category : 'as yet unclassified' }
FamixAngularTypesImporter >> decoratorName [
	^ self subclassResponsibility

]

{ #category : 'as yet unclassified' }
FamixAngularTypesImporter >> fillMetadata: angularType [
 
]

{ #category : 'as yet unclassified' }
FamixAngularTypesImporter >> readDecoratorArgument: aKey in: anAst [
	"I hate this and prefer MoTion; but ok for now"

	"we are using it to get key and value from decorator in Angular componenents for example"

	^ (anAst allWithType: FASTTypeScriptPair)
		  detect: [ :pair |
			  pair children anySatisfy: [ :child |
				  child class = FASTTypeScriptPropertyIdentifier and: [
					  child sourceCode = aKey ] ] ]
		  ifFound: [ :pair | self stringValueOf: pair ]
		  ifNone: [ nil ]
]

{ #category : 'as yet unclassified' }
FamixAngularTypesImporter >> stringValueOf: aPair [
	| valueString |
	valueString := aPair children
		detect: [ :e | e class = FASTTypeScriptString ]
		ifNone: [ nil ].
	^ valueString
		ifNil: [ nil ]
		ifNotNil: [
			(valueString children
				detect: [ :e | e class = FASTTypeScriptStringFragment ]
				ifNone: [ nil ])
				ifNotNil: [ :frag | frag sourceCode ] ]
]
