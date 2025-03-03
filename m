Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A28F253F04
	for <linux-doc@vger.kernel.org>; Mon,  3 Mar 2025 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019466; cv=none; b=hVe7QWmKQQoIcCtXfLt+Y2CW7ZykTnB/2Dr4uBSfFhhFtvivU1ZbxfoAgi6rkO+69+ddyI9Slpcys1h8eRnKEXKthrOmkEo9kVcmewyhOC8WI4XlmWlbWz87lIejTn1TfevT+leHktCEfx2NCk/37j9nda4uhxn9FPWZ7/ilFdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019466; c=relaxed/simple;
	bh=67PK8pUQYPqYlMZHYSLo+XzRkAgj9tRIuRjTWNQ3VlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cd/DVAFJAlgqIwVHJSCDbs0Iq4C/eti/Fh0R1BpC6bqFisr9TAgGbmSxssmHe9AooC0MHmQCDCPg13Dflhc9I85ZJNB2xwrB1sYp1r1mFXpvXEYdWECaqpL0ktdxpXOz9AXXEZ1/TmwrG1Lk6MEVBb8hrtIHYdSX/eHCagwN8LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V1FvZmZT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V1FvZmZT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741019463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Ha8UZDq7Lu61upXZpfKkXckZhfouMk5cB7+X6dnx8Y=;
	b=V1FvZmZTyY/z8oAcBAwx7yzKkMyM/FLffLOqKdOaEnXJey2Xs3mFOilpKOHMTe+PwYznt6
	wButqooIIvZfj2wfNlaocP47oRA9OmgxSHml/HSzzKDIG+f5UO4GfFr+a72CTmQg8pwmLP
	kO9LZgdUpWK7lfNEt5Z+d9o9J834NFs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-QD-NKPcQNp-bMM4Q8TYpOA-1; Mon, 03 Mar 2025 11:30:57 -0500
X-MC-Unique: QD-NKPcQNp-bMM4Q8TYpOA-1
X-Mimecast-MFC-AGG-ID: QD-NKPcQNp-bMM4Q8TYpOA_1741019456
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-390e62ef5f6so1682714f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Mar 2025 08:30:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741019456; x=1741624256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Ha8UZDq7Lu61upXZpfKkXckZhfouMk5cB7+X6dnx8Y=;
        b=C79eo/jfr4gpyg8mV2TXnGAMgS3tAX/7h+CjpacWQOCOtuqNURBwiY/Y8e4fQRTkyI
         OsV7mkHNjHjkNhwElKjpzC8Cqdkgvh3HnwmX7lCqga57iWtnMCwpkYrg8Oq1N3MAMA2t
         41rD53MtcS7iL7Kso+TmAoqPNf7xi1t56JUDwSgQjD2kJKDHi4KzEhJLVrHzp3WotI2O
         vBUaa/lCm+Y0OSN6KclrudysXpnE09f7x0j/COV7pCQ5IYtBfZmIJFyojMmD3m8d9Ht8
         G/7DgvY0+dY/PXmNV1QQpeWieBP6ilDEpQdFl/1sAHxQV7yZgGp9hFO6wHkHA2atEjf4
         UuSQ==
X-Gm-Message-State: AOJu0YwLkavF9arpiRkBdviNjCKNiiy8P5e8vN0h5Sh/UmHFlbAPzK/+
	dCGItBGQwYFUV3CBf/8lIGCF+tnIMvO8G0dqMA6XhXq/eRXvQlAmBuW5kf69VDJQjtxjGiAW2nw
	NOFr7USG5xoqJaRvgovisGyoaHIVyhVtWzgNJCy56hZBHY56ScVkiSJMT7g==
X-Gm-Gg: ASbGncsrGqJOCSXjuUjIftQdahM7UsdzNVLmFx7Z+mMtwPoDnzw52AEWZ8xsG2Ys2Yh
	6C5kkIpxKxPqkEROQAbYpbsUvkNzJO0QjmmXHIw2FkwsnE42bC89yJpTcqWxhU4jhIrfSpp7E4R
	nExNE+Mc3tO0smGSyUjsEodJyGvNEkdbvIWnUcSQcdZ+Z2/k37nQjjXDwrH+Kg42+2SqKNHMznd
	tqqKfGnmenJkUul6yZXwdDjEBUUAbwkZHyfoD0S17kZWFAiEj5tpFV6Zz1s1u/xralGJta6Rcqf
	EMDFqcq4JVafeuILBxewGgGfzpIN93U8cEt1XXgZAS1FqFutE4iQ3OtXt9U7PTGDMLh6n0nM8hJ
	P
X-Received: by 2002:a5d:64cf:0:b0:390:df6c:591f with SMTP id ffacd0b85a97d-390ec7cd2ddmr9512469f8f.17.1741019455922;
        Mon, 03 Mar 2025 08:30:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEU1cXWjWugfmabLrmr0XJAbs+GQI7107y37ij+zO9LNUtV9tqHS/ZXKWHCRmLlaLTb16eXbQ==
X-Received: by 2002:a5d:64cf:0:b0:390:df6c:591f with SMTP id ffacd0b85a97d-390ec7cd2ddmr9512425f8f.17.1741019455528;
        Mon, 03 Mar 2025 08:30:55 -0800 (PST)
Received: from localhost (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de. [2003:cb:c734:9600:af27:4326:a216:2bfb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e485ddd1sm15052695f8f.94.2025.03.03.08.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:30:55 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Muchun Song <muchun.song@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v3 17/20] fs/proc/task_mmu: remove per-page mapcount dependency for PM_MMAP_EXCLUSIVE (CONFIG_NO_PAGE_MAPCOUNT)
Date: Mon,  3 Mar 2025 17:30:10 +0100
Message-ID: <20250303163014.1128035-18-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303163014.1128035-1-david@redhat.com>
References: <20250303163014.1128035-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's implement an alternative when per-page mapcounts in large folios are
no longer maintained -- soon with CONFIG_NO_PAGE_MAPCOUNT.

PM_MMAP_EXCLUSIVE will now be set if folio_likely_mapped_shared() is
true -- when the folio is considered "mapped shared", including when
it once was "mapped shared" but no longer is, as documented.

This might result in and under-indication of "exclusively mapped", which
is considered better than over-indicating it: under-estimating the USS
(Unique Set Size) is better than over-estimating it.

As an alternative, we could simply remove that flag with
CONFIG_NO_PAGE_MAPCOUNT completely, but there might be value to it. So,
let's keep it like that and document the behavior.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/admin-guide/mm/pagemap.rst | 11 +++++++++++
 fs/proc/task_mmu.c                       | 11 +++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
index d6647daca9122..afce291649dd6 100644
--- a/Documentation/admin-guide/mm/pagemap.rst
+++ b/Documentation/admin-guide/mm/pagemap.rst
@@ -38,6 +38,17 @@ There are four components to pagemap:
    precisely which pages are mapped (or in swap) and comparing mapped
    pages between processes.
 
+   Traditionally, bit 56 indicates that a page is mapped exactly once and bit
+   56 is clear when a page is mapped multiple times, even when mapped in the
+   same process multiple times. In some kernel configurations, the semantics
+   for pages part of a larger allocation (e.g., THP) can differ: bit 56 is set
+   if all pages part of the corresponding large allocation are *certainly*
+   mapped in the same process, even if the page is mapped multiple times in that
+   process. Bit 56 is clear when any page page of the larger allocation
+   is *maybe* mapped in a different process. In some cases, a large allocation
+   might be treated as "maybe mapped by multiple processes" even though this
+   is no longer the case.
+
    Efficient users of this interface will use ``/proc/pid/maps`` to
    determine which areas of memory are actually mapped and llseek to
    skip over unmapped regions.
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 1162f0e72df2e..f937c2df7b3f4 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1652,6 +1652,13 @@ static int add_to_pagemap(pagemap_entry_t *pme, struct pagemapread *pm)
 	return 0;
 }
 
+static bool __folio_page_mapped_exclusively(struct folio *folio, struct page *page)
+{
+	if (IS_ENABLED(CONFIG_PAGE_MAPCOUNT))
+		return folio_precise_page_mapcount(folio, page) == 1;
+	return !folio_maybe_mapped_shared(folio);
+}
+
 static int pagemap_pte_hole(unsigned long start, unsigned long end,
 			    __always_unused int depth, struct mm_walk *walk)
 {
@@ -1742,7 +1749,7 @@ static pagemap_entry_t pte_to_pagemap_entry(struct pagemapread *pm,
 		if (!folio_test_anon(folio))
 			flags |= PM_FILE;
 		if ((flags & PM_PRESENT) &&
-		    folio_precise_page_mapcount(folio, page) == 1)
+		    __folio_page_mapped_exclusively(folio, page))
 			flags |= PM_MMAP_EXCLUSIVE;
 	}
 	if (vma->vm_flags & VM_SOFTDIRTY)
@@ -1817,7 +1824,7 @@ static int pagemap_pmd_range(pmd_t *pmdp, unsigned long addr, unsigned long end,
 			pagemap_entry_t pme;
 
 			if (folio && (flags & PM_PRESENT) &&
-			    folio_precise_page_mapcount(folio, page + idx) == 1)
+			    __folio_page_mapped_exclusively(folio, page))
 				cur_flags |= PM_MMAP_EXCLUSIVE;
 
 			pme = make_pme(frame, cur_flags);
-- 
2.48.1

