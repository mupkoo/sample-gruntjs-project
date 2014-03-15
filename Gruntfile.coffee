module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'

        sass:
            dist:
                files:
                    'dev/css/main.css': 'src/css/main.scss'

        coffee:
            compile:
                files:
                    'dev/js/main.js': 'src/js/main.coffee'

        coffeelint:
            app: [ 'src/js/*.coffee', 'src/js/**/*.coffee' ]
            options:
                indentation:
                    level: 'ignore'

    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-coffeelint'

    grunt.registerTask 'default', [ 'coffeelint', 'coffee', 'sass' ]
