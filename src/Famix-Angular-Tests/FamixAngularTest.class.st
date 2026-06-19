Class {
	#name : 'FamixAngularTest',
	#superclass : 'TestCase',
	#category : 'Famix-Angular-Tests',
	#package : 'Famix-Angular-Tests'
}

{ #category : 'tests' }
FamixAngularTest >> testComponent [

	| component tsClass |
	
	"for the moment these are the accessible properties of FamixAngularComponent. Until others are handled then I add them here"
	
	component := FamixAngularComponent new name: 'AppComponent'.
	self assert: component name equals: 'AppComponent'.
	
	"component selector: 'app-root'.
	self assert: component selector equals: 'app-root'."
	
	tsClass := FamixTypeScriptClass new name: 'AppComponent'.
	component implementingClass: tsClass.
	self assert: component implementingClass equals: tsClass.
	self assert: tsClass angularType equals: component
]
