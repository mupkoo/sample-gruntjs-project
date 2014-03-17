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

        watch:
            css:
                files: 'src/**/*.scss'
                tasks: [ 'sass:dev' ]
                options: { livereload: true }
            html:
                files: 'src/**/*.html'
                tasks: [ 'includereplace:dev' ]
                options: { livereload: true }
            js:
                files: 'src/**/*.scss'
                tasks: [ 'coffeelint', 'coffee:dev' ]
                options: { livereload: true }

        connect:
            options:
                keepalive: true
                hostname: 'localhost'
            livereload:
                options:
                    port: 35729
                    base: 'dev'
            dev:
                options:
                    port: 9000
                    open: true
                    base: 'dev'
                    hostname: 'localhost'


    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-coffeelint'
    grunt.loadNpmTasks 'grunt-include-replace'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-connect'

    grunt.registerTask 'default', [ 'coffeelint', 'coffee:dev', 'sass:dev', 'includereplace:dev' ]
