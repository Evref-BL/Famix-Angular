"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `component` | `FamixAngularHTMLTemplate` | `htmlTemplate` | `FamixAngularComponent` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `usedComponents` | `FamixAngularHTMLTemplate` | `usingTemplates` | `FamixAngularComponent` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isInline` | `Boolean` | nil | |
| `templateUrl` | `String` | nil | |

"
Class {
	#name : 'FamixAngularHTMLTemplate',
	#superclass : 'FamixAngularArtifact',
	#instVars : [
		'#component => FMOne type: #FamixAngularComponent opposite: #htmlTemplate',
		'#templateUrl => FMProperty',
		'#usedComponents => FMMany type: #FamixAngularComponent opposite: #usingTemplates'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularHTMLTemplate class >> annotation [

	<FMClass: #HTMLTemplate super: #FamixAngularArtifact>
	<package: #FamixAngular>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixAngularHTMLTemplate >> addUsedComponent: anObject [
	<generated>
	^ self usedComponents add: anObject
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> component [
	"Relation named: #component type: #FamixAngularComponent opposite: #htmlTemplate"

	<generated>
	<container>
	<derived>
	^ component
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> component: anObject [

	<generated>
	component := anObject
]

{ #category : 'navigation' }
FamixAngularHTMLTemplate >> componentGroup [
	<generated>
	<navigation: 'Component'>
	^ MooseSpecializedGroup with: self component
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> isInline [

	<FMProperty: #isInline type: #Boolean>
	<generated>
	^ isInline
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> isInline: anObject [
	<generated>
	isInline := anObject
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> templateUrl [

	<FMProperty: #templateUrl type: #String>
	<generated>
	^ templateUrl
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> templateUrl: anObject [
	<generated>
	templateUrl := anObject
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> usedComponents [
	"Relation named: #usedComponents type: #FamixAngularComponent opposite: #usingTemplates"

	<generated>
	<derived>
	^ usedComponents
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> usedComponents: anObject [

	<generated>
	usedComponents value: anObject
]
