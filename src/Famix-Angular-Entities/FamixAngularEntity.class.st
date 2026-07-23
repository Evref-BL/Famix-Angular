"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixAngularEntity',
	#superclass : 'MooseEntity',
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #FamixAngular>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixAngularEntity class >> isAbstract [

	<generated>
	^ self == FamixAngularEntity
]

{ #category : 'meta' }
FamixAngularEntity class >> metamodel [

	<generated>
	^ FamixAngularModel metamodel
]

{ #category : 'testing' }
FamixAngularEntity >> isNamedEntity [

	<generated>
	^ false
]
