"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declaringModule` | `FamixAngularTDeclarable` | `declarations` | `FamixAngularNgModule` | |



"
Trait {
	#name : 'FamixAngularTDeclarable',
	#instVars : [
		'#declaringModule => FMOne type: #FamixAngularNgModule opposite: #declarations'
	],
	#category : 'Famix-Angular-Entities-Traits',
	#package : 'Famix-Angular-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FamixAngularTDeclarable classSide >> annotation [

	<FMClass: #TDeclarable super: #Object>
	<package: #FamixAngular>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixAngularTDeclarable >> declaringModule [
	"Relation named: #declaringModule type: #FamixAngularNgModule opposite: #declarations"

	<generated>
	^ declaringModule
]

{ #category : 'accessing' }
FamixAngularTDeclarable >> declaringModule: anObject [

	<generated>
	declaringModule := anObject
]
