Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FED36AB59
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770150012; cv=none; b=m/cHKmb7V3SnzPnbKjXf1OFsK/F8hBOKh1XU3tTLUNTVPlrHuFiwYsd5qpJUldP2WlotPiOLhV/CZnJu7AeZon2q0wR2TQqzMKhWiDBhmkDUS/z3U3VbaKmNh1HENOPd/PzGeWJUFrVvhLwjxygxvnqI4PpyeviZsvi61lIolJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770150012; c=relaxed/simple;
	bh=KNAz9P+MREIhPSokwvSCnEkWtR776uGMELJFJcVu150=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYHpdKnNcNEvJ8nqdtuAIFQXOeWCIhEsZEs9iuQI/6Z7Svj82iCdfEpXfVVhfoY5K0FmfCoOPALdTTLVOrPPPosh/ZJI+1Z9uO+orI0gdLKWKkfAqGr5fX67TG706V6mfoBnzo/7kKcfjVEOu3AyOV91ujh8vwTqtbrVlIqwwUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CBFCLDo7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CBFCLDo7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iFy4eB9AArm7Jn7no0+dr9bAsL0REntrFrp24B9Mhug=; b=CBFCLDo7mRxLZWvtvN+bmB9JEr
	qSGHzTo+3T09mCEPSOe3Fh9QG/kIjSHhCabmBxuEk9y0+enWVVUzcCK8AJPwAto4t6LzT6RgkHwz2
	huLPV9sXF+tiDZMuAFyLK7A8qwezfOCHBsGfC1NAuEoaVe07Jc6ExuBMDPyewfOomlO9QdcxduITn
	+spDVj09cYO/H31ND4hdxubMjfOX3IL2D9P4U65Ez+MgnUedFOF9Gmm66vvyNXsrvB/w0GfoHbLki
	gJOMetjpo/MI+PPRVgRWH30qZtelM8RTbNgUh1w/yh3iPSTnTfYK2EQdhhnS7qmA/+svEy7AzmLWK
	Ra3mIS4g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnMsS-000000010Yq-30ve;
	Tue, 03 Feb 2026 20:20:00 +0000
Date: Tue, 3 Feb 2026 20:20:00 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Daniel <danielmaraboo@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4] docs: pt_BR: add initial Portuguese translation
Message-ID: <aYJYcBZh3fxvpXLM@casper.infradead.org>
References: <20260203184826.81594-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203184826.81594-1-danielmaraboo@gmail.com>

On Tue, Feb 03, 2026 at 03:48:20PM -0300, Daniel wrote:
> diff --git a/Documentation/translations/index.rst b/Documentation/translations/index.rst
> index b826c3479..409b6a84e 100644
> --- a/Documentation/translations/index.rst
> +++ b/Documentation/translations/index.rst
> @@ -11,10 +11,12 @@ Translations
>     zh_TW/index
>     it_IT/index
>     ko_KR/index
> +   pt_BR/index
>     ja_JP/index
>     sp_SP/index
>  
>  
> +

This seems an unnecessary blank line?

> +Becoming A Kernel Developer
> +---------------------------

Is there a reason to not translate this one heading?


I have a delicate question ... how different are Brazilian and European
Portuguese for technical documentation?  We have similar questions for
other languages; for example we freely mix Commonwealth and American
spellings in the English documentation because they're mutually
intelligible, but split Traditional and Simplified Chinese because
they're quite different from each other.

