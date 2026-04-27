Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5EA3B27CE;
	Mon, 27 Apr 2026 10:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284452; cv=none; b=LNYd+q8JQ3X7yw4tOYG3/Eaqmh50esvwAdbNUVRf+XI6w+/Mcbv1Z7aDNAmYUyIhEbXkVfDw6O1OcclT4nTc3LTkDhOgCMrA7dfRGFVeGK9DoPuMN/hTyCefv1tOUS4YJNs5/DawYZCDe4k1rcuCUapvTfbQAPHn84GLad5PJ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284452; c=relaxed/simple;
	bh=VsJYSBsEJwtq3iSHacKLUqkeUHY96hSYjZ5ldp+kAK4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rdFBSkM2j4OePmIcCSc/FGUX6EnRjGFOs+buDerQv566R5POD96dDNNFVlDJ27yYFcnpQyXc3zKE7Aa+HKZ5U6bOz6LU6HHOm3NqXg+5xW8FV7QmMDmoG6GkHBa18DGmB9NlowFra8+A0+XPUDszGnR9b6K1owvuQtQUBEgwQJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=M7Ht9uuR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="M7Ht9uuR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 263AE41098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777284450; bh=N3lrxGQLjDcCiAEwGQU0tUUpjT1qzBS5oH03zByesoU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M7Ht9uuR6WzDnlUXwj+p3MBR71ekY+OjVFlu40wwm3gxR1Vby20tHhPW+3mEafFTP
	 NbbJ6qpu4SXCqzVTbc3bgqzZFGXqtAulMullliDO5RaUXlR1t9Q05DFXyUrnI8BCco
	 KArKJL02y7nvozsgHa6aUvY5bUjXM+y+aWwY8aRA124/9bEizThkIr+rc/cAxRwD2b
	 6YH5r4pHRY099sSGvfm1cLw505E5xjh5ZECSiqRPs1pHLX2POY9hy14iNBa9CFWQI7
	 i3B3ugSfahqle7HwAJRR6IRkmRDwOfPS/jJSxntN1hdbgmeabZpcZJry705fdnxipK
	 zkCpFyr7Dx4kg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 263AE41098;
	Mon, 27 Apr 2026 10:07:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Bart Van Assche <bvanassche@acm.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: xforms_lists: allow __maybe_unused in func
 parameters
In-Reply-To: <20260411233526.3909303-1-rdunlap@infradead.org>
References: <20260411233526.3909303-1-rdunlap@infradead.org>
Date: Mon, 27 Apr 2026 04:07:26 -0600
Message-ID: <877bpspvhd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Bart has a patch (not yet merged) that causes kernel-doc warnings:
>
> WARNING: ./include/linux/highmem.h:235 function parameter '__maybe_unused' not described in 'clear_user_pages'
> Documentation/mm/highmem:211: ./include/linux/highmem.h:222: WARNING: Error in declarator or parameters
>
> Handle this by adding "__maybe_unused" to the list of known function
> parameter modifiers.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604120025.jtlnpWff-lkp@intel.com/
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Bart Van Assche <bvanassche@acm.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>  tools/lib/python/kdoc/xforms_lists.py |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linext-2026-0410.orig/tools/lib/python/kdoc/xforms_lists.py
> +++ linext-2026-0410/tools/lib/python/kdoc/xforms_lists.py
> @@ -93,6 +93,7 @@ class CTransforms:
>          (CMatch("__weak"), ""),
>          (CMatch("__sched"), ""),
>          (CMatch("__always_unused"), ""),
> +        (CMatch("__maybe_unused"), ""),
>          (CMatch("__printf"), ""),

Applied, thanks.

jon
