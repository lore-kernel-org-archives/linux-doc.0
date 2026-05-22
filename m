Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C303AEB49;
	Fri, 22 May 2026 13:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456601; cv=none; b=R5ugbH/ZBoEOHalpAn4pbU041hMwXZsg48yZEL3f9uau5WJLc5nudzfJeurRi3uKoqW1NPCNmLOPV1awDLtX7D/w6e6Tww5CYd5l22BlSy7a5L/b1K7FKnsQeDJ8AVjRBHdv57mSOV2xeTMoyEFlgGndCDU1nEi3uDogiXwpNvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456601; c=relaxed/simple;
	bh=rCyOu9JLzXkaUjqAe9b9lMev4R9PVVH7ZFa06IgU2bA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BMBRIh+ChmUL5WypRuSpfJLnAlf7RpWhgA3X/dKt37XNgOGHp2VkfuTbiLNKwW+9cY0zUpLIAw8TtPEyBSiB4iLiY2JUXX1I+q7bfBQHQrWe2b7mx8332Ay4hcU4MYBcyFMwKcXfSz4BX11QRwX1/mjRflai4nmeItQKF1Ln6WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ekdqRlxI; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ekdqRlxI"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 53DE340E24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779456593; bh=0IE3ADjOn6A63eoEwUFCog4etJknRGr4fBE0QDME9NA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ekdqRlxIqDCU40U8uQ69u0A4BddD5Jx1Lf/Fat7KfU+seye680QGTXbUKQYlMo09N
	 EcoQ6dLTPZqViWcJOZFSVVVDLGGUwham58zAiNBynQR1i+L0ntcUSlfzh9+oesB29r
	 OvJ/wWAbCM7C50K9TPIOS8Ih3AQ08eJKOZN1EimzO8MKmju9bvRbwhafHlPagj5mKD
	 EascH/vCPevMY22ZbqOsR2SYbpjyf3/R0ZB8HzA2bs+OYShr0IxhsQMV1QfnLEV/Wq
	 1rLee8azS39oBqpDEh+0PhhZjqEZOanVLPTjtrvQjbgqxrSNIurJBridpl9uq2ZSw3
	 xHk5jtiptMiWQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 53DE340E24;
	Fri, 22 May 2026 13:29:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: omkarbhor4011@gmail.com
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Omkarbhor4011@gmail.com
Subject: Re: [PATCH] docs: fix typo in Sphinx custom CSS
In-Reply-To: <20260522003156.70389-1-omkarbhor4011@gmail.com>
References: <20260522003156.70389-1-omkarbhor4011@gmail.com>
Date: Fri, 22 May 2026 07:29:52 -0600
Message-ID: <87ik8f4lnz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

omkarbhor4011@gmail.com writes:

> From: omkarbhor4011 <Omkarbhor4011@gmail.com>
>
> Signed-off-by: omkarbhor4011 <Omkarbhor4011@gmail.com>

For future reference, please include a proper changelog and your full
name in the signoff.  That said,

> ---
>  Documentation/sphinx-static/custom.css | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index f91393426..5aa0a1ed9 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -30,7 +30,7 @@ img.logo {
>      margin-bottom: 20px;
>  }
>  
> -/* The default is to use -1em, wich makes it override text */
> +/* The default is to use -1em, which makes it override text */
>  li { text-indent: 0em; }

This one is already fixed in docs-next; that (or linux-next) is where
you should be preparing documentation patches.

Thanks,

jon
