Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85018C13B;
	Tue,  6 Jan 2026 22:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767736941; cv=none; b=hcWJ5BbWHHAcTyndS8fv55fGTbPOrWsxjd3POElAZWQbzWf0O/hDmirEBiaJRfaWalhYaz+NT8VJ5TqCYAeMW8VISmNwcNCY3DS2dZQpizNxrOxP0q3gPiKilkfz//o2/NBaGaNej6XEH7iAWh3i3oQMhpW+jPmZiUth5z49m6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767736941; c=relaxed/simple;
	bh=ow5QUbl/BVZL70G69zafO9zToeMVLMMNrJZWqJGiAg4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eQmVNcdnW5VIvSTzfNtgMnaSRf6gmevvgnTgROlZlpQULleIF9gcOUYP2OQNDB9LF8nDIB3u9UcpvQtVLuF5WYs44wXHqLGrNT50cc7d0WaFRmXIg8Q5bM3hiVP19pAdEBAliG/8gIeIzENHwYjsDPR1h9rsdCKBlaM0+noAgAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sRgist88; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sRgist88"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EF74640C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767736940; bh=6C4lx2sIcacITKbSOK1BcozCt21qVZYWRPkVstSuk44=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sRgist88zoTDn1AORwo37O/i9HsH+NsD7ZOZ32ATEGCpmY19adPnihzUwJb2/LYE+
	 ARhUig02rQJQNRt3Ysj+7yaqqdVqKRBy+uaryhJqnMA64I79OzquL7SlmcvakZTS3i
	 k/oMYho6mwcOy1vUP1v3AdGFeaBVkAca+mhqto8F9HV7R/pt8y7z+aiLWoz6od8Qeb
	 k2YM4811eYRV/p4gq3NPYiFSxZMuSjAQw2I96wnf9yoEbOOomwd+Dq+tMfACGH0Z7v
	 Uec4XUxs2hc/17pKN8B6Qt1FNWCVJ+KYh9WX7Zq95Rr4AXbUQXOx02rqJWy5lKvQ8x
	 mHR1hXhoK0oyA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EF74640C7D;
	Tue,  6 Jan 2026 22:02:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vishal Singh <vishalrajput96156@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Vishal Singh
 <vishalrajput96156@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] docs: conf.py: drop stale FIXME about pdf index size
In-Reply-To: <20251223121543.401133-1-vishalrajput96156@gmail.com>
References: <20251223121543.401133-1-vishalrajput96156@gmail.com>
Date: Tue, 06 Jan 2026 15:02:19 -0700
Message-ID: <87eco2csd0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vishal Singh <vishalrajput96156@gmail.com> writes:

CC += Jani

> The comment describes intentional behavior and does not indicate
> unfinished work. Remove the FIXME marker and keep it as a normal
> explanatory comment.
>
> Signed-off-by: Vishal Singh <vishalrajput96156@gmail.com>
> ---
>  Documentation/conf.py | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 1ea2ae5c6276..7e0817469e86 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -572,9 +572,8 @@ epub_exclude_files = ["search.html"]
>  #
>  # See the Sphinx chapter of https://ralsina.me/static/manual.pdf
>  #
> -# FIXME: Do not add the index file here; the result will be too big. Adding
> -# multiple PDF files here actually tries to get the cross-referencing right
> -# *between* PDF files.
> +# Do not add the index file here; the result would be too big. Adding multiple
> +# PDF files here tries to keep cross-referencing correct *between* PDF files.

I think the comment doesn't have much to tell people either way, I
wonder if it can just go altogether.  Jani, what problem is actually
being described here?

Thanks,

jon
