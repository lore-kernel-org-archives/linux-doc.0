Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7AF362156
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235947; cv=none; b=XBMgdQwVSk5CpccwZBB6UqnYYzfMgm25z+h7vB6i/d2zXXJeHfPaqPL+CV92G0XbaT7tNVsKC8XN6Isfs5hjhLgMJrAPXYseX77Pkljrtynfr4+mo8yj3vN9bKzI3/6/7S4W+9jbnmV8mi0PZsgRGYqGiloMmRI9Nx0TmQhPeMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235947; c=relaxed/simple;
	bh=1U7nwB7NB3cgEbxAyz7PCm4JBmU9EAkuaaDsRLIuTw0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OeoZmo5CcBh54BscJl5XBoAR3CpEsIDMFsE9uqvJoqoDCkzNF3C/SFOtHi1BO+XLNq/TiKb/lGi/gLdjKXjBBt8GCbhBA1eODGMbZzJguVlxRGtvxAUnkDyL2j8OaH452v+ErdW2GQNCONbAijLOCfViLroYv5mZ567DJIy2NC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IrPCAygc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IrPCAygc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 948B740C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768235945; bh=NJ+LC/IGba2jtiExqnG8n0XxirHLnw52tr08OzBCnmE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IrPCAygc6iUyF/dYtrIKe75PwYfW/4X41YwX1nxFV4JMS7VmY0/pmuBFPiXiUHw+M
	 DPX7FPlzRZyyUFC97SbUDWgoONDC4Xm37pS8Zj+vctMkZjWDXP2B65Nwkee64NqYH1
	 0izk73NVWcyDCoTMF3iFHYv9ILm31Cpn3RpDl3dTQH4pIo2Tmc3KhWGz/hth/PWb48
	 vglPlBscg3u92kqd2rbCxLmw3mr7/PPjnYJ5AUUOjDLXcbkxjFg5yNoYay9KKuWO4G
	 vrxkCjNxkXWJJ8+pRvtpu6tf9p7xzPXYKpsmEZC4PW1XkKQGnMshwJWEwdTRR/QHm+
	 2OiiPJ19rbtNw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 948B740C42;
	Mon, 12 Jan 2026 16:39:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Petr Vorel <pvorel@suse.cz>, linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>, Michael Kerrisk <mtk@man7.org>, Alejandro
 Colomar <alx@kernel.org>, man-pages@man7.org
Subject: Re: [PATCH v2 1/3] Documentation: sp_SP: Add missing man page section
In-Reply-To: <20260111233534.183272-2-pvorel@suse.cz>
References: <20260111233534.183272-1-pvorel@suse.cz>
 <20260111233534.183272-2-pvorel@suse.cz>
Date: Mon, 12 Jan 2026 09:39:04 -0700
Message-ID: <87bjiy23br.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Petr Vorel <pvorel@suse.cz> writes:

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> New in v2.
>
>  Documentation/translations/sp_SP/process/adding-syscalls.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/sp_SP/process/adding-syscalls.rst b/Documentation/translations/sp_SP/process/adding-syscalls.rst
> index f21504c612b25..28f680652383d 100644
> --- a/Documentation/translations/sp_SP/process/adding-syscalls.rst
> +++ b/Documentation/translations/sp_SP/process/adding-syscalls.rst
> @@ -172,7 +172,7 @@ describiendo un describiendo un movimiento dentro de un archivo, ponga de
>  tipo ``loff_t`` para que movimientos de 64-bit puedan ser soportados
>  incluso en arquitecturas de 32-bit.
>  
> -Si su nueva llamada de sistema  :manpage:`xyzzy` involucra una
> +Si su nueva llamada de sistema :manpage:`xyzzy(2)` involucra una
>  funcionalidad privilegiada, esta necesita ser gobernada por la capability

I would just fix that while changing the line in the next patch anyway,
but whatever...

jon
