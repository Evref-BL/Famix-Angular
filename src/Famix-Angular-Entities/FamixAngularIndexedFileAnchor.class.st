"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `correspondingFile` | `FamixTFile` | nil | File associated to this source anchor|
| `encoding` | `String` | nil | A string representing the encoding of a file|
| `endPos` | `Number` | nil | Stop position in the source|
| `fileName` | `String` | nil | Name of the source file|
| `startPos` | `Number` | nil | Start position in the source|

"
Class {
	#name : 'FamixAngularIndexedFileAnchor',
	#superclass : 'FamixAngularSourceAnchor',
	#traits : 'FamixTIndexedFileNavigation',
	#classTraits : 'FamixTIndexedFileNavigation classTrait',
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularIndexedFileAnchor class >> annotation [

	<ignoreForCoverage>
	<FMClass: #IndexedFileAnchor super: #FamixAngularSourceAnchor>
	<package: #'Famix-Angular-Entities'>
	<generated>
]
