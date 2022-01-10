import HtmlUtils from "./HtmlUtils"
import SourceData from "./SourceData";

class SourceRenderer {
  constructor($elm) {
    this.$elm = $elm
  }

  render() {
    const { $elm } = this

    let result = ''
    $elm.each((idx, elm) => {
      result += this.renderElement(elm) 
    })

    return result
  }

  renderElement(elm) {
    let data = new SourceData(elm)

    if (!data.canRender()) {
      return data.getRawSource()
    }

    return `<div contentEditable="false" data-opengraph-source="${data.getSource()}" style="position: relative;max-width: 470px;max-height: 300px;box-shadow: 0 1px 5px #999;margin: 10px auto 30px;">
      <div style="height: 40px;line-height: 40px;padding: 0 20px;font-size: 16px;font-weight: bold;background-color:#fafafa;border-bottom: 1px solid #ddd;">${data.getTitle()}</div>
      <div style="font-size:12px;padding: 20px;font-family: monospace;color:#999;word-break: break-all;">${data.getContent()}</div>
    </div>`
  }
}

export default SourceRenderer
