Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6744B3A4F28
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768409013; cv=none; b=VIzeb5iLNZcfZc59xg5tsvCD3VLztbgQD2PwuxnPAncpfEACkPXDywbvzPvmJVdBP6+yT4JJal6BUie4zrjK6qtrdtneUAZrZovM2RJcJDg44Wy2oFXWJl/xd6oqGYHn7V8C1xnHMC+BRPVZA/wtBx2zMmtGxGeMKZJuiPur5ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768409013; c=relaxed/simple;
	bh=7BYRgRnhfN3fHr35Z4lIewD7nb4bdgg7dJRSYUFPl2k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O4+Vvp7EqjylrNeaenE2F10K/tjrrwTIETmEoL3TY4UbG2Ib2to35BkHh2ocEHAiQs3qJDNDnEkvmdBwjKUN8Ba9wnLv8kVc//wIElljBpn4cCQ+Oe8zVPdFI2fyOsONy7a4VCuBrSjykeh5X9SRVkZe8RlEln8hhT5WI2QGczY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iCmITmYz; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iCmITmYz"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47ee868f5adso387715e9.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 08:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768409011; x=1769013811; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NagltRQpX2SlKWY3/YB/PdnajjFmvEiNKHSf6/veCZ0=;
        b=iCmITmYzBFUH9gYHFUZPjgDr1WAUBC4PkanBW9XOw9HBQEr0Fd7MGoISiB+V+LCw7h
         Z8HyT6dFWF3lNxxflP1tJaoaW08cO61FsOmtT/adxI4vRkv+Xj+YSSdQ8aSlbF78HQYt
         orEyr4M17eirungbI6dkPTXCWFRY9/QOR2dcsNUCHSvdvdcTZaphpSRjxoHaqmfwCiQR
         UFLUmsRgIBcAzXMa+XTAwdAVH31X/mNzkiC3BKhtZZgu11I0oNXkX2ZgwmTu0rXN8XZ4
         ZsPEOCMVShMuzC76+3tcWs6gVqDsr9liXXa/pq+B4CUkZueVJg8oLoN7wLUh7efAFrEC
         sL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768409011; x=1769013811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NagltRQpX2SlKWY3/YB/PdnajjFmvEiNKHSf6/veCZ0=;
        b=UZDeJcqacv9ZiNE3o77WPu4MjFOYAeq5HoF20J+HQSvGEu6YIaoe5d1gjY9CM3/Mxc
         U2QnwJf4kFwPtBMzGEjqITEEslzhUfFoUADJAlrycx4AxOA+tSLf5WOk3wEIRhh6+Mwt
         r5hhc2YdY6lyDAxbMpKZmVHm81AsJIoHJyTKHtyO2GUEGju7fHFWGVw96wp2Q3Wq9AAb
         rSqxPbhAYJBjLtVTXu4mJJe54IzI8YKkl5boz1NI4Md9NqKetuR0YvGY3EO4KVulkMcR
         /INuqN2n0Su2VMEgLFlS5EwHPfnP7ar+jkO4LOH8yebvUYAGzTJ1tDx5OmP0w22BVs3J
         9vJA==
X-Forwarded-Encrypted: i=1; AJvYcCVdZUDPq1yK/EfQK6HGbo2iKJaDiOGoPhqjHXS0BmUmuqnvxV93ouAEPCt+IfbMFeB9GN/EhlpVLTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQSkAxj4oEOSr9FDLijgOWrpfRMxldMevxse20UNq9TkVKtJh6
	zFzIlExnhBq73/iOua1r0QDfD8FaUQwa8ul07vJRnntsp/fXPpqCMMJ5MCWaDsQtsFh/suO3WV0
	oFlERThLsNVavlw==
X-Received: from wmbd23.prod.google.com ([2002:a05:600c:58d7:b0:477:9654:b44c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8707:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-47ee33192c2mr42786345e9.1.1768409011069;
 Wed, 14 Jan 2026 08:43:31 -0800 (PST)
Date: Wed, 14 Jan 2026 16:43:18 +0000
In-Reply-To: <20260114164322.787125-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260114164322.787125-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260114164322.787125-2-smostafa@google.com>
Subject: [PATCH v7 1/5] mm/page_ext: Add page_ext_get_phys()
From: Mostafa Saleh <smostafa@google.com>
To: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	xiaqinxin@huawei.com, baolu.lu@linux.intel.com, rdunlap@infradead.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

In the next patches, IOMMU code will add data to page_ext.
The IOMMU code would operate on physical addresses which
can be outside of system RAM.

Add a new function page_ext_get_phys() to abstract the logic of
checking the address and returning the page_ext.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 include/linux/page_ext.h |  6 ++++++
 mm/page_ext.c            | 23 +++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 76c817162d2f..bd373496e166 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -93,6 +93,7 @@ static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 #endif
 
 extern struct page_ext *page_ext_get(const struct page *page);
+extern struct page_ext *page_ext_get_phys(phys_addr_t phys);
 extern void page_ext_put(struct page_ext *page_ext);
 extern struct page_ext *page_ext_lookup(unsigned long pfn);
 
@@ -215,6 +216,11 @@ static inline struct page_ext *page_ext_get(const struct page *page)
 	return NULL;
 }
 
+static inline struct page_ext *page_ext_get_phys(phys_addr_t phys)
+{
+	return NULL;
+}
+
 static inline void page_ext_put(struct page_ext *page_ext)
 {
 }
diff --git a/mm/page_ext.c b/mm/page_ext.c
index d7396a8970e5..95e8c40131b7 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -534,6 +534,29 @@ struct page_ext *page_ext_get(const struct page *page)
 	return page_ext;
 }
 
+/**
+ * page_ext_get_phys() - Get the page_ext structure for a physical address.
+ * @phys: The physical address to query.
+ *
+ * This function safely gets the `struct page_ext` associated with a given
+ * physical address. It performs validation to ensure the address corresponds
+ * to a valid, online struct page before attempting to access it.
+ * It should return NULL for (MMIO, ZONE_DEVICE, holes, offline memory)
+ *
+ * Return: NULL if no page_ext exists for this physical address.
+ * Context: Any context.  Caller may not sleep until they have called
+ * page_ext_put().
+ */
+struct page_ext *page_ext_get_phys(phys_addr_t phys)
+{
+	struct page *page = pfn_to_online_page(__phys_to_pfn(phys));
+
+	if (!page)
+		return NULL;
+
+	return page_ext_get(page);
+}
+
 /**
  * page_ext_put() - Working with page extended information is done.
  * @page_ext: Page extended information received from page_ext_get().
-- 
2.52.0.457.g6b5491de43-goog

