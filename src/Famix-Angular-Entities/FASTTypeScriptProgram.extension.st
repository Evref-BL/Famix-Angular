Extension { #name : 'FASTTypeScriptProgram' }

{ #category : '*Famix-Angular-Entities' }
FASTTypeScriptProgram >> angularType [
	"Relation named: #angularType type: #FamixAngularType opposite: #ast"

	<ignoreForCoverage>
	<generated>
	<container>
	<derived>
	<FMProperty: #angularType type: #FamixAngularType opposite: #ast>
	<package: #'Famix-Angular-Entities'>
	^ self attributeAt: #angularType ifAbsent: [ nil ]
]

{ #category : '*Famix-Angular-Entities' }
FASTTypeScriptProgram >> angularType: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-Angular-Entities'>

	(self attributeAt: #angularType ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self angularType.
		self attributeAt: #angularType put: anObject.
		otherSide ast: nil ]
	ifNotNil: [ 
		self attributeAt: #angularType put: anObject.
		anObject ast: self ]
]

{ #category : '*Famix-Angular-Entities' }
FASTTypeScriptProgram >> childrenNodes [
	"Relation named: #childrenNodes type: #FASTTypeScriptEntity opposite: #programOwner"

	<ignoreForCoverage>
	<generated>
	<derived>
	<FMProperty: #childrenNodes type: #FASTTypeScriptEntity opposite: #programOwner>
	<multivalued>
	<package: #'Famix-Angular-Entities'>
	^ self attributeAt: #childrenNodes ifAbsentPut: [ FMMultivalueLink on: self opposite: #programOwner: ]
]

{ #category : '*Famix-Angular-Entities' }
FASTTypeScriptProgram >> childrenNodes: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-Angular-Entities'>

	self childrenNodes value: anObject
]

{ #category : '*Famix-Angular-Entities' }
FASTTypeScriptProgram >> classDeclarations [
	"Relation named: #classDeclarations type: #FASTTypeScriptClassDeclaration opposite: #programClassDeclarationOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The class declarations that I define'>
	<derived>
	<FMProperty: #classDeclarations type: #FASTTypeScriptClassDeclaration opposite: #programClassDeclarationOwner>
	<multivalued>
	<package: #'Famix-Angular-Entities'>
	^ self attributeAt: #classDeclarations ifAbsentPut: [ FMMultivalueLink on: self opposite: #programClassDeclarationOwner: ]
]

{ #category : '*Famix-Angular-Entities' }
FASTTypeScriptProgram >> classDeclarations: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-Angular-Entities'>

	self classDeclarations value: anObject
]

{ #category : '*Famix-Angular-Entities' }
FASTTypeScriptProgram >> enumDeclarations [
	"Relation named: #enumDeclarations type: #FASTTypeScriptEnumDeclaration opposite: #programEnumDeclarationOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The enum declarations that I define'>
	<derived>
	<FMProperty: #enumDeclarations type: #FASTTypeScriptEnumDeclaration opposite: #programEnumDeclarationOwner>
	<multivalued>
	<package: #'Famix-Angular-Entities'>
	^ self attributeAt: #enumDeclarations ifAbsentPut: [ FMMultivalueLink on: self opposite: #programEnumDeclarationOwner: ]
]

{ #category : '*Famix-Angular-Entities' }
FASTTypeScriptProgram >> enumDeclarations: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-Angular-Entities'>

	self enumDeclarations value: anObject
]

{ #category : '*Famix-Angular-Entities' }
FASTTypeScriptProgram >> interfaceDeclarations [
	"Relation named: #interfaceDeclarations type: #FASTTypeScriptInterfaceDeclaration opposite: #programInterfaceDeclarationOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The interface declarations that I define'>
	<derived>
	<FMProperty: #interfaceDeclarations type: #FASTTypeScriptInterfaceDeclaration opposite: #programInterfaceDeclarationOwner>
	<multivalued>
	<package: #'Famix-Angular-Entities'>
	^ self attributeAt: #interfaceDeclarations ifAbsentPut: [ FMMultivalueLink on: self opposite: #programInterfaceDeclarationOwner: ]
]

{ #category : '*Famix-Angular-Entities' }
FASTTypeScriptProgram >> interfaceDeclarations: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-Angular-Entities'>

	self interfaceDeclarations value: anObject
]
