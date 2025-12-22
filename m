Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0922B209F5A;
	Mon, 22 Dec 2025 22:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766441730; cv=none; b=p2t21tSW3ZGEdMnnvlLBga7qa4/HE0auTMeAMoQUAHplD8/YTy36wUmfgIbGfCqhVRYCotb+ANQF2bV14fLE54OB0uD0aNzmqrH/cAWiD2yoyYu5LHbRqYoXWiJ+klkwwUDvVzqTD451+IlO7GwS1mq79x8BFRtccAEGs+wesuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766441730; c=relaxed/simple;
	bh=D3+vq77CmWlyUZbC2DhULtDGuksoHzGTIPKpsnHEGmY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VHB+3SCYgefKQgH828SGJunDa7d/DZdwggIsafJ5ucB+KLNHnvafoJt/ckRCMIO9WMM7puJ4xyTam+ipGPSNEZctCsDNYvSpNrM/CxncDVK5bVRKVfY0LzJKTZ2MLWRJE1Jjq17vtUY3skyOjGROwYbeA4mlGzCvaoG80ihLbfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PTbu6ock; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PTbu6ock"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2D49A4040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766441728; bh=7gs2Jb0Gk8vH//5mfVICha1iPPLaIcRnLt1aFL3p2Ic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PTbu6ockr++HFssB7xRdBSzE8G1ILI0HzNVHgIdh1tJevOUEFvfEk0lIoPjcsB84G
	 t0iQUox3TQ1Qv0D0jDH0p6EYlNNAOW8AZioH1yaPr4wX3RaNn/wFnrLdosO2Lkvq6r
	 ZHLB9Ze96+5AYJkV4tdS+QbUj68kWoVhqdByLH/9nuzJf3lFSpd/i2zeYs7MgBo3Sa
	 Jlr6PldGkA8SFQ+s2ocBL1FH2qyvige36jzL4ONASPbWlitQP1WNSIlhYX4kkaextw
	 dXYLbQA8VHThFyLI6ql8qeddcjKM1n7kaAtGb5Veunkt+/v7zVbOQ5o5+o5VCW7fuC
	 8yn97bKE12W2Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2D49A4040B;
	Mon, 22 Dec 2025 22:15:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Steven Price <steven.price@arm.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Steven Price <steven.price@arm.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] kdoc: allow dots in inline @param names
In-Reply-To: <20251211104851.45330-1-steven.price@arm.com>
References: <20251211104851.45330-1-steven.price@arm.com>
Date: Mon, 22 Dec 2025 15:15:27 -0700
Message-ID: <87345217uo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Steven Price <steven.price@arm.com> writes:

> Inline kernel-doc blocks failed to parse tags containing dots (e.g.
> creator.process_name in panfrost_gem.h) because the @name regex only
> matched word characters. Modify the single-line pattern to match
> doc_inline_sect so it includes \. and parses the same as a multi-line
> comment.
>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index 500aafc50032..261b484ad130 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -53,7 +53,7 @@ doc_content = doc_com_body + KernRe(r'(.*)', cache=False)
>  doc_inline_start = KernRe(r'^\s*/\*\*\s*$', cache=False)
>  doc_inline_sect = KernRe(r'\s*\*\s*(@\s*[\w][\w\.]*\s*):(.*)', cache=False)
>  doc_inline_end = KernRe(r'^\s*\*/\s*$', cache=False)
> -doc_inline_oneline = KernRe(r'^\s*/\*\*\s*(@[\w\s]+):\s*(.*)\s*\*/\s*$', cache=False)
> +doc_inline_oneline = KernRe(r'^\s*/\*\*\s*(@\s*[\w][\w\.]*\s*):\s*(.*)\s*\*/\s*$', cache=False)
>  

Heh ... that makes cross-references to container_of() work ... I'm
convinced.  Applied, thanks.

jon
