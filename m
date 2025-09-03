Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588AB283CBD
	for <linux-doc@vger.kernel.org>; Wed,  3 Sep 2025 21:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756936750; cv=none; b=FSrKV5Spe2HSywENPDOQffUPV1Fmv2e1MLaJ5RKYh9mQJ5fg7LItC3UpLbkQ8YHWM+MkdFoj+r+bGhj+hY3nLHmG9ZU/jyTXf44PXdrZTZCdubrmz9nTSCKK1cLJKHc3CI9ezuCDtgayTeZBdTUJFS2kDNufbpu3dmgW0POSxno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756936750; c=relaxed/simple;
	bh=j/ZUWZi1M5vdGot18yf4J8K1on/WpNu9zJn9BJvszic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WMMF+/grLNg3CCfYXpHe5eYa7H6by49nGUTdChGTy1PYRZlo0E8cBUvvI5OdcggvTUpkgox+oHpAuHLean3Rb7YCUjTiIO6AROhKxkGi13uMXau9VqjkYdkw81KD+bgQXkWoJwRgkJ+RU3dCUe4wAgZxlNX+61MtUNhdlkNHaq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KrwB5JEa; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KrwB5JEa"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9148440AF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756936748; bh=79smM83ybfmG4CmF+4yln8AzvYDQMyQipSc2qbpzxyc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KrwB5JEa/lY6Taynygf9qOC4R1W+9htIsG3YTIeBIoTrSibBXrR2pfZkqipdItrCe
	 DQsxUHH3VJqiCTSyzS+EzUWGHcoz6wTCo4qKZ2tUE/ETNGchk5V13vMZ753TJCcgFm
	 sALLWWTWRxowSg2q3xp286XEE77DYjoYhhyCw7mQqLKGHkXLlf4uftdXK0+7GSH0vr
	 mZsy81zPW8emdcrhn1dt5U0DwRBGL4vsjdQ8qeJ2sv2T42jbf71cSB5xuLoUAoYh4C
	 4+P1wfLFRL327A5JoVy/6Cf3pfhFK6ak/Y4kHLzmFNkbRDqb6Ve4ITowPVFbfkiwTX
	 mf/P4ucpxAkmg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9148440AF5;
	Wed,  3 Sep 2025 21:59:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH] docs: sphinx: remove SPDX/copyright comments from HTML
 output
In-Reply-To: <20250830170808.3911151-1-vegard.nossum@oracle.com>
References: <20250830170808.3911151-1-vegard.nossum@oracle.com>
Date: Wed, 03 Sep 2025 15:59:07 -0600
Message-ID: <87jz2fp590.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> Use Jinja2 comments instead of HTML comments for the SPDX and copyright
> lines. This prevents them from appearing in the HTML output, which was
> never the intention; the HTML output has its own copyright line at the
> bottom of the document.
>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/sphinx/templates/kernel-toc.html   | 3 ++-
>  Documentation/sphinx/templates/translations.html | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/sphinx/templates/kernel-toc.html b/Documentation/sphinx/templates/kernel-toc.html
> index 41f1efbe64bb2..b84969bd31c4f 100644
> --- a/Documentation/sphinx/templates/kernel-toc.html
> +++ b/Documentation/sphinx/templates/kernel-toc.html
> @@ -1,4 +1,5 @@
> -<!-- SPDX-License-Identifier: GPL-2.0 -->
> +{# SPDX-License-Identifier: GPL-2.0 #}
> +

So this stuff started with jinja2 comments, but then was changed to HTML
by 4e98799a7021 in 2023.  The problem being addressed there was that
spdxcheck.py doesn't recognize those comments and whines, and it didn't
seem worth fixing at the time.

I was thinking I should just fix spdxcheck.py now and be done with it,
but it seems that 154916f4b59d by Lukas Bulwahn tweaked the script
earlier this year.

...which is a long way of saying: applied, thanks ... :)

jon
