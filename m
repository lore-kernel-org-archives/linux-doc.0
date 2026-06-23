Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470F13A6B9C
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 20:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247021; cv=none; b=e72lXcaganxOEFRvQ2cz3f7juU5r0gwRsPdV1sE/stclJYOFlJmXwcSMPhBSa3clFiTiJG1oScy0RgfkBF3WASfC+CBqftrwbBb1lxCweDvyIFfQuOxibiTgBSnMMRfznedom7k/mJ+qkZumdIE03RZ8OvfQL1ApIEYIOdch7qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247021; c=relaxed/simple;
	bh=4d7rbSUoknYWkqLQldukzHGAy7E7sYvSut49rhPhijs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E0QcZzA88HigRX2qhfMBCDUIChXMhG50BdNzCY84k4xOJH7+Y4tRW2Dq4KvoYb7mwBIF5t0q6W5VxoZlKn7GdbEYcXD0KyRtqKP8xmdQgN0e4aHhfMoFgYpRhdMrmvmZ2bK2wKDbQi4X1m7EbeEHAbcnufkjS7mz1rO2jAk6ECg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cuiSzY/B; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cuiSzY/B"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A731141592
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782247019; bh=tcGaOMIfoHNHvpsb5leLrOaPbNSZ4kNxIce0fkbKdOI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cuiSzY/BUcGZc4U0TvXvAZw8Www83Jb8BL3N30GfhHFVbHHV0bAXjFyrQEMwVBPIJ
	 VQpRX4xXMfycCSioBxHXpnecCli752m1X0MFH2nX5clMgzWl3p//N+DniAyEljT9zr
	 Lo+L7/8eg/NxxXQuTepOcD8IgcLnIlsCyLbB8Lm58vs0rftM66h47Rid/hulDHQaov
	 BX4YpmVdccFhmKE6m8EbNutnBJ45IVazKzOQlxilmDgFGSFircuKPQIiuaTPruqYt7
	 YJuIDQbse8PaxTMu+GzJv1WE/H7I3eApekdpKjPWf+l8QcCR6n7/oaCZ9cpkqiidP+
	 OnMLcJzHGYH2w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A731141592;
	Tue, 23 Jun 2026 20:36:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Fix regex for kdoc
In-Reply-To: <20260615154057.2156589-1-willy@infradead.org>
References: <20260615154057.2156589-1-willy@infradead.org>
Date: Tue, 23 Jun 2026 14:36:58 -0600
Message-ID: <87a4slat91.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Matthew Wilcox (Oracle)" <willy@infradead.org> writes:

> The trailing '*' means "all files in this directory, but not
> subdirectories" which excluded tools/lib/python/kdoc/.  This is surely
> not intended.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0d94420eae3d..999957a3e0ca 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7653,7 +7653,7 @@ S:	Maintained
>  P:	Documentation/doc-guide/maintainer-profile.rst
>  T:	git git://git.lwn.net/linux.git docs-next
>  F:	Documentation/
> -F:	tools/lib/python/*
> +F:	tools/lib/python/
>  F:	tools/docs/

Applied, thanks.

jon
