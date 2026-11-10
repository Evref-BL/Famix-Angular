Extension { #name : 'FASTHTMLDocument' }

{ #category : '*Famix-Angular-Entities' }
FASTHTMLDocument >> angularTemplate [
	"Relation named: #angularTemplate type: #FamixAngularHTMLTemplate opposite: #ast"

	<ignoreForCoverage>
	<generated>
	<container>
	<derived>
	<FMProperty: #angularTemplate type: #FamixAngularHTMLTemplate opposite: #ast>
	<package: #'Famix-Angular-Entities'>
	^ self attributeAt: #angularTemplate ifAbsent: [ nil ]
]

{ #category : '*Famix-Angular-Entities' }
FASTHTMLDocument >> angularTemplate: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-Angular-Entities'>

	(self attributeAt: #angularTemplate ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self angularTemplate.
		self attributeAt: #angularTemplate put: anObject.
		otherSide ast: nil ]
	ifNotNil: [ 
		self attributeAt: #angularTemplate put: anObject.
		anObject ast: self ]
]

{ #category : '*Famix-Angular-Entities' }
FASTHTMLDocument >> childrenNodes [
	"Relation named: #childrenNodes type: #FASTHTMLEntity opposite: #documentOwner"

	<ignoreForCoverage>
	<generated>
	<derived>
	<FMProperty: #childrenNodes type: #FASTHTMLEntity opposite: #documentOwner>
	<multivalued>
	<package: #'Famix-Angular-Entities'>
	^ self attributeAt: #childrenNodes ifAbsentPut: [ FMMultivalueLink on: self opposite: #documentOwner: ]
]

{ #category : '*Famix-Angular-Entities' }
FASTHTMLDocument >> childrenNodes: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-Angular-Entities'>

	self childrenNodes value: anObject
]
