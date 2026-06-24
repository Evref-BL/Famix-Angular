"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `component` | `FamixAngularStyle` | `styles` | `FamixAngularComponent` | |



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
