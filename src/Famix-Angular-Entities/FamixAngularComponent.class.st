"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `crossLanguageLinks` | `FamixAngularComponent` | `component` | `FamixAngularCrossLanguageLink` | |
| `htmlTemplate` | `FamixAngularComponent` | `component` | `FamixAngularHTMLTemplate` | |
| `styles` | `FamixAngularComponent` | `component` | `FamixAngularStyle` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declaringModule` | `FamixAngularTDeclarable` | `declarations` | `FamixAngularNgModule` | |
| `routes` | `FamixAngularComponent` | `targetComponent` | `FamixAngularRoute` | |
| `usingTemplates` | `FamixAngularComponent` | `usedComponents` | `FamixAngularHTMLTemplate` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `selector` | `String` | nil | |

"
Class {
	#name : 'FamixAngularComponent',
	#superclass : 'FamixAngularType',
	#traits : 'FamixAngularTDeclarable',
	#classTraits : 'FamixAngularTDeclarable classTrait',
	#instVars : [
		'#crossLanguageLinks => FMMany type: #FamixAngularCrossLanguageLink opposite: #component',
		'#htmlTemplate => FMOne type: #FamixAngularHTMLTemplate opposite: #component',
		'#routes => FMOne type: #FamixAngularRoute opposite: #targetComponent',
		'#selector => FMProperty',
		'#styles => FMMany type: #FamixAngularStyle opposite: #component',
		'#usingTemplates => FMMany type: #FamixAngularHTMLTemplate opposite: #usedComponents'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularComponent class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Component super: #FamixAngularType>
	<package: #'Famix-Angular-Entities'>
	<generated>
]

{ #category : 'adding' }
FamixAngularComponent >> addCrossLanguageLink: anObject [

	<ignoreForCoverage>
	<generated>
	^ self crossLanguageLinks add: anObject
]

{ #category : 'adding' }
FamixAngularComponent >> addStyle: anObject [

	<ignoreForCoverage>
	<generated>
	^ self styles add: anObject
]

{ #category : 'adding' }
FamixAngularComponent >> addUsingTemplate: anObject [

	<ignoreForCoverage>
	<generated>
	^ self usingTemplates add: anObject
]

{ #category : 'accessing' }
FamixAngularComponent >> crossLanguageLinks [
	"Relation named: #crossLanguageLinks type: #FamixAngularCrossLanguageLink opposite: #component"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ crossLanguageLinks
]

{ #category : 'accessing' }
FamixAngularComponent >> crossLanguageLinks: anObject [

	<ignoreForCoverage>
	<generated>
	crossLanguageLinks value: anObject
]

{ #category : 'accessing' }
FamixAngularComponent >> htmlTemplate [
	"Relation named: #htmlTemplate type: #FamixAngularHTMLTemplate opposite: #component"

	<ignoreForCoverage>
	<generated>
	^ htmlTemplate
]

{ #category : 'accessing' }
FamixAngularComponent >> htmlTemplate: anObject [

	<ignoreForCoverage>
	<generated>
	htmlTemplate := anObject
]

{ #category : 'accessing' }
FamixAngularComponent >> routes [
	"Relation named: #routes type: #FamixAngularRoute opposite: #targetComponent"

	<ignoreForCoverage>
	<generated>
	^ routes
]

{ #category : 'accessing' }
FamixAngularComponent >> routes: anObject [

	<ignoreForCoverage>
	<generated>
	routes := anObject
]

{ #category : 'accessing' }
FamixAngularComponent >> selector [

	<FMProperty: #selector type: #String>
	<ignoreForCoverage>
	<generated>
	^ selector
]

{ #category : 'accessing' }
FamixAngularComponent >> selector: anObject [
	<ignoreForCoverage>
	<generated>
	selector := anObject
]

{ #category : 'accessing' }
FamixAngularComponent >> styles [
	"Relation named: #styles type: #FamixAngularStyle opposite: #component"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ styles
]

{ #category : 'accessing' }
FamixAngularComponent >> styles: anObject [

	<ignoreForCoverage>
	<generated>
	styles value: anObject
]

{ #category : 'accessing' }
FamixAngularComponent >> usingTemplates [
	"Relation named: #usingTemplates type: #FamixAngularHTMLTemplate opposite: #usedComponents"

	<ignoreForCoverage>
	<generated>
	^ usingTemplates
]

{ #category : 'accessing' }
FamixAngularComponent >> usingTemplates: anObject [

	<ignoreForCoverage>
	<generated>
	usingTemplates value: anObject
]
