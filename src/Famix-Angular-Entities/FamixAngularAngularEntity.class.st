"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixAngularAngularEntity',
	#superclass : 'FamixAngularEntity',
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularAngularEntity class >> annotation [

	<FMClass: #AngularEntity super: #FamixAngularEntity>
	<package: #FamixAngular>
	<generated>
	^ self
]
