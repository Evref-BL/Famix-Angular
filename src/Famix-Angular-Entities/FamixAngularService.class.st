"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `injectingClients` | `FamixAngularService` | `injectedServices` | `FamixAngularType` | |
| `providingModules` | `FamixAngularService` | `providedServices` | `FamixAngularNgModule` | |



"
Class {
	#name : 'FamixAngularService',
	#superclass : 'FamixAngularType',
	#instVars : [
		'#providingModules => FMMany type: #FamixAngularNgModule opposite: #providedServices',
		'#injectingClients => FMMany type: #FamixAngularType opposite: #injectedServices'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularService class >> annotation [

	<FMClass: #Service super: #FamixAngularType>
	<package: #FamixAngular>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixAngularService >> addInjectingClient: anObject [
	<generated>
	^ self injectingClients add: anObject
]

{ #category : 'adding' }
FamixAngularService >> addProvidingModule: anObject [
	<generated>
	^ self providingModules add: anObject
]

{ #category : 'accessing' }
FamixAngularService >> injectingClients [
	"Relation named: #injectingClients type: #FamixAngularType opposite: #injectedServices"

	<generated>
	^ injectingClients
]

{ #category : 'accessing' }
FamixAngularService >> injectingClients: anObject [

	<generated>
	injectingClients value: anObject
]

{ #category : 'accessing' }
FamixAngularService >> providingModules [
	"Relation named: #providingModules type: #FamixAngularNgModule opposite: #providedServices"

	<generated>
	^ providingModules
]

{ #category : 'accessing' }
FamixAngularService >> providingModules: anObject [

	<generated>
	providingModules value: anObject
]
