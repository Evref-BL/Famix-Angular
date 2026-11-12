# Famix-Angular

![Moose version](https://img.shields.io/badge/Moose-13-%23aac9ff.svg)

This project is a Famix metamodel for Angular. It is a project under development and experimentation. It is the first project to cover a framework and not a language. We'll see how it continues.

# Logic behind

The idea is to build a metamodel for Angular *on top of* the FamixTypeScript metamodel, with no need for a complicated, dedicated importer.

Angular is, in the end, just TypeScript with conventions, decorators like `@Component`, `@Injectable`, `@Directive`, `@Pipe`. So once a TypeScript project has been imported into a **FamixTypeScript** model (using the existing `ts2famix` importer, which already does all the parsing), every Angular construct is *already there* as a regular TypeScript class. There's no need to write an equivalent of `ts2famix` importer for Angular, nor to parse a single source file ourselves.

Instead, the Angular entities are recovered simply by **applying filters over the FamixTypeScript model**: a component is a class decorated with `@Component`, a service a class with `@Injectable`, and so on. The heavy lifting (parsing TS) is reused, and the Angular layer only tags and links what already exists, which is why it stays so lightweight.

## Installation

```smalltalk
Metacello new
	repository: 'github://Evref-BL/Famix-Angular:main/src';
	baseline: 'FamixAngular';
	load
```

This pulls FamixTypeScript (and Famix/Moose).

## Usage

```smalltalk
tsModel := MooseModel root at: 1.
angularModel := FamixAngularImporter new importAngularModelFrom: tsModel.
```

## What is supported in the metamodel? 

Currently supported: **components, services, directives, and pipes**. Routes and templates are planned for a later stage.
We also started recently to add support for cross-language links established between TypeScript and HTML. Those cross-language links are the links that exist between entities defined in TypeScript (that we call resource entities) and references referring to them from HTML (we call them refernce entitites). The detection of such links could be possible because of FAST-ANgular that is capable of parsing the embeddings in HTML that are not TypeScript (so we can't use FAST-TypeScript), but more Angular style. 


## Cross-language links (HTML ↔ TS)

Each link between HTML and TS is a `FamixAngularHTMLToTSLink` that joins a member of a component's class to the place in that component's template where it is used:

- **source**: the TS member (property or method), as a FAST-TypeScript node.
- **reference**: the identifier in the HTML, as a FAST-Angular node. Its position matches the HTML file.
- **component**: the component that owns both.
- **kind**: the template construct that created the link.

| kind | example | linked member |
|---|---|---|
| `interpolation` | `<p>{{ user.name }}</p>`, `<img src="{{ baseUrl }}/logo.png">` | `user`, `baseUrl` |
| `propertyBinding` | `<img [src]="imageUrl">`, `bind-src="imageUrl"` | `imageUrl` |
| `eventBinding` | `<button (click)="save($event)">`, `on-click="save()"` | `save` |
| `twoWayBinding` | `<input [(ngModel)]="name">`, `bindon-ngModel="name"` | `name` |
| `ngFor` | `*ngFor="let item of items; trackBy: trackById"` | `items`, `trackById` |
| `ngIf` | `*ngIf="isLoggedIn"` | `isLoggedIn` |
| `ngSwitchCase` | `*ngSwitchCase="modes.edit"` | `modes` |
| `structuralDirective` | `*appPermission="role"` (custom directives) | `role` |

What does **not** create a link:
- property accesses after the first object (`user.name` links `user` only), and pipe names;
- binding names such as `[src]` and `(click)`, and object-literal keys;
- template variables (`let item`, `as x`) and template references (`#input`, `ref-input`), within their scope;
- expressions that FAST-Angular cannot parse yet (`ERROR` nodes).

The links are computed during the import; you don't need an extra step:

```smalltalk
links := angularModel allWithType: FamixAngularHTMLToTSLink.
links groupedBy: [ :link | link source entity ].
```

Each kind has its own importer under `FamixAngularHTMLTSLinkImporter`. To support a new construct, add a subclass that implements `usagesIn:` and `kind`.

## Visualizing the links

This script draws one box per component. In each box, an arrow goes from every TS source (yellow) to each of its HTML references, colored by kind. 

```smalltalk
| links canvas colors legend |
links := angularModel allWithType: FamixAngularHTMLToTSLink.
colors := NSScale category10.
canvas := RSCanvas new.
(links groupedBy: [ :link | link component ]) keysAndValuesDo: [ :component :componentLinks |
	| nodes box |
	nodes := Dictionary new.
	componentLinks do: [ :link |
		nodes at: link source entity ifAbsentPut: [
			RSCircle new size: 16; color: Color yellow; model: link source; popupText: #name; yourself ].
		nodes at: link reference entity ifAbsentPut: [
			RSCircle new size: 10; color: (colors scale: link kind); model: link reference; popupText: #name; yourself ] ].
	box := RSComposite new.
	box addAll: nodes values.
	componentLinks do: [ :link |
		box add: (RSLine new
			from: (nodes at: link source entity);
			to: (nodes at: link reference entity);
			markerEnd: (RSShapeFactory arrow size: 6);
			attachPoint: RSBorderAttachPoint new;
			yourself) ].
	RSForceBasedLayout new charge: -150; on: nodes values.
	box adjustToChildren; padding: 10; color: Color veryLightGray; border: (RSBorder new color: Color gray).
	box model: component; popupText: #name.
	canvas add: box ].
RSFlowLayout new gapSize: 20; on: canvas nodes.
legend := RSLegend new container: canvas; yourself.
legend text: 'TS source' withCircleColor: Color yellow.
((links collect: #kind) asSet asSortedCollection) do: [ :kind |
	legend text: kind withCircleColor: (colors scale: kind) ].
legend legendDo: [ :l | l border: RSBorder new; padding: 10 ].
legend location below.
legend build.
canvas @ RSCanvasController.
canvas pngExporter fileName: 'html-ts-links.png'; export.
canvas open
```
<img width="1506" height="862" alt="Screenshot 2026-11-12 at 2 03 08 PM" src="https://github.com/user-attachments/assets/8563488d-11ed-49d5-a8b7-d3fbf93767bb" />


## Finally 

Enjoy inspecting it :)

For the moment it's still under construction, but I'm working on updating it more and more :))))) 
Feel free to try it and send us feedback :)
