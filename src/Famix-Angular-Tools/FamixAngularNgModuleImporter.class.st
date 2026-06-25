Class {
	#name : 'FamixAngularNgModuleImporter',
	#superclass : 'FamixAngularTypesImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'instance creation' }
FamixAngularNgModuleImporter >> basicCreateFrom: aTSClass [

	^ FamixAngularNgModule new
		  name: aTSClass name;
		  implementingClass: aTSClass;
		  yourself
]

{ #category : 'as yet unclassified' }
FamixAngularNgModuleImporter >> decoratorName [
	^ '@NgModule' 
]

{ #category : 'as yet unclassified' }
FamixAngularNgModuleImporter >> extractDeclarationsFor: aModule in: ast [

	| declarations |
	
	declarations := self readDecoratorArrayArgument: 'declarations' in: ast.
	(angularModel  allWithType: FamixAngularComponent) do: [ :each |
		(declarations includes: each name)
		ifTrue: [aModule addDeclaration: each ] 
	]
	
	
]

{ #category : 'instance creation' }
FamixAngularNgModuleImporter >> fillMetadata: aComponent [

	aComponent ast ifNotNil: [ :ast |
		self extractDeclarationsFor: aComponent in: ast  ]
]
