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

{ #category : 'as yet unclassified' }
FamixAngularNgModuleImporter >> extractProvidedServicesFor: aModule in: ast [

	| providers |
	providers := self
		                readDecoratorArrayArgument: 'providers'
		                in: ast.
	(angularModel allWithType: FamixAngularService) do: [ :each |
		(providers includes: each name) ifTrue: [
			aModule addProvidedService: each ] ]
]

{ #category : 'instance creation' }
FamixAngularNgModuleImporter >> fillMetadata: aModule [

	aModule ast ifNotNil: [ :ast |
		self extractDeclarationsFor: aModule in: ast.
		self extractProvidedServicesFor: aModule in: ast  ]
]
