Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441324;
	b=ydIVSEJStQBo0CKdddRADI6c7ZLEbU8/z8tLusv/d2I5z9LYXM2W5NFI14U89UgjzDA/
	 dV9tIYg5dOd4gO/V/OiGLYOBlop62FZNEDf1b+uSeBnmZCX3w7TEN6ItgmQctrxkNKg6j
	 pINMuXIsI3FtfUFWLF9IM+Hr+9w16fpjAeFcy6RB07NKWydF8rs9hG9DF0dDM3KT/4bxf
	 2SPnLPOY/s/Bl+mykTnrs0LrQOTa4zvr0LXg2Acr8qgvcymoW0d3atKQlSo+hqHbOnVGZ
	 vpYv86FmtWixqA5tcBc5JcwPPZdNhKVs/VH9WDrok9Jh+lU5QG9uD9LookmlN2qn6mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441324;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GGnM0TZCofw/NWgW1vYpZRtaqJU+biK+2YkRW/4cIC8=;
	b=H+tWpGWrxnqwtCXSPnA7OYK0zrXvct/syDiCgsU8FKDWkolSuRksMG+6Zq+5YfybNE2y
	 Lvlk4k8bFhFomLP+owrPnpwYPtjtaEOKCBTmiCNsx+Z4SxtTxI9xzcxgRrw2LeEnf9DJU
	 RB0hfPj0UUXqrzc1jEoybFLrUXslkpUKwJ58NglVb8ZOsVsMtqwru3d/U02NbtWCqcje+
	 K43fu2+B2pr68n4bdPB4wUFjsyuU2OryVAfIXAMgG/cKC2GNQVxmuE72RP951XrKH21C/
	 2Cx4T8x8g3HFeOYBufo3rV6jycW3FmAHTq9cPte60LZr+BSpGM/Vlp3igBI+Ng/EwRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=faabQryq;
	arc=none smtp.remote-ip=95.215.58.149
Received: from mta1.migadu.com (out-149.mta1.migadu.com [95.215.58.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67568606A695
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 13:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67568606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=faabQryq
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9M2PxqsBIT5oufgzXeepgRVpkrLEF6NDh3LaxXiKaPs=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795441320; v=1; x=1796046120;
 b=faabQryqhpI7sWN12aKNkKNNdNKFtwncuHJb1a/9yhKTycu71GR9pAdoyqIURYOj0ZdgRkDd
 HacX3WI0GaT8OeM2D7X/jqFK7teMnFJ8QFIh/JhjW4f5s4bdEDAsruA7LTGZ+Ftg2KkYnays93j
 zKqUvlqCETsinHmDV19wnJNvIZKqQyw7KvSXWtkGTfE5MzcXZJrQxzSzeFyxVfstAJ0ta2LbWtA
 nXYpVhjapzoZxG0ttEzG5lqjJb6kR1zAgajbWVaovnScWR/79DOz+NC0z6PvfRTfPRnmNGA5gmC
 OixtiooC2l2PvcuvJw+CmnpvJsiZqnFxCasL91Xvr77fw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b8e188c9b65a6afe;
	Mon, 23 Nov 2026 13:42:00 +0000
X-Mizu-Trace-ID: b8e188c9b65a6afe
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 21:41:56 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] docs: doc-guide: add a guide for translators
Message-ID: <awRCpJIjpKMbA2J5@wyuan.org>
References: <20261119041009.63651-1-danielmaraboo@gmail.com>
 <20261119041009.63651-2-danielmaraboo@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119041009.63651-2-danielmaraboo@gmail.com>

On Thu, Nov 19, 2026 at 01:10:08AM -0300, Daniel Pereira wrote:
> The documentation has seven translations, but nothing in the English
> documentation explains how to contribute to them. The only guide that
> exists, Documentation/translations/zh_CN/how-to.rst, is written in
> Chinese and covers the zh_CN translation only.
> 
> As a result, the same problems come up over and over in the review of
> translation patches: labels and citations copied from the original,
> which are global in Sphinx and collide with the English ones; partial
> builds with SPHINXDIRS that hide those collisions; lines over 80
> columns; translations not added to any toctree; missing commit
> descriptions, tags separated by blank lines, HTML email rejected by the
> lists, and the documentation maintainer left out of the recipients.
> 
> Add Documentation/doc-guide/translations.rst, a guide that covers the
> whole workflow of a translation: choosing what to translate, the layout
> of a translated document (path, header, labels, citations,
> cross-references, what must not be translated), translation quality and
> terminology, adding the document to the build, checking it, preparing
> and sending the patch, the review process, keeping translations up to
> date and starting a new translation. The commit message format it
> suggests is the one already recognized by tools/docs/checktransupdate.py.
> 
> Link the guide from the doc-guide index and from the translations
> index.
> 
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>

Acked-by: Weijie Yuan <wy@wyuan.org>

Thanks!

> ---
> Changes in v3:
> - State the path-mirroring rule explicitly, and exempt documents that
>   exist only in a translation, such as a glossary or a language-specific
>   how-to (Chen-Yu Yeh, Dongliang Mu, Weijie Yuan).
> - Make ":Original:" optional, needed only when the path does not mirror
>   the original, and drop it from the header example (Jani Nikula, Weijie
>   Yuan, Dongliang Mu).
> - Drop the sections that duplicated Documentation/doc-guide/sphinx.rst
>   and Documentation/process/submitting-patches.rst, keeping only the
>   points specific to translations, and link to those documents instead
>   (Federico Vaga, Jonathan Corbet).
> - Encourage translators to send a fix for the English original when they
>   find a problem in it while translating (Jonathan Corbet).
> - Mention b4 as an alternative for preparing and sending a patch series
>   (Weijie Yuan).
> - Drop avadhut.naik@amd.com from the recipients; the address bounced
>   twice on v2.
