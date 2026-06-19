Class {
	#name : 'BaselineOfFamixAngular',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFamixAngular',
	#package : 'BaselineOfFamixAngular'
}

{ #category : 'baselines' }
BaselineOfFamixAngular >> baseline: spec [  
	<baseline>
	spec
		for: #common
		do: [
			spec description: 'Famix metamodel for Angular, built on top of FamixTypeScript.'.
			spec author: 'AlessHosry'.
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ] 
]

{ #category : 'baselines' }
BaselineOfFamixAngular >> defineDependencies: spec [ 
	spec baseline: 'FamixTypeScript' with: [
		spec
			loads: #( 'default' );
			repository: 'github://fuhrmanator/FamixTypeScript:main/src' ] 
]

{ #category : 'baselines' }
BaselineOfFamixAngular >> defineGroups: spec [ 
	spec
		group: 'default' with: #( 'core' 'tools' 'tests' );
		group: 'core' with: #( 'Famix-Angular-Entities' 'Famix-Angular-Generator' );
		group: 'tools' with: #( 'core' 'Famix-Angular-Tools' );
		group: 'tests' with: #( 'Famix-Angular-Tests' ) 
]

{ #category : 'baselines' }
BaselineOfFamixAngular >> definePackages: spec [  
	spec
		package: 'Famix-Angular-Entities'
			with: [ spec requires: #( 'FamixTypeScript' ) ];
		package: 'Famix-Angular-Generator'
			with: [ spec requires: #( 'FamixTypeScript' ) ];
		package: 'Famix-Angular-Tools'
			with: [ spec requires: #( 'Famix-Angular-Entities' ) ];
		package: 'Famix-Angular-Tests'
			with: [ spec requires: #( 'Famix-Angular-Tools' ) ] 
]
