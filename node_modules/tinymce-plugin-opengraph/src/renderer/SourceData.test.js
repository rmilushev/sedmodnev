import SourceData from "./SourceData";

describe('can render', () => {
  test('script can render', () => {
    const target = new SourceData({
      tagName: 'script'
    })
    expect(target.canRender()).toBe(true)
  })
  
  test('iframe can render', () => {
    const target = new SourceData({
      tagName: 'iframe',
      src: 'http://github.com'
    })
    expect(target.canRender()).toBe(true)
  })
  
  test('youtube cannot render', () => {
    const target = new SourceData({
      tagName: 'iframe',
      src: 'https://www.youtube.com/watch/12345'
    })
    expect(target.canRender()).toBe(false)
  })

  test('soundcloud cannot render', () => {
    const target = new SourceData({
      tagName: 'iframe',
      src: 'https://w.soundcloud.com/player/fff'
    })
    expect(target.canRender()).toBe(false)
  })
})

describe('get title', () => {
  test('unknownname', () => {
    const target = new SourceData({
      tagName: 'script',
      src: 'http://test.com'
    })
    expect(target.getTitle()).toBe('SCRIPT')
  })

  test('GIST', () => {
    const target = new SourceData({
      tagName: 'script',
      src: 'https://gist.github.com'
    })
    expect(target.getTitle()).toBe('GIST')
  })

  test('GOOGLE MAPS', () => {
    const target = new SourceData({
      tagName: 'iframe',
      src: 'https://www.google.com/maps'
    })
    expect(target.getTitle()).toBe('GOOGLE MAPS')
  })

})
