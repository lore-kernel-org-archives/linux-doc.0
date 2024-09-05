Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA3218D65A
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 19:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725563967; cv=none; b=RLT1Y9i3kQhjkiddoc3xUcR9nRGC3A5+anz4zbY8Qtfc/2eEx/0d4Gnk8IbhN1cH8g46lDZf3x+bB4jaUTLNvDcoBaFITEgcaLLZlh5fpVt8kKlLPoxr4aC9Ie76wWQrfhAVhIgYLwHuFq7vl1DNlMws0QhO8HYlQ+qMdSV4h6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725563967; c=relaxed/simple;
	bh=nRhLeT2Jh9gYnu6OMWl+nOwlWh3l22N0Umwjp1aPh2w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Fo5f4leavDTM8ThL5MllY1+z/pf3o7AwDS1iVJv3RTY/7JRwOabhyTzE5IHFFK3Tz2vGVNfJwR4LAfcuVhP4ZgGdqjzWdtTAfjUaEFCO2hnE8KeicbtmQtt2ppIqdC+qu0Dcrh1nt+NvXFdReqraytScXw4EAZVY1LXc/1drpiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZWN4LTRr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZWN4LTRr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 68B2042B29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1725563963; bh=l8Ga3Wh8fNoYBQBGfGNrXutQ6+/bZH1959O1/4kJtb0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZWN4LTRrSdQWD1C7q+mglUjjqYMLPs2aKwMTMnSgN3KJd+IgMmzsY4tLw8gFptlE2
	 4nydc1jTznTSvObp3Q9FWgwvk9jWMnPWKmdoPJAk3Em+28O9LA3esmxvEmB8C3iTAt
	 sl01Li35xezp+Dw8JAl36/ZGK6iDUZS5YrgHPn27KEULzbnRoQ1NrPDXL2aWnckv7d
	 bFdWhdoRHlBfhsBNU+NtxMOa2E1vnP3inYJKiVp0TQNUESEB3clTJC+fN8b7PSYWNY
	 WIFY5xXK2zyx71y1y3DjnTStNXC49PA309JQjd7BdkYIjkU/JFprvGAJv9Crm3+qIu
	 gKVu4PGLghjiA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 68B2042B29;
	Thu,  5 Sep 2024 19:19:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yanteng Si <si.yanteng@linux.dev>, seakeel@gmail.com
Cc: Yanteng Si <si.yanteng@linux.dev>, dzm91@hust.edu.cn,
 hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Docs/zh_CN: Update Yanteng's email address
In-Reply-To: <20240905021012.2571820-1-si.yanteng@linux.dev>
References: <20240905021012.2571820-1-si.yanteng@linux.dev>
Date: Thu, 05 Sep 2024 13:19:22 -0600
Message-ID: <877cbpj4cl.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yanteng Si <si.yanteng@linux.dev> writes:

> I've permanently lost access to my loongson email
> account, and luckily I got a developer email,
> let's use it.
>
> Signed-off-by: Yanteng Si <si.yanteng@linux.dev>
> ---
> v2:
> Modify mailmap.
>
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/.mailmap b/.mailmap
> index d2870c28c0b0..1ceac0fc231c 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -710,6 +710,7 @@ Will Deacon <will@kernel.org> <will.deacon@arm.com>
>  Wolfram Sang <wsa@kernel.org> <w.sang@pengutronix.de>
>  Wolfram Sang <wsa@kernel.org> <wsa@the-dreams.de>
>  Yakir Yang <kuankuan.y@gmail.com> <ykk@rock-chips.com>
> +Yanteng Si <si.yanteng@linux.dev> <siyanteng@loongson.cn>
>  Yusuke Goda <goda.yusuke@renesas.com>

Applied, thanks.

jon
