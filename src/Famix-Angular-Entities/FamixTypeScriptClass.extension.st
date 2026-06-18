Extension { #name : 'FamixTypeScriptClass' }

{ #category : '*Famix-Angular-Entities-accessing' }
FamixTypeScriptClass >> angularType [
	"Relation named: #angularType type: #FamixAngularAngularType opposite: #implementingClass"

	<generated>
	<derived>
	<FMProperty: #angularType type: #FamixAngularAngularType opposite: #implementingClass>
	<package: #'Famix-Angular-Entities'>
	^ self attributeAt: #angularType ifAbsent: [ nil ]
]

{ #category : '*Famix-Angular-Entities-accessing' }
FamixTypeScriptClass >> angularType: anObject [

	<generated>
	(self attributeAt: #angularType ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self angularType.
		self attributeAt: #angularType put: anObject.
		otherSide implementingClass: nil ]
	ifNotNil: [ 
		self attributeAt: #angularType put: anObject.
		anObject implementingClass: self ]
]
