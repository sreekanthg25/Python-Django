var pkg = require('./package.json');

module.exports = function ( grunt ){
	/**
	* Load required Grunt tasks. These are installed based on the versions listed
	* in `package.json` when you do `npm install` in this directory.
	*/
	grunt.loadNpmTasks('grunt-contrib-clean');
 	grunt.loadNpmTasks('grunt-contrib-copy');
 	grunt.loadNpmTasks('grunt-contrib-concat');
 	grunt.loadNpmTasks('grunt-contrib-cssmin');
 	grunt.loadNpmTasks('grunt-contrib-jade');
 	grunt.loadNpmTasks('grunt-contrib-jshint');
 	grunt.loadNpmTasks('grunt-contrib-less');
 	grunt.loadNpmTasks('grunt-contrib-uglify');
 	grunt.loadNpmTasks('grunt-contrib-watch');
 	grunt.loadNpmTasks('grunt-html2js');
 	grunt.loadNpmTasks('grunt-ng-annotate');

 	/**
 	 * Holds all user configuration for the build process.
 	 */
 	var userConfig = {
 		/**
 		 * The `build_dir` folder is where our projects are compiled during
 		 * development and build.
 		 */
 		build_dir:'static/dist',
 		app_files:{
 			js: [ 'static/src/**/*.js'],
 			jade: ['static/src/**/*.jade'],
 			less: 'static/src/imports.less',
 			htmls: [ 'static/src/**/*.html'],
 			layout: [ 'templates/_layout.jade' ]
 		},
 		/**
 		 * This is the same as `app_files`, except it contains patterns that
 		 * reference vendor code (`vendor/`) that we need to place into the build
 		 * process somewhere. While the `app_files` property ensures all
 		 * standardized files are collected for compilation, it is the user's job
 		 * to ensure non-standardized (i.e. vendor-related) files are handled
 		 * appropriately in `vendor_files.js`.
 		 *
 		 * The `vendor_files.js` property holds files to be automatically
 		 * concatenated and minified with our project source files.
 		 *
 		 * The `vendor_files.css` property holds any CSS files to be automatically
 		 * included in our app.
 		 *
 		 * The `vendor_files.assets` property holds any assets to be copied along
 		 * with our app's assets. This structure is flattened, so it is not
 		 * recommended that you use wildcards.
 		 */
 		vendor_files:{
 			js:[
 				'static/bower_components/angular/angular.js',
 				'static/bower_components/angular-ui-router/release/angular-ui-router.js'
 			],
 			css:[

 			],
 			assets:[

 			]

 		}

 	};
 	/**
 	 * This is the configuration object Grunt uses to give each plugin its
 	 * instructions.
 	 */
 	var taskConfig = {
 		/**
 		 * We read in our `package.json` file so we can access the package name and
 		 * version. It's already there, so we don't repeat ourselves here.
 		 */
 		pkg: grunt.file.readJSON("package.json"),
 		/**
 		 * The banner is the comment that is placed at the top of our compiled
 		 * source files. It is first processed as a Grunt template, where the `<%=`
 		 * pairs are evaluated based on this very configuration object.
 		 */
 		meta: {
 			banner:
 		       '/**\n' +
 		       ' * <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %>\n' +
 		       ' * <%= pkg.homepage %>\n' +
 		       ' *\n' +
 		       ' * Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author %>\n' +
 		       ' * Licensed <%= pkg.license %>\n' +
 		       ' */\n'
 		},

 		module_prefix: '(function ( window, angular, undefined ) {',
 		module_suffix: '})( window, window.angular );',

		/**
		 * The directories to delete when `grunt clean` is executed.
		 */
		clean: {
		  all: ['<%= build_dir %>'],
		  dev: ['<%= build_dir %>/*', '!<%= build_dir %>/assets', '!<%= build_dir %>/*.html']
		},
		/**
		 * The `copy` task just copies files from A to B. We use it here to copy
		 * our project assets (images, fonts, etc.) and javascripts into
		 * `build_dir`.
		 */
		copy: {

		  app_assets: {
		    files: [
		      {
		        src: [ '**' ],
		        dest: '<%= build_dir %>/assets/',
		        cwd: 'static/assets',
		        expand: true
		      }
		   ]
		  },
		  vendor_assets: {
		    files: [
		      {
		        src: [ '<%= vendor_files.assets %>' ],
		        dest: '<%= build_dir %>/assets/',
		        cwd: '.',
		        expand: true,
		        flatten: true
		      }
		   ]
		  },
		  appjs: {
		    files: [
		      {
		        src: [ '<%= app_files.js %>' ],
		        dest: '<%= build_dir %>/',
		        cwd: '.',
		        expand: true
		      }
		    ]
		  },
		  vendorjs: {
		    files: [
		      {
		        src: [ '<%= vendor_files.js %>' ],
		        dest: '<%= build_dir %>/',
		        cwd: '.',
		        expand: true
		      }
		    ]
		  },
		  app_html: {
		    files: [
		      {
		        src: [ '<%= app_files.htmls %>' ],
		        dest: '<%= build_dir %>/',
		        cwd: '.',
		        expand: true
		      }
		    ]
		  }
		},
		/**
		 * `grunt concat` concatenates multiple source files into a single file.
		 */
		concat: {
		  /**
		   * The `build_css` target concatenates compiled CSS and vendor CSS
		   * together.
		   */
		  build_css: {
		    src: [
		      '<%= vendor_files.css %>',
		      '<%= build_dir %>/assets/<%= pkg.name %>.css'
		    ],
		    dest: '<%= build_dir %>/assets/<%= pkg.name %>.css'
		  },
		  /**
		   * concatinates all app files in src folder so that ngmin can be applied
		   */
		  appjs: {
		    src: [
		      '<%= build_dir %>/static/src/**/*.js'
		    ],
		    dest: '<%= build_dir %>/src.js'
		  },
		  /**
		   * The `alljs` target is the concatenation of our application source
		   * code and all specified vendor source code into a single file.
		   */
		  alljs: {
		    options: {
		      banner: '<%= meta.banner %>'
		    },
		    src: [
		      '<%= vendor_files.js %>',
		      '<%= module_prefix %>',
		      '<%= concat.appjs.dest %>',
		      '<%= html2js.main.dest %>',
		      '<%= module_suffix %>'
		    ],
		    dest: '<%= build_dir %>/assets/<%= pkg.name %>.js'
		  }
		},
		/**
	     * `ng-min` annotates the sources before minifying. That is, it allows us
	     * to code without the array syntax.
	     */
	     ngAnnotate: {
	      options: {
	        singleQuotes: true,
	      },
	      build: {
	        files: {
	          '<%= concat.appjs.dest %>': [ '<%= concat.appjs.dest %>' ]
	        },
	      }
	    },
	    /**
	     * Minify the sources!
	     */
	    uglify: {
	      compile: {
	        options: {
	          banner: '<%= meta.banner %>'
	        },
	        files: {
	          '<%= concat.alljs.dest %>': '<%= concat.alljs.dest %>'
	        }
	      }
	    },
	    less: {
          development: {
            options: {
              paths: ['static/src/imports.less']
            },
            files: {
              '<%= build_dir %>/assets/<%= pkg.name %>.css': '<%= app_files.less %>'
            },
            compress: false
          },
          production: {
            options: {
              paths: ['static/src/imports.less']
            },
            files: {
              '<%= build_dir %>/assets/<%= pkg.name %>.css': '<%= app_files.less %>'
            },
            compress: true
          }
        },

        cssmin: {
          target: {
            files: [
              {
                expand: true,
                cwd: '<%= build_dir %>/assets/',
                src: ['*.css', '!*.min.css'],
                dest: '<%= build_dir %>/assets/',
                ext: '.css'
              }
            ]
          }
        },
	    /**
	     * `jshint` defines the rules of our linter as well as which files we
	     * should check. This file, all javascript sources, and all our unit tests
	     * are linted based on the policies listed in `options`. But we can also
	     * specify exclusionary patterns by prefixing them with an exclamation
	     * point (!); this is useful when code comes from a third party but is
	     * nonetheless inside `src/`.
	     */
	    jshint: {
	      src: [
	        '<%= app_files.js %>'
	      ],
	      gruntfile: [
	        'Gruntfile.js'
	      ],
	      options: {
	        curly: true,
	        immed: true,
	        newcap: true,
	        noarg: true,
	        sub: true,
	        boss: true,
	        eqnull: true,
	        laxcomma: true,
	        debug: true
	      },
	      globals: {}
	    },

	    jade: {
          options: {
            pretty: true
          },
          compile2html: {
            files: [
              {
                src: ['<%= app_files.jade %>'],
                cwd: '.',
                dest: '<%= build_dir %>',
                expand: true,
                ext: '.html'
              }
            ]
          },
          index: {
            options: { data: { pkg: pkg } },
            files:{ "templates/index.html": "<%= app_files.layout %>" }
          }
        },
        /**
         * HTML2JS is a Grunt plugin that takes all of your template files and
         * places them into JavaScript files as strings that are added to
         * AngularJS's template cache. This means that the templates too become
         * part of the initial payload as one JavaScript file. Neat!
         */
        html2js: {
          main: {
            options: {
              base: '<%= build_dir %>/static/src',
              module: 'blogs.templates'
            },
            src: [ '<%= build_dir %>/static/src/**/*.html' ],
            dest: '<%= build_dir %>/templates.js'
          }
        },

        /**
         * And for rapid development, we have a watch set up that checks to see if
         * any of the files listed below change, and then to execute the listed
         * tasks when they do. This just saves us from having to type "grunt" into
         * the command-line every time we want to see what we're working on; we can
         * instead just leave "grunt watch" running in a background terminal. Set it
         * and forget it, as Ron Popeil used to tell us.
         *
         * But we don't need the same thing to happen for all the files.
         */
        delta: {
          /**
           * By default, we want the Live Reload to work for all tasks; this is
           * overridden in some tasks (like this file) where browser resources are
           * unaffected. It runs by default on port 35729, which your browser
           * plugin should auto-detect.
           */
          options: {
            livereload: false,
            forever: false
          },

          /**
           * When the Gruntfile changes, we just want to lint it. In fact, when
           * your Gruntfile changes, it will automatically be reloaded!
           */
          gruntfile: {
            files: 'Gruntfile.js',
            tasks: [ 'jshint:gruntfile' ],
            options: {
              livereload: false
            }
          },

          /**
           * When our JavaScript source files change, we want to run lint them and
           * run our unit tests.
           */
          jssrc: {
            files: [
              '<%= app_files.js %>'
            ],
            tasks: [ 'jshint:src', 'copy:appjs', 'concat:appjs', 'concat:alljs']
          },

          /**
           * When assets are changed, copy them. Note that this will *not* copy new
           * files, so this is probably not very useful.
           */
          assets: {
            files: [
              'assets/**/*'
            ],
            tasks: [ 'copy:app_assets' ]
          },

          /**
           * When layout file changes, we need to compile it.
           */
          layout: {
            files: [ '<%= app_files.layout %>'],
            tasks: [ 'jade:index']
          },

          /**
           * When our templates change, we only rewrite the template cache.
           */
          tpls: {
          	files: [
               '<%= app_files.htmls %>'
            ],
            tasks: [ 'copy:app_html', 'html2js', 'concat:alljs' ]
          },

          /**
           * When jade files change, we need to convert to hrml and then to js.
           */
          jade: {
            files: [ '<%= app_files.jade %>' ],
            tasks: [ 'jade:compile2html', 'html2js', 'concat:alljs' ]
          },

          /**
           * When the CSS files change, we need to compile and minify them.
           */
          less: {
            files: [ 'static/src/**/*.less' ],
            tasks: [ 'less:development', 'concat:build_css' ]
          }

        }
 	};
 	grunt.initConfig( grunt.util._.extend( taskConfig, userConfig ) );
 	/**
 	 * In order to make it safe to just compile or copy *only* what was changed,
 	 * we need to ensure we are starting from a clean, fresh build. So we rename
 	 * the `watch` task to `delta` (that's why the configuration var above is
 	 * `delta`) and then add a new task called `watch` that does a clean build
 	 * before watching for changes.
 	 */
 	grunt.renameTask( 'watch', 'delta' );
 	grunt.registerTask( 'watch', [
 	  'build',
 	  'delta'
 	]);

 	/**
 	 * The default task is to build and compile.
 	 */
 	grunt.registerTask( 'default', [ 'build', 'compile' ] );

 	/**
 	 * The `build` task gets your app ready to run for development and testing.
 	 */
 	grunt.registerTask( 'build', [
 	  'clean:all', 'jade', 'copy:app_html', 'html2js', 'jshint','less:development',
 	  'copy:app_assets', 'copy:vendor_assets', 'copy:appjs', 'copy:vendorjs',
 	  'concat:build_css', 'concat:appjs', 'ngAnnotate:build', 'concat:alljs'
 	]);
 	/**
 	 * The `compile` task gets your app ready for deployment by concatenating and
 	 * minifying your code.
 	 */
 	grunt.registerTask( 'compile', [
 	  'clean:dev','cssmin','uglify'
 	]);
};
