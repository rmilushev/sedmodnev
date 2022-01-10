# opengraph TinyMCE Plugin [![npm][npm-image]][npm-url]

[npm-image]: https://img.shields.io/npm/v/tinymce-plugin-opengraph.svg
[npm-url]: https://npmjs.org/package/tinymce-plugin-opengraph


Welcome stranger! This is a repo containing the opengraph TinyMCE plugin.

## use

```
tinymce.init({
	selector:'textarea',
	plugins: 'opengraph code autoresize',
	toolbar: 'opengraph code',
	opengraph: {
		fetch_handler: (url, callback) => {
			// summary
			callback({
				description: "안녕하세요, TISTORY입니다. 지난 2월 2일부터 시범운영한 로그인 보안 기능을 정식 오픈합니다. 현재까지 3천 여개의 계정에서 사용 중이며 등록된 기기는 7천 여개에 달합니다. 많은 분들의 사용으로 안정성을 확인하였으므로 이제 모든 계정에 로그인 보안 기능을 활성화하려고 합니다 로그인 보안 바로가기 Q&A 정식 오픈으로 무엇이 달라지나요? 모든 계정에 로그인 보안이 기본적으로 활성화됩니다. 시범운영 기간 동안에..",
				host: "notice.tistory.com",
				mediaUrl: "",
				image: "http://alpha-scrap-kage.kakao.com/dn/gxM4i/bAOctTqOOio/teqswemQhKHmCrMDQQPE5k/800x400.jpg",
				title: "당신의 블로그는 안전한가요? - 로그인 보안 기능 정식 오픈 로그인 보안 기능 정식 오픈",
				type: "article",
				url: "http://notice.tistory.com/2384"
			})

			// media (use iframe)
			callback({
				description: "자유를 위해, 가족을 위해, 이 땅을 위해! '혹성탈출: 종의 전쟁(War for the Planet of the Apes)' 1차 예고편 --------- 영화 소개 --------- ▶장르(Genre) : 액션(Action), 모험(Adventure), 드라마(Drama) ▶...",
				host : "www.youtube.com",
				image : "http://alpha-scrap-kage.kakao.com/dn/bdCUUx/bAOctSZKJLJ/05seb13v3KWr2SOs9bEjIK/800x400.jpg",
				mediaUrl : "https://www.youtube.com/embed/W28VlDoJwGo",
				title : "[혹성탈출: 종의 전쟁] 1차 예고편 War for the Planet of the Apes 앤디 서키스,우디 해럴슨, 주디 그리어, 맷 리브스 감독 (한국어 CC)",
				type : "video",
				url : "https://www.youtube.com/watch?v=W28VlDoJwGo"
			})
		}
	}
})
```

## The development server

By running the `npm start` command you start the development server and open a browser window with an instance of TinyMCE with your plugin added to it. This window will reload automatically whenever a change is detected in the `index.html` file in the `static` folder or in one of the JavaScript files in the `src` directory.

## The production build

By running the `npm run build` command Webpack will create a `dist` directory with a child directory with the name of your plugin (opengraph) containing three files:

* `plugin.js` - the bundled plugin
* `plugin.min.js` - the bundles, uglified and minified plugin
* `LICENSE` - a file explaining the license of your plugin (copied over from `src/LICENSE`) 
