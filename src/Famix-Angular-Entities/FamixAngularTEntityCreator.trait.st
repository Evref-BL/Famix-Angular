"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixAngularTEntityCreator',
	#category : 'Famix-Angular-Entities-Model',
	#package : 'Famix-Angular-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixAngularTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #FamixAngular>
	<generated>
	^ self
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newAngularEntity [

	<generated>
	^ self add: FamixAngularAngularEntity new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newAngularEntityNamed: aName [

	<generated>
	^ self add: (FamixAngularAngularEntity named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newAngularType [

	<generated>
	^ self add: FamixAngularAngularType new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newComment [

	<generated>
	^ self add: FamixAngularComment new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newComponent [

	<generated>
	^ self add: FamixAngularComponent new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newDirective [

	<generated>
	^ self add: FamixAngularDirective new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newNgModule [

	<generated>
	^ self add: FamixAngularNgModule new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newPipe [

	<generated>
	^ self add: FamixAngularPipe new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newRoute [

	<generated>
	^ self add: FamixAngularRoute new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newService [

	<generated>
	^ self add: FamixAngularService new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixAngularSourceLanguage new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixAngularSourceTextAnchor new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newTemplate [

	<generated>
	^ self add: FamixAngularTemplate new
]
