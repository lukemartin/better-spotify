# Load required libraries
gulp       = require 'gulp'
gutil      = require 'gulp-util'
coffee     = require 'gulp-coffee'
concat     = require 'gulp-concat'
header     = require 'gulp-header'
livereload = require 'gulp-livereload'
sourcemaps = require 'gulp-sourcemaps'
stylus     = require 'gulp-stylus'
uglify     = require 'gulp-uglify'
nib        = require 'nib'
pkg        = require './package.json'

banner = """
  /**
   * <%= pkg.name %> - <%= pkg.description %>
   * @version v<%= pkg.version %>
   * @link <%= pkg.homepage %>
   */

"""

# Gulp tasks
gulp.task 'stylus', ->
  gulp.src './www/stylus/main.styl'
    .pipe stylus
      use: [nib()]
      sourcemap: { inline: true }
    .pipe gulp.dest('./www/css')
    .pipe livereload(35779)

gulp.task 'coffee', ->
  gulp.src './www/coffee/**/*.coffee'
    .pipe sourcemaps.init()
    .pipe coffee({ bare: false }).on('error', gutil.log)
    .pipe sourcemaps.write()
    .pipe concat('main.js')
    .pipe gulp.dest('./www/js')
    .pipe livereload(35779)

gulp.task 'livereload', ->
  gulp.src ['./www/**/*.html']
    .pipe livereload(35779)

gulp.task 'package', ->
  gulp.src './www/coffee/**/*.coffee'
    .pipe coffee({ bare: false }).on('error', gutil.log)
    .pipe concat('main.min.js')
    .pipe uglify()
    .pipe header(banner, { pkg: pkg })
    .pipe gulp.dest('./www/js')
  gulp.src './www/stylus/main.styl'
    .pipe stylus
      use: [nib()]
      compress: true
    .pipe header(banner, { pkg: pkg })
    .pipe concat('main.min.css')
    .pipe gulp.dest('./www/css')


# Default tasks
gulp.task 'default', ['coffee', 'stylus'], ->
  livereload(35779)
  gulp.watch './www/coffee/**/*.coffee', ['coffee']
  gulp.watch './www/stylus/**/*.styl', ['stylus']
  gulp.watch ['./www/**/*.html'], ['livereload']