Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622293;
	b=jIBI00jnEYYkdz8RM4xk1SHkyBzKH6Epnxe9qnvbZFUvwLMhPFTN+MxvZFR14BOqLPtx
	 lhry/1IEr/5KBKXT7MhQD1qItWH04zntmBZL+8ml7ffqbu20vCkK1+7/r0+sy9ih2pKmm
	 //uJ6PJ/1aqnyaXUNlvkeTzd4xppDaDjLvS/otkPb31pkancjzzTyq+BLtAEpeGBrqK4x
	 dour03TfZ2X/LfyOlVrqb0LJ2dfGOJscd2+jyOMSPL6TAQV0eQH+t7B8Z4SE9KobB1Wcp
	 6ajHgl3wn5IsSWyM0wx1QUw8sbhvTWp34qRi8RQmo2L1qWOVW3B8d01bg2ZTiEr+Q1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622293;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=Y9paJOV/L2pKl6q9dwScw89aSql6TBbYFzkDpsCrh5s=;
	b=FVB1GhzdItGX/J4FSxHII5XpIpZJXQJBe/xrWpx0XUFlBqwRnFs3o1hYVondDpg/eZV0
	 YZ2zGQZ48njumHMKtd/srpD/p6QdAC29BXnAIyKgQC9lIfumJbuAXTMsd1zgkR5fvw6dm
	 i7QpyZRi/5CgskFzUADepXNsok2S0LVZH+N6wnuAT3qxbkA3Q/zSfmbU22oSQQ1FqjW/X
	 PQeAwNtGmod/rX8o32+66roHpg7E1OdUBon+qUwGKHUUpGTGqN3H6JKfIDDzHryt4Ibrj
	 WJ7tdx5FgsokHN+C1P0R57vnZr/OgORmXuAHgER1dEJymiL1SxtiOb7hgx2CagWfHnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=UHMGOGPY;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1A3606A31E
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 15:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B1A3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=UHMGOGPY
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F41B4410D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795622292; bh=Y9paJOV/L2pKl6q9dwScw89aSql6TBbYFzkDpsCrh5s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UHMGOGPY2Swzk6uSVSU9hHUaQhCIvpfcu6jDVC1l96J3qByypzVmvxGjobtTPN8vI
	 n2oUAIR+xdd5mrM/Sqxrzz06B+c8fjL8BYLOM/hkzFDX8YJcB9l/2fNy6t7mcyx4Lt
	 pz0bpAgVz71AvdD/7w5xFhfgfu4RD8Gezv8YoqQB0qfWA2/sY+Y1DegsZqweh4hehr
	 wicpJ/Ln/yOU151zSmEfu9yT+7gpXpC+rhxbM7nCwBnetByozOcCs+ytEwQtFFqmFC
	 AJHnMKRuYLhyxQcA6kMNrcbmJHUJCZyNYTLAWErFm5ymOSXmXMIhN8QwoCdnCD/fuj
	 cRz+J4VH0mDnw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F41B4410D3;
	Wed, 25 Nov 2026 15:58:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 0/3] docs: translations: pt_BR: wording fixes and
 plain process index
In-Reply-To: <20261116115605.174735-1-danielmaraboo@gmail.com>
References: <20261116115605.174735-1-danielmaraboo@gmail.com>
Date: Wed, 25 Nov 2026 08:58:00 -0700
Message-ID: <87cxrsykc7.fsf@trenco.lwn.net>
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

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Hi Jon,
>
> Small cleanups to the pt_BR translation: wording fixes, plain filenames
> in the process index, and "branch" instead of "ramo". Based on docs-next.
>
> Thanks,
> Daniel
>
> Daniel Pereira (3):
>   docs: translations: pt_BR: fix wording in index, disclaimer and howto
>   docs: translations: pt_BR: use plain filenames in process index
>   docs: translations: pt_BR: use "branch" instead of "ramo"
>
>  .../translations/pt_BR/disclaimer-pt_BR.rst   |  2 +-
>  Documentation/translations/pt_BR/index.rst    |  8 +-
>  .../translations/pt_BR/process/cve.rst        |  2 +-
>  .../process/embargoed-hardware-issues.rst     |  4 +-
>  .../translations/pt_BR/process/howto.rst      | 14 ++--
>  .../translations/pt_BR/process/index.rst      | 74 +++++++++----------
>  6 files changed, 52 insertions(+), 52 deletions(-)

I can't get this set to apply; what was it generated against?

Thanks,

jon
