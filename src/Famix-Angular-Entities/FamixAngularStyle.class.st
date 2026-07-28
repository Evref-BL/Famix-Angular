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
| `styleAstRoot` | `FamixAngularStyle` | `angularStyle` | `FASTSCSSStylesheet` | |



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

	<FMClass: #Style super: #FamixAngularArtifact>
	<package: #FamixAngular>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixAngularStyle >> component [
	"Relation named: #component type: #FamixAngularComponent opposite: #styles"

	<generated>
	<container>
	^ component
]

{ #category : 'accessing' }
FamixAngularStyle >> component: anObject [

	<generated>
	component := anObject
]

{ #category : 'navigation' }
FamixAngularStyle >> componentGroup [
	<generated>
	<navigation: 'Component'>
	^ MooseSpecializedGroup with: self component
]

{ #category : 'accessing' }
FamixAngularStyle >> styleAstRoot [
	"Relation named: #styleAstRoot type: #FASTSCSSStylesheet opposite: #angularStyle"

	<generated>
	<FMProperty: #styleAstRoot type: #FASTSCSSStylesheet opposite: #angularStyle>
	^ self attributeAt: #styleAstRoot ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixAngularStyle >> styleAstRoot: anObject [

	<generated>
	(self attributeAt: #styleAstRoot ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self styleAstRoot.
		self attributeAt: #styleAstRoot put: anObject.
		otherSide angularStyle: nil ]
	ifNotNil: [ 
		self attributeAt: #styleAstRoot put: anObject.
		anObject angularStyle: self ]
]

{ #category : 'navigation' }
FamixAngularStyle >> styleAstRootGroup [
	<generated>
	<navigation: 'StyleAstRoot'>
	^ MooseSpecializedGroup with: self styleAstRoot
]
