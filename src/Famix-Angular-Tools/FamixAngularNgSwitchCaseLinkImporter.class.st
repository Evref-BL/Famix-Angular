"
I link the members read in *ngSwitchCase, e.g. caseB in <p *ngSwitchCase=""caseB"">. The value of the switch itself ([ngSwitch]=""mode"") is a property binding.
"
Class {
	#name : 'FamixAngularNgSwitchCaseLinkImporter',
	#superclass : 'FamixAngularStructuralDirectiveLinkImporter',
	#category : 'Famix-Angular-Tools',
	#package : 'Famix-Angular-Tools'
}

{ #category : 'accessing' }
FamixAngularNgSwitchCaseLinkImporter >> directive [
	^ '*ngSwitchCase'
]
