import { isURL, validation } from './validate'

it('validate url', () => {
  expect(isURL('http://www.daum.net')).toBe(true)
  expect(isURL('http://a.com')).toBe(true)
  expect(isURL('a.com', true)).toBe(true)
})


it('validation url', () => {
  expect(validation('http://www.daum.net')).toBe('http://www.daum.net')
  expect(validation('http://a.com')).toBe('http://a.com')
  expect(validation('a.com')).toBe('http://a.com')
})

