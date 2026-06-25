"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declarations` | `FamixAngularNgModule` | `declaringModule` | `FamixAngularTDeclarable` | |
| `providedServices` | `FamixAngularNgModule` | `providingModules` | `FamixAngularService` | |



"
Class {
	#name : 'FamixAngularNgModule',
	#superclass : 'FamixAngularType',
	#instVars : [
		'#declarations => FMMany type: #FamixAngularTDeclarable opposite: #declaringModule',
		'#providedServices => FMMany type: #FamixAngularService opposite: #providingModules'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularNgModule class >> annotation [

	<FMClass: #NgModule super: #FamixAngularType>
	<package: #FamixAngular>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixAngularNgModule >> addDeclaration: anObject [
	<generated>
	^ self declarations add: anObject
]

{ #category : 'adding' }
FamixAngularNgModule >> addProvidedService: anObject [
	<generated>
	^ self providedServices add: anObject
]

{ #category : 'accessing' }
FamixAngularNgModule >> declarations [
	"Relation named: #declarations type: #FamixAngularTDeclarable opposite: #declaringModule"

	<generated>
	<derived>
	^ declarations
]

{ #category : 'accessing' }
FamixAngularNgModule >> declarations: anObject [

	<generated>
	declarations value: anObject
]

{ #category : 'accessing' }
FamixAngularNgModule >> providedServices [
	"Relation named: #providedServices type: #FamixAngularService opposite: #providingModules"

	<generated>
	<derived>
	^ providedServices
]

{ #category : 'accessing' }
FamixAngularNgModule >> providedServices: anObject [

	<generated>
	providedServices value: anObject
]
