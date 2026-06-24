Class {
	#name : 'FamixAngularGenerator',
	#superclass : 'FamixBasicInfrastructureGenerator',
	#instVars : [
		'angularEntity',
		'component',
		'route',
		'typeScriptNamedEntity',
		'typeScriptClass',
		'angularType',
		'ngModule',
		'directive',
		'pipe',
		'service',
		'template',
		'tDeclarable'
	],
	#category : 'Famix-Angular-Generator',
	#package : 'Famix-Angular-Generator'
}

{ #category : 'accessing' }
FamixAngularGenerator class >> packageName [
	^ #'Famix-Angular-Entities'
]

{ #category : 'accessing' }
FamixAngularGenerator class >> packageNameForAnnotations [
	^ #'FamixAngular'
]

{ #category : 'accessing' }
FamixAngularGenerator class >> prefix [
	^ #'FamixAngular'
]

{ #category : 'accessing' }
FamixAngularGenerator class >> submetamodels [
	^ { FamixTypeScriptGenerator }
]

{ #category : 'definition' }
FamixAngularGenerator >> defineClasses [

	super defineClasses.

	angularEntity := builder newClassNamed: #Entity.
	angularType := builder newClassNamed: #Type.
	ngModule := builder newClassNamed: #NgModule.
	component := builder newClassNamed: #Component.
	directive := builder newClassNamed: #Directive.
	pipe := builder newClassNamed: #Pipe.
	service := builder newClassNamed: #Service.
	 
	template := builder newClassNamed: #Template. "Template represents a component's view: the HTML that Angular renders for that component. "
	route := builder newClassNamed: #Route "Route represents one entry in Angular's router configuration For example { path: 'users', component: UsersComponent }"
]

{ #category : 'definition' }
FamixAngularGenerator >> defineHierarchy [

    super defineHierarchy.
    
    angularEntity --|> #TNamedEntity.
    angularType   --|> angularEntity.
    ngModule --|> angularType.
    component --|> angularType.
    directive --|> angularType.
    pipe --|> angularType.
    service --|> angularType.
    template --|> angularEntity.
    route --|> angularEntity.

    "declarables"
"not sure if I use declarable like this."
    component --|> tDeclarable.
    directive --|> tDeclarable.
    pipe      --|> tDeclarable.

]

{ #category : 'definition' }
FamixAngularGenerator >> defineProperties [

	super defineProperties. 
	
	component property: #selector type: #String.
	pipe property: #pipeName type: #String.
	template property: #isInline type: #Boolean.
	template property: #templateUrl type: #String.
	route property: #path type: #String.

	"aless: for the moment I don't see why we need this for something else other than angulartype"
	angularType property: #ast type: #Object.
	template property: #ast type: #Object.
	template property: #templateFile type: #Object.
]

{ #category : 'definition' }
FamixAngularGenerator >> defineRelations [

	| tsClass |
	"aless not sure about this"
	super defineRelations.

	tsClass := self remoteEntity: #Class withPrefix: #FamixTypeScript.

	"each Angular role is backed by exactly one TS class (1-1 association)"
	(angularType property: #implementingClass)
	- (tsClass property: #angularType).

	"module declares many declarables; a declarable is declared by 0..1 module"
	(ngModule property: #declarations)
	-* (tDeclarable property: #declaringModule).

	"module import graph"
	(ngModule property: #importedModules)
	*-* (ngModule property: #importingModules).

	"providers"
	(ngModule property: #providedServices)
	*-* (service property: #providingModules).

	"a component owns one template"
	(component property: #template) <>- (template property: #component).

	"dependency injection via constructor"
	(angularType property: #injectedServices)
	*-* (service property: #injectingClients).

	"template references components by selector"
	(template property: #usedComponents)
	*-* (component property: #usingTemplates).

	"routing"
	(route property: #targetComponent) -* (component property: #routes).
	
]

{ #category : 'definition' }
FamixAngularGenerator >> defineTraits [
    super defineTraits.
    tDeclarable := builder newTraitNamed: #TDeclarable.


]
