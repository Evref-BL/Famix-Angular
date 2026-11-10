Extension { #name : 'FASTSCSSStylesheet' }

{ #category : '*Famix-Angular-Entities' }
FASTSCSSStylesheet >> angularStyle [
	"Relation named: #angularStyle type: #FamixAngularStyle opposite: #ast"

	<ignoreForCoverage>
	<generated>
	<container>
	<derived>
	<FMProperty: #angularStyle type: #FamixAngularStyle opposite: #ast>
	<package: #'Famix-Angular-Entities'>
	^ self attributeAt: #angularStyle ifAbsent: [ nil ]
]

{ #category : '*Famix-Angular-Entities' }
FASTSCSSStylesheet >> angularStyle: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-Angular-Entities'>

	(self attributeAt: #angularStyle ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self angularStyle.
		self attributeAt: #angularStyle put: anObject.
		otherSide ast: nil ]
	ifNotNil: [ 
		self attributeAt: #angularStyle put: anObject.
		anObject ast: self ]
]

{ #category : '*Famix-Angular-Entities' }
FASTSCSSStylesheet >> childrenNodes [
	"Relation named: #childrenNodes type: #FASTSCSSEntity opposite: #stylesheetOwner"

	<ignoreForCoverage>
	<generated>
	<derived>
	<FMProperty: #childrenNodes type: #FASTSCSSEntity opposite: #stylesheetOwner>
	<multivalued>
	<package: #'Famix-Angular-Entities'>
	^ self attributeAt: #childrenNodes ifAbsentPut: [ FMMultivalueLink on: self opposite: #stylesheetOwner: ]
]

{ #category : '*Famix-Angular-Entities' }
FASTSCSSStylesheet >> childrenNodes: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'Famix-Angular-Entities'>

	self childrenNodes value: anObject
]
