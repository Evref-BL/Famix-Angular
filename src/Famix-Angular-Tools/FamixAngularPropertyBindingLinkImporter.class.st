"
I link the members read in property bindings, e.g. imageUrl in <img [src]=""imageUrl"">. The bound property (src) is an HTML/DOM property, not a member, and is never linked.
"
Class {
	#name : 'FamixAngularPropertyBindingLinkImporter',
	#superclass : 'FamixAngularBindingLinkImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'accessing' }
FamixAngularPropertyBindingLinkImporter >> bindingClass [ ^ FASTAngularPropertyBinding
]

{ #category : 'accessing' }
FamixAngularPropertyBindingLinkImporter >> canonicalPrefix [ ^ 'bind-'
]

{ #category : 'accessing' }
FamixAngularPropertyBindingLinkImporter >> close [ ^ ']'
]

{ #category : 'accessing' }
FamixAngularPropertyBindingLinkImporter >> kind [
	^ 'propertyBinding'
]

{ #category : 'accessing' }
FamixAngularPropertyBindingLinkImporter >> open [ ^ '['
]
