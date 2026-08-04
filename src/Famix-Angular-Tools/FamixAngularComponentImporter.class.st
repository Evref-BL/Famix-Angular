Class {
	#name : 'FamixAngularComponentImporter',
	#superclass : 'FamixAngularTypesImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'instance creation' }
FamixAngularComponentImporter >> basicCreateFrom: aTSClass [

	^ FamixAngularComponent new
		  name: aTSClass name;
		  implementingClass: aTSClass; 
		  yourself
]

{ #category : 'as yet unclassified' }
FamixAngularComponentImporter >> decoratorName [ 
	^ '@Component'
]

{ #category : 'as yet unclassified' }
FamixAngularComponentImporter >> extractStylesFor: aComponent in: ast [

	| styles scssParser |
	styles := OrderedCollection new.
	scssParser := FASTSCSSParser new.
	(self readDecoratorArrayArgument: 'styles' in: ast) do: [ :css |
		css ifNotNil: [
			styles add: (self
					 fillArtifact: FamixAngularStyle new
					 name: aComponent name , '_style'
					 inlineContent: css
					 withParser: scssParser
					 for: aComponent) ] ].
	(self readDecoratorArrayArgument: 'styleUrls' in: ast) do: [ :p |
		p ifNotNil: [
			styles add: (self
					 fillArtifact: FamixAngularStyle new
					 name: aComponent name , '_style'
					 path: p
					 withParser: scssParser
					 for: aComponent) ] ].
	^ styles
]

{ #category : 'as yet unclassified' }
FamixAngularComponentImporter >> extractTemplateFor: aComponent in: ast [

	| inline path |
	inline := self readDecoratorArgument: 'template' in: ast.
	inline ifNotNil: [
		^ self
			  fillArtifact: FamixAngularHTMLTemplate new
			  name: aComponent name , '_template'
			  inlineContent: inline
			  withParser: FASTHTMLParser new
			  for: aComponent ].
	path := self readDecoratorArgument: 'templateUrl' in: ast.
	path ifNil: [ ^ nil ].
	^ self
		  fillArtifact: FamixAngularHTMLTemplate new
		  name: aComponent name , '_template'
		  path: path
		  withParser: FASTHTMLParser new
		  for: aComponent
]

{ #category : 'as yet unclassified' }
FamixAngularComponentImporter >> fillArtifact: anArtifact name: aName inlineContent: aString withParser: aParser for: aComponent [

	| ast anchor |
	anchor := FamixAngularIndexedFileAnchor new
		          element: anArtifact;
		          mooseModel: angularModel;
		          fileName: 'noName'; 
		          startPos: 1;
		          endPos: (aString ifNil: [ 0 ] ifNotNil: [ :c | c size ]);
		 			 name: 'noName';
		          yourself.


	anArtifact
		sourceAnchor: anchor;
		name: aName;
		component: aComponent.
	"content: aString;"
	"isInline: true;"

	ast := aParser parse: aString.

	anArtifact class = FamixAngularHTMLTemplate ifTrue: [
		anArtifact htmlAstRoot: (ast allWithType: FASTHTMLDocument) first ].

	anArtifact class = FamixAngularStyle ifTrue: [
		anArtifact styleAstRoot: (ast allWithType: FASTSCSSStylesheet) first ].

	^ anArtifact
]

{ #category : 'as yet unclassified' }
FamixAngularComponentImporter >> fillArtifact: anArtifact name: aName path: aPath withParser: aParser for: aComponent [

	| file content ast anchor |
	file := self
		        resolvePath: aPath
		        fromSourceAnchor: aComponent implementingClass sourceAnchor.
	content := file exists
		           ifTrue: [ file contents ]
		           ifFalse: [ nil ].

	anchor := FamixAngularIndexedFileAnchor new
		          element: anArtifact;
		          mooseModel: angularModel;
		          fileName: file fullName;
		          startPos: 1;
		          endPos: (content ifNil: [ 0 ] ifNotNil: [ :c | c size ]);
		          name: file basename;
		          yourself.

	anArtifact
		sourceAnchor: anchor;
		name: aName;
		component: aComponent.
	"path: aPath;"
	"file: file;"
	"content: content;"
	"isInline: false;"

	ast := content ifNotNil: [ :c | aParser parse: c ].

	anArtifact class = FamixAngularHTMLTemplate ifTrue: [
		anArtifact htmlAstRoot: (ast allWithType: FASTHTMLDocument) first ].

	anArtifact class = FamixAngularStyle ifTrue: [
		anArtifact styleAstRoot: (ast allWithType: FASTSCSSStylesheet) first ].

	^ anArtifact
]

{ #category : 'as yet unclassified' }
FamixAngularComponentImporter >> fillMetadata: aComponent [
	aComponent ast ifNotNil: [ :ast |
		aComponent selector: (self readDecoratorArgument: 'selector' in: ast).
		self extractTemplateFor: aComponent in: ast.
		self extractStylesFor: aComponent in: ast ]
]

{ #category : 'as yet unclassified' }
FamixAngularComponentImporter >> resolvePath: extractedPath fromSourceAnchor: aSourceAnchor [

	| tsFile directory |
	tsFile := aSourceAnchor fileReference .
	directory := tsFile parent.
	^ (directory / extractedPath) asFileReference
]
