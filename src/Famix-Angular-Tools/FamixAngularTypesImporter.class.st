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
			entity ast:
				((FASTTypeScriptParser new parse: anchor sourceText) allWithType:
					 FASTTypeScriptProgram) first ].
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

{ #category : 'reading' }
FamixAngularTypesImporter >> isStringNode: aNode [
	"Quoted string or backtick template string"

	^ aNode class = FASTTypeScriptString or: [
		  aNode class = FASTTypeScriptTemplateString ]
]

{ #category : 'reading' }
FamixAngularTypesImporter >> pairNamed: aKey in: anAst [
	"The key: value pair named aKey in anAst (a FASTTypeScriptProgram), or nil"

	^ anAst allContainedEntities
		  detect: [ :e |
				  e class = FASTTypeScriptPair and: [
						  e containedEntities anySatisfy: [ :child |
								  child class = FASTTypeScriptPropertyIdentifier and: [
									  child sourceCode = aKey ] ] ] ]
		  ifNone: [ nil ]
]

{ #category : 'reading' }
FamixAngularTypesImporter >> readDecoratorArgument: aKey in: anAst [
	"I hate this and prefer MoTion; but ok for now"

	"we are using it to get key and value from decorator in Angular componenents for example"

	^ (self pairNamed: aKey in: anAst) ifNotNil: [ :pair |
		  self stringValueOf: pair ]
]

{ #category : 'reading' }
FamixAngularTypesImporter >> readDecoratorArrayArgument: aKey in: anAst [

	^ (self pairNamed: aKey in: anAst)
		  ifNil: [ #(  ) ]
		  ifNotNil: [ :pair | self stringValuesOf: pair ]
]

{ #category : 'reading' }
FamixAngularTypesImporter >> stringValueOf: aPair [

	^ (aPair containedEntities
		   detect: [ :e | self isStringNode: e ]
		   ifNone: [ nil ]) ifNotNil: [ :str | self textOf: str ]
]

{ #category : 'reading' }
FamixAngularTypesImporter >> stringValuesOf: aPair [

	| identifiers |
	identifiers := aPair allContainedEntities select: [ :e |
		               e class = FASTTypeScriptIdentifier ].
	identifiers ifNotEmpty: [
		^ identifiers collect: [ :id | id sourceCode ] ].
	^ (aPair allContainedEntities select: [ :e | self isStringNode: e ])
		  collect: [ :str | self textOf: str ]
]

{ #category : 'reading' }
FamixAngularTypesImporter >> textOf: aStringNode [
	"Literal text of a string node, without its delimiters"

	aStringNode class = FASTTypeScriptTemplateString ifTrue: [
			^ aStringNode sourceCode
				  copyFrom: 2
				  to: aStringNode sourceCode size - 1 ].
	^ (aStringNode containedEntities
		   detect: [ :e | e class = FASTTypeScriptStringFragment ]
		   ifNone: [ nil ]) ifNotNil: [ :fragment | fragment sourceCode ]
]
