"
I link the members used in event bindings, e.g. save in <button (click)=""save($event)"">, a and b in (click)=""a(); b()"". The event name (click, keyup.enter) is never linked.
"
Class {
	#name : 'FamixAngularEventBindingLinkImporter',
	#superclass : 'FamixAngularBindingLinkImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'accessing' }
FamixAngularEventBindingLinkImporter >> bindingClass [ ^ FASTAngularEventBinding
]

{ #category : 'accessing' }
FamixAngularEventBindingLinkImporter >> canonicalPrefix [ ^ 'on-'
]

{ #category : 'accessing' }
FamixAngularEventBindingLinkImporter >> close [ ^ ')'
]

{ #category : 'accessing' }
FamixAngularEventBindingLinkImporter >> kind [ ^ 'eventBinding'
]

{ #category : 'accessing' }
FamixAngularEventBindingLinkImporter >> open [ ^ '('
]
