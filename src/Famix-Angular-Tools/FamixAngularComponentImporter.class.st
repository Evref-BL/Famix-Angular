Class {
	#name : 'FamixAngularComponentImporter',
	#superclass : 'FamixAngularDecoratedImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'instance creation' }
FamixAngularComponentImporter >> createFrom: aTSClass [

	^ FamixAngularComponent new
		name: aTSClass name;
		implementingClass: aTSClass;
		selector: (self selectorOf: aTSClass);
		yourself

]

{ #category : 'as yet unclassified' }
FamixAngularComponentImporter >> decoratorName [ 
	^ '@Component'
]

{ #category : 'accessing' }
FamixAngularComponentImporter >> selectorOf: aTSClass [
	"Component-specific. Lives inside the @Component({...}) argument,
	 so it stays a placeholder until the metadata pass. Returns nil for now."

	^ nil
]
