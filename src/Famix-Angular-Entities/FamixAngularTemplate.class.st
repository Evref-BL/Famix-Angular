"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `component` | `FamixAngularTemplate` | `template` | `FamixAngularComponent` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `usedComponents` | `FamixAngularTemplate` | `usingTemplates` | `FamixAngularComponent` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isInline` | `Boolean` | nil | |
| `templateUrl` | `String` | nil | |

"
Class {
	#name : 'FamixAngularTemplate',
	#superclass : 'FamixAngularEntity',
	#instVars : [
		'#isInline => FMProperty',
		'#templateUrl => FMProperty',
		'#component => FMOne type: #FamixAngularComponent opposite: #template',
		'#usedComponents => FMMany type: #FamixAngularComponent opposite: #usingTemplates'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularTemplate class >> annotation [

	<FMClass: #Template super: #FamixAngularEntity>
	<package: #FamixAngular>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixAngularTemplate >> addUsedComponent: anObject [
	<generated>
	^ self usedComponents add: anObject
]

{ #category : 'accessing' }
FamixAngularTemplate >> component [
	"Relation named: #component type: #FamixAngularComponent opposite: #template"

	<generated>
	<container>
	<derived>
	^ component
]

{ #category : 'accessing' }
FamixAngularTemplate >> component: anObject [

	<generated>
	component := anObject
]

{ #category : 'navigation' }
FamixAngularTemplate >> componentGroup [
	<generated>
	<navigation: 'Component'>
	^ MooseSpecializedGroup with: self component
]

{ #category : 'accessing' }
FamixAngularTemplate >> isInline [

	<FMProperty: #isInline type: #Boolean>
	<generated>
	^ isInline
]

{ #category : 'accessing' }
FamixAngularTemplate >> isInline: anObject [
	<generated>
	isInline := anObject
]

{ #category : 'accessing' }
FamixAngularTemplate >> templateUrl [

	<FMProperty: #templateUrl type: #String>
	<generated>
	^ templateUrl
]

{ #category : 'accessing' }
FamixAngularTemplate >> templateUrl: anObject [
	<generated>
	templateUrl := anObject
]

{ #category : 'accessing' }
FamixAngularTemplate >> usedComponents [
	"Relation named: #usedComponents type: #FamixAngularComponent opposite: #usingTemplates"

	<generated>
	<derived>
	^ usedComponents
]

{ #category : 'accessing' }
FamixAngularTemplate >> usedComponents: anObject [

	<generated>
	usedComponents value: anObject
]
