"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
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
		'#selector => FMProperty',
		'#htmlTemplate => FMOne type: #FamixAngularHTMLTemplate opposite: #component',
		'#styles => FMMany type: #FamixAngularStyle opposite: #component',
		'#usingTemplates => FMMany type: #FamixAngularHTMLTemplate opposite: #usedComponents',
		'#routes => FMOne type: #FamixAngularRoute opposite: #targetComponent'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularComponent class >> annotation [

	<FMClass: #Component super: #FamixAngularType>
	<package: #FamixAngular>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixAngularComponent >> addStyle: anObject [
	<generated>
	^ self styles add: anObject
]

{ #category : 'adding' }
FamixAngularComponent >> addUsingTemplate: anObject [
	<generated>
	^ self usingTemplates add: anObject
]

{ #category : 'accessing' }
FamixAngularComponent >> htmlTemplate [
	"Relation named: #htmlTemplate type: #FamixAngularHTMLTemplate opposite: #component"

	<generated>
	^ htmlTemplate
]

{ #category : 'accessing' }
FamixAngularComponent >> htmlTemplate: anObject [

	<generated>
	htmlTemplate := anObject
]

{ #category : 'navigation' }
FamixAngularComponent >> htmlTemplateGroup [
	<generated>
	<navigation: 'HtmlTemplate'>
	^ MooseSpecializedGroup with: self htmlTemplate
]

{ #category : 'accessing' }
FamixAngularComponent >> routes [
	"Relation named: #routes type: #FamixAngularRoute opposite: #targetComponent"

	<generated>
	^ routes
]

{ #category : 'accessing' }
FamixAngularComponent >> routes: anObject [

	<generated>
	routes := anObject
]

{ #category : 'accessing' }
FamixAngularComponent >> selector [

	<FMProperty: #selector type: #String>
	<generated>
	^ selector
]

{ #category : 'accessing' }
FamixAngularComponent >> selector: anObject [
	<generated>
	selector := anObject
]

{ #category : 'accessing' }
FamixAngularComponent >> styles [
	"Relation named: #styles type: #FamixAngularStyle opposite: #component"

	<generated>
	<derived>
	^ styles
]

{ #category : 'accessing' }
FamixAngularComponent >> styles: anObject [

	<generated>
	styles value: anObject
]

{ #category : 'navigation' }
FamixAngularComponent >> stylesGroup [
	<generated>
	<navigation: 'Styles'>
	^ MooseSpecializedGroup withAll: self styles asSet
]

{ #category : 'accessing' }
FamixAngularComponent >> usingTemplates [
	"Relation named: #usingTemplates type: #FamixAngularHTMLTemplate opposite: #usedComponents"

	<generated>
	^ usingTemplates
]

{ #category : 'accessing' }
FamixAngularComponent >> usingTemplates: anObject [

	<generated>
	usingTemplates value: anObject
]
