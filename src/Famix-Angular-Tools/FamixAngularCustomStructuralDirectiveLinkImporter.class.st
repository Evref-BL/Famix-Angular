"
I link the members read in custom structural directives (*appPermission=""role"", *appRepeat=""count""), i.e. every structural directive without a dedicated importer.
"
Class {
	#name : 'FamixAngularCustomStructuralDirectiveLinkImporter',
	#superclass : 'FamixAngularStructuralDirectiveLinkImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'accessing' }
FamixAngularCustomStructuralDirectiveLinkImporter >> directive [
	"I handle every structural directive without a dedicated importer, see #handledDirectives"
	^ nil
]

{ #category : 'accessing' }
FamixAngularCustomStructuralDirectiveLinkImporter >> handledDirectives [
	"The directives linked by the other structural directive importers (*ngFor, *ngIf...)"
	^ (FamixAngularStructuralDirectiveLinkImporter allSubclasses reject: [
		   :each | each isAbstract or: [ each = self class ] ]) collect: [
		  :each | each new directive ]
]

{ #category : 'accessing' }
FamixAngularCustomStructuralDirectiveLinkImporter >> kind [
	^ 'structuralDirective'
]

{ #category : 'html' }
FamixAngularCustomStructuralDirectiveLinkImporter >> usagesIn: aDocument [
	"FASTHTML attribute -> its FASTAngular directive, for the custom directives (*appRepeat, *appPermission...)"
	| handled |
	handled := self handledDirectives.
	^ (self structuralDirectivesIn: aDocument) associations reject: [
		  :each | handled includes: (self nameOf: each key) ]
]
