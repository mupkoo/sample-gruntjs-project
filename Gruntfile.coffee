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


    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-coffee'

    grunt.registerTask 'default', [ 'coffee', 'sass' ]
