Class {
	#name : 'FamixAngularTest',
	#superclass : 'TestCase',
	#category : 'Famix-Angular-Tests',
	#package : 'Famix-Angular-Tests'
}

{ #category : 'tests' }
FamixAngularTest >> testAngularModel [

	| model |
	
	"ok for the moment I created the test with these entities as they are handled in the importer. perhaps will modify it later when other entities are added"
	
	model := FamixAngularModel new.
	model
		add: (FamixAngularComponent new name: 'AppComponent');
		add: (FamixAngularService new name: 'DataService');
		add: (FamixAngularPipe new name: 'CurrencyPipe');
		add: (FamixAngularDirective new name: 'HighlightDirective').
	self
		assert: (model allWithType: FamixAngularComponent) size
		equals: 1.
	self assert: (model allWithType: FamixAngularService) size equals: 1.
	self assert: (model allWithType: FamixAngularPipe) size equals: 1.
	self
		assert: (model allWithType: FamixAngularDirective) size
		equals: 1.
	self assert: model numberOfEntities equals: 4
]

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

{ #category : 'tests' }
FamixAngularTest >> testDirective [
	| directive tsClass |
	directive := FamixAngularDirective new name: 'HighlightDirective'.
	self assert: directive name equals: 'HighlightDirective'.
	tsClass := FamixTypeScriptClass new name: 'HighlightDirective'.
	directive implementingClass: tsClass.
	self assert: directive implementingClass equals: tsClass.
	self assert: tsClass angularType equals: directive
]
