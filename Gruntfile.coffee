module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'

        sass:
            dev:
                files:
                    'dev/css/main.css': 'src/css/main.scss'

        coffee:
            dev:
                compile:
                    files:
                        'dev/js/main.js': 'src/js/main.coffee'

        coffeelint:
            app: [ 'src/js/*.coffee', 'src/js/**/*.coffee' ]
            options:
                indentation:
                    level: 'ignore'

        includereplace:
            options:
                prefix: '<!-- @@'
                suffix: ' -->'
            dev:
                src: '*.html',
                dest: 'dev'
                expand: true
                cwd: 'src/'


    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-coffeelint'
    grunt.loadNpmTasks 'grunt-include-replace'

    grunt.registerTask 'default', [ 'coffeelint', 'coffee:dev', 'sass:dev', 'includereplace:dev' ]
