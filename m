Received: from mail-yx1-f66.google.com (mail-yx1-f66.google.com [74.125.224.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8CE37D115
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 21:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965453; cv=none; b=VCWA1iXXxGtnijHGGW0JHUTkycibh7Woa07zzH2FViMW43tpICZNIGSAILUv/I3dYI8foRlU++i5CLApYccyFIx6lK+6/tweWaSbWfwlmZk0V1UsCSIin328yO/3DmSsouZaZ/Bc4R39A7/PM/YXW8p0WT9M2mzKWoaZ3J/0BAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965453; c=relaxed/simple;
	bh=GEYyugiLC/39SzrjBwPLIt1vcjzzwMWmrLt7pnxaa/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nkh8e9NV2O456/rEunRR1SB8Sen7RbeKwB++wTY9nAEi2nWzXrCS/4XvXPz5Dd8qDaMnv8ObcBWYRlDZMnzMIeBO2pFknA4/ySo0LTZIYyRRVXGWanB3hyQSqn4MojgSA+GdrmdKKcw2HyzXC/z3eTGSJJKEi3Pk9GQ8skZncGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KK8IH9xy; arc=none smtp.client-ip=74.125.224.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KK8IH9xy"
Received: by mail-yx1-f66.google.com with SMTP id 956f58d0204a3-65c364b893aso1293331d50.0
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 14:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778965450; x=1779570250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zii2AWb8oMGGjdpxDAORttiwCSLXiloFVUhqxIkFOU=;
        b=KK8IH9xyO442jO+DfF0hPhh8hM7JhdJ7DmWo9B3bdtZ89XqZvEc6UW5TtJabqKw94q
         ZN2mYSI4unPySPz6R2XUdbOHoxqZzj4Lixghcl8DScOsxm7QMn9nm+6rs/L9oKSUTBZJ
         kokK7HygJTKadjDDRkXzc8VgGDCvAmH9Z6C41di1bEMluAcQhgvZ4BvPz/rIpFA5Rqqu
         idOY3AqCBXxLuD0EXR8zR7KqYXB8s2WvltHJ1CF4Jd+niYH7CBdY65Gn4zitBkxB3uy/
         SZQPr5+h28qKnUzeIGtHTj48XG+5y3z5jRv+jZprXKjrkVQvVg5r1l9C5TfT1SqVNsnx
         6lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778965450; x=1779570250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9zii2AWb8oMGGjdpxDAORttiwCSLXiloFVUhqxIkFOU=;
        b=Ili3y+1QBANaBA0OBAwYxcZI2Pk0FPBR07T35IHM0pcLtE0N0ieeuvMwjxxDdBU23r
         4lO+PKsBMlX/Xd+Bwulvto2sRivnAEhCK61yV5Ppr4XPO7msWyFLoYGK2y+y/qHa1tvE
         0zi6TszAVpiKge7GawPuw20c12B8y8fR9gU0wbgJJJRIKFhaslU+61i2MeiMVRg4O8T6
         230i5/eBfZjVwrycZTxQc8ccdCbZk4NPjNFRF713uArkgQPagJF8q8RcXFupGlgsnufc
         gXXQqo7mjY9F/aQ+7+T/8hmyeSmJchj1HtIE2W4jhatkDFizi6xtbwqukQUG3hulJour
         3jmg==
X-Forwarded-Encrypted: i=1; AFNElJ9chZ2CAlEqGhqu5bCAZrLNG4LBv9Tc+W+ZZmsNE0aw0nglHrMmsvUjM6+7LqgrmpDkP0RRdfnxzX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUmJ5Ty36r85FWiykK5QPoPGwHxWdcHOpLw4XhsQV6MlTwI3Zr
	i6HNExjTXqZb9brfnamOKlZI/legPpQGG0wmdftuAmXSixbIMQGpKmCP0+ndB5g=
X-Gm-Gg: Acq92OHzAJ2jSGqdULfj9HPoGP2M9y7QXNjfZZPGK48R1b3XIlSLm3xoocF+NLMHgXH
	WwvALwpCoU9D91E3sGYdvJMis5OV6lqAv1lv1scgjJ6CGFShIm89f874N36VNKs0aoaE+G6rWGh
	4yub5/FHFc4Nk65qSmpG/ESpcsTZ7Ru3FfReV8fcsoEFIkpRnHdSYtvardZiAFFgcFQWR1cJuBl
	nTqBxyIU3QQgAn7pkniKacYtozrfmiWbX2uKdq2xIeczfzw51g96fdunRuGH4apfrjsOJyOhj8t
	VXFAFThO9ETj1CdhdOoUtin720wCatX58OK5ZWYOhIV9WUxJq7RjivEHsyU2S60hz6KpeortC9C
	2D8SzPGcRf+1dRabEgKuhIjw3di+Qt90VfF1jeYVhnABSrGO04wjbkKIqH04JFrCPxnniWEgHxZ
	XjnItoDoOL5VPdPu+hnNu8uBseNbwTjJJVQsHxbq2kTIoVtOX9yg2fG7Y3gQKOdqeZ7TRzFrsVu
	g==
X-Received: by 2002:a05:690e:191b:b0:65e:c81:3a6c with SMTP id 956f58d0204a3-65e226dcb9dmr9397203d50.15.1778965450383;
        Sat, 16 May 2026 14:04:10 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0d86c850sm4349204d50.1.2026.05.16.14.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:04:09 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com
Subject: [RFC PATCH 4/5] mm/damon/paddr: skip free pageblocks in migration walk
Date: Sat, 16 May 2026 14:03:56 -0700
Message-ID: <20260516210357.2247-5-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516210357.2247-1-ravis.opensrc@gmail.com>
References: <20260516210357.2247-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_pa_migrate() walks every PFN in a region linearly, calling
damon_get_folio() for each one.  On sparse physical address spaces
(e.g., CXL-attached memory), a single DAMON region can span hundreds
of gigabytes where most memory is free and sitting in the buddy
allocator.  Most page lookups are fruitless and dominate kdamond
tick time.

Check at pageblock boundaries (2MB on x86_64) whether the block is
entirely free.  If the first page of a pageblock is a buddy page at
pageblock_order or higher, the entire block is free and can be
skipped.  Similarly skip pageblocks where pfn_to_online_page() returns
NULL.

This reduces the iteration from O(region_sz / PAGE_SIZE) to
O(region_sz / pageblock_sz) + O(populated_pages).

buddy_order_unsafe() is used without zone->lock.  A transient false
positive (block becomes non-free between the PageBuddy and order
checks) costs at most one tick of missed candidates on that block;
the next tick re-scans.  No correctness consequence as DAMON walks
are best-effort.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/paddr.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index c4738cd5e221e..e844c990987b9 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -258,13 +258,32 @@ static unsigned long damon_pa_migrate(struct damon_region *r,
 		unsigned long addr_unit, struct damos *s,
 		unsigned long *sz_filter_passed)
 {
-	phys_addr_t addr, applied;
+	phys_addr_t addr, end, applied;
 	LIST_HEAD(folio_list);
 	struct folio *folio = NULL;
+	unsigned long pfn;
 
 	addr = damon_pa_phys_addr(r->ar.start, addr_unit);
-	while (addr < damon_pa_phys_addr(r->ar.end, addr_unit)) {
-		folio = damon_get_folio(PHYS_PFN(addr));
+	end = damon_pa_phys_addr(r->ar.end, addr_unit);
+	while (addr < end) {
+		pfn = PHYS_PFN(addr);
+
+		/* Skip pageblocks that are entirely free. */
+		if (IS_ALIGNED(pfn, pageblock_nr_pages)) {
+			struct page *page = pfn_to_online_page(pfn);
+
+			if (!page) {
+				addr += pageblock_nr_pages * PAGE_SIZE;
+				continue;
+			}
+			if (PageBuddy(page) &&
+			    buddy_order_unsafe(page) >= pageblock_order) {
+				addr += pageblock_nr_pages * PAGE_SIZE;
+				continue;
+			}
+		}
+
+		folio = damon_get_folio(pfn);
 		if (damon_pa_invalid_damos_folio(folio, s)) {
 			addr += PAGE_SIZE;
 			continue;
-- 
2.43.0

