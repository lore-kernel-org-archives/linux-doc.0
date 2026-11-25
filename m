Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620572;
	b=JMNqI2a6uKNidWYRfMZp5Qb3DiHZsMWrlFeH5zVR8ob9XbYIfFvdDStI1D2A/GYNahUo
	 iJbp6m9CvLJDlsYMYlBPSOOFMSeXiU6UDMCvP6coZoIRGlj0r/f3Aqpnq8HCkX9FXf+x7
	 MwOBKEBEBrDafQUCTiLZH9c/dGfTTyMGszPa0YWQZzEuBlGiJYRQ9DRpDOov5JjYMVHLd
	 HDlvEZNXXAl6qHVtMS8avIfAKjqJdwcqkiOmJ0ThXaUNhgbwDoEGuMV7CyBixPjCBsLG1
	 WgfUPCPPfOw//Ta20SfaXfvnu8XfgUpi5HtvzKUFNNocVM1QcnWL9rsMxxHq5uSqPXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620572;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=XxZNqoOP0eI7+1VsBPbwEPbuYDffz2H0UqXKKI/BgPw=;
	b=oxq3C5AyrLOYMJCWDNSMZmKYroKFXNgad3opyKGFTeyHOLLzeVERfLRs4XCxDayJFuZe
	 Lu8A/cUOw4uCngctm3YgPobfhsrZ0qiQJLP8dSePQNuKUKO0tfBylQOVSB7tPPWzQB7fR
	 Q89PHFiiCNMB2eyDh3qIVsFbOYL+4A7u0s+/RXC6pQRPRkz8TjYOmwtNK1VUP0XvRMdg/
	 Xs0IIAh7ApQkf83yh0AIyC7X5mOowZeZfq8dpM5CVsYQYqBCp+yOz4hnY9md1DxDgPHLF
	 RF4++l/3W7gXTK6GxH7Q92wULvdlgM8jTHtqzw4f4NlaEww39iqh6pPRgpTRgs8Ak/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=s5AwtU5x;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED66C606A31E;
	Wed, 25 Nov 2026 15:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED66C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=s5AwtU5x
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 055B7410DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795620571; bh=XxZNqoOP0eI7+1VsBPbwEPbuYDffz2H0UqXKKI/BgPw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=s5AwtU5x73Gwar9DPlhMCe7VIbnZoUGTk07zmeRiQt8Za3JCufiV+mt9FfUBl3Shc
	 5oY/bEE9G8BORr8gMrqz3HoVaA3hw0wNUQEAlkN3fTN2RIMHlhTnIgEKQ8ICATDv7P
	 Ra76i+7WM8R6/1+i+KXAWk+tUhEgrFHKe8gl+RgqTEAv261ZmqU/TA4l2ie3mKunHo
	 duOBJnMv4dd/MaXoZq5InfroOdwPJJKNeOfWbEJaTYHjWKmrj61lt8qXuZTKnfGgIa
	 dKMmbgYYLOH8JTgq7V/uGH77LlemDfDPzBY5SxkZpiaJv267BFBF1DjyoP8g6LvBBp
	 Eq8mgx/6F0Z9g==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 055B7410DA;
	Wed, 25 Nov 2026 15:29:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sean Lyon <sean@seanlyon.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Lyon <sean@seanlyon.dev>
Subject: Re: [PATCH] docs: conf.py: register sphinx_rtd_theme as an extension
In-Reply-To: <20261119195117.32709-1-sean@seanlyon.dev>
References: <20261119195117.32709-1-sean@seanlyon.dev>
Date: Wed, 25 Nov 2026 08:29:20 -0700
Message-ID: <87y0ahx73j.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Sean Lyon <sean@seanlyon.dev> writes:

> The sphinx_rtd_theme sidebar has collapsible sections. The theme uses
> jQuery to add the toctree-expand buttons that control them.
>
> Sphinx 6 stopped bundling jQuery. Since sphinx_rtd_theme 1.2.0, the
> theme's setup() enables the sphinxcontrib-jquery extension to load it,
> but setup() does not run when the theme is loaded through
> html_theme_path. Without jQuery, the buttons are never added, so sidebar
> sections cannot be collapsed.
>
> Register sphinx_rtd_theme as an extension so its setup() runs. The
> setup() also registers the theme, so html_theme_path is no longer
> needed, and sphinx_rtd_theme 3.0 warns that it is deprecated.
>
> Signed-off-by: Sean Lyon <sean@seanlyon.dev>
> ---
> Note for testers: with Sphinx >= 8.1, some pages (e.g. core-api/) expand
> more than one sidebar section. This also happens without this patch. It
> comes from documents included in multiple toctrees. Sphinx warns about
> these documents, but the warnings are only shown with make V=1 htmldocs.
> I'm looking into this separately and plan to send an RFC.
>
> Tested with sphinx_rtd_theme 3.1.0 and sphinx_rtd_dark_mode 1.3.0 on
> Sphinx 9.2.0, and on min_requirements.txt with sphinx_rtd_theme 1.3.0.
> No new build warnings, and the get_html_theme_path deprecation warning
> is gone.

Just to be clear, which versions of Sphinx have you tested this with?

Thanks,

jon
