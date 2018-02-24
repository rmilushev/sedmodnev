// (function ($, window, document, undefined) {
//
//   var wysiwyg = {
//     serverPath: "/attachments",
//     fileMaxSize: 2097152, // 2MB
//
//     config: function () {
//       _trixAddAttachmentButtonToToolbar();
//
//       document.addEventListener("trix-attachment-add", _trixAttachmentAdd);
//       document.addEventListener("trix-attachment-remove", _trixAttachmentRemove);
//     },
//
//     addFile: function () {
//       var trix = document.querySelector("trix-editor");
//       var fileInput = document.createElement("input");
//
//       fileInput.setAttribute("type", "file");
//       fileInput.setAttribute("multiple", "");
//
//       fileInput.addEventListener("change", function(event) {
//         var files = this.files;
//         var results = [];
//         var filesCounter = files.length;
//
//         for (var i = 0; i < filesCounter; i++) {
//           results.push(trix.editor.insertFile(files[i]));
//         }
//
//         return results;
//       }),
//
//       fileInput.click();
//     }
//   };
//
//   window.app.wysiwyg = wysiwyg;
//
//   // ****************************** PROTECTED **********************************
//
//   function _trixAddAttachmentButtonToToolbar() {
//     var buttonHTML = '<button type="button" onclick="return app.wysiwyg.addFile();" class="trix-button trix-button--icon trix-button--icon-attach-files" data-trix-action="x-attach" title="Attach Files" tabindex="-1">Attach Files</button>';
//     var nth = 0;
//     var newtoolbarHTML = Trix.config.toolbar.getDefaultHTML().replace(/<\/span>/g, function (match, i) {
//       return (++nth === 2) ? buttonHTML + '</span>' : match;
//     });
//
//     Trix.config.toolbar.getDefaultHTML = function () {
//       return newtoolbarHTML;
//     };
//   }
//
//   function _trixAttachmentAdd(event) {
//     var attachment = event.attachment;
//     var xhr = new XMLHttpRequest;
//     var form = new FormData;
//     var file = attachment.file;
//     var CSRFToken = $('meta[name="csrf-token"]').attr('content');
//
//     if (!file || file.size === 0) {
//       attachment.remove();
//
//       return alert("The file you submitted looks empty.");;
//     }
//
//     if (file.size > wysiwyg.fileMaxSize) {
//       attachment.remove();
//
//       return alert("The selected file is bigger then the allowed max file size.");
//     }
//
//     form.append("attachment[file]", file);
//
//     xhr.open("POST", wysiwyg.serverPath, true);
//     xhr.setRequestHeader('X-CSRF-Token', CSRFToken);
//
//     xhr.upload.onprogress = function(event) {
//       var progress = event.loaded / event.total * 100;
//
//       return attachment.setUploadProgress(progress);
//     };
//
//     xhr.onload = function() {
//       if (xhr.status >= 200 && xhr.status < 300) {
//         var data = JSON.parse(xhr.responseText);
//
//         data.href = data.url;
//
//         return attachment.setAttributes(data);
//       } else {
//         attachment.remove();
//
//         alert("Upload failed. Try to reload the page.");
//       }
//     };
//
//     return xhr.send(form);
//   };
//
//   function _trixAttachmentRemove(event) {
//     var attachment = event.attachment;
//     var data = attachment.getAttributes();
//
//     if (!data.id) { return false; }
//
//     $.ajax({ url: wysiwyg.serverPath + "/" + data.id, type: "delete" });
//   }
//
// })(jQuery, window, document);
//
// window.app.wysiwyg.config();
