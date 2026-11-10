"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `component` | `FamixAngularCrossLanguageLink` | `crossLanguageLinks` | `FamixAngularComponent` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `kind` | `String` | nil | |
| `reference` | `Object` | nil | |
| `source` | `Object` | nil | |

"
Class {
	#name : 'FamixAngularCrossLanguageLink',
	#superclass : 'FamixAngularEntity',
	#instVars : [
		'#component => FMOne type: #FamixAngularComponent opposite: #crossLanguageLinks',
		'#kind => FMProperty',
		'#reference => FMProperty',
		'#source => FMProperty'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularCrossLanguageLink class >> annotation [

	<ignoreForCoverage>
	<FMClass: #CrossLanguageLink super: #FamixAngularEntity>
	<package: #'Famix-Angular-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixAngularCrossLanguageLink >> component [
	"Relation named: #component type: #FamixAngularComponent opposite: #crossLanguageLinks"

	<ignoreForCoverage>
	<generated>
	<container>
	^ component
]

{ #category : 'accessing' }
FamixAngularCrossLanguageLink >> component: anObject [

	<ignoreForCoverage>
	<generated>
	component := anObject
]

{ #category : 'accessing' }
FamixAngularCrossLanguageLink >> kind [

	<FMProperty: #kind type: #String>
	<ignoreForCoverage>
	<generated>
	^ kind
]

{ #category : 'accessing' }
FamixAngularCrossLanguageLink >> kind: anObject [
	<ignoreForCoverage>
	<generated>
	kind := anObject
]

{ #category : 'accessing' }
FamixAngularCrossLanguageLink >> reference [

	<FMProperty: #reference type: #Object>
	<ignoreForCoverage>
	<generated>
	^ reference
]

{ #category : 'accessing' }
FamixAngularCrossLanguageLink >> reference: anObject [
	<ignoreForCoverage>
	<generated>
	reference := anObject
]

{ #category : 'accessing' }
FamixAngularCrossLanguageLink >> source [

	<FMProperty: #source type: #Object>
	<ignoreForCoverage>
	<generated>
	^ source
]

{ #category : 'accessing' }
FamixAngularCrossLanguageLink >> source: anObject [
	<ignoreForCoverage>
	<generated>
	source := anObject
]
