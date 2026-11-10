"
Tests of FamixAngularHTMLTSLinkImporter on small hand-written components.
"
Class {
	#name : 'FamixAngularHTMLTSLinkImporterTest',
	#superclass : 'TestCase',
	#category : 'Famix-Angular-Tests',
	#package : 'Famix-Angular-Tests'
}

{ #category : 'running' }
FamixAngularHTMLTSLinkImporterTest >> linksFor: aClassSource template: anHTMLSource [
	"Import links, with every concrete HTML-TS link importer, for a component made of aClassSource and its template"

	| model component |
	model := FamixAngularModel new.
	component := FamixAngularComponent new
		             name: 'C';
		             ast:
			             ((FASTTypeScriptParser new parse: aClassSource)
				              allWithType: FASTTypeScriptProgram) first;
		             htmlTemplate: (FamixAngularHTMLTemplate new ast:
					              ((FASTHTMLImporter new parse: anHTMLSource)
						               allWithType: FASTHTMLDocument) first);
		             yourself.
	model add: component.
	(FamixAngularHTMLTSLinkImporter allSubclasses reject: [ :each |
		 each isAbstract ]) do: [ :each |
			each new
				tsModel: nil angularModel: model;
				run ].
	^ component crossLanguageLinks
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testInterpolationLinksOnlyTheObjectOfAMemberAccess [

	| links |
	links := self
		         linksFor: 'class C { user: User; name = 1; }'
		         template: '<p>{{ user.name }}</p>'.
	self assert: links size equals: 1.
	self assert: links first name equals: '{{ user.name }}'.
	self assert: links first kind equals: 'interpolation'.
	self assert: links first reference entity sourceCode equals: 'user'.
	self assert: links first source name equals: 'user: User'
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testInterpolationOfTemplateVariableIsNotLinked [

	| links |
	links := self
		         linksFor: 'class C { users = []; user = 1; title = 2; }'
		         template:
		         '<div *ngFor="let user of users"><p>{{ user.name }} {{ title | uppercase }}</p></div>'.
	self
		assertCollection: (links collect: #name)
		hasSameElements:
		#( '*ngFor="let user of users"' '{{ title | uppercase }}' )
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testInterpolationReferencePositionIsInTheHTMLFile [

	| html link |
	html := '<div>
  <span>{{ count }}</span>
</div>'.
	link := (self linksFor: 'class C { count = 0; }' template: html)
		        first.
	self
		assert: (html
				 copyFrom: link reference entity startPos
				 to: link reference entity endPos)
		equals: 'count'
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testLinkEndsAreNamedAfterTheirCode [

	| link |
	link := (self
		         linksFor: 'class C { items = []; track() {
		return 1 } }'
		         template:
		         '<li *ngFor="let item of items; trackBy: track"></li>')
		        first.
	self assert: link source name equals: 'items = []'.
	self assert: link reference name equals: 'items'
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testLinkIsNamedAfterItsAttribute [

	| link |
	link := (self
		         linksFor: 'class C { items = [] }'
		         template: '<li *ngFor="let item of items"></li>') first.
	self assert: link name equals: '*ngFor="let item of items"'
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testNgForLinksIterableToField [

	| link |
	link := (self
		         linksFor: 'class C { items = [] }'
		         template: '<li *ngFor="let item of items">{{ item }}</li>')
		        first.
	self assert: link kind equals: 'ngFor'.
	self assert: link reference entity sourceCode equals: 'items'.
	self
		assert: link source entity class
		equals: FASTTypeScriptPublicFieldDefinition.
	self assert: link reference container class equals: FASTHTMLDocument.
	self
		assert: link source container class
		equals: FASTTypeScriptProgram
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testNgForTrackByLinksMethod [

	| links |
	links := self
		         linksFor:
		         'class C { items = []; track(i, x) { return x } }'
		         template:
		         '<li *ngFor="let item of items; trackBy: track"></li>'.
	self
		assert:
		(links collect: [ :l | l reference entity sourceCode ]) asSet
		equals: #( 'items' 'track' ) asSet
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testNgIfLinksFieldsMethodsAndParameterProperties [

	| links |
	links := self
		         linksFor:
		         'class C { closed = false; isOk() { return true } constructor(private svc: S, x: number) {} }'
		         template:
		         '<p *ngIf="!closed && isOk() && svc.ready && x"></p>'.
	self
		assert:
		(links collect: [ :l | l reference entity sourceCode ]) asSet
		equals: #( 'closed' 'isOk' 'svc' ) asSet.
	self assert: (links allSatisfy: [ :l | l kind = 'ngIf' ])
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testPipesAliasesAndTemplateReferencesAreNotLinked [

	| links |
	links := self
		         linksFor:
		         'class C { user$ = null; user = null; async = 0; loading = 0 }'
		         template:
		         '<p *ngIf="user$ | async as user; else loading"></p>'.
	self
		assert:
		(links collect: [ :l | l reference entity sourceCode ]) asArray
		equals: #( 'user$' )
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testReferencePositionIsInTheHTMLFile [

	| html reference |
	html := '<div>
  <p *ngIf="flag"></p>
</div>'.
	reference := (self linksFor: 'class C { flag = true }' template: html)
		             first reference entity.
	self
		assert: reference startPos
		equals: (html indexOfSubCollection: 'flag').
	self assert: reference sourceCode equals: 'flag'
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testTemplateVariablesAreNotLinked [

	| links |
	links := self
		         linksFor: 'class C { item = 1; items = []; index = 0 }'
		         template:
		         '<li *ngFor="let item of items; let i = index"><p *ngIf="item.ok"></p></li>'.
	self
		assert:
		(links collect: [ :l | l reference entity sourceCode ]) asArray
		equals: #( 'items' )
]
