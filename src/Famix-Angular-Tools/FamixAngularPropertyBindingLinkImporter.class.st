"
I link the members read in property bindings, e.g. imageUrl in <img [src]=""imageUrl"">. The bound property (src) is an HTML/DOM property, not a member, and is never linked.
"
Class {
	#name : 'FamixAngularPropertyBindingLinkImporter',
	#superclass : 'FamixAngularHTMLTSLinkImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'accessing' }
FamixAngularPropertyBindingLinkImporter >> kind [
	^ 'propertyBinding'
]

{ #category : 'html' }
FamixAngularPropertyBindingLinkImporter >> usagesIn: aDocument [
	"FASTHTML attribute -> its FASTAngular property binding, e.g. [src]=""imageUrl"" (not two-way [(x)])"
	^ (aDocument allContainedEntities select: [ :e |
			   e class = FASTHTMLAttribute and: [
					   ((self nameOf: e) beginsWith: '[') and: [
						   ((self nameOf: e) beginsWith: '[(') not ] ] ]) flatCollect: [
			  :attribute |
			  ((self parse: '<x ' , attribute sourceCode , '>' at: attribute)
				   allWithType: FASTAngularPropertyBinding) collect: [ :each |
				  attribute -> each ] ]
]
