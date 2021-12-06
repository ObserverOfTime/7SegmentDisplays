# Contributing

## Rules & guidelines

* Make sure your code conforms to [`.editorconfig`](.editorconfig).
* Don't alter the coding style of existing files.
* Keep the implementations short and simple.
* Words containing any of `gkmqvwxzio` are invalid.
* The program's working directory must be the project root.
* You can skip checking for `words.txt`'s existence.
* If possible, separate the code into 3 or 4 sections (with a blank line):

    0. Importing/including (if necessary).
    1. Declaring variables & reading the file.
    2. Finding the longest words.
    3. Printing the longest words.
* If possible, use the following variable names for consistency:

    * `words`: List/array of words read from `words.txt`.
    * `longest`: List/array of the longest words.
    * `invalid`: Regular expression of invalid letters.
    * `maxlen`: Length of the longest word(s).

## Expected output

All implementations should produce the following output:

```
supertranscendentness
three-and-a-halfpenny
```

## Adding a new language

* Name the file according to the language it was written in.
* Place the file inside a folder named after the language family.
* Add the new language to the [README](README.md#languages) (`make langs`).
* Add a new target for the language to the [Makefile](Makefile), if needed.
* Add any required packages or steps to the [workflow](.github/workflows/build.yml).
* Add any compiler/editor-generated files to [`.gitignore`](.gitignore).
* Add a new test for the language in [`t/tests.json`](t/tests.json).
    * If it cannot be tested, explain why in a comment within the file.
