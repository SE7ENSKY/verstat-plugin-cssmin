module.exports = (next) ->
	cssmin = require 'cssmin'
	@postprocessor 'cssmin',
		extname: '.css'
		priority: 1000
		postprocess: (file, donePostprocessor) =>
			return donePostprocessor() unless file.cssmin
			try
				if file.processor
					file.processed = cssmin file.processed
				else
					file.source = cssmin file.source
				@modified file
				donePostprocessor()
			catch err
				donePostprocessor err

	next()