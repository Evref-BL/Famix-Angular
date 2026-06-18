"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declaringModule` | `FamixAngularTDeclarable` | `declarations` | `FamixAngularNgModule` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `pipeName` | `String` | nil | |

"
Class {
	#name : 'FamixAngularPipe',
	#superclass : 'FamixAngularAngularType',
	#traits : 'FamixAngularTDeclarable',
	#classTraits : 'FamixAngularTDeclarable classTrait',
	#instVars : [
		'#pipeName => FMProperty'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularPipe class >> annotation [

	<FMClass: #Pipe super: #FamixAngularAngularType>
	<package: #FamixAngular>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixAngularPipe >> pipeName [

	<FMProperty: #pipeName type: #String>
	<generated>
	^ pipeName
]

{ #category : 'accessing' }
FamixAngularPipe >> pipeName: anObject [
	<generated>
	pipeName := anObject
]
