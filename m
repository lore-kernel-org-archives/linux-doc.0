Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4226D221270
	for <linux-doc@vger.kernel.org>; Mon,  9 Jun 2025 20:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749500639; cv=none; b=AgCtjJKc5YIbXj+ZXQHc1to50vL+2Na5yKbDTYwGn6J/6J3I2wkZwnrAe9wldwLMESZKR/RSs92Qqw6LQ3WR39PqLiQ1RKxP3InTp9ySjAxbkkJEV5zNoBOQDRc/r8VIEFJnZX1TkhXEHn04uIUOuQN+7L1eNNBOH3gSZJkOil0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749500639; c=relaxed/simple;
	bh=qzio5ZFZk1EJpKZStF+L1CELCiRdwXtM4uyUKz5Bko4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cEbYRg0Dp2YTzHi47qvKNDwtogZErD3wkxPDY3rlFwtZ3duowKCqw/VmuVibenwNzslEinQhpe8S33E8z48iZhvgsSZ0h0c5Iivr8Q5ajn3hs+B/N5CKb+d4p6qO22xjigcFamT70a4Dy4AIIilFr0aJ886QBuSmV8OD7e7zz5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GCP+uopZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GCP+uopZ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1312A41AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749500637; bh=atJFUWaot/ICo3MOAIesl81dbvMAFLNuWpe4kyWvNwE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GCP+uopZqPPM9yE6+VyXVQ4KVD1WmgWtp046M3WqOzChXGCZ1ro2rnsFkPlA/8tP4
	 cUR+w3SBiqyy7PqGRYf/9ZqbaAmZPPkOlwKCvcnd49TNclU2MfVuVdhF9tF5iy3cd3
	 uItQcVKJNnB9woChSVxqm8gOvwvPObThfxTEZOqaWKpVOI6ZXJcQ3TePUXTU/F9YO3
	 3SDMvZgPYBcELFB/BMTClGiCaHnuSGJN15dBW65+tt5zsTQrMYwH70TvI9mkv1lXUu
	 LBgv6VBi8yet7Cv9pLZv15JFMsVKFXdfXBnVWOXQbYjOGCubt3g6B3KgsVAqyvUfJa
	 lfv16HQOzDdVQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1312A41AA1;
	Mon,  9 Jun 2025 20:23:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] kernel-doc: Fix symbol matching for dropped suffixes
In-Reply-To: <20250606141543.1285671-1-willy@infradead.org>
References: <20250606141543.1285671-1-willy@infradead.org>
Date: Mon, 09 Jun 2025 14:23:56 -0600
Message-ID: <877c1kbr4z.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Matthew Wilcox (Oracle)" <willy@infradead.org> writes:

> The support for dropping "_noprof" missed dropping the suffix from
> exported symbols.  That meant that using the :export: feature would
> look for kernel-doc for (eg) krealloc_noprof() and not find the
> kernel-doc for krealloc().
>
> Fixes: 51a7bf0238c2 (scripts/kernel-doc: drop "_noprof" on function prototypes)
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  scripts/lib/kdoc/kdoc_parser.py | 8 ++++++++
>  1 file changed, 8 insertions(+)

I've applied this.  Naturally, it gifts us with a new docs build
warning:

> Documentation/core-api/mm-api:40: ./mm/slub.c:4936: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/core-api/mm-api:40: ./mm/slub.c:4936: ERROR: Undefined substitution referenced: "--------". [docutils]

I was hoping your other slab patch series address this, but it doesn't
look that way...?

Thanks,

jon
