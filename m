Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118D9159596;
	Thu, 16 Jan 2025 18:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737051426; cv=none; b=WK4yseNSQpRmaKk8NCXAmXi/XiAyuPTlLugDiCeSLZNwig7dCKKAEFf8uHzrstaIJYTykMmOkLsilwZBMLtIfvgYU+IeyX38u+jkRhOm1Qmv0xJ+2ahd5U2+gDupDXALITe0HjKI8HKYg1Oqj5LqKT7hQZwl2CMJzg3/SJ6pVos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737051426; c=relaxed/simple;
	bh=qPbh2ajnUH3leIiWYRYjdwFf4GEI2DpQa0pPxXcpIwE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y78gUukNFqBJ4aVH7lteMIbgR82ruDbuHqbvJ7KQLhC5s0ZtPTxV02vJPu1cyGkYSPvH3Ni1DaEApXkrbBMhXzUcHMxsXiEXBgQ2KoklRVjqAO/q56OC8g3pKlskyJqCcrUdgbfpZ66TErBgZV4qu9OykyccLs5Qi+onqTqod4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qOQK+xV4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qOQK+xV4"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 08260404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1737051424; bh=2BRVNA8zLFK2nkJRN2qjzzDWBprO8fkqkgsSO9NH6M0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qOQK+xV4cATIohmdY8sX8Ni9P+UJ+0RbzZfXqyFAWrmdTxjzKFY4Y2opkIHUrM9fM
	 DEXFhVG0sc4l3FabeH9LmePNGAedifU65cmMrR6KD5cjvWagMN8Q+CHKp4AUHHkfTw
	 2xg6zsNq1gvFpKGPrUIgj4frFzHuRq/53/fzeoj15fns3+MAD+0UldFcVXoUh1JLr2
	 ChIr9rBmITmzF5GBjg9reGCzRjQO/qE82Ulc3K7vYja27jHPI8O0+BFnueYw9+rpQu
	 Gbma0z2uEpdbEgeWJcfOeP/8bxlodXGZorJJydyrenrrAH/NQKRRTbpblJDjjPeSWz
	 gfJ2u6jD4pLXw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 08260404F0;
	Thu, 16 Jan 2025 18:17:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: akpm@linux-foundation.org, jserv@ccns.ncku.edu.tw,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, I Hsin Cheng
 <richard120310@gmail.com>
Subject: Re: [PATCH] docs/mm: Physical memory: Remove zone_t
In-Reply-To: <20250115070355.41769-1-richard120310@gmail.com>
References: <20250115070355.41769-1-richard120310@gmail.com>
Date: Thu, 16 Jan 2025 11:17:03 -0700
Message-ID: <87r052zkrk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

I Hsin Cheng <richard120310@gmail.com> writes:

> "zone_t" doesn't exist in current code base anymore, remove the
> description of it.
>
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>  Documentation/mm/physical_memory.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
> index 531e73b00..71fd4a6ac 100644
> --- a/Documentation/mm/physical_memory.rst
> +++ b/Documentation/mm/physical_memory.rst
> @@ -33,7 +33,7 @@ The entire physical address space is partitioned into one or more blocks
>  called zones which represent ranges within memory. These ranges are usually
>  determined by architectural constraints for accessing the physical memory.
>  The memory range within a node that corresponds to a particular zone is
> -described by a ``struct zone``, typedeffed to ``zone_t``. Each zone has
> +described by a ``struct zone``. Each zone has
>  one of the types described below.

Makes sense; applied, thanks.

jon
