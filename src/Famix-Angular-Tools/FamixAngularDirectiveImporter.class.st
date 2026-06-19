Class {
	#name : 'FamixAngularDirectiveImporter',
	#superclass : 'FamixAngularDecoratedImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'instance creation' }
FamixAngularDirectiveImporter >> createFrom: aTSClass [
 
	^ FamixAngularDirective new
		  name: aTSClass name;
		  implementingClass: aTSClass;
		  yourself 
]

{ #category : 'as yet unclassified' }
FamixAngularDirectiveImporter >> decoratorName [ ^ '@Directive' 
]
