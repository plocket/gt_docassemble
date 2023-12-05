Class {
	#name : #BaselineOfGtDocassemble,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtDocassemble
}

{ #category : #loading }
BaselineOfGtDocassemble class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt_docassemble' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtDocassemble >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtDocassemble'
		]
]
