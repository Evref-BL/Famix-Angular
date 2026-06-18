# Famix-Angular
This project is a Famix metamodel for angular. It is a project under development and experimentation. It is the first project to cover a framework and not a language. Will see how it will continue.

# Logic behind
The idea is to create a new metamodel for Angular on top of Famix metamodel with no need for complicated importer etc... Basic entities are created cz it's not very complicated such as routes and componenets. These can be retrieved by applying filters in the importer of Angular over famix typescript metamodel. 

So finally the usage can be like this:

```smalltalk
tsModel := MooseModel root at: 1.
angularModel := FamixAngularImporter new importComponentsFrom: tsModel.
```
Enjoy inspecting it :) 

For the moment it's basic, but I'm working on updating it more and more, and why not one day also including the cross-links with html :))))) (I have something already working locally, but step by step ;)
