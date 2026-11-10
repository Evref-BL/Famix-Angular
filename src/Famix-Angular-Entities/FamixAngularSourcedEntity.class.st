Class {
	#name : 'FamixAngularSourcedEntity',
	#superclass : 'FamixAngularEntity',
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularSourcedEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourcedEntity super: #FamixAngularEntity>
	<package: #'Famix-Angular-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixAngularSourcedEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixAngularSourcedEntity
]
