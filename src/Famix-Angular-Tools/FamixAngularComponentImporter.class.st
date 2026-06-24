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
FamixAngularComponentImporter >> fillMetadata: aComponent [

	aComponent ast ifNotNil: [ :ast |
		aComponent selector:
			(self readDecoratorArgument: 'selector' in: ast). 
		aComponent template: (self
				 resolveTemplateForArgument: 'templateUrl'
				 in: ast
				 for: aComponent) ]
]

{ #category : 'as yet unclassified' }
FamixAngularComponentImporter >> resolvePath: extractedPath fromSourceAnchor: aSourceAnchor [

	| tsFile directory |
	tsFile := aSourceAnchor fileReference .
	directory := tsFile parent.
	^ (directory / extractedPath) asFileReference
]

{ #category : 'as yet unclassified' }
FamixAngularComponentImporter >> resolveTemplateForArgument: anArgument in: ast for: aComponent [

	| pathStr htmlTemplateFile angularTemplate |
	
	" !!!! handle the case when inline !!!! "
		
	pathStr := self readDecoratorArgument: 'templateUrl' in: ast.
	htmlTemplateFile := self
		                    resolvePath: pathStr
		                    fromSourceAnchor:
		                    aComponent implementingClass sourceAnchor.

	angularTemplate := FamixAngularTemplate new.
	"Add ast and fill it with parsed htmlTemplateFile"
	angularTemplate templateUrl: pathStr.
	angularTemplate templateFile: htmlTemplateFile.
	angularTemplate ast: (FASTHTMLParser new parse: htmlTemplateFile contents  ).
	angularTemplate component: aComponent.
	angularTemplate isInline: false.

	^ angularTemplate
]
