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
	
    angularEntity := builder newClassNamed: #AngularEntity.   
    angularType   := builder newClassNamed: #AngularType. 
    ngModule      := builder newClassNamed: #NgModule.
    component     := builder newClassNamed: #Component.
    directive     := builder newClassNamed: #Directive.
    pipe          := builder newClassNamed: #Pipe.
    service       := builder newClassNamed: #Service.
    template      := builder newClassNamed: #Template.
    route         := builder newClassNamed: #Route.
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
	"aless to be changed? already thios approach (type) is handled in famix typescript "
	component property: #selector type: #String.
	pipe property: #pipeName type: #String.
	template property: #isInline type: #Boolean.
	template property: #templateUrl type: #String.
	route property: #path type: #String
]

{ #category : 'definition' }
FamixAngularGenerator >> defineRelations [
	| tsClass |
	"aless not sure about this"
    super defineRelations.
    
    tsClass := self remoteEntity: #Class withPrefix: #FamixTypeScript.

    "each Angular role is backed by exactly one TS class (1-1 association)"
    (angularType property: #implementingClass) - (tsClass property: #angularType).

    "module declares many declarables; a declarable is declared by 0..1 module"
    (ngModule property: #declarations) -* (tDeclarable property: #declaringModule).

    "module import graph"
    (ngModule property: #importedModules) *-* (ngModule property: #importingModules).

    "providers"
    (ngModule property: #providedServices) *-* (service property: #providingModules).

    "a component owns one template"
    (component property: #template) <>- (template property: #component).

    "dependency injection via constructor"
    (angularType property: #injectedServices) *-* (service property: #injectingClients).

    "template references components by selector"
    (template property: #usedComponents) *-* (component property: #usingTemplates).

    "routing"
    (route property: #targetComponent) -* (component property: #routes).
]

{ #category : 'definition' }
FamixAngularGenerator >> defineTraits [
    super defineTraits.
    tDeclarable := builder newTraitNamed: #TDeclarable.


]
