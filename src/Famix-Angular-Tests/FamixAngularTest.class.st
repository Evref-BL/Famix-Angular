Class {
	#name : 'FamixAngularTest',
	#superclass : 'TestCase',
	#category : 'Famix-Angular-Tests',
	#package : 'Famix-Angular-Tests'
}

{ #category : 'tests' }
FamixAngularTest >> testComponent [

	| component tsClass |
	
	component := FamixAngularComponent new name: 'AppComponent'. 
	self assert: component name equals: 'AppComponent'.
	component selector: 'app-root'.
	self assert: component selector equals: 'app-root'.
	tsClass := FamixTypeScriptClass new name: 'AppComponent'.
	component implementingClass: tsClass.
	self assert: component implementingClass equals: tsClass.
	self assert: tsClass angularType equals: component
]
