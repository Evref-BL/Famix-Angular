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
		'indexedFileAnchor',
		'crossLanguageLink',
		'htmlToTSLink',
		'linkEnd'
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
	route := builder newClassNamed: #Route. "Route represents one entry in Angular's router configuration For example { path: 'users', component: UsersComponent }"

	"Cross-language links: a defined entity (source) used from another language (reference).
	One subclass per language pair; later SCSS-HTML, JSON-TS, ..."
	crossLanguageLink := builder newClassNamed: #CrossLanguageLink.
	htmlToTSLink := builder newClassNamed: #HTMLToTSLink.
	linkEnd := builder newClassNamed: #LinkEnd "one side of a link: a FAST entity and the FAST root of its file"
]

{ #category : 'definition' }
FamixAngularGenerator >> defineHierarchy [
	"super defineHierarchy."

	"removed to avoid conflicts between traits like TComments comming from FAST and Famix"

	sourceAnchor --|> famixTSourceAnchor.
	"sourceLanguage --|> famixTSourceLanguage." "no need for it now"
	indexedFileAnchor --|> sourceAnchor.
	indexedFileAnchor --|> #TIndexedFileNavigation.
	sourceTextAnchor --|> sourceAnchor.
	sourceTextAnchor --|> famixTHasImmediateSource.

	angularEntity --|> famixTNamedEntity.
	angularEntity --|> famixTSourceEntity.

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
	pipe --|> tDeclarable.

	htmlToTSLink --|> crossLanguageLink
]

{ #category : 'definition' }
FamixAngularGenerator >> defineProperties [

	super defineProperties.
	component property: #selector type: #String.
	pipe property: #pipeName type: #String.
	"htmlTemplate property: #isInline type: #Boolean."
	htmlTemplate property: #templateUrl type: #String.
	route property: #path type: #String.

	"what produced the link, e.g. 'ngFor', 'ngIf'"
	crossLanguageLink property: #kind type: #String.
	"both ends are FamixAngularLinkEnd; plain properties, so a link end does not point back to its link"
	crossLanguageLink property: #source type: #Object.
	crossLanguageLink property: #reference type: #Object.
	"FAST entities of any language (FASTTEntity users); untyped to keep FAST metamodels untouched"
	linkEnd property: #entity type: #Object.
	linkEnd property: #container type: #Object

	"shared artifact properties"
	"artifact property: #isInline type: #Boolean."
	"artifact property: #path type: #String." "templateUrl / a styleUrl / later a json path"
	"artifact property: #content type: #String." "inline source, or file contents"
	"artifact property: #file type: #Object" "FileReference, transient"
]

{ #category : 'definition' }
FamixAngularGenerator >> defineRelations [

	| tsClass tsProgram |
	super defineRelations.

	"remote entities"
	tsClass := self remoteEntity: #Class withPrefix: #FamixTypeScript.
	tsProgram := self remoteEntity: #Program withPrefix: #FASTTypeScript.
	fastHtmlDocument := self
		                    remoteEntity: #Document
		                    withPrefix: #FASTHTML.
	fastScssStylesheet := self
		                      remoteEntity: #Stylesheet
		                      withPrefix: #FASTSCSS.

	"each Angular role is backed by exactly one TS class (1-1 association)"
	(angularType property: #implementingClass)
	- (tsClass property: #angularType).

	"the parsed AST (FAST root) of that TS class"
	(angularType property: #ast) <>- (tsProgram property: #angularType).

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

	(htmlTemplate property: #ast)
	<>- (fastHtmlDocument property: #angularTemplate).

	(style property: #ast)
	<>- (fastScssStylesheet property: #angularStyle).

	"routing"
	(route property: #targetComponent) -* (component property: #routes).

	"cross-language links are owned by their component"
	(component property: #crossLanguageLinks)
	<>-* (crossLanguageLink property: #component)
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
