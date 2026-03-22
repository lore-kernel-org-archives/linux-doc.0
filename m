Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EC01D5CFB;
	Sun, 22 Mar 2026 20:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774212053; cv=none; b=Ww8Jzj9G8TnaD9BHjAp3CAQhmWRfNfcVf9HuljvEhPsRX2pMonCzF1sxRoHpKlhbBRUXR6zQnIC5wwdz2gvThy8dxF/3JN+sSZe7HvEjg7/Le0Bp6CszyBsPZ64UmKze8j1hhybKUHtpKA7QXaP0UbTflx84Asv3IKqrSBjs12c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774212053; c=relaxed/simple;
	bh=9C5yrzVrVTDGAjlLbQr+nrcb6A4GfZCAzIslqW/2SIA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rdTks9alGXIq7H7uehSlnvioRfZ/rVhiYELA4JZ1T2dCoUrTbb6Kmm1XolJENe6NKjY7f+9mfZdh7iiLdNOHOoiXtBRs9vQVfCg7nW7A9IP02J1SEaFixV7Rzm+GmkyXsWtbDGt+mLbgVeWSzaBkwbcGb56GFqx/EWWTmJUa6V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VdUBLfxd; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VdUBLfxd"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 26327411E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774212052; bh=fQ1fSPK511MJpj/8Y0FZ9LDhkI9z7WV1jdEbs3wsCbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VdUBLfxd3AU/vvmK9/f5WKA9sfwCpT7egYZNClfoWPAunFOfKnOSubMLbVNb/GuCL
	 AkfO7A0FT2doejl98rA8Cka8WC2m4wdvAXNcumME7xdUYFgtQMNabYQDHdiBWu3AgX
	 9eY2GIVW82a/FawCN9Idrbb3R+v+5gIGRIivEFwhSrAtQ6n9i1BSE4sMtg1gneMlBN
	 WonioFStNEH1ghBs2cbhd0enKN91IrlVP9ahr8NnTAV7CflKOhaRFj/D1TdrI02hW/
	 MgrRBZZ8Nai3hcHksrXtXBovQz5c6oRZ9pGR9RIagrlk+LJRIOMhiBbW11cCiLMPGp
	 7AORxJqzc4QEA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 26327411E2;
	Sun, 22 Mar 2026 20:40:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rito Rhymes <rito@ritovision.com>
Subject: Re: [PATCH] docs: set canonical base URL for HTML output
In-Reply-To: <20260321124907.8524-1-rito@ritovision.com>
References: <20260321124907.8524-1-rito@ritovision.com>
Date: Sun, 22 Mar 2026 14:40:51 -0600
Message-ID: <87zf3zd2cs.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Rito Rhymes <rito@ritovision.com> writes:

> Set the published docs URL as html_baseurl so generated HTML pages
> advertise the correct canonical URL metadata.
>
> This helps search engines and other consumers treat docs.kernel.org as
> the canonical location for published documentation pages.
>
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> ---
>  Documentation/conf.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 679861503..f517dfeaf 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -437,6 +437,9 @@ sys.stderr.write("Using %s theme\n" % html_theme)
>  # so a file named "default.css" will overwrite the builtin "default.css".
>  html_static_path = ["sphinx-static"]
>  
> +# Canonical base URL for generated HTML pages.
> +html_baseurl = "https://docs.kernel.org/"
> +

What problem does this actually solve; what isn't working as well as it
should due to the lack of this configuration?

...and how does it help all of the people who do their own docs builds?

Thanks,

jon
