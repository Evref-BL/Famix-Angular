Extension { #name : 'FASTSCSSStylesheet' }

{ #category : '*Famix-Angular-Entities-accessing' }
FASTSCSSStylesheet >> angularStyle [
	"Relation named: #angularStyle type: #FamixAngularStyle opposite: #styleAstRoot"

	<generated>
	<container>
	<derived>
	<FMProperty: #angularStyle type: #FamixAngularStyle opposite: #styleAstRoot>
	<package: #'Famix-Angular-Entities'>
	^ self attributeAt: #angularStyle ifAbsent: [ nil ]
]

{ #category : '*Famix-Angular-Entities-accessing' }
FASTSCSSStylesheet >> angularStyle: anObject [

	<generated>
	(self attributeAt: #angularStyle ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self angularStyle.
		self attributeAt: #angularStyle put: anObject.
		otherSide styleAstRoot: nil ]
	ifNotNil: [ 
		self attributeAt: #angularStyle put: anObject.
		anObject styleAstRoot: self ]
]
