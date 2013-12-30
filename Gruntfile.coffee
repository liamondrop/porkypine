module.exports = (grunt) ->

  grunt.initConfig
    package: grunt.file.readJSON 'package.json'
    outputFileName: '<%= package.name %>'

    watch:
      scripts:
        files: 'src/**/*.js'
        tasks: ['lintcompile']

    clean:
      all: ['dist/*']

    uglify:
      all:
        src: ['dist/browser/<%= outputFileName %>.js']
        dest: 'dist/browser/<%= outputFileName %>.min.js'

    coffee:
      all:
        options:
          bare: true
        expand: yes
        cwd: 'src/'
        src: ['**/*.coffee']
        dest: 'dist/'
        ext: '.js'

    coffeelint:
      app:
        src: ['src/**/*.coffee']

    browserify2:
      compile:
        options:
          expose:
            'porkypine': './index.js'
        entry: './index.js'
        compile: 'dist/browser/<%= outputFileName %>.js'


  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-browserify2'

  grunt.registerTask 'default', ['coffeelint', 'clean', 'coffee', 'browserify2', 'uglify']
  grunt.registerTask 'lintcompile', ['coffeelint', 'coffee']
  grunt.registerTask 'watch'