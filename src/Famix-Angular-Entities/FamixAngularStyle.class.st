"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `component` | `FamixAngularStyle` | `styles` | `FamixAngularComponent` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `ast` | `FamixAngularStyle` | `angularStyle` | `FASTSCSSStylesheet` | |



"
Class {
	#name : 'FamixAngularStyle',
	#superclass : 'FamixAngularArtifact',
	#instVars : [
		'#component => FMOne type: #FamixAngularComponent opposite: #styles'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularStyle class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Style super: #FamixAngularArtifact>
	<package: #'Famix-Angular-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixAngularStyle >> ast [
	"Relation named: #ast type: #FASTSCSSStylesheet opposite: #angularStyle"

	<ignoreForCoverage>
	<generated>
	<FMProperty: #ast type: #FASTSCSSStylesheet opposite: #angularStyle>
	^ self attributeAt: #ast ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixAngularStyle >> ast: anObject [

	<ignoreForCoverage>
	<generated>
	(self attributeAt: #ast ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self ast.
		self attributeAt: #ast put: anObject.
		otherSide angularStyle: nil ]
	ifNotNil: [ 
		self attributeAt: #ast put: anObject.
		anObject angularStyle: self ]
]

{ #category : 'accessing' }
FamixAngularStyle >> component [
	"Relation named: #component type: #FamixAngularComponent opposite: #styles"

	<ignoreForCoverage>
	<generated>
	<container>
	^ component
]

{ #category : 'accessing' }
FamixAngularStyle >> component: anObject [

	<ignoreForCoverage>
	<generated>
	component := anObject
]
