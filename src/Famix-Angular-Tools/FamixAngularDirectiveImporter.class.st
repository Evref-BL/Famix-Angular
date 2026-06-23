Class {
	#name : 'FamixAngularDirectiveImporter',
	#superclass : 'FamixAngularTypesImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'instance creation' }
FamixAngularDirectiveImporter >> basicCreateFrom: aTSClass [

	^ FamixAngularDirective new
		  name: aTSClass name;
		  implementingClass: aTSClass;
		  yourself
]

{ #category : 'as yet unclassified' }
FamixAngularDirectiveImporter >> decoratorName [ ^ '@Directive' 
]
