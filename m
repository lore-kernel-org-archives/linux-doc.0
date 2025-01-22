Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D902144C9;
	Wed, 22 Jan 2025 16:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564902; cv=none; b=cTlrT2NfhHIMteR1sy/TM8aFfBiMHfoOP8QbEURfrvvdJWxg0FVaLs4nK5qOyAluSGn7eiKVhedJD132rY8pjszsZvJhj/2AfmY8hjcrWgV2sZrZJdSn9rRoISHVP6pBCb40seM7+H7WgcipcJarRhBztZHj+sH/pvNnL6lL5Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564902; c=relaxed/simple;
	bh=/a6yyYw7P0v6BFrLWVmXJxV7/4Oy3KkaVZ/ED7mFoco=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jLI/do2UtjQIEybXQaRtcaucK7OA+oVBKWStbOqWtQZce77bhDVgb0LyEgjh95q/qq4A+SPJwANU3jUxxu3f//1BHsCjfpt1VBmGvDo9UpbzYzaLUdEpcmAo/iysPFBALcaq35oVrztqrlFWSpNSnfMniA6Mao8JKHqLgMs1HPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rQG0SyVu; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rQG0SyVu"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E5A1B404F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1737564900; bh=wVjq7YgKTE8zL3FFYUDPR50fxpXvZnJAkeshFteUcG4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rQG0SyVuuAXgX0bMXRt2ZG1RvA/jJKUvDEbQRO/OUSQ/riUYZ32sWn1WZ7HT2V1xY
	 yOHdSvzRmM9I+C793+b6FNYip5OP0e/e7mV52I+oFxZxfBMyyd4Lyjhpta+l9c+ZAg
	 MHNuA3WeP+kE/83BaXPJMOAnNXKl9oxstJHV0376QvsNb0M9V1C2IOlX4WeYpI3pDq
	 H5AXGi34BPB3mk62C+r+vZVcUkh3VQFIBvRe/16aL4/M4n2dKf4t3zd1r/CiUDPeA5
	 71cFS3Cl0LDFRRQnNsUirUHCL0f0EjsdBZXWe/Rb0DGC6yjQhwt7V5aMpO7W6tfPPf
	 IlFAOu69EXTlQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E5A1B404F5;
	Wed, 22 Jan 2025 16:54:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: carlodelos90 <carlodelos90@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, carlodelos90 <carlodelos90@gmail.com>
Subject: Re: [PATCH] docs: Fix backticks in README instructions
In-Reply-To: <20250121230213.10701-1-carlodelos90@gmail.com>
References: <20250121230213.10701-1-carlodelos90@gmail.com>
Date: Wed, 22 Jan 2025 09:54:59 -0700
Message-ID: <87zfjidc0s.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

We're getting there.  I'm going to be extra-picky here to point out a
few things that are important for working with the kernel community,
though.

As Akira suggested, please use checkpatch on your patches.  Also, you
should always Cc people who have commented on previous versions.

carlodelos90 <carlodelos90@gmail.com> writes:

> The commands 'make pdfdocs' and make 'htmldocs' were formatted with backticks. which caused confusion in some contexts, like GitHub. However, using tripple backticks is not universally compatible.
>
> This patch replaces backticks with normal quotes to ensure clarity and compatibility across all rendering contexts.

Please adhere to the 80-column limit for changelog messages.

Some maintainers will get really annoyed at the "This patch" wording;
changelogs should describe changes in an imperative tense.

> Signed-off-by: Carlo K <carlodelos90@gmail.com>

It won't really matter for a non-copyrightable change like this, but we
do want to see a full name in the signoff.

> ---
>  README | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/README b/README
> index fd903645e6de..c1d280c622e9 100644
> --- a/README
> +++ b/README
> @@ -5,8 +5,8 @@ There are several guides for kernel developers and users. These guides can
>  be rendered in a number of formats, like HTML and PDF. Please read
>  Documentation/admin-guide/README.rst first.
>  
> -In order to build the documentation, use ``make htmldocs`` or
> -``make pdfdocs``.  The formatted documentation can also be read online at:
> +In order to build the documentation, use "make htmldocs" or
> +"make pdfdocs".  The formatted documentation can also be read online at:
>  
>      https://www.kernel.org/doc/html/latest/

The change itself is good.

Thanks,

jon
