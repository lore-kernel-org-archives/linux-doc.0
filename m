Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85BD34E763;
	Fri, 21 Nov 2025 17:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763746237; cv=none; b=Xevy5uRl79kWu2lZKwsH6O3cAdM7hFNEcIQY6Tf56kbu0V+bnmDAgJbKEYKmaPTvzsc5VE5hL65VRYJ6WeIu58vlkzSYwJVpuE14aWhhFRjOWaj6W+aaJI8vIAV7kLVza5tffifzBxTrafyInTl1Byy1XgszqZErnMp47KWrHDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763746237; c=relaxed/simple;
	bh=sNSkN4Z59CxZA7WG+OgkAd/kyxSs7LwijTfQVOzc7QA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pj/yuh8VHNOreWDFykokC3N5T6IRo5d1lMWMtoH2wvL0zmjiPlqOcsuK3d3Azkt6nvs8VPStgZ5mb4tHBzuYeP9+rzXRtqd0sUr8pDVYlk47ByqDrXA+2vgV5zUIfm0MbFFEbqj5U45SWYaSuXgvgUBfPOEevFTzFaoER17Knhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MJpB2xhN; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="MJpB2xhN"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6139240AED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763746229; bh=hHSm+TpA4jklLPr6BJFmqbSm5j6eJsQ+p1DGwLQ60cs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MJpB2xhNyAnWds1oNYzBAGWVgfIlmsLsFq82bzEZzxaAR9BDX9WUyMrySXO4amSAn
	 Zg1WQBogvBLG+KPMOtIG/2X+rWFKbJ6FKQJvblmf4dD5VqwRa4tfEZ97BGZtL3r9KV
	 KU+V3/j/joBuckUGQYAJvfbVtUnnxau+iRpOiKC7elEkxrN9EPPhaSM8YxagfgfD5D
	 UONQBMppIRnN+cRqF+XQGbNZvqNvW1UZ3tM5GcGdB8YHTm/LLTmoG4u3TweqKSNg4m
	 nE8TTl4zuZeOxdoP4ZR4fPJ6XVlvAjI0fMMy3i6hpM7VBP6iU0On48mEI2sPjjVh3d
	 FJiN6ioBzp/xw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6139240AED;
	Fri, 21 Nov 2025 17:30:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jiakai Xu <jiakaipeanut@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v3] Documentation/admin-guide: fix typo and comment in
 cscope example
In-Reply-To: <20251119065727.3500015-1-jiakaiPeanut@gmail.com>
References: <20251119065727.3500015-1-jiakaiPeanut@gmail.com>
Date: Fri, 21 Nov 2025 10:30:24 -0700
Message-ID: <87o6ovthsf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jiakai Xu <jiakaipeanut@gmail.com> writes:

> This patch updates the Linux documentation for cscope, fixing two issues:
> 1. Corrects the typo in the command line:
>        c"scope -d -p10  ->  cscope -d -p10
> 2. Fixes the related documentation comment for clarity and correctness:
>        cscope by default cscope.out database.
>        ->
>        cscope by default uses the cscope.out database.
>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
>
> Changes since v2:
>  * Fixed line-wrapping issues to ensure patch applies cleanly.
>  * Formatting improvements in the commit message.
> Thanks to Jonathan Corbet for pointing out this additional correction.
>
> Changes since v1:
>  * Added the second fix for the documentation comment line.
> Thanks to Randy Dunlap for pointing out this additional correction.
>
> References:
>  * [PATCH] Documentation/admin-guide: fix typo in cscope command example
> https://lore.kernel.org/linux-doc/6017104c-740d-43db-bc53-58751ec57282@infradead.org/T/#t
>  * [PATCH v2] Documentation/admin-guide: fix typo and comment in cscope example
> https://lore.kernel.org/linux-doc/871plv5mlf.fsf@trenco.lwn.net/T/#m10f8ec032dd57eaf7388939da3722c9f4b599b33
>  Documentation/admin-guide/workload-tracing.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

jon
