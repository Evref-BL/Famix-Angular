Class {
	#name : 'FamixAngularGenerator',
	#superclass : 'FamixBasicInfrastructureGenerator',
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
