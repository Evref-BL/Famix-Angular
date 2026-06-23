Class {
	#name : 'FamixAngularServiceImporter',
	#superclass : 'FamixAngularTypesImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'instance creation' }
FamixAngularServiceImporter >> basicCreateFrom: aTSClass [

	^ FamixAngularService new
		  name: aTSClass name;
		  implementingClass: aTSClass;
		  yourself
]

{ #category : 'as yet unclassified' }
FamixAngularServiceImporter >> decoratorName [ ^ '@Injectable'
]
