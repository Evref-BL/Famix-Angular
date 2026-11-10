"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixAngularEntity',
	#superclass : 'MooseEntity',
	#traits : 'FamixTNamedEntity + FamixTSourceEntity',
	#classTraits : 'FamixTNamedEntity classTrait + FamixTSourceEntity classTrait',
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Angular-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixAngularEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixAngularEntity
]

{ #category : 'meta' }
FamixAngularEntity class >> metamodel [

	<ignoreForCoverage>
	<generated>
	^ FamixAngularModel metamodel
]

{ #category : 'testing' }
FamixAngularEntity >> hasImmediateSource [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixAngularEntity >> isFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FamixAngularEntity >> isNamedEntity [

	<ignoreForCoverage>
	<generated>
	^ false
]
