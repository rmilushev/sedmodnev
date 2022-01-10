import '../style/index.scss'
import App from './App'
import SourceRenderer from '../renderer/SourceRenderer'
import HtmlUtils from '../renderer/HtmlUtils';

const plugin = (editor) => {
  let app = new App(editor)
  const $ = editor.$

  editor.ui.registry.addButton('opengraph', {
    icon: 'embed',
    tooltip: '미디어',
    onAction: () => {
      editor.execCommand('mceOpengraph')
    }
  })

  editor.addCommand('mceOpengraph', () => {
    app.open()
  })

  editor.on("PreProcess", e => {
    $('[data-opengraph-url]', e.node).each((idx, elm) => {
      $(elm).removeAttr("contentEditable")
    })
    $('[data-opengraph-source]', e.node).each((idx, elm) => {
      elm.outerHTML = HtmlUtils.urlDecode($(elm).attr('data-opengraph-source'))
    })
  })

  editor.on("SetContent", e => {
    $('iframe, script').each((idx, elm) => {
      let renderer = new SourceRenderer($(elm))
      elm.outerHTML = renderer.render()
    })
    $('[data-opengraph-url]').each((idx, elm) => {
      elm.contentEditable = false
    })
  })

  editor.shortcuts.add('meta+o', 'Opengraph', 'mceOpengraph')
}

export default plugin;
