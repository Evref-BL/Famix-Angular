"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|



"
Class {
	#name : 'FamixAngularSourceAnchor',
	#superclass : 'FamixAngularEntity',
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularSourceAnchor class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourceAnchor super: #FamixAngularEntity>
	<package: #'Famix-Angular-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixAngularSourceAnchor class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixAngularSourceAnchor
]
