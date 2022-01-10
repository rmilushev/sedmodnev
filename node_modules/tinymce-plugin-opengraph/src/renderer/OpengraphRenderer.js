
class OpengraphRenderer {
	constructor(opengraph) {
		this.opengraph = opengraph
	}

	render() {
		const { mediaUrl } = this.opengraph
		if (mediaUrl) {
			return this.renderMedia()
		} else {
			return this.renderSummary()
		}
	}

	renderMedia() {
		const { mediaUrl, url, image, title } = this.opengraph
		return `<iframe src="${mediaUrl}" data-opengraph-url="${url}" data-opengraph-image="${image}" data-opengraph-title="${encodeURIComponent(title)}" width="560" height="315" frameborder="0" allowfullscreen></iframe>`
	}

	renderSummary() {
		const { image, title, description, host, url } = this.opengraph
    let body = ''
		if (image) {
			body += `<div style="width:100px; height:100px; overflow:hidden; display:flex; justify-content: center;align-items: center; background-color: #000;">
				<a href="${url}" style="width:100px;height:100px;display:flex;justify-items: center;align-items: center;"><img style="max-width:100%; max-height:100%" src="${image}"></a>
			</div>`
		}
		body += `<div style="position:absolute; left:${image? 100 : 0}px; right:0; top:0; bottom:0; padding:10px; box-sizing:border-box">
			<a href="${url}" style="display:block; font-weight:500; font-size:18px; overflow: hidden; word-wrap: break-word; line-height:25px; text-overflow: ellipsis; white-space:nowrap; color:#666; text-decoration:none">${title}</a>
			<div style="font-size:12px; line-height:18px; height:36px; white-space: normal;-webkit-line-clamp: 2; -webkit-box-orient: vertical; text-overflow: ellipsis; display: -webkit-box; overflow:hidden; color:#666">${description}</div>
			<div style="font-size:11px; color:#999; line-height:14px">${host}</div>
		</div>`
		return `<div class="opengraph" style="position:relative; height:100px; box-shadow:0 1px 5px #999; margin: 10px auto 30px;overflow:hidden;"
			data-opengraph-image="${image}" data-opengraph-title="${title}"
			data-opengraph-description="${description}" data-opengraph-host="${host}"
			data-opengraph-url="${url}">
			${body}
		</div>`
	}
}

export default OpengraphRenderer
