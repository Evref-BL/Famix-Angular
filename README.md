# Famix-Angular

This project is a Famix metamodel for Angular. It is a project under development and experimentation. It is the first project to cover a framework and not a language. We'll see how it continues.

# Logic behind

The idea is to build a metamodel for Angular *on top of* the Famix metamodel, with no need for a complicated, dedicated importer.

Angular is, in the end, just TypeScript with conventions, decorators like `@Component`, `@Injectable`, `@Directive`, `@Pipe`. So once a TypeScript project has been imported into a **FamixTypeScript** model (using the existing `ts2famix` importer, which already does all the parsing), every Angular construct is *already there* as a regular TypeScript class. There's no need to write an equivalent of `ts2famix` for Angular, nor to parse a single source file ourselves.

Instead, the Angular entities are recovered simply by **applying filters over the FamixTypeScript model**: a component is a class decorated with `@Component`, a service a class with `@Injectable`, and so on. The heavy lifting (parsing TS) is reused, and the Angular layer only tags and links what already exists — which is why it stays so lightweight.

Currently supported: **components, services, directives, and pipes**. Routes and templates (plus the HTML cross-links) are planned for a later stage, once the decorator-argument and template parsing land via FAST TypeScript.

# Installation

```smalltalk
Metacello new
	repository: 'github://Evref-BL/Famix-Angular:main/src';
	baseline: 'FamixAngular';
	load
```

This pulls FamixTypeScript (and Famix/Moose).

# Usage

```smalltalk
tsModel := MooseModel root at: 1.
angularModel := FamixAngularImporter new importAngularModelFrom: tsModel.
```

Enjoy inspecting it :)

For the moment it's basic, but I'm working on updating it more and more, and why not one day also including the cross-links with html :))))) (I have something already working locally, but step by step ;)
