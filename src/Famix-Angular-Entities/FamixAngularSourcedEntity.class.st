Class {
	#name : 'FamixAngularSourcedEntity',
	#superclass : 'FamixAngularEntity',
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
