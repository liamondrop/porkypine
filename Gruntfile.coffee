module.exports = (grunt) ->

  grunt.initConfig
    package: grunt.file.readJSON 'package.json'

    watch:
      all:
        files: ['src/**/*.coffee']
        tasks: ['coffeelint', 'coffee']

    clean:
      all: ['dist/*']

    uglify:
      all:
        src: ['dist/browser/<%= package.name %>.js']
        dest: 'dist/browser/<%= package.name %>.min.js'

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
        src: ['src/**/*.coffee', 'spec/**/*.coffee']

    browserify2:
      compile:
        options:
          expose:
            'porkypine': './index.js'
        entry: './index.js'
        compile: 'dist/browser/<%= package.name %>.js'

    mochaTest:
      test:
        options:
          reporter: 'spec'
          require: ['coffee-script']
        src: ['spec/**/*Spec.coffee']


  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-browserify2'
  grunt.loadNpmTasks 'grunt-mocha-test'

  grunt.registerTask 'default', ['coffeelint', 'clean', 'coffee', 'test', 'browserify2']
  grunt.registerTask 'test', ['coffeelint', 'mochaTest']
