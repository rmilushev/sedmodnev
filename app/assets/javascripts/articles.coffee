Trix.config.attachments =
  preview:
    caption:
      name: false
      size: false
  file:
    caption:
      size: false
$ ->
  document.addEventListener 'trix-attachment-add', (event) ->
    attachment = event.attachment
    if attachment.file
      return sendFile(attachment)
    return
  document.addEventListener 'trix-attachment-remove', (event) ->
    attachment = event.attachment
    deleteFile attachment

  sendFile = (attachment) ->
    file = attachment.file
    form = new FormData
    form.append 'Content-Type', file.type
    form.append 'image[picture]', file
    xhr = new XMLHttpRequest
    xhr.open 'POST', '/images', true

    xhr.upload.onprogress = (event) ->
      progress = undefined
      progress = event.loaded / event.total * 100
      attachment.setUploadProgress progress

    xhr.onload = ->
      response = JSON.parse(@responseText)
      attachment.setAttributes
        url: response.url
        picture_id: response.picture_id
        href: response.image_url

    xhr.send form

  deleteFile = (n) ->
    $.ajax
      type: 'DELETE'
      url: '/images/' + n.attachment.attributes.values.picture_id
      cache: false
      contentType: false
      processData: false

  return
