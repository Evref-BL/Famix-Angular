"
I link the members read in text interpolations, e.g. user in <p>{{ user.name }}</p>.
"
Class {
	#name : 'FamixAngularInterpolationLinkImporter',
	#superclass : 'FamixAngularHTMLTSLinkImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'accessing' }
FamixAngularInterpolationLinkImporter >> kind [
	^ 'interpolation'
]

{ #category : 'html' }
FamixAngularInterpolationLinkImporter >> parseInterpolations: aText [
	^ (self parse: '<x>' , aText sourceCode , '</x>' at: aText)
		  allWithType: FASTAngularInterpolation
]

{ #category : 'html' }
FamixAngularInterpolationLinkImporter >> usagesIn: aDocument [
	"FASTHTML text -> each {{ }} interpolation it contains"
	^ (aDocument allContainedEntities select: [ :e |
		   e class = FASTHTMLText and: [
			   e sourceCode includesSubstring: '{{' ] ]) flatCollect: [ :text |
		  (self parseInterpolations: text) collect: [ :each | text -> each ] ]
]
