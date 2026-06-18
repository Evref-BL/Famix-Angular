"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FamixAngularSourcedEntity',
	#superclass : 'FamixAngularEntity',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixAngularEntity>
	<package: #FamixAngular>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixAngularSourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixAngularSourcedEntity
]
