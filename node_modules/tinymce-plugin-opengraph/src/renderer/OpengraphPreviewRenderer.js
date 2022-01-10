import OpengraphRenderer from './OpengraphRenderer'

class OpengraphPreviewRenderer extends OpengraphRenderer {

	renderMedia() {
		const { mediaUrl, url } = this.opengraph
		return `<div class="mce-opengraph-video-preview">
			<iframe src="${mediaUrl}" data-opengraph-url="${url}" frameborder="0" allowfullscreen>
		</div>`
	}

	renderSummary() {
		const { image, title, description, host, url } = this.opengraph
		let body = ''
		body = ''
		if (image) {
			body += `<div class="mce-opengraph-image">
				<img src="${image}">
			</div>`
		}
		body += `<div class="mce-opengraph-content" ${image? '' : 'style="left:0;"'}>
			<div class="mce-opengraph-title">${title}</div>
			<div class="mce-opengraph-description">${description}</div>
			<div class="mce-opengraph-host">${host}</div>
		</div>`
		return `<div class="mce-opengraph-preview">${body}</div>`
	}

}

export default OpengraphPreviewRenderer
