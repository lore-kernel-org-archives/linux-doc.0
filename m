Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5422D1AF0B6;
	Thu,  9 Jan 2025 19:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736451322; cv=none; b=dSY3HlpaiI3EoeQClcNNG/hcSYdDSgOorOJg7kZ4c1gbb93crivr4XK3GLOQ5nRHwGIQa9TvA1Fp7Z+8kwXGG7A/tAVMDd6jpj15aik8lOCFwrpBEQBCpp4cAsUg3jJYJgdyUwgf6mZ1m2FFFpJlwmvvUOuG+XwoxfhtLfNE+2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736451322; c=relaxed/simple;
	bh=/dStl9YVIzqFHw+2wBBaEo5qwQUkT68eAx4eH8QAz1s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=caelgXuuqZXxdcNpbQ76Yo2eJuzWqQwmO/gq1+IqWwsMJrFvcQ/cwBOjGnF3hLQ8lvchAOHHZyBqqw0ts5P8/z8/Q0r7kU6I7+2WF08tdfshHFOgKHtd15yzRVOniveOXfXROaVXf+B0YhbSBl03zudKIhg0Nd4FDQ6VjtUQO1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cmZZKOzS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cmZZKOzS"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6A7D6404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736451320; bh=FHa3xHxP33h1cdafMj0CtyDwF6lW8OH/ql35po48Ld4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cmZZKOzSAbIm/nL2JEvtCWS52zaas3Xbx+ZovaOs+BjLjq3OlV4vR/FzWAnD2Iu+6
	 xvn1+agg31lyOkOxmeSWuOfnSh/vKfBkMCgS80+TwTfhbyBNHRRkOHG3QxLNs7Mf82
	 tQqJCYmz75vi2gSaNzoIJUIpwagWvo8yRaCglBnZLUoZODiaVOYz9Bsg5K2bOgFvBO
	 GwweXG9Vx5A+kiTBcEsmZI0+SExz/4TientGfTgf/OWUNeBVsefgYG03j0oSyXdNWG
	 M3oRXm50H/urjqwRjC0I8CHZjEeiBP7/LsyaZzJwGLGqAXfjbsc6LHFL/vCyaHQ08l
	 j4yfJVlRFbvWw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6A7D6404F0;
	Thu,  9 Jan 2025 19:35:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Lubomir Rintel <lrintel@redhat.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel
 <lkundrak@v3.sk>
Subject: Re: [PATCH] Documentation/kernel-parameters: Fix a reference to
 vga-softcursor.rst
In-Reply-To: <20241231190240.417446-1-lkundrak@v3.sk>
References: <20241231190240.417446-1-lkundrak@v3.sk>
Date: Thu, 09 Jan 2025 12:35:19 -0700
Message-ID: <878qrjlr0o.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lubomir Rintel <lrintel@redhat.com> writes:

> A very minor oversight that dates all the way back to rst migration in
> commit 9d85025b0418 ("docs-rst: create an user's manual book").
>
> Fixes: 9d85025b0418 ("docs-rst: create an user's manual book")
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 3872bc6ec49d..da19728b5bee 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7474,7 +7474,7 @@
>  	vt.cur_default=	[VT] Default cursor shape.
>  			Format: 0xCCBBAA, where AA, BB, and CC are the same as
>  			the parameters of the <Esc>[?A;B;Cc escape sequence;
> -			see VGA-softcursor.txt. Default: 2 = underline.
> +			see vga-softcursor.rst. Default: 2 = underline.
>  

I've applied this, but dropped the Fixes tag - the named commit was
simply a rename and didn't actually introduce the error.

Thanks,

jon
