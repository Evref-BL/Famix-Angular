"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `template` | `FamixAngularComponent` | `component` | `FamixAngularTemplate` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declaringModule` | `FamixAngularTDeclarable` | `declarations` | `FamixAngularNgModule` | |
| `routes` | `FamixAngularComponent` | `targetComponent` | `FamixAngularRoute` | |
| `usingTemplates` | `FamixAngularComponent` | `usedComponents` | `FamixAngularTemplate` | |


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
		'#template => FMOne type: #FamixAngularTemplate opposite: #component',
		'#usingTemplates => FMMany type: #FamixAngularTemplate opposite: #usedComponents',
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
FamixAngularComponent >> addUsingTemplate: anObject [
	<generated>
	^ self usingTemplates add: anObject
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
FamixAngularComponent >> template [
	"Relation named: #template type: #FamixAngularTemplate opposite: #component"

	<generated>
	^ template
]

{ #category : 'accessing' }
FamixAngularComponent >> template: anObject [

	<generated>
	template := anObject
]

{ #category : 'navigation' }
FamixAngularComponent >> templateGroup [
	<generated>
	<navigation: 'Template'>
	^ MooseSpecializedGroup with: self template
]

{ #category : 'accessing' }
FamixAngularComponent >> usingTemplates [
	"Relation named: #usingTemplates type: #FamixAngularTemplate opposite: #usedComponents"

	<generated>
	^ usingTemplates
]

{ #category : 'accessing' }
FamixAngularComponent >> usingTemplates: anObject [

	<generated>
	usingTemplates value: anObject
]
