# Contributing to ags-tween

## Requirements

* AGS Editor 3.4.1
* Module should be compatible with AGS 3.4.1 or above. New features should be wrapped around `#ifver`

## Submission process

1. Fork this repo into your own account
2. Make your changes in your fork
3. Update `CHANGES.TXT` and ensure new features are wrapped in `#ifver`
4. Push your changes and create a Pull Request
5. The [code owners](CODEOWNERS) will approve the Pull Request and merge into master
6. Your changes may be released by the code owners in a new version as soon as possible

## Code style

There are some really simple code style guidelines that the code should follow to
keep convention. When in doubt, take a look at the Tween script file for examples.

### Indentation

* Please use 2 spaces for indentation as it is the standard for AGS scripts

### Blocks

* Functions and blocks must have the opening bracket `{` start at the end of the statement
and not in a new line
* Blocks should ideally be enclosed in brackets `{}` even when they are not necessary

Example:

```
function HelloGoodbye(bool hello) {
  if (hello) {
    Display("Hello Example!");
  }
  else {
    Display("Goodbye Example!");
  }
}
```

### Naming

* Macros (`#define`s) must always be written in `ALL_CAPS_WITH_UNDERSCORE_SPACING`
* Variables, structs, and functions that are local to the script should start with an underscore `_`
* Function names should always be in `TitleCase`
* Variable names should always be in `camelCase`
* Please use clear names for functions and variables

Example:

```
#define MY_MACRO 1

int _myScriptVar;

function _MyScriptFunction() {
  int myLocalVar;
}
```
