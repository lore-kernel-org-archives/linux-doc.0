Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91165288CBF
	for <linux-doc@vger.kernel.org>; Mon, 14 Apr 2025 16:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649108; cv=none; b=EOmbv7iKrAwxXSp3v6c9/7xGOFTEj3R3IbnPxuGeIqSKyInYhEF0r3s8aBTCn900ExiYHnWEo7WhoIf5Jiozna3PcAc3E+OUq0Yf3tmxAL89vqiFnsRuukPsn0Lw1VsQHIHSR9ct/Ymg1uogJbRMpcSUyoJoD0kobOOcHhqU3mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649108; c=relaxed/simple;
	bh=mhsi0DOeQYbpxukkethWFqkcy0tQF4koJxOMB68FTtQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fZIzWk5uWAT0i2wwFQmXDp6umJfEbQG7Cv5aUunUiYvEEEmPV0OgA7MtiMo1+eSNydXTtDUVPtcXJ7BbKdMzM4yWQZnL9x82ZChfTa6165kEllJKKYKCUgE0dY5wGEjhAd1EnLHGTNRZ78+8+YMUBS1RcBa/31t8O1Ymkyd3pk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mI2rk0H8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mI2rk0H8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AACD641062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1744649105; bh=sdpSDZAgHfCELwlTMSR/BmwdIBY8gp3LitT69vGxVhI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mI2rk0H8hRvckig6A//Uld+mopvh/5ijoHRghZWWIZEKMAmq9kNbpSiac2XBSkd06
	 zCXVPrJaGBBhzHnB5D4g3wk1xRSGMVyBFKxEbMb0jF8pjeJ8eZpphw0tzPzJ5ptiiB
	 PDJMZ4h0KJKSlWwxpKY33SfeBfNj2WHUMcYxa2VMTdjFR1sPerldn9vTCD1EC48A4H
	 8DW5NVv1BOiDizj0Jfkba0Tgzry8V8mfUoFUz74rnbBXCq0r0UzO/Bj3Q/mjX2XO3i
	 R9ZBQjZsUP6QqylhFOhkeGdJlVudSQAfLOlWTw3G/bpe7TEHdiVlzKmCYR9LsaeaXZ
	 88+uwJNOPR7dQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AACD641062;
	Mon, 14 Apr 2025 16:45:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andres Urian Florez <andres.emb.sys@gmail.com>,
 carlos.bilbao@kernel.org, avadhut.naik@amd.com
Cc: Andres Urian Florez <andres.emb.sys@gmail.com>,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/sp_SP: fix links to mailing list services
In-Reply-To: <20250324164613.12639-1-andres.emb.sys@gmail.com>
References: <20250324164613.12639-1-andres.emb.sys@gmail.com>
Date: Mon, 14 Apr 2025 10:45:04 -0600
Message-ID: <871ptuae0f.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andres Urian Florez <andres.emb.sys@gmail.com> writes:

> With the changes in the way mailing lists are hostet at kernel.org, there
> is a need to sync the Spanish documentation to:
>
> 1. fix links that are pointing at the outdated resources
> 2. remove an outdated patchbomb admonition
>
> Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
> ---
>  .../translations/sp_SP/process/2.Process.rst        | 11 ++++++-----
>  Documentation/translations/sp_SP/process/howto.rst  | 10 +++++-----
>  .../translations/sp_SP/process/kernel-docs.rst      |  5 ++---
>  .../sp_SP/process/submitting-patches.rst            | 13 +++++--------
>  4 files changed, 18 insertions(+), 21 deletions(-)

Applied, thanks.

jon
