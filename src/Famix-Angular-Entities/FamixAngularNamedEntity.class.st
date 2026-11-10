Class {
	#name : 'FamixAngularNamedEntity',
	#superclass : 'FamixAngularEntity',
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularNamedEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #NamedEntity super: #FamixAngularEntity>
	<package: #'Famix-Angular-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixAngularNamedEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixAngularNamedEntity
]

{ #category : 'testing' }
FamixAngularNamedEntity >> isNamedEntity [

	<ignoreForCoverage>
	<generated>
	^ true
]
