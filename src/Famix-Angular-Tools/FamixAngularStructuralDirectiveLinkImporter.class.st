"
I link the members read in the value of one structural directive (see #directive). Subclasses only name the directive.
"
Class {
	#name : 'FamixAngularStructuralDirectiveLinkImporter',
	#superclass : 'FamixAngularHTMLTSLinkImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'testing' }
FamixAngularStructuralDirectiveLinkImporter class >> isAbstract [
	^ self = FamixAngularStructuralDirectiveLinkImporter
]

{ #category : 'accessing' }
FamixAngularStructuralDirectiveLinkImporter >> directive [
	"The HTML attribute name of the directive I link, e.g. *ngFor"
	^ self subclassResponsibility
]

{ #category : 'accessing' }
FamixAngularStructuralDirectiveLinkImporter >> kind [
	^ self directive allButFirst
]

{ #category : 'html' }
FamixAngularStructuralDirectiveLinkImporter >> usagesIn: aDocument [
	"FASTHTML attribute -> its FASTAngular directive, for my directive only"
	^ (self structuralDirectivesIn: aDocument) associations select: [
		  :each | (self nameOf: each key) = self directive ]
]
