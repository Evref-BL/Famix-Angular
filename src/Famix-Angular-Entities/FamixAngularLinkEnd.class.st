"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `container` | `Object` | nil | |
| `entity` | `Object` | nil | |

"
Class {
	#name : 'FamixAngularLinkEnd',
	#superclass : 'FamixAngularEntity',
	#instVars : [
		'#container => FMProperty',
		'#entity => FMProperty'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularLinkEnd class >> annotation [

	<ignoreForCoverage>
	<FMClass: #LinkEnd super: #FamixAngularEntity>
	<package: #'Famix-Angular-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixAngularLinkEnd >> container [

	<FMProperty: #container type: #Object>
	<ignoreForCoverage>
	<generated>
	^ container
]

{ #category : 'accessing' }
FamixAngularLinkEnd >> container: anObject [
	<ignoreForCoverage>
	<generated>
	container := anObject
]

{ #category : 'accessing' }
FamixAngularLinkEnd >> entity [

	<FMProperty: #entity type: #Object>
	<ignoreForCoverage>
	<generated>
	^ entity
]

{ #category : 'accessing' }
FamixAngularLinkEnd >> entity: anObject [
	<ignoreForCoverage>
	<generated>
	entity := anObject
]
