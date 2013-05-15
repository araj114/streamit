# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#new_track').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(mp3|wma|aac)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $($.parseHTML(tmpl("template-upload", file))[1])
        $('#new_track').append(data.context)
        data.submit()
      else
        alert("#{file.name} is not an mp3 file.")
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')
