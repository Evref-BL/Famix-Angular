"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `ast` | `Object` | nil | |
| `content` | `String` | nil | |
| `file` | `Object` | nil | |
| `isInline` | `Boolean` | nil | |
| `path` | `String` | nil | |

"
Class {
	#name : 'FamixAngularArtifact',
	#superclass : 'FamixAngularEntity',
	#instVars : [
		'#isInline => FMProperty',
		'#path => FMProperty',
		'#content => FMProperty',
		'#file => FMProperty',
		'#ast => FMProperty'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularArtifact class >> annotation [

	<FMClass: #Artifact super: #FamixAngularEntity>
	<package: #FamixAngular>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixAngularArtifact >> ast [

	<FMProperty: #ast type: #Object>
	<generated>
	^ ast
]

{ #category : 'accessing' }
FamixAngularArtifact >> ast: anObject [
	<generated>
	ast := anObject
]

{ #category : 'accessing' }
FamixAngularArtifact >> content [

	<FMProperty: #content type: #String>
	<generated>
	^ content
]

{ #category : 'accessing' }
FamixAngularArtifact >> content: anObject [
	<generated>
	content := anObject
]

{ #category : 'accessing' }
FamixAngularArtifact >> file [

	<FMProperty: #file type: #Object>
	<generated>
	^ file
]

{ #category : 'accessing' }
FamixAngularArtifact >> file: anObject [
	<generated>
	file := anObject
]

{ #category : 'accessing' }
FamixAngularArtifact >> isInline [

	<FMProperty: #isInline type: #Boolean>
	<generated>
	^ isInline
]

{ #category : 'accessing' }
FamixAngularArtifact >> isInline: anObject [
	<generated>
	isInline := anObject
]

{ #category : 'accessing' }
FamixAngularArtifact >> path [

	<FMProperty: #path type: #String>
	<generated>
	^ path
]

{ #category : 'accessing' }
FamixAngularArtifact >> path: anObject [
	<generated>
	path := anObject
]
