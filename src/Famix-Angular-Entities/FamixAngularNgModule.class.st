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

	<ignoreForCoverage>
	<FMClass: #NgModule super: #FamixAngularType>
	<package: #'Famix-Angular-Entities'>
	<generated>
]

{ #category : 'adding' }
FamixAngularNgModule >> addDeclaration: anObject [

	<ignoreForCoverage>
	<generated>
	^ self declarations add: anObject
]

{ #category : 'adding' }
FamixAngularNgModule >> addProvidedService: anObject [

	<ignoreForCoverage>
	<generated>
	^ self providedServices add: anObject
]

{ #category : 'accessing' }
FamixAngularNgModule >> declarations [
	"Relation named: #declarations type: #FamixAngularTDeclarable opposite: #declaringModule"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ declarations
]

{ #category : 'accessing' }
FamixAngularNgModule >> declarations: anObject [

	<ignoreForCoverage>
	<generated>
	declarations value: anObject
]

{ #category : 'accessing' }
FamixAngularNgModule >> providedServices [
	"Relation named: #providedServices type: #FamixAngularService opposite: #providingModules"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ providedServices
]

{ #category : 'accessing' }
FamixAngularNgModule >> providedServices: anObject [

	<ignoreForCoverage>
	<generated>
	providedServices value: anObject
]
