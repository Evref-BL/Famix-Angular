Class {
	#name : 'FamixAngularEntity',
	#superclass : 'MooseEntity',
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
FamixAngularEntity >> isComment [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixAngularEntity >> isNamedEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixAngularEntity >> isQueryable [

	<generated>
	^ false
]
