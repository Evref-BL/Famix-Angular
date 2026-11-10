"
I link the members read in property bindings, e.g. imageUrl in <img [src]=""imageUrl"">. The bound property (src) is an HTML/DOM property, not a member, and is never linked.
"
Class {
	#name : 'FamixAngularPropertyBindingLinkImporter',
	#superclass : 'FamixAngularHTMLTSLinkImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'html' }
FamixAngularPropertyBindingLinkImporter >> isPropertyBinding: anAttribute [

	| name |
	name := self nameOf: anAttribute.
	^ ((name beginsWith: '[') and: [ (name beginsWith: '[(') not ]) or: [
		  name beginsWith: 'bind-' ]
]

{ #category : 'accessing' }
FamixAngularPropertyBindingLinkImporter >> kind [
	^ 'propertyBinding'
]

{ #category : 'running' }
FamixAngularPropertyBindingLinkImporter >> linkNameOf: aUsage [
	"The HTML attribute as written, bind-src='imageUrl' included"

	^ aUsage key sourceCode
]

{ #category : 'html' }
FamixAngularPropertyBindingLinkImporter >> parseBinding: anAttribute [
	"FASTAngular only knows the [x] form: bind-x=""v"" is parsed as [x]=""v"", which is 3 characters shorter,
	so 3 more spaces keep the value at its position in the HTML file"

	| name |
	name := self nameOf: anAttribute.
	(name beginsWith: 'bind-') ifFalse: [
		^ self parse: '<x ' , anAttribute sourceCode , '>' at: anAttribute ].
	^ self
		  parse: '   <x [' , (name allButFirst: 5) , ']'
			  , (anAttribute sourceCode allButFirst: name size) , '>'
		  at: anAttribute
]

{ #category : 'html' }
FamixAngularPropertyBindingLinkImporter >> usagesIn: aDocument [
	"FASTHTML attribute -> its FASTAngular property binding: [src]=""imageUrl"" or bind-src=""imageUrl"" (not two-way [(x)])"

	^ (aDocument allContainedEntities select: [ :e |
		   e class = FASTHTMLAttribute and: [ self isPropertyBinding: e ] ])
		  flatCollect: [ :attribute |
				  ((self parseBinding: attribute) allWithType:
					   FASTAngularPropertyBinding) collect: [ :each |
					  attribute -> each ] ]
]
