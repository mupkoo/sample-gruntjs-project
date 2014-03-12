module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'

        sass:
            dist:
                files:
                    'dev/css/main.css': 'src/css/main.scss'

    grunt.loadNpmTasks 'grunt-contrib-sass'
