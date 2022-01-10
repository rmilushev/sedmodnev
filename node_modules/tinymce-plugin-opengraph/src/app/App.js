import { isURL, validation } from './validate'
import OpengraphRenderer from '../renderer/OpengraphRenderer'
import OpengraphPreviewRenderer from '../renderer/OpengraphPreviewRenderer'
import SourceRenderer from '../renderer/SourceRenderer'

import autobind from 'autobind-decorator'

const STATUS_READY = 1
const STATUS_FETCHING = 2
const STATUS_VIEW = 3
const STATUS_FAILED = 4

const MODE_MEDIA = 1
const MODE_SOURCE = 2

class App {
  constructor(editor) {
    this.editor = editor
    this.win = null
    this.opengraph = null
    this.source = ''
    this.status = STATUS_READY
    this.mode = MODE_MEDIA

    this.fetchHandler = this.editor.settings.opengraph && this.editor.settings.opengraph.fetch_handler ? this.editor.settings.opengraph.fetch_handler : () => {}
  }

  open() {
    this.win = this.makeWindow()
    this.initView()
    this.attachViewEvent()
    this.updateView()
    this.$input[0].focus()
  }

  makeWindow() {
    return this.editor.windowManager.open({
      title: '미디어 삽입',
      width: 600,
      height: 480,
      body: {
        type: 'panel', 
        items: [
          {
            type: 'htmlpanel',
            name: 'opengraph',
            html: `<div class="mce-opengraph media">
              <div class="mce-opengraph-media">
                <div class="mce-opengraph-header">
                  <form class="opengraph-search-form">
                    <input class="mce-opengraph-input" placeholder="http://url">
                    <button class="mce-opengraph-search" disabled="disabled">확인</button>
                  </form>
                </div>
                <div class="mce-opengraph-body"></div>
              </div>
              <div class="mce-opengraph-source">
                <textarea class="mce-opengraph-textarea" placeholder="<iframe src='media-url' />"></textarea>
              </div>
            </div>`
          }
        ]
      },
      buttons: [
        {
          type: 'custom',
          name: 'toggle-mode',
          text: 'source',
          align: 'start'
        },
        {
          type: 'cancel',
          name: 'cancel',
          align: 'end',
          text: '취소'
        },
        {
          type: 'submit',
          name: 'save',
          align: 'end',
          text: '삽입',
          primary: true
        }
      ],
      onAction: this.handleOnAction,
      onSubmit: this.handleOnSubmit,
      onCancel: this.handleOnCancel,
    })
  }

  initView() {
    const $ = this.editor.$
    const $area = $(document.getElementsByClassName('mce-opengraph')[0])
    this.$searchForm = $area.find('.opengraph-search-form')
    this.$input = $area.find('.mce-opengraph-input')
    this.$btnSearch = $area.find('.mce-opengraph-search')
    this.$body = $area.find('.mce-opengraph-body')
    this.$source = $area.find('.mce-opengraph-source .mce-opengraph-textarea')
    this.$area = $area
  }

  @autobind
  handleOnAction(api, data) {
    if (data.name != 'toggle-mode') {
      return
    }

    if (this.mode == MODE_MEDIA) {
      this.handleChangeSourceMode()
    } else {
      this.handleChangeMediaMode()
    }
  }

  @autobind
  handleOnSubmit() {
    const { editor, opengraph, mode, source, win } = this

    let renderer
    if (mode == MODE_MEDIA) {
      renderer = new OpengraphRenderer(opengraph)
    } else if (mode == MODE_SOURCE) {
      renderer = new SourceRenderer(editor.$(source))
    }

    if (renderer) {
      editor.insertContent(renderer.render())
      editor.nodeChanged()
    }
    win.close()
    this.detachViewEvent()
  }

  @autobind
  handleOnCancel() {
    this.detachViewEvent()
  }

  attachViewEvent() {
    this.$searchForm.on('submit', e => {
      e.preventDefault()
      this.fetchOpengraph(this.$input[0].value)
    })

    this.$input.on('keyup', e => {
      if (isURL(e.target.value, true)) {
        this.$btnSearch.removeAttr('disabled')
      } else {
        this.$btnSearch.attr('disabled', 'disabled')
      }
    })

    this.$source.on('change', e => {
      this.source = e.target.value
    })
  }

  detachViewEvent() {
    if (this.win) {
      this.$searchForm.off('submit')
      this.$input.off("keyup")
      
      this.opengraph = null
      this.$searchForm = null
      this.$input = null
      this.$btnSearch = null
      this.$body = null
      this.$source = null
      this.status = STATUS_READY
      this.win = null
    }
  }


  updateView() {
    const { $body, status, mode } = this
    if (mode == MODE_MEDIA) {
      switch (status) {
        case (STATUS_VIEW):
          this.showOpengraph()
          break;
        case (STATUS_FAILED):
          $body.html("미리보기를 불러오지 못했습니다.")
          break;
        case (STATUS_FETCHING):
          $body.html("<span class='ico_blog ico_loading'></span>")
          break;
        default:
          $body.html("이 곳에 미리보기가 표시됩니다.")
      }
    }
    
  }

  fetchOpengraph(value) {
    if (!value || !isURL(value, true)) {
      return
    }

    this.status = STATUS_FETCHING
    this.updateView()

    this.fetchHandler(validation(value), (data) => {
      if (data) {
        this.opengraph = data
        this.status = STATUS_VIEW
      } else {
        this.status = STATUS_FAILED
      }
      this.updateView()
    })
  }

  showOpengraph() {
    const { opengraph, $body } = this
    let renderer = new OpengraphPreviewRenderer(opengraph)
    $body.html(renderer.render())
  }

  @autobind
  onSourceChange(e) {
    this.source = this.$source[0].value
    // this.updateView()
  }

  @autobind
  handleChangeSourceMode() {
    this.$area.addClass('source').removeClass('media')
    this.mode = MODE_SOURCE
    this.updateView()
    this.$source[0].focus()
  }

  @autobind
  handleChangeMediaMode() {
    this.$area.addClass('media').removeClass('source')
    this.mode = MODE_MEDIA
    this.updateView()
    this.$input[0].focus()
  }
}

export default App
