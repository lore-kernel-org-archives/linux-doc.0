Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1631ADC98
	for <linux-doc@vger.kernel.org>; Mon,  9 Jun 2025 21:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749503386; cv=none; b=onFUDTooBxlarcrh6xRARxD9Ng6skY8biut67z6xbaemXuJlJhqnkQXP6D5OULyeru7GKmzsmiBu03X+pLeVVohwA2o7aID8nsgnabtB4eXiQlZLufz2x2kMFdyw/Sc3GSSZtfYPnxU9SJdqRaiSti+xIumwNLHtLSXL049WBpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749503386; c=relaxed/simple;
	bh=E0WOZ94E2WrSI0rJ6aQRYheSpIEIUqe/xBG7DIm0aP4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IJzneFhV+84R8mPLr4ifBK3FKhQdQ3FrhkuCcm5ssd1k6HX6NhRz05/52CzPqj5kbzvHKt4ilG665qRev77/bNqGr/84HhpnIpUe9fqi01mOJO8jK0+eYqbxi17QbbPcH5v8c5z6SMdcm+UbCof6afDCniJFXIN7/bTVSUro5y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nPqkFHLR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nPqkFHLR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9EABF41AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749503382; bh=loaxC/DH/uahhnOeaE+FDXmEPj3usRhtnJkDxfkAjLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nPqkFHLRplYDUpevHqYJBeH5ZhHfAIxeB8bEKUB3cxKVccL8rMsr1rXfhNR/Hm83V
	 /Hyf03pVSIJH2n2uj4vySPTHBU95LSFTI7e+Cx5WBVIF68i+KAC5zAKcvVV3M2uN3B
	 lZJnI9QAz900BeJREXdqPN8VhsnLgoGISSvBcmKtQfSeCrsJto49Ru49wvBo324+sP
	 vg3iY6qO1raU5SdUgfVln8TrdiJX1grBLQLIaXxVAF7LIMcYuuiemEjFc8u6SVD6u5
	 3QcmWJPbH4ibLnMco1Cn7pn4+YdbguAWfWH3dSW3XVEd+tcqeOSi0/vi2rj5QOLssu
	 fTU/+nvqJLNOQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9EABF41AA1;
	Mon,  9 Jun 2025 21:09:42 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] kernel-doc: Fix symbol matching for dropped suffixes
In-Reply-To: <aEdJwQAZrTiKWBFI@casper.infradead.org>
References: <20250606141543.1285671-1-willy@infradead.org>
 <877c1kbr4z.fsf@trenco.lwn.net> <aEdJwQAZrTiKWBFI@casper.infradead.org>
Date: Mon, 09 Jun 2025 15:09:41 -0600
Message-ID: <87cybcaaga.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matthew Wilcox <willy@infradead.org> writes:

>> I've applied this.  Naturally, it gifts us with a new docs build
>> warning:
>> 
>> > Documentation/core-api/mm-api:40: ./mm/slub.c:4936: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> > Documentation/core-api/mm-api:40: ./mm/slub.c:4936: ERROR: Undefined substitution referenced: "--------". [docutils]
>> 
>> I was hoping your other slab patch series address this, but it doesn't
>> look that way...?
>
> Indeed it does.
>
> It's a pre-existing bug, that's only unmaked by this patch.

I knew that, that's why I hoped the other series maybe addressed it. 

> Honestly,
> I'm not that great at kerneldoc and I was hoping someone like Randy
> would notice and fix it ;-)

The attached fixes it, but may conflict with your other work.

jon

From 6b3b23e49b57a377716870bc752b884f324ad342 Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Mon, 9 Jun 2025 15:05:46 -0600
Subject: [PATCH] mm: slub: Fix a documentation build error for kerealloc()

The kerneldoc comment for krealloc() contains an unmarked literal block,
leading to these warnings in the docs build:

  Documentation/core-api/mm-api:40: ./mm/slub.c:4936: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
  Documentation/core-api/mm-api:40: ./mm/slub.c:4936: ERROR: Undefined substitution referenced: "--------". [docutils]

Mark up and indent the block properly to bring a bit of peace to our build
logs.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 mm/slub.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 31e11ef256f9..45a963e363d3 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4930,12 +4930,12 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
  * When slub_debug_orig_size() is off, krealloc() only knows about the bucket
  * size of an allocation (but not the exact size it was allocated with) and
  * hence implements the following semantics for shrinking and growing buffers
- * with __GFP_ZERO.
+ * with __GFP_ZERO::
  *
- *         new             bucket
- * 0       size             size
- * |--------|----------------|
- * |  keep  |      zero      |
+ *           new             bucket
+ *   0       size             size
+ *   |--------|----------------|
+ *   |  keep  |      zero      |
  *
  * Otherwise, the original allocation size 'orig_size' could be used to
  * precisely clear the requested size, and the new size will also be stored
-- 
2.49.0

