# Load required libraries
gulp        = require 'gulp'
gutil       = require 'gulp-util'
browserify  = require 'gulp-browserify'
coffee      = require 'gulp-coffee'
concat      = require 'gulp-concat'
header      = require 'gulp-header'
htmlreplace = require 'gulp-html-replace'
livereload  = require 'gulp-livereload'
sourcemaps  = require 'gulp-sourcemaps'
stylus      = require 'gulp-stylus'
uglify      = require 'gulp-uglify'
nib         = require 'nib'
pkg         = require './package.json'

banner = """
  /**
   * <%= pkg.name %> - <%= pkg.description %>
   * @version v<%= pkg.version %>
   * @link <%= pkg.homepage %>
   */

"""

# Gulp tasks
gulp.task 'stylus', ->
  gulp.src './stylus/main.styl'
    .pipe stylus
      use: [nib()]
      sourcemap: { inline: true }
    .pipe gulp.dest('./css')
    .pipe livereload(35779)

gulp.task 'coffee', ->
  gulp.src './coffee/main.coffee', { read: false }
    .pipe browserify(
      debug: true,
      transform: ['coffeeify']
      extensions: ['.coffee']
    )
    .pipe concat 'main.js'
    .pipe gulp.dest './js'
    .pipe livereload(35779)

gulp.task 'livereload', ->
  gulp.src ['./**/*.html']
    .pipe livereload(35779)

gulp.task 'package', ->
  gulp.src './coffee/main.coffee', { read: false }
    .pipe browserify(
      debug: false,
      transform: ['coffeeify']
      extensions: ['.coffee']
    )
    .pipe concat 'main.min.js'
    .pipe uglify()
    .pipe header(banner, { pkg: pkg })
    .pipe gulp.dest '../dist/js'
  gulp.src './stylus/main.styl'
    .pipe stylus
      use: [nib()]
      compress: true
    .pipe header(banner, { pkg: pkg })
    .pipe concat('main.min.css')
    .pipe gulp.dest('../dist/css')
  gulp.src '../dist/index.html'
    .pipe htmlreplace
      css: 'css/main.min.css'
      js: 'js/main.min.js'
      basehref: '<base href="http://luke.is/spotify-browser/">'
    .pipe gulp.dest('../dist')

# Default tasks
gulp.task 'default', ['coffee', 'stylus'], ->
  livereload(35779)
  gulp.watch './coffee/**/*.coffee', ['coffee']
  gulp.watch './stylus/**/*.styl', ['stylus']
  gulp.watch ['./**/*.html'], ['livereload']