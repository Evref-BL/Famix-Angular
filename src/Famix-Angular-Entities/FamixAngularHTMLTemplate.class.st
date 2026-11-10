"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `component` | `FamixAngularHTMLTemplate` | `htmlTemplate` | `FamixAngularComponent` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `ast` | `FamixAngularHTMLTemplate` | `angularTemplate` | `FASTHTMLDocument` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `usedComponents` | `FamixAngularHTMLTemplate` | `usingTemplates` | `FamixAngularComponent` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `templateUrl` | `String` | nil | |

"
Class {
	#name : 'FamixAngularHTMLTemplate',
	#superclass : 'FamixAngularArtifact',
	#instVars : [
		'#templateUrl => FMProperty',
		'#component => FMOne type: #FamixAngularComponent opposite: #htmlTemplate',
		'#usedComponents => FMMany type: #FamixAngularComponent opposite: #usingTemplates'
	],
	#category : 'Famix-Angular-Entities-Entities',
	#package : 'Famix-Angular-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixAngularHTMLTemplate class >> annotation [

	<ignoreForCoverage>
	<FMClass: #HTMLTemplate super: #FamixAngularArtifact>
	<package: #'Famix-Angular-Entities'>
	<generated>
]

{ #category : 'adding' }
FamixAngularHTMLTemplate >> addUsedComponent: anObject [

	<ignoreForCoverage>
	<generated>
	^ self usedComponents add: anObject
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> ast [
	"Relation named: #ast type: #FASTHTMLDocument opposite: #angularTemplate"

	<ignoreForCoverage>
	<generated>
	<FMProperty: #ast type: #FASTHTMLDocument opposite: #angularTemplate>
	^ self attributeAt: #ast ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> ast: anObject [

	<ignoreForCoverage>
	<generated>
	(self attributeAt: #ast ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self ast.
		self attributeAt: #ast put: anObject.
		otherSide angularTemplate: nil ]
	ifNotNil: [ 
		self attributeAt: #ast put: anObject.
		anObject angularTemplate: self ]
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> component [
	"Relation named: #component type: #FamixAngularComponent opposite: #htmlTemplate"

	<ignoreForCoverage>
	<generated>
	<container>
	<derived>
	^ component
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> component: anObject [

	<ignoreForCoverage>
	<generated>
	component := anObject
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> templateUrl [

	<FMProperty: #templateUrl type: #String>
	<ignoreForCoverage>
	<generated>
	^ templateUrl
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> templateUrl: anObject [
	<ignoreForCoverage>
	<generated>
	templateUrl := anObject
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> usedComponents [
	"Relation named: #usedComponents type: #FamixAngularComponent opposite: #usingTemplates"

	<ignoreForCoverage>
	<generated>
	<derived>
	^ usedComponents
]

{ #category : 'accessing' }
FamixAngularHTMLTemplate >> usedComponents: anObject [

	<ignoreForCoverage>
	<generated>
	usedComponents value: anObject
]
