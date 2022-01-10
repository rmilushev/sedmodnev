class HtmlUtils {
  static stripHtml(source) {
    return source.replace(/</g, '&lt;').replace(/>/g, '&gt;')
  }

  static urlEncode(source) {
    return encodeURIComponent(source)
  }

  static urlDecode(source) {
    return decodeURIComponent(source)
  }
}

export default HtmlUtils
