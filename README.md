# My Website [![Build Status](https://img.shields.io/travis/unindented/unindented-rails.svg)](http://travis-ci.org/unindented/unindented-rails) [![Dependency Status](https://img.shields.io/gemnasium/unindented/unindented-rails.svg)](https://gemnasium.com/unindented/unindented-rails) [![Coverage Status](https://img.shields.io/coveralls/unindented/unindented-rails.svg)](https://coveralls.io/r/unindented/unindented-rails) [![Quality Status](https://img.shields.io/codeclimate/github/unindented/unindented-rails.svg)](https://codeclimate.com/github/unindented/unindented-rails)

This is the source code for my website, [unindented.org](https://unindented.org/).

The contents themselves are versioned separately as a submodule. You can find them at <https://github.com/unindented/unindented-contents>.


## Install

If you have [Ruby](https://www.ruby-lang.org/) with [Bundler](http://bundler.io/) on your system, just run:

```sh
$ bundle install
```


## Configure

Check out the [settings.yml](config/settings.yml) file.


## Test

To run all specs and features through [RSpec](http://rspec.info/) and [Cucumber](http://cukes.info/), do:

```sh
$ rake
```


## Build & Deploy

To build and deploy the site, do:

```sh
$ RAILS_ENV=production rake build
```

This will load all contents into the database, start a server, run `wget -m` to mirror the site, and run `rsync -a` to deploy it to whatever destination is configured.


## Reload Contents

To reload all contents into the database, do:

```sh
$ rake contents
```


## Regenerate Icons

To regenerate all icons, do:

```sh
$ rake icons
```

This will invoke [ImageMagick](http://www.imagemagick.org/)'s `convert -resize` to create `.ico` files, and [Inkscape](http://www.inkscape.org/)'s `inkscape --export-png` to create `.png` files.

**NOTE:** You will need to have [ImageMagick](http://www.imagemagick.org/) and [Inkscape](http://www.inkscape.org/) installed (obviously):

```sh
$ brew install imagemagick inkscape
```


## Regenerate Fonts

To regenerate all fonts, do:

```sh
$ rake glyphs
```

This will invoke [FontCustom](http://fontcustom.com/)'s `fontcustom compile` to create all necessary font files.

**NOTE:** You will need to have [FontForge](http://fontforge.org/) and [FreeType's ttfautohint](http://www.freetype.org/ttfautohint/) installed:

```sh
$ brew install fontforge ttfautohint
```


## Meta

* Code: `git clone git://github.com/unindented/unindented-rails.git`
* Home: <https://unindented.org/>


## Contributors

Daniel Perez Alvarez ([unindented@gmail.com](mailto:unindented@gmail.com))


## License

Copyright (c) 2014 Daniel Perez Alvarez ([unindented.org](https://unindented.org/)). This is free software, and may be redistributed under the terms specified in the LICENSE file.
