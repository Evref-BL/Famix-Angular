Class {
	#name : 'FamixAngularNamedEntity',
	#superclass : 'FamixAngularEntity',
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixAngularEntity>
	<package: #FamixAngular>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixAngularNamedEntity class >> isAbstract [

	<generated>
	^ self == FamixAngularNamedEntity
]

{ #category : 'testing' }
FamixAngularNamedEntity >> isNamedEntity [

	<generated>
	^ true
]
