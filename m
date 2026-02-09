Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482C22690EC;
	Mon,  9 Feb 2026 14:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648500; cv=none; b=UOYYYCYTAYEpPWLRCUBFQjSARPGiImyfAbXHwqgPDlaLfT75a0ortOQx2Zv3X+ayJngt0frvYRTTX9U+9B0P5Pf3CuzSTFAKucpdy1CbdMBedwPyXHbx8SGHgVUrK1f8a11BJH6KMtOazPh/7R0lvBJjQRt779IOFsPC4vTZaTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648500; c=relaxed/simple;
	bh=bAcFWYxYWucnehIAESEvF8irVS2ZL2078+qnlPGHapE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i85x2FJDwCgwccScIUwlkNDbilftT//nNsgwxle87DB94uYJMSvQ6Ox3fQnSm1Y/og544LWwzI7MeoXOvS+FgcAAGgSzWwKDJo9rhsl4YVWuT1Id4WWrO34Wh3824k/xoPPtBvPWsK2yZqXMl3sH9cL/O+/iOxN/SM2b6tPigMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QTOPP3Er; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QTOPP3Er"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7FD9540C8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770648499; bh=Qdm14cHHj8D24U6COEkXGmQ6Vu/705Cb0Axetnz5Nbs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QTOPP3ErsxHjo2jsLBJaTk8MlmXdMV3D7tvzPLhhuwAyRfdCGsm7FMPFEHG3RoBjT
	 dk68P5aQHoXl2tv6bifVXz/KWrUIapAFwYeapspBTOz7OsP8oG/hndHrCVVA/u4gC/
	 S5r+Kd9POrbu9gcaovUJwFGc+ex0N3yedOWKPGVN3ZYqsEe47dyXv7mi6xaDvhzObW
	 NLriV0oxoxCEzaE+V2Rr5Pb/oDzrO6FFOX8KxBkpHKo86sNz9RWd1694Go/pvrEoTj
	 xr4LWc44i/R4DKM0jm8PiJbiU8mALzZU8FWr2L9uPzDEkost26wD1nxyK3LuKYLMT3
	 w+ebCu3gwCi4g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7FD9540C8B;
	Mon,  9 Feb 2026 14:48:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Min-Hsun Chang <chmh0624@gmail.com>, akpm@linux-foundation.org
Cc: linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Min-Hsun Chang <chmh0624@gmail.com>
Subject: Re: [PATCH] Docs/mm: fix typos and grammar in page_tables.rst
In-Reply-To: <20260209081323.68339-1-chmh0624@gmail.com>
References: <20260209081323.68339-1-chmh0624@gmail.com>
Date: Mon, 09 Feb 2026 07:48:18 -0700
Message-ID: <87wm0m9dn1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Min-Hsun Chang <chmh0624@gmail.com> writes:

> Correct several spelling and grammatical errors in the page tables
> documentation. This includes:
> - Fixing "a address" to "an address"
> - Fixing "pfs" to "pfns"
> - Correcting the possessive "Torvald's" to "Torvalds'"
> - Fixing "instruction that want" to "instruction that wants"
> - Fixing "code path" to "code paths"
>
> Signed-off-by: Min-Hsun Chang <chmh0624@gmail.com>
> ---
>  Documentation/mm/page_tables.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tables.rst
> index e7c69cc32493..d5a2c37b05e4 100644
> --- a/Documentation/mm/page_tables.rst
> +++ b/Documentation/mm/page_tables.rst
> @@ -26,9 +26,9 @@ Physical memory address 0 will be *pfn 0* and the highest pfn will be
>  the last page of physical memory the external address bus of the CPU can
>  address.
>  
> -With a page granularity of 4KB and a address range of 32 bits, pfn 0 is at
> +With a page granularity of 4KB and an address range of 32 bits, pfn 0 is at
>  address 0x00000000, pfn 1 is at address 0x00001000, pfn 2 is at 0x00002000
> -and so on until we reach pfn 0xfffff at 0xfffff000. With 16KB pages pfs are
> +and so on until we reach pfn 0xfffff at 0xfffff000. With 16KB pages pfns are
>  at 0x00004000, 0x00008000 ... 0xffffc000 and pfn goes from 0 to 0x3ffff.
>  
>  As you can see, with 4KB pages the page base address uses bits 12-31 of the
> @@ -38,8 +38,8 @@ address, and this is why `PAGE_SHIFT` in this case is defined as 12 and
>  Over time a deeper hierarchy has been developed in response to increasing memory
>  sizes. When Linux was created, 4KB pages and a single page table called
>  `swapper_pg_dir` with 1024 entries was used, covering 4MB which coincided with
> -the fact that Torvald's first computer had 4MB of physical memory. Entries in
> -this single table were referred to as *PTE*:s - page table entries.
> +the fact that Torvalds' first computer had 4MB of physical memory. Entries in
> +this single table were referred to as *PTEs* - page table entries.

If you are going to correct that, it should be, by the rules of English,
"Torvalds's".  The elision of the final "s" is done with plural nouns
but not those ending naturally with "s".  As we all know, there's only
one Linus.

Thanks,

jon
