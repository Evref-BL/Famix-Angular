"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `targetComponent` | `FamixAngularRoute` | `routes` | `FamixAngularComponent` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `path` | `String` | nil | |

"
Class {
	#name : 'FamixAngularRoute',
	#superclass : 'FamixAngularAngularEntity',
	#instVars : [
		'#path => FMProperty',
		'#targetComponent => FMMany type: #FamixAngularComponent opposite: #routes'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularRoute class >> annotation [

	<FMClass: #Route super: #FamixAngularAngularEntity>
	<package: #FamixAngular>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixAngularRoute >> addTargetComponent: anObject [
	<generated>
	^ self targetComponent add: anObject
]

{ #category : 'accessing' }
FamixAngularRoute >> path [

	<FMProperty: #path type: #String>
	<generated>
	^ path
]

{ #category : 'accessing' }
FamixAngularRoute >> path: anObject [
	<generated>
	path := anObject
]

{ #category : 'accessing' }
FamixAngularRoute >> targetComponent [
	"Relation named: #targetComponent type: #FamixAngularComponent opposite: #routes"

	<generated>
	<derived>
	^ targetComponent
]

{ #category : 'accessing' }
FamixAngularRoute >> targetComponent: anObject [

	<generated>
	targetComponent value: anObject
]
