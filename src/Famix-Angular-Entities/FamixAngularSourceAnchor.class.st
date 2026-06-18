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

	<FMClass: #SourceAnchor super: #FamixAngularEntity>
	<package: #FamixAngular>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixAngularSourceAnchor class >> isAbstract [

	<generated>
	^ self == FamixAngularSourceAnchor
]
