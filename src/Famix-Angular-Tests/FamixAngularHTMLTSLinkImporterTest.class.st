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
FamixAngularHTMLTSLinkImporterTest >> testBindingNamesAreNeverLinked [

	| links |
	links := self
		         linksFor:
		         'class C { keyup = 1; enter = 2; class = 3; active = 4; send() {} isOn = 5; }'
		         template:
		         '<input (keyup.enter)="send()" [class.active]="isOn">'.
	self
		assertCollection: (links collect: [ :each | each reference name ])
		hasSameElements: #( 'send' 'isOn' )
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testCanonicalBindPrefixIsLinked [

	| html link |
	html := '<div>
  <img bind-src="imageUrl">
</div>'.
	link := (self
		         linksFor: 'class C { imageUrl = 1; src = 2; }'
		         template: html) first.
	self assert: link name equals: 'bind-src="imageUrl"'.
	self assert: link kind equals: 'propertyBinding'.
	self assert: link reference name equals: 'imageUrl'.
	self
		assert: (html
				 copyFrom: link reference entity startPos
				 to: link reference entity endPos)
		equals: 'imageUrl'
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testCanonicalBindonPrefixIsLinked [

	| html link |
	html := '<div>
  <input bindon-ngModel="name">
</div>'.
	link := (self linksFor: 'class C { name = 1; }' template: html) first.
	self assert: link name equals: 'bindon-ngModel="name"'.
	self assert: link kind equals: 'twoWayBinding'.
	self
		assert: (html
				 copyFrom: link reference entity startPos
				 to: link reference entity endPos)
		equals: 'name'
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testCanonicalOnPrefixIsLinked [

	| html link |
	html := '<div>
  <button on-click="save()">x</button>
</div>'.
	link := (self linksFor: 'class C { save() {} }' template: html) first.
	self assert: link name equals: 'on-click="save()"'.
	self assert: link kind equals: 'eventBinding'.
	self
		assert: (html
				 copyFrom: link reference entity startPos
				 to: link reference entity endPos)
		equals: 'save'
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testCustomStructuralDirectiveLinksItsValue [

	| links |
	links := self
		         linksFor:
		         'class C { role = 1; appPermission = 2; items = []; }'
		         template: '<div *appPermission="role">x</div>
<div *appPermission="''admin''">x</div>
<li *ngFor="let item of items">x</li>'.
	self
		assertCollection:
		(links collect: [ :each | each reference name -> each kind ])
		hasSameElements: {
				('role' -> 'structuralDirective').
				('items' -> 'ngFor') }
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testEventBindingLinksCalledMethods [

	| links |
	links := self
		         linksFor: 'class C { save(e) {} a() {} b() {} click = 1; }'
		         template: '<button (click)="save()">x</button>
<button (click)="save($event)">x</button>
<button (click)="a(); b()">x</button>'.
	self
		assertCollection:
		(links collect: [ :each | each name -> each reference name ])
		hasSameElements: {
				('(click)="save()"' -> 'save').
				('(click)="save($event)"' -> 'save').
				('(click)="a(); b()"' -> 'a').
				('(click)="a(); b()"' -> 'b') }.
	self
		assert: (links collect: #kind) asSet asArray
		equals: #( 'eventBinding' )
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testInterpolationInAttributeValueOfTemplateVariableIsNotLinked [

	| links |
	links := self
		         linksFor: 'class C { items = []; item = 1; }'
		         template:
		         '<li *ngFor="let item of items" title="{{ item }}">x</li>'.
	self
		assertCollection: (links collect: #name)
		hasSameElements: #( '*ngFor="let item of items"' )
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
FamixAngularHTMLTSLinkImporterTest >> testInterpolationsInAttributeValuesAreLinked [

	| html links |
	html := '<img src="{{ baseUrl }}/logo.png">
<a title="Hello {{ first }} {{ last }}">x</a>'.
	links := self
		         linksFor: 'class C { baseUrl = 1; first = 2; last = 3; }'
		         template: html.
	self
		assertCollection: (links collect: #name)
		hasSameElements: #( '{{ baseUrl }}' '{{ first }}' '{{ last }}' ).
	links do: [ :link |
			self
				assert: (html
						 copyFrom: link reference entity startPos
						 to: link reference entity endPos)
				equals: link reference name ]
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
FamixAngularHTMLTSLinkImporterTest >> testNgSwitchLinksSwitchValueAndCaseMembers [

	| links |
	links := self
		         linksFor:
		         'class C { mode = 1; caseB = 2; ngSwitch = 3; a = 4; }'
		         template: '<div [ngSwitch]="mode">
  <p *ngSwitchCase="''a''">A</p>
  <p *ngSwitchCase="caseB">B</p>
  <p *ngSwitchDefault>Other</p>
</div>'.
	self
		assertCollection:
		(links collect: [ :each | each reference name -> each kind ])
		hasSameElements: {
				('mode' -> 'propertyBinding').
				('caseB' -> 'ngSwitchCase') }
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
FamixAngularHTMLTSLinkImporterTest >> testPropertyBindingLinksReadMembersOnly [

	| links |
	links := self
		         linksFor:
		         'class C { imageUrl = 1; isLoading = 2; src = 3; disabled = 4; }'
		         template: '<img [src]="imageUrl">
<button [disabled]="isLoading">x</button>'.
	self
		assertCollection:
		(links collect: [ :each | each name -> each reference name ])
		hasSameElements: {
				('[src]="imageUrl"' -> 'imageUrl').
				('[disabled]="isLoading"' -> 'isLoading') }.
	self
		assert: (links collect: #kind) asSet asArray
		equals: #( 'propertyBinding' )
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testPropertyBindingObjectKeysAreNotLinked [

	| links |
	links := self
		         linksFor: 'class C { a = 1; b = 2; total = 3; }'
		         template:
		         '<app-x [config]="{ a: 1, b: [1, 2] }"></app-x><app-y [c]="{ a: total }"></app-y>'.
	self
		assertCollection: (links collect: [ :each | each reference name ])
		hasSameElements: #( 'total' )
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testPropertyBindingWithMemberAccessPipeAndTemplateVariable [

	| links |
	links := self
		         linksFor:
		         'class C { items = []; image = 1; big = 2; isOn = 3; active = 4; item = 5; }'
		         template:
		         '<li *ngFor="let item of items" [title]="item" [class.active]="isOn"><img [src]="image.big | async"></li>'.
	self
		assertCollection: (links collect: [ :each | each reference name ])
		hasSameElements: #( 'items' 'isOn' 'image' )
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
FamixAngularHTMLTSLinkImporterTest >> testTemplateReferenceScope [

	| links |
	links := self
		         linksFor: 'class C { c = 1; inner = 2; tpl = 3; r = 4; }'
		         template:
			         '<div *ngIf="c; else tpl"><b #r>{{ r }}</b></div>
<p>{{ r }}</p>
<ng-template #tpl><i #inner>{{ inner }}</i></ng-template>
<p>{{ inner }}</p>'.
	self
		assertCollection:
		(links collect: [ :each | each name -> each reference name ])
		hasSameElements: {
				('*ngIf="c; else tpl"' -> 'c').
				('{{ r }}' -> 'r').
				('{{ inner }}' -> 'inner') }
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testTemplateReferencesAreNotLinked [

	| links |
	links := self
		         linksFor:
		         'class C { greet(v) {} submit(f) {} nameInput = 1; f = 2; child = 3; other = 4; }'
		         template: '<input #nameInput>
<button (click)="greet(nameInput.value)">x</button>
<form #f="ngForm" (ngSubmit)="submit(f)"></form>
<app-child #child></app-child>
<input ref-other>
<p>{{ child.x }} {{ other.value }}</p>'.
	self
		assertCollection: (links collect: [ :each | each reference name ])
		hasSameElements: #( 'greet' 'submit' )
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

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testTwoWayBindingIsNotAlsoAPropertyOrEventBinding [

	| links |
	links := self
		         linksFor: 'class C { name = 1; }'
		         template: '<input [(ngModel)]="name">'.
	self assert: links size equals: 1
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testTwoWayBindingLinksBoundMember [

	| links |
	links := self
		         linksFor: 'class C { name = 1; ngModel = 2; user = 3; }'
		         template:
		         '<input [(ngModel)]="name"><input [(ngModel)]="user.name">'.
	self
		assertCollection:
		(links collect: [ :each | each name -> each reference name ])
		hasSameElements: {
				('[(ngModel)]="name"' -> 'name').
				('[(ngModel)]="user.name"' -> 'user') }.
	self
		assert: (links collect: #kind) asSet asArray
		equals: #( 'twoWayBinding' )
]

{ #category : 'tests' }
FamixAngularHTMLTSLinkImporterTest >> testUnparsableDirectivesDoNotBreakTheImport [

	| links |
	links := self
		         linksFor:
		         'class C { user = 1; ok = 2; ko = 3; count = 4; let = 5; then = 6; }'
		         template: '<div *ngIf="user; then ok; else ko">x</div>
<div *appRepeat="count; let n">x</div>'.
	self
		assertCollection: (links collect: [ :each | each reference name ])
		hasSameElements: #( 'user' 'count' )
]
