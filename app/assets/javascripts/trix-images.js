(function() {
  var host, uploadAttachment;

  document.addEventListener("trix-attachment-add", function(event) {
    var attachment;
    attachment = event.attachment;
    if (attachment.file) {
      return uploadAttachment(attachment);
    }
  });

  host = "/images";

  uploadAttachment = function(attachment) {
    var file, form, xhr;
    file = attachment.file;
    form = new FormData;
    form.append("Content-Type", file.type);
    form.append("image[image]", file);
    xhr = new XMLHttpRequest;
    xhr.open("POST", host, true);
    xhr.upload.onprogress = function(event) {
      var progress;
      progress = event.loaded / event.total * 100;
      return attachment.setUploadProgress(progress);
    };
    xhr.onload = function() {
      var href, url;
      url = href = JSON.parse(this.responseText).url;
      return attachment.setAttributes({
        url: url,
        href: href
      });
    };
    return xhr.send(form);
  };


}).call(this);
