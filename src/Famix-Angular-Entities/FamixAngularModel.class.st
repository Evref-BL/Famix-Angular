Class {
	#name : 'FamixAngularModel',
	#superclass : 'MooseModel',
	#traits : 'FamixAngularTEntityCreator + FamixTypeScriptTEntityCreator',
	#classTraits : 'FamixAngularTEntityCreator classTrait + FamixTypeScriptTEntityCreator classTrait',
	#category : 'Famix-Angular-Entities-Model',
	#package : 'Famix-Angular-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixAngularModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-TypeScript-Entities' #'Famix-Traits')
]

{ #category : 'meta' }
FamixAngularModel class >> annotation [
	<FMClass: #FamixAngularModel super: #MooseModel>
	<package: #FamixAngular>
	<generated>
]
