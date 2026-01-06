Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E3B2C029F;
	Tue,  6 Jan 2026 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767735411; cv=none; b=OHWQ5GnTYWKKGAORIy70wrIXSpiFCgn+JOwdKf6fyQp5tC16Xcd4w2Da+7S7p+To/1GScTssS8a6M9gyeckRSnCebgH8SWoLvePQVZ42kXIuCbwSyF8m0ZVzR5ujTin8sLCN33D7JHXSIz+Y0df8DM4zxfuEVlpawAEm/PgZNAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767735411; c=relaxed/simple;
	bh=7HF2020FEL8Tm8Kpkkid1awRt6ygGUMSvsbqPDy8mac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f1whmxGP5DgtTecLiQv6TCVsXqbCN2mTnezDphtr2McwkNmiH36IZpRHbR659ljwqNbIzpu2AU/w1Vi+5qG7i18bmAconTrFH7NikRsBxS1BPEekyJKZRuVYWUXDuJ4LvHPH5efqpPaePIXDznExQzbuzLoDRmCiHiRBFGPNOb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XUuDUX34; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XUuDUX34"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B5CAC40C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767735408; bh=OHtMw5AxQgO7NRTYv86s2jvfeWY2Qj6EN7hHfOzLvz4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XUuDUX34kVwEu9MqphB3CtKsNkevL0pH3BY8UqnP+b61cyFEcpC8+OydV4T3B1jeP
	 jAAIAvI3py4l28yYwTwYAGmmBak1zN0kbyBdOVJ5kkyLugdGnDG70dSxDklIg6lD92
	 zNK47mbNpRD8Xb8ZlBTBl1KbnQuJ/u+TlmCEsU4TKDmvMji3/M83mqGsg77dtfFxAU
	 NV00KEEQxPgkV+BBNnvln2V6173Q7/KpwGu+hvlrAqXfaH+7UJZxpVHznEUzWfazji
	 hmar0tSqtsGGsknFAt1NPh9fiFu5I7Qnzoz+5BC62LJrYc899C7+KFIth93Nz2aiI0
	 2LTK1uLcoBKog==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B5CAC40C7D;
	Tue,  6 Jan 2026 21:36:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: find-unused-docs.sh: fixup directory usage
In-Reply-To: <20260102200657.1040234-1-rdunlap@infradead.org>
References: <20260102200657.1040234-1-rdunlap@infradead.org>
Date: Tue, 06 Jan 2026 14:36:48 -0700
Message-ID: <87ldiae83z.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> The recent move of this script from scripts/ to tools/docs/
> did not account for the 'cd' directory usage.
> Update "cd .." to "cd ../.." to make the script self-correcting.
>
> This also eliminates a shell warning:
> ./tools/docs/find-unused-docs.sh: line 33: cd: Documentation/: No such file or directory
>
> Fixes: 184414c6a6ca ("docs: move find-unused-docs.sh to tools/docs")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> v2: correct subject line typos (2) (arg, kbd error!)
>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
>
>  tools/docs/find-unused-docs.sh |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20251219.orig/tools/docs/find-unused-docs.sh
> +++ linux-next-20251219/tools/docs/find-unused-docs.sh
> @@ -28,7 +28,7 @@ if ! [ -d "$1" ]; then
>  fi
>  
>  cd "$( dirname "${BASH_SOURCE[0]}" )"
> -cd ..
> +cd ../..

Weird, I'm sure I tested that ... evidently not very well.  Applied,
thanks.

jon
