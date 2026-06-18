Class {
	#name : 'FamixAngularImporter',
	#superclass : 'Object',
	#instVars : [
		'tsModel',
		'angularModel'
	],
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'as yet unclassified' }
FamixAngularImporter >> componentClasses [

	^ tsModel allModelClasses select: [ :each |
		  each decorators anySatisfy: [ :d | d name = '@Component' ] ]
]

{ #category : 'as yet unclassified' }
FamixAngularImporter >> createComponents [
    self componentClasses do: [ :tsClass |
        | component |
        component := FamixAngularComponent new.
        component name: tsClass name.
        component implementingClass: tsClass.   "reverse accessor #angularType on the TS class"
        component selector: (self selectorOf: tsClass).
        angularModel add: component ]
]

{ #category : 'as yet unclassified' }
FamixAngularImporter >> importComponentsFrom: aTSModel [
    tsModel := aTSModel.
    angularModel := FamixAngularModel new.
    self createComponents.
    ^ angularModel
]

{ #category : 'accessing' }
FamixAngularImporter >> selectorOf: tsClass [
    "Depends on whether ts2famix modeled the @Component argument object.
     Returns nil if not available — adapt once you've inspected a decorator."
    ^ nil
]
