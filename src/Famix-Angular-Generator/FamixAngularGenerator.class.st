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
		'tDeclarable',
		'artifact',
		'style',
		'htmlTemplate',
		'famixTNamedEntity',
		'famixTSourceAnchor',
		'famixTSourceLanguage',
		'famixTSourceEntity',
		'famixTHasImmediateSource',
		'fastHtmlDocument',
		'fastScssStylesheet',
		'fastTypeScriptModel',
		'indexedFileAnchor'
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

^ {
	FamixTypeScriptGenerator.
	FASTHTMLMetamodelGenerator.
	FASTSCSSMetamodelGenerator.
	FASTTypeScriptMetamodelGenerator.
	FamixGenerator
}

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
	indexedFileAnchor := builder newClassNamed: #IndexedFileAnchor.

	htmlTemplate := builder newClassNamed: #HTMLTemplate. "Template represents a component's view: the HTML that Angular renders for that component. "
	artifact := builder newClassNamed: #Artifact. "this is on top of template and style for css files; because both are files :)"
	style := builder newClassNamed: #Style.

	route := builder newClassNamed: #Route "Route represents one entry in Angular's router configuration For example { path: 'users', component: UsersComponent }"
]

{ #category : 'definition' }
FamixAngularGenerator >> defineHierarchy [
	"super defineHierarchy."   "leave disabled -- no longer needed"

	sourceAnchor --|> famixTSourceAnchor.
	sourceLanguage --|> famixTSourceLanguage.
	"sourcedEntity --|> famixTSourceEntity."   "REMOVE -- no longer used by anything"

	indexedFileAnchor --|> sourceAnchor.
	indexedFileAnchor --|> #TIndexedFileNavigation.

	sourceTextAnchor --|> sourceAnchor.
	sourceTextAnchor --|> famixTHasImmediateSource.

	angularEntity --|> famixTNamedEntity.
	angularEntity --|> famixTSourceEntity.   "compose the trait directly -- no intermediate entity, no cycle"

	angularType --|> angularEntity.
	ngModule --|> angularType.
	component --|> angularType.
	directive --|> angularType.
	pipe --|> angularType.
	service --|> angularType.

	artifact --|> angularEntity.
	htmlTemplate --|> artifact.
	style --|> artifact.

	route --|> angularEntity.

	component --|> tDeclarable.
	directive --|> tDeclarable.
	pipe --|> tDeclarable
]

{ #category : 'definition' }
FamixAngularGenerator >> defineProperties [

	super defineProperties.

	component property: #selector type: #String.
	pipe property: #pipeName type: #String.
	"htmlTemplate property: #isInline type: #Boolean."
	htmlTemplate property: #templateUrl type: #String.
	route property: #path type: #String

	"shared artifact properties"
	"artifact property: #isInline type: #Boolean."
	"artifact property: #path type: #String." "templateUrl / a styleUrl / later a json path"
	"artifact property: #content type: #String." "inline source, or file contents"
	"artifact property: #file type: #Object" "FileReference, transient"
]

{ #category : 'definition' }
FamixAngularGenerator >> defineRelations [

	| tsClass |
	"aless not sure about this"
	super defineRelations.

	"remote entities"
	tsClass := self remoteEntity: #Class withPrefix: #FamixTypeScript.
	fastHtmlDocument := self
		                    remoteEntity: #Document
		                    withPrefix: #FASTHTML.

	fastScssStylesheet := self
		                      remoteEntity: #Stylesheet
		                      withPrefix: #FASTSCSS.

	fastTypeScriptModel := self
		                         remoteEntity: #Model
		                         withPrefix: #FASTTypeScript.

	"each Angular role is backed by exactly one TS class (1-1 association)"
	(angularType property: #implementingClass)
	- (tsClass property: #angularType).

	(angularType property: #ast)
	<>- (fastTypeScriptModel property: #angularTemplate).

	"module declares many declarables; a declarable is declared by 0..1 module"
	(ngModule property: #declarations)
	-* (tDeclarable property: #declaringModule).

	"module import graph"
	"(ngModule property: #importedModules)
	*-* (ngModule property: #importingModules)." "For the moment this is external and i will stop it cz i dunno how to handle it ... yet :) "

	"providers"
	(ngModule property: #providedServices)
	*-* (service property: #providingModules).

	"a component owns one template"
	(component property: #htmlTemplate)
	<>- (htmlTemplate property: #component).
	"a component owns many stylesheets"
	(component property: #styles) <>-* (style property: #component).

	"dependency injection via constructor"
	(angularType property: #injectedServices)
	*-* (service property: #injectingClients).

	"template references components by selector"
	(htmlTemplate property: #usedComponents)
	*-* (component property: #usingTemplates).

	(htmlTemplate property: #htmlAstRoot)
	<>- (fastHtmlDocument property: #angularTemplate).

	(style property: #styleAstRoot)
	<>- (fastScssStylesheet property: #angularStyle).

	"routing"
	(route property: #targetComponent) -* (component property: #routes)
]

{ #category : 'definition' }
FamixAngularGenerator >> defineTraits [

	super defineTraits.
 
	famixTNamedEntity := self
		                     remoteTrait: #TNamedEntity
		                     withPrefix: #Famix.
	famixTSourceEntity := self
		                      remoteTrait: #TSourceEntity
		                      withPrefix: #Famix.
	famixTSourceAnchor := self
		                      remoteTrait: #TSourceAnchor
		                      withPrefix: #Famix.
	famixTHasImmediateSource := self
		                            remoteTrait: #THasImmediateSource
		                            withPrefix: #Famix.
	famixTSourceLanguage := self
		                        remoteTrait: #TSourceLanguage
		                        withPrefix: #Famix.

	tDeclarable := builder newTraitNamed: #TDeclarable
]
