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

	<ignoreForCoverage>
	<FMClass: #TDeclarable super: #Object>
	<package: #'Famix-Angular-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixAngularTDeclarable >> declaringModule [
	"Relation named: #declaringModule type: #FamixAngularNgModule opposite: #declarations"

	<ignoreForCoverage>
	<generated>
	^ declaringModule
]

{ #category : 'accessing' }
FamixAngularTDeclarable >> declaringModule: anObject [

	<ignoreForCoverage>
	<generated>
	declaringModule := anObject
]
