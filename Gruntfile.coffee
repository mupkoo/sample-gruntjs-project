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


    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-slim'

    grunt.registerTask 'default', [ 'coffee', 'sass' ]
