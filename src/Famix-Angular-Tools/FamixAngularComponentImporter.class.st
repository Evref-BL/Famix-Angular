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

	| styles cssParser |
	styles := OrderedCollection new.
	cssParser := FASTCSSParser new.
	(self readDecoratorArrayArgument: 'styles' in: ast) do: [ :css |
		css ifNotNil: [
			styles add: (self
					 fillArtifact: FamixAngularStyle new
					 name: aComponent name , '_style'
					 inlineContent: css
					 withParser: cssParser
					 for: aComponent) ] ].
	(self readDecoratorArrayArgument: 'styleUrls' in: ast) do: [ :p |
		p ifNotNil: [
			styles add: (self
					 fillArtifact: FamixAngularStyle new
					 name: aComponent name , '_style'
					 path: p
					 withParser: cssParser
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

	anArtifact
		isInline: true;
		content: aString;
		ast: (aParser parse: aString);
		name: aName;
		component: aComponent.
	^ anArtifact
]

{ #category : 'as yet unclassified' }
FamixAngularComponentImporter >> fillArtifact: anArtifact name: aName path: aPath withParser: aParser for: aComponent [

	| file content |
	file := self
		        resolvePath: aPath
		        fromSourceAnchor: aComponent implementingClass sourceAnchor.
	content := file exists
		           ifTrue: [ file contents ]
		           ifFalse: [ nil ].
	anArtifact
		isInline: false;
		path: aPath;
		file: file;
		content: content;
		ast: (content ifNotNil: [ :c | aParser parse: c ]);
		name: aName;
		component: aComponent.
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
