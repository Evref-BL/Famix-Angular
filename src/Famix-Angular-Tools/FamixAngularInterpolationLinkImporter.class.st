"
I link the members read in {{ }} interpolations, in text (<p>{{ user.name }}</p>) and in attribute values (<img src=""{{ baseUrl }}/logo.png"">).
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
	"FASTHTML text or attribute value -> each {{ }} interpolation it contains,
	e.g. <p>{{ user.name }}</p> or <a title=""Hello {{ first }} {{ last }}"">"

	^ (aDocument allContainedEntities select: [ :e |
			   (e class = FASTHTMLText or: [ e class = FASTHTMLAttributeValue ])
				   and: [ e sourceCode includesSubstring: '{{' ] ]) flatCollect: [
		  :node |
		  (self parseInterpolations: node) collect: [ :each | node -> each ] ]
]
