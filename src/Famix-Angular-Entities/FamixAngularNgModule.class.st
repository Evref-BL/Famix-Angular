"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declarations` | `FamixAngularNgModule` | `declaringModule` | `FamixAngularTDeclarable` | |
| `importedModules` | `FamixAngularNgModule` | `importingModules` | `FamixAngularNgModule` | |
| `importingModules` | `FamixAngularNgModule` | `importedModules` | `FamixAngularNgModule` | |
| `providedServices` | `FamixAngularNgModule` | `providingModules` | `FamixAngularService` | |



"
Class {
	#name : 'FamixAngularNgModule',
	#superclass : 'FamixAngularAngularType',
	#instVars : [
		'#declarations => FMMany type: #FamixAngularTDeclarable opposite: #declaringModule',
		'#importedModules => FMMany type: #FamixAngularNgModule opposite: #importingModules',
		'#importingModules => FMMany type: #FamixAngularNgModule opposite: #importedModules',
		'#providedServices => FMMany type: #FamixAngularService opposite: #providingModules'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularNgModule class >> annotation [

	<FMClass: #NgModule super: #FamixAngularAngularType>
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
FamixAngularNgModule >> addImportedModule: anObject [
	<generated>
	^ self importedModules add: anObject
]

{ #category : 'adding' }
FamixAngularNgModule >> addImportingModule: anObject [
	<generated>
	^ self importingModules add: anObject
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
FamixAngularNgModule >> importedModules [
	"Relation named: #importedModules type: #FamixAngularNgModule opposite: #importingModules"

	<generated>
	<derived>
	^ importedModules
]

{ #category : 'accessing' }
FamixAngularNgModule >> importedModules: anObject [

	<generated>
	importedModules value: anObject
]

{ #category : 'accessing' }
FamixAngularNgModule >> importingModules [
	"Relation named: #importingModules type: #FamixAngularNgModule opposite: #importedModules"

	<generated>
	^ importingModules
]

{ #category : 'accessing' }
FamixAngularNgModule >> importingModules: anObject [

	<generated>
	importingModules value: anObject
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
