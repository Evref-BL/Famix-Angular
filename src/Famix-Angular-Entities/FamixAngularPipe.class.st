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
	#superclass : 'FamixAngularType',
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

	<ignoreForCoverage>
	<FMClass: #Pipe super: #FamixAngularType>
	<package: #'Famix-Angular-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixAngularPipe >> pipeName [

	<FMProperty: #pipeName type: #String>
	<ignoreForCoverage>
	<generated>
	^ pipeName
]

{ #category : 'accessing' }
FamixAngularPipe >> pipeName: anObject [
	<ignoreForCoverage>
	<generated>
	pipeName := anObject
]
