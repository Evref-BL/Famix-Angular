Extension { #name : 'FASTHTMLDocument' }

{ #category : '*Famix-Angular-Entities-accessing' }
FASTHTMLDocument >> angularTemplate [
	"Relation named: #angularTemplate type: #FamixAngularHTMLTemplate opposite: #htmlAstRoot"

	<generated>
	<container>
	<derived>
	<FMProperty: #angularTemplate type: #FamixAngularHTMLTemplate opposite: #htmlAstRoot>
	<package: #'Famix-Angular-Entities'>
	^ self attributeAt: #angularTemplate ifAbsent: [ nil ]
]

{ #category : '*Famix-Angular-Entities-accessing' }
FASTHTMLDocument >> angularTemplate: anObject [

	<generated>
	(self attributeAt: #angularTemplate ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self angularTemplate.
		self attributeAt: #angularTemplate put: anObject.
		otherSide htmlAstRoot: nil ]
	ifNotNil: [ 
		self attributeAt: #angularTemplate put: anObject.
		anObject htmlAstRoot: self ]
]
