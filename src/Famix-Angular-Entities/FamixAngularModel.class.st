Class {
	#name : 'FamixAngularModel',
	#superclass : 'MooseModel',
	#traits : 'FASTHTMLTEntityCreator + FASTSCSSTEntityCreator + FASTTEntityCreator + FASTTypeScriptTEntityCreator + FamixAngularTEntityCreator + FamixTypeScriptTEntityCreator',
	#classTraits : 'FASTHTMLTEntityCreator classTrait + FASTSCSSTEntityCreator classTrait + FASTTEntityCreator classTrait + FASTTypeScriptTEntityCreator classTrait + FamixAngularTEntityCreator classTrait + FamixTypeScriptTEntityCreator classTrait',
	#category : 'Famix-Angular-Entities-Model',
	#package : 'Famix-Angular-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixAngularModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-TypeScript-Entities' #'Famix-Traits' #'FAST-TypeScript-Model' #'FAST-SCSS-Model' #'FAST-HTML-Model' #'FAST-Core-Model')
]

{ #category : 'meta' }
FamixAngularModel class >> annotation [
	<FMClass: #FamixAngularModel super: #MooseModel>
	<package: #FamixAngular>
	<generated>
]
