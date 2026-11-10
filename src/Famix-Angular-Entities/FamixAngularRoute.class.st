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
	#superclass : 'FamixAngularEntity',
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

	<ignoreForCoverage>
	<FMClass: #Route super: #FamixAngularEntity>
	<package: #'Famix-Angular-Entities'>
	<generated>
]

{ #category : 'adding' }
FamixAngularRoute >> addTargetComponent: anObject [

	<ignoreForCoverage>
	<generated>
	^ self targetComponent add: anObject
]

{ #category : 'accessing' }
FamixAngularRoute >> path [

	<FMProperty: #path type: #String>
	<ignoreForCoverage>
	<generated>
	^ path
]

{ #category : 'accessing' }
FamixAngularRoute >> path: anObject [
	<ignoreForCoverage>
	<generated>
	path := anObject
]

{ #category : 'accessing' }
FamixAngularRoute >> targetComponent [
	"Relation named: #targetComponent type: #FamixAngularComponent opposite: #routes"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ targetComponent
]

{ #category : 'accessing' }
FamixAngularRoute >> targetComponent: anObject [

	<ignoreForCoverage>
	<generated>
	targetComponent value: anObject
]
