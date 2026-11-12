"
I link the members read in a binding attribute, in its bracket form ([x]=""""v"""", (x)=""""v"""", [(x)]=""""v"""") or its legacy prefix form (bind-x, on-x, bindon-x). The binding name (x) is never linked. Subclasses give the brackets, the prefix and the FASTAngular node.
"
Class {
	#name : 'FamixAngularBindingLinkImporter',
	#superclass : 'FamixAngularHTMLTSLinkImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'testing' }
FamixAngularBindingLinkImporter class >> isAbstract [
	^ self = FamixAngularBindingLinkImporter
]

{ #category : 'accessing' }
FamixAngularBindingLinkImporter >> bindingClass [
	"The FASTAngular node of the binding"
	^ self subclassResponsibility
]

{ #category : 'html' }
FamixAngularBindingLinkImporter >> bracketOf: aName [
	"The opening bracket of an attribute name: [( for a two-way binding, else its first character"

	^ (aName beginsWith: '[(')
		  ifTrue: [ '[(' ]
		  ifFalse: [ aName first: (1 min: aName size) ]
]

{ #category : 'accessing' }
FamixAngularBindingLinkImporter >> canonicalPrefix [
	"The legacy prefix form of the binding, e.g. bind-"
	^ self subclassResponsibility
]

{ #category : 'accessing' }
FamixAngularBindingLinkImporter >> close [
	^ self subclassResponsibility
]

{ #category : 'html' }
FamixAngularBindingLinkImporter >> isBinding: anAttribute [

	| name |
	name := self nameOf: anAttribute.
	^ (self bracketOf: name) = self open or: [
		  name beginsWith: self canonicalPrefix ]
]

{ #category : 'running' }
FamixAngularBindingLinkImporter >> linkNameOf: aUsage [
	"The HTML attribute as written, legacy prefix form included"
	^ aUsage key sourceCode
]

{ #category : 'accessing' }
FamixAngularBindingLinkImporter >> open [
	"The bracket opening the binding name, e.g. ["
	^ self subclassResponsibility
]

{ #category : 'html' }
FamixAngularBindingLinkImporter >> parseBinding: anAttribute [
	"FASTAngular only knows the bracket form: bind-x=""v"" is parsed as [x]=""v"" (on-x as (x), bindon-x as [(x)]),
	which is shorter, so as many spaces are added to keep the value at its position in the HTML file"

	| name prefix |
	name := self nameOf: anAttribute.
	prefix := self canonicalPrefix.
	(name beginsWith: prefix) ifFalse: [
		^ self parse: '<x ' , anAttribute sourceCode , '>' at: anAttribute ].
	^ self
		  parse: (String
				   new: prefix size - self open size - self close size
				   withAll: Character space) , '<x ' , self open
			  , (name allButFirst: prefix size) , self close
			  , (anAttribute sourceCode allButFirst: name size) , '>'
		  at: anAttribute
]

{ #category : 'html' }
FamixAngularBindingLinkImporter >> usagesIn: aDocument [
	"FASTHTML attribute -> its FASTAngular binding"
	^ (aDocument allContainedEntities select: [ :e |
		   e class = FASTHTMLAttribute and: [ self isBinding: e ] ])
		  flatCollect: [ :attribute |
				  ((self parseBinding: attribute) allWithType: self bindingClass)
					  collect: [ :each | attribute -> each ] ]
]
