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

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Angular-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newArtifact [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularArtifact new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newArtifactNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularArtifact named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularComment new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newCommentNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularComment named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newComponent [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularComponent new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newComponentNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularComponent named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newCrossLanguageLink [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularCrossLanguageLink new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newCrossLanguageLinkNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularCrossLanguageLink named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newDirective [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularDirective new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newDirectiveNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularDirective named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newHTMLTemplate [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularHTMLTemplate new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newHTMLTemplateNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularHTMLTemplate named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newHTMLToTSLink [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularHTMLToTSLink new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newHTMLToTSLinkNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularHTMLToTSLink named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newIndexedFileAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularIndexedFileAnchor new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newIndexedFileAnchorNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularIndexedFileAnchor named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newLinkEnd [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularLinkEnd new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newLinkEndNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularLinkEnd named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newNgModule [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularNgModule new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newNgModuleNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularNgModule named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newPipe [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularPipe new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newPipeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularPipe named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newRoute [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularRoute new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newRouteNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularRoute named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newService [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularService new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newServiceNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularService named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularSourceLanguage new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newSourceLanguageNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularSourceLanguage named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularSourceTextAnchor new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newSourceTextAnchorNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularSourceTextAnchor named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newStyle [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularStyle new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newStyleNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularStyle named: aName)
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newType [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixAngularType new
]

{ #category : 'entity creation' }
FamixAngularTEntityCreator >> newTypeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixAngularType named: aName)
]
