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

        slim:
            dist:
                options:
                    pretty: true
                files:
                    'dev/index.html': [ 'src/shared/_header.slim', 'src/index.slim', 'src/shared/_footer.slim' ]

        coffeelint:
            app: [ 'src/js/*.coffee', 'src/js/**/*.coffee' ]
            options:
                indentation:
                    level: 'ignore'

    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-slim'
    grunt.loadNpmTasks 'grunt-coffeelint'

    grunt.registerTask 'default', [ 'cofffeelint', 'coffee', 'sass' ]
