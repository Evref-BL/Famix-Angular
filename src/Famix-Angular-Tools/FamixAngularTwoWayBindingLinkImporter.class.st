"
I link the members bound both ways, e.g. name in <input [(ngModel)]=""name""> or bindon-ngModel=""name"". The bound property (ngModel) is never linked.
"
Class {
	#name : 'FamixAngularTwoWayBindingLinkImporter',
	#superclass : 'FamixAngularBindingLinkImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'accessing' }
FamixAngularTwoWayBindingLinkImporter >> bindingClass [ ^ FASTAngularTwoWayBinding
]

{ #category : 'accessing' }
FamixAngularTwoWayBindingLinkImporter >> canonicalPrefix [ ^ 'bindon-'
]

{ #category : 'accessing' }
FamixAngularTwoWayBindingLinkImporter >> close [ ^ ')]'
]

{ #category : 'accessing' }
FamixAngularTwoWayBindingLinkImporter >> kind [ ^ 'twoWayBinding'
]

{ #category : 'accessing' }
FamixAngularTwoWayBindingLinkImporter >> open [ ^ '[('
]
