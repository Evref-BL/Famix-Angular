Extension { #name : 'FASTTypeScriptModel' }

{ #category : '*Famix-Angular-Entities-accessing' }
FASTTypeScriptModel >> angularTemplate [
	"Relation named: #angularTemplate type: #FamixAngularType opposite: #ast"

	<generated>
	<container>
	<derived>
	<FMProperty: #angularTemplate type: #FamixAngularType opposite: #ast>
	<package: #'Famix-Angular-Entities'>
	^ self attributeAt: #angularTemplate ifAbsent: [ nil ]
]

{ #category : '*Famix-Angular-Entities-accessing' }
FASTTypeScriptModel >> angularTemplate: anObject [

	<generated>
	(self attributeAt: #angularTemplate ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self angularTemplate.
		self attributeAt: #angularTemplate put: anObject.
		otherSide ast: nil ]
	ifNotNil: [ 
		self attributeAt: #angularTemplate put: anObject.
		anObject ast: self ]
]
