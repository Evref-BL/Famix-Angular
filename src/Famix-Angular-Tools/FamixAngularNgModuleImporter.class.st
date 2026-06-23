Class {
	#name : 'FamixAngularNgModuleImporter',
	#superclass : 'FamixAngularTypesImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'instance creation' }
FamixAngularNgModuleImporter >> basicCreateFrom: aTSClass [

	^ FamixAngularNgModule new
		  name: aTSClass name;
		  implementingClass: aTSClass;
		  yourself
]

{ #category : 'as yet unclassified' }
FamixAngularNgModuleImporter >> decoratorName [
	^ '@NgModule' 
]
