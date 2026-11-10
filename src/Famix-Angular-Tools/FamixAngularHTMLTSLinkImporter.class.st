"
I link component class members (TypeScript sources) to their uses in the component template (HTML references).

For each structural directive I handle (see #linkedDirectives), FASTHTML gives the attribute and FASTAngular parses its value. Each identifier read from the component scope that names a member of the component class becomes a FamixAngularHTMLToTSLink:
- source: the member declaration (FASTTypeScript), container: the FASTTypeScriptProgram;
- reference: the FASTAngularIdentifier, container: the FASTHTMLDocument.
Template variables (let x of ..., ... as x) of the directive and of enclosing elements are local and never linked.
"
Class {
	#name : 'FamixAngularHTMLTSLinkImporter',
	#superclass : 'FamixAngularCrossLanguageLinkImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'angular' }
FamixAngularHTMLTSLinkImporter >> declaredNamesIn: aDirective [
	"let item of ..., let i = index, ... as alias"

	^ (self identifiersIn: aDirective)
		  select: [ :id |
				  id structuralAssignmentNameRefOwner notNil or: [
					  id structuralExpressionAliasOwner notNil ] ]
		  thenCollect: [ :id | id sourceCode ]
]

{ #category : 'html' }
FamixAngularHTMLTSLinkImporter >> directivesIn: aDocument [
	"FASTHTML attribute -> its FASTAngular structural directive"

	| directives |
	directives := Dictionary new.
	(aDocument allContainedEntities select: [ :e |
		 e class = FASTHTMLAttribute ]) do: [ :attribute |
			(self linkedDirectives includes: (self nameOf: attribute)) ifTrue: [
					(self parseDirective: attribute) ifNotNil: [ :directive |
						directives at: attribute put: directive ] ] ].
	^ directives
]

{ #category : 'html' }
FamixAngularHTMLTSLinkImporter >> elementOf: anAttribute [

	^ anAttribute allContainers detect: [ :e | e class = FASTHTMLElement ]
]

{ #category : 'running' }
FamixAngularHTMLTSLinkImporter >> endOn: aFASTEntity in: aContainer [
	"Named after the first line of the code it points to, e.g. public isSpinnerVisible = true"

	^ FamixAngularLinkEnd new
		  name: aFASTEntity sourceCode lines first trimBoth;
		  entity: aFASTEntity;
		  container: aContainer;
		  yourself
]

{ #category : 'angular' }
FamixAngularHTMLTSLinkImporter >> identifiersIn: aDirective [

	^ aDirective allContainedEntities select: [ :e |
		  e class = FASTAngularIdentifier ]
]

{ #category : 'angular' }
FamixAngularHTMLTSLinkImporter >> isComponentRead: anIdentifier [
	"An identifier is read from the component scope unless it is the directive name, a declared
	variable (let x / as x), the 'of' keyword, a member access (a.b -> b), a pipe name,
	a template reference (else tpl) or a context variable value (let i = index)"

	({
		 anIdentifier structuralDirectiveOwner.
		 anIdentifier structuralAssignmentNameRefOwner.
		 anIdentifier structuralAssignmentOperatorOwner.
		 anIdentifier structuralExpressionAliasOwner.
		 anIdentifier memberExpressionPropertyOwner.
		 anIdentifier pipeCallNameRefOwner } anySatisfy: [ :owner |
		 owner notNil ]) ifTrue: [ ^ false ].
	(anIdentifier allContainers first isKindOf:
		 FASTAngularStructuralExpression) ifTrue: [ ^ false ].
	^ (self isInLetAssignment: anIdentifier) not
]

{ #category : 'angular' }
FamixAngularHTMLTSLinkImporter >> isInLetAssignment: anIdentifier [

	^ anIdentifier allContainers anySatisfy: [ :c |
			  c class = FASTAngularStructuralAssignment and: [
					  c containedEntities anySatisfy: [ :e |
						  e class = FASTAngularSpecialKeyword ] ] ]
]

{ #category : 'running' }
FamixAngularHTMLTSLinkImporter >> linkFrom: aSourceEnd to: aReferenceEnd attribute: anAttribute for: aComponent [
	"The link is named after the HTML attribute it comes from, e.g. *ngFor='let item of items'"

	| link |
	link := FamixAngularHTMLToTSLink new
		        name: anAttribute sourceCode;
		        kind: (self nameOf: anAttribute) allButFirst;
		        source: aSourceEnd;
		        reference: aReferenceEnd;
		        yourself.
	aComponent addCrossLanguageLink: link.
	angularModel addAll: {
			link.
			aSourceEnd.
			aReferenceEnd }.
	^ link
]

{ #category : 'running' }
FamixAngularHTMLTSLinkImporter >> linkTemplateOf: aComponent [

	| document program members directives |
	document := aComponent htmlTemplate ifNotNil: [ :template |
		            template ast ].
	program := aComponent ast.
	(document isNil or: [ program isNil ]) ifTrue: [ ^ self ].
	members := self membersOf: aComponent.
	directives := self directivesIn: document.
	directives keysAndValuesDo: [ :attribute :directive |
			| locals |
			locals := self localsVisibleAt: attribute in: directives.
			(self readsIn: directive) do: [ :identifier |
					(locals includes: identifier sourceCode) ifFalse: [
							members at: identifier sourceCode ifPresent: [ :member |
									self
										linkFrom: (self endOn: member in: program)
										to: (self endOn: identifier in: document)
										attribute: attribute
										for: aComponent ] ] ] ]
]

{ #category : 'html' }
FamixAngularHTMLTSLinkImporter >> linkedDirectives [
	"HTML attributes whose value is parsed and linked"

	^ #( '*ngFor' '*ngIf' )
]

{ #category : 'html' }
FamixAngularHTMLTSLinkImporter >> localsVisibleAt: anAttribute in: directives [
	"Template variables declared by directives on the attribute's element or on enclosing elements"

	| elements |
	elements := anAttribute allContainers select: [ :e |
		            e class = FASTHTMLElement ].
	^ (directives keys select: [ :each |
		   elements includes: (self elementOf: each) ]) flatCollect: [ :each |
		  self declaredNamesIn: (directives at: each) ]
]

{ #category : 'typescript' }
FamixAngularHTMLTSLinkImporter >> membersOf: aComponent [
	"Fields, methods and accessors of the component class, plus constructor parameter properties (private x: X), by name"

	| members nodes |
	members := Dictionary new.
	nodes := aComponent ast allContainedEntities.
	(nodes detect: [ :e | e class = FASTTypeScriptClassBody ])
		containedEntities do: [ :member |
			(self nameOf: member as: FASTTypeScriptPropertyIdentifier)
				ifNotNil: [ :name | members at: name put: member ] ].
	(nodes select: [ :e | e class = FASTTypeScriptRequiredParameter ])
		do: [ :parameter |
				(parameter containedEntities anySatisfy: [ :e |
					 e class = FASTTypeScriptAccessibilityModifier ]) ifTrue: [
						members
							at: (self nameOf: parameter as: FASTTypeScriptIdentifier)
							put: parameter ] ].
	members removeKey: 'constructor' ifAbsent: [ ].
	^ members
]

{ #category : 'html' }
FamixAngularHTMLTSLinkImporter >> nameOf: anAttribute [

	^ self nameOf: anAttribute as: FASTHTMLAttributeName
]

{ #category : 'typescript' }
FamixAngularHTMLTSLinkImporter >> nameOf: aDeclaration as: anIdentifierClass [

	^ aDeclaration containedEntities
		  detect: [ :e | e class = anIdentifierClass ]
		  ifFound: [ :identifier | identifier sourceCode ]
		  ifNone: [ nil ]
]

{ #category : 'html' }
FamixAngularHTMLTSLinkImporter >> parseDirective: anAttribute [
	"Parse the attribute alone with FASTAngular. The source is left-padded so that
	positions (and thus sourceCode) are those of the attribute in the HTML file."

	| source |
	source := (String
		           new: anAttribute startPos - 4
		           withAll: Character space) , '<x '
	          , anAttribute sourceCode , '>'.
	^ ((FASTAngularImporter new parse: source) allWithType:
		   FASTAngularStructuralDirective)
		  ifEmpty: [ nil ]
		  ifNotEmpty: [ :found | found first ]
]

{ #category : 'angular' }
FamixAngularHTMLTSLinkImporter >> readsIn: aDirective [

	^ (self identifiersIn: aDirective) select: [ :id |
		  self isComponentRead: id ]
]

{ #category : 'running' }
FamixAngularHTMLTSLinkImporter >> run [

	(angularModel allWithType: FamixAngularComponent) do: [ :component |
		self linkTemplateOf: component ]
]
