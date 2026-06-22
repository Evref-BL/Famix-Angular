Class {
	#name : 'FamixAngularNgModuleImporter',
	#superclass : 'FamixAngularDecoratedImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'instance creation' }
FamixAngularNgModuleImporter >> createFrom: aTSClass [  
	^ FamixAngularNgModule new
		name: aTSClass name;
		implementingClass: aTSClass;
		yourself 
]

{ #category : 'as yet unclassified' }
FamixAngularNgModuleImporter >> decoratorName [
	^ '@NgModule' 
]
