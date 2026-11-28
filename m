Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876490;
	b=EryRzft64zy+87/2qGhydZOwcz+AJlI8gKFa02dW1IOe/OdpO1/LV90GskXhNCIdPijJ
	 MFEvIo9YIxkn7GBijju9SPLlqTm1Avp1QLe+lD7/vmrJYobwClJzfSJFrDC/3HzD1LpZV
	 bSFB/u942ip9aEGOmixre7xhn3R9PT1+I0DlE/ool64oIu5i32sv3I4cBGhKU4QOQTn/G
	 u/QSTOAbW/KSnkwwJoc2yLgG40OrN+YIaTNLKTuXkBZ710UzuIM8g78p+hxonEavIFh0R
	 sHMfVOj8xr56RQ2s1xNBw6CFpyAxbICFARRSU71iphUmEo4OMDzv+hmY3vXqxghlrVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876490;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ba82/DXHsGp7zImrCLEDml3NZDfk5cE/Qz7vmkljABw=;
	b=RnRpLhdI6EF8jXu/tiP1fMR9m7Ag9/zPx+1yqW4Kx9lEY6yw17ep74wm0zX2ox1aBjLK
	 f9C/nHiFTv6/1Xv5m9ni73qFLfla+TU8h0aV4LSTPEd//lRIY3gG7NdKmnKUX1FCA0d/L
	 9LfSD7XSR9Go+DW88pouk3Wcdj6P5a0HxUigggckGGcXmjA8f5xKtca51DFvDq8FywIOV
	 n75ntM2n36APC1GunXGNZlnC2jLvJFFNY/I0j2pGvg9WEeLkRL0TiCET+ygu9YeGUbVHA
	 U6gBi2cBtYUrrlUV97jzAXTYV0QBB/l3IC/Po5BsQ5QQKEcKI5QKYxz1iwWNZ4wFwBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=jw4T3eEB;
	arc=none smtp.remote-ip=95.215.58.217
Received: from mta1.migadu.com (out-217.mta1.migadu.com [95.215.58.217])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FEF606A31F
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 14:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2FEF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=jw4T3eEB
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BO/h53Ng34EMcvdjK8J7dduiAaDS2ZOqKazQyDtzkBo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795876487; v=1; x=1796481287;
 b=jw4T3eEBFLR52rJgwlTtfMGm22cRErZg24u9Y/R6AL+7okLT7iQ6jDfRQNeIzXkCuTbl19MN
 n81+bbTOAAFc75Q3IHG1eJUNIZN85BB9RPIeIODl1yVaMpY2T/bnacGgJvqXOH6JVIgpcz/oith
 325dtV3rAQobNo9RnBL+0FTtVJraUygGgsXvryBTb3cyaz5pvTmB4/qcAskDg9c3ralqYOHLE1H
 pgDxO3xOzknZ1P+ETxPW4PCNopFQ+UwX8GZplzvW1DvZQm2lsdAr5hsuHMAKEq7NvtIbwqgr6im
 no0kTtofgyBW76OiiHGZAyR7ze7Mw45kQTScsS4O7npTA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7a8542db2b98a6a7;
	Sat, 28 Nov 2026 14:34:47 +0000
X-Mizu-Trace-ID: 7a8542db2b98a6a7
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 22:34:43 +0800
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
Message-ID: <awrmgxPwwPICvTVG@wyuan.org>
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

[...]

> +Labels
> +------
> +
> +Sphinx labels (``.. _label:``) are global to the whole documentation
> +build.  A label copied unchanged from the original therefore defines the
> +same name twice, which breaks the build or, at best, makes references
> +resolve to the wrong document.
> +
> +- Labels placed at the very top of a file are usually not needed at all
> +  in the translation; simply drop them.
> +
> +- Labels that are needed, for example because other parts of the
> +  translated document refer to them, must be made unique by adding a
> +  language prefix.  Each translation already uses one; look at existing
> +  files to find it (``it_``, ``sp_``, ``cn_``, ``tw_``, ``pt_``, ...)::
> +
> +    .. _it_process_howto:
> +
> +- References to labels of the English documentation are fine and
> +  expected.  When the target document is not translated yet, linking to
> +  the English version is the right thing to do.

So sorry for bringing up this matter just now, here's what's recently
re-discussed in zh_CN:

Some contributors are adding unused (not referred) labels when sending
translations. Basically, in most(?) cases, they see this label in the
original English text, so they add it accordingly (and with "sp_").

So far, sorry that I haven't systematically investigated the situation
where these labels are cited. But I have come across some examples where
the labels in the original English text were not used at all. So the
labels in the newly added translation will definitely not be used. Or
there is another situation where the labels used in the original English
text come from articles that do not yet exist in this translation, or
vice versa.

For consistency, on the Simplified Chinese side, we have roughly decided
to follow the first principle, that is, do not add labels that have not
been used; if it needs to be used in the future, then add it in the
subsequent patches. However, it should be pointed out that this might
require more work from contributors and reviewers, because sphinx does
not warn labels that are not in use; therefore I mainly grep them every
time.

The following point may be beyond the scope of discussion in this patch
set: Currently, it is not seen in the existing documentation (sorry if I
missed any docs): Do not add unused labels. Do we need to notify it in
the existing documents not to do this? This might be helpful in
preventing the introduction of unused labels in new translations.

This is only the discussion result reached between me and Dongliang Mu.
It may not be applicable to all languages. Suggestions from everyone are
welcome as well.

Related thread:

https://lore.kernel.org/linux-doc/9d2b25e4-c5a0-4ef0-8698-1a622d05223e@hust.edu.cn/

Thanks.

