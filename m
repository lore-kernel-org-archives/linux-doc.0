Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071688;
	b=H8cH9i7a+0+v48fq+EmeIev1wTgDFbzGICo7RYyJ3pIhSgG2rzYaW/r1sUfRVvc5JyXM
	 dUhxt0O/Fjkv7yiKeEErqY0zWuzkcr+YqvCwqw/4G1S3jgQN72GQKXl28/iK4rGyiJmUN
	 Zb3k+YMi8BupzlKLXdIRnjWY8CbkCz6vZcU3xQcEjromxG4rq4ygdrg4bzcvOl/HpheHH
	 +Dt3bjjRTk4OFqt6R9M2MH7BmXROduuGKL1gAx9tWAzpqthMhrY9+NIH1rr+5O39/oYVt
	 C/LTBfAT7hALUfORm6htz5+V3o4wkKbD0kAESCMpHERWHAMZq+oVagwkVmKZEDJXgUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PqykPPsR7vG8RbNReH5m+C9K46mE2LkFenHsUlsFdp0=;
	b=U5U+1Q3Wdk4/tXcfCso1MERy+EGBB6ZEo+zV943K298J5j3QcqEOTEv5NL9piNlHtlwq
	 68QQlJszmG2O/VqoGDGonAIOncscqNRxW1huyn2CgreaxEYFbx+0jkv+d61ggInXNZK+s
	 mDs3MFdlU2rGjSv39GLGEXqrST9dR07gPlve2p+RtrVW81oWzzYBCF/90g8ZQsTu96iu3
	 e3Kt91m63P94v6OV/EmmPGMu/xiegFmMRXsiA5Wc9f4pqAE1unj1VU65HnnN1xYZd3HLI
	 Hlp0e6hHZnM4DuGFuFIEY9tGQIyI9vnKuHhrE+t88C/Tbl6wnJcOvi5NeDkcysAtieA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=YBmgBfyO;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106E8606A334
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 07:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 106E8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=YBmgBfyO
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1668332a91.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 23:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071687; x=1795676487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqykPPsR7vG8RbNReH5m+C9K46mE2LkFenHsUlsFdp0=;
        b=YBmgBfyOjqXoVMkfsmSdgPgEbZzY/nsu1UPcgSHwFef3FtMLNDU9R/blryNFWek7no
         AdibTYYCN24EDLJnPzPsP/kUExAzP5oYdvNl6Ubm7GEGTjO1bU97xGZHEcJ9VWZJZxUt
         XPhwNpkwK1qKlt2DmjR1s/X3dUxdmhwtDPXWsImmN8z12ndz3iQzdCIR3CfHNh0UbHpC
         JXgcB+XE26kwkihBmjYPNEOXSeHsQxFi41tzLppZ8whEMIzFbfglwJb4LVg13xtCVsvq
         7o4xQo+EvO3Wr6+3QXnL5+sRK2PXxdzskuTQYo1dPow7v9BS1tFRNj9M8PLSfidZiXjc
         mEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071687; x=1795676487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PqykPPsR7vG8RbNReH5m+C9K46mE2LkFenHsUlsFdp0=;
        b=U7VbRpdydITywllTUSZdMogrYybz1ZPstrdPwZiCxXKyqndWrOq59ag/dkRWKdOYN0
         X16WK7hP5Ae/f53Ogl80Oz3isPrUKb7KfWurguRmr9JKHYZDYvXdz+B/6taWjj9t3hA/
         95FVGiBEIWP3jSKeF+IiEoK2LDAopMpmqCOkzPytVzqpvTCM/X9TpXttfvMcmsCXsafX
         mnaOtDqwNcYaR9yuEEh0RqWhVLpJ6QgXLM092LBIsBhbjVr/HsLotVpGu9epwuyrz34J
         GFnHMjNjZP4nLI7dS/WbGyP7i6+BSgbzM+Lttn88rRxLWQ9k8q4+oOEgDP3xlTsXFe0B
         EgzQ==
X-Forwarded-Encrypted: i=1; AL+hErFGgN6U2VZWGkjQQ7uSYA6wkYfN/7yYOj15zHqY/QWQR6NnPrPoRv3EwI/a7uQf/5C5rAogHeCpNQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nN/8KH0mQIdglvTRsDMvMFQ5VWVIDxhvgYKIplIs/HplNbReN
	rhLm8LchWI6Jpk5QhERYhkqZ0WApkwNRkVUnLMlNnbXPSHJngiBMJQlZbvVA09/bDUg=
X-Gm-Gg: AZFdTZcQ40F9ReqT1/B3AAOsKYuowriir1dpQgudJC3ilUN4TSSf2aHvOKpjWAOVdle
	m1Rv4rty08PK7FJtsUJk3PKDj8Zi6A8DnWVm0JUxQV6XZgW6sBg9Q38IQOxhgfbsNsqZ+JMHFZi
	HHzlcd7c+x3p2KLO0FojkUtTOBb2rbdVF/xzJlbaoOP+19A1DDLZ5HE3bvaXRXhGvRFtJ992QXS
	AXmfMIf2sS6JbcZuPc3Lm+Pk52IglPr3zW1BmrW5xsg+jbdkUTfHeISK1cg/4L481NHj4wPGuJ0
	oy5Px+sn0gB5PyZQkGnEYVfeXL1V3Tn+I31ptdK/K7m4vZrcoaNIBJnaW0MH5aru7zI9DvkekM9
	C22K4I2wSQoUFE20xOykLkSjy+PQU/RqzdIbnSP/BMhV86dCAn/OWwcxGiZ2J6CYI6TdW8DyfIg
	kbq41TXBmfhK/HCcckWGrmesigMhZT5mmhRIzEwgvM+qw1eqxLIv5OfM11W1XfpOdOmI4zaOcDe
	reVojWOTl11sYNd04FXPWoQZagVZoqVwpkaMmYcVUicm+Gvct7NfCCIIHREqOsdmqFAx9i+1/3F
	3vFAbdeBQi37s7QuM5MaSlFGjv1QoAXL3VtFNpzQWExLb7bBykE6dPy/q08=
X-Received: by 2002:a17:90b:2ec8:b0:3ab:c80:9370 with SMTP id 98e67ed59e1d1-3b3d0759d8fmr4252956a91.20.1795071686861;
        Wed, 18 Nov 2026 23:01:26 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.23.01.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:01:26 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>,
	kasan-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 6/7] mm/page_ext: inline unchecked page extension lookup
Date: Thu, 19 Nov 2026 14:58:11 +0800
Message-ID: <20261119065812.89959-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119065812.89959-1-songmuchun@bytedance.com>
References: <20261119065812.89959-1-songmuchun@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KMSAN runtime needs an unchecked page extension lookup that can be
inlined into its uninstrumented compilation unit while page_ext.c remains
instrumented.

Provide an inline lookup for this use case while keeping the existing RCU
checks for other callers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
---
v3:
- Collect Reviewed-by and Tested-by from Chris Down

v2:
- Add a preparatory patch that inlines the unchecked lookup (suggested
  by Chris Down)
- Use a PFN interface to avoid architecture header-order dependencies
---
 include/linux/page_ext.h | 46 ++++++++++++++++++++++++++++++
 mm/page_ext.c            | 60 +++-------------------------------------
 2 files changed, 50 insertions(+), 56 deletions(-)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index d00320106a58..166f8be11564 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -64,7 +64,14 @@ static inline bool early_page_ext_enabled(void)
 void page_ext_alloc(void);
 void page_ext_init(void);
 
+static __always_inline struct page_ext *page_ext_entry(void *base, unsigned long index)
+{
+	return base + page_ext_size * index;
+}
+
 #ifdef CONFIG_SPARSEMEM
+#define PAGE_EXT_INVALID	0x1
+
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
 	/*
@@ -73,11 +80,50 @@ static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 	 */
 	return next_pfn % PAGES_PER_SECTION;
 }
+
+static __always_inline bool page_ext_invalid(struct page_ext *page_ext)
+{
+	return !page_ext || (((unsigned long)page_ext & PAGE_EXT_INVALID) == PAGE_EXT_INVALID);
+}
+
+static __always_inline struct page_ext *__page_ext_lookup(unsigned long pfn)
+{
+	struct mem_section *section = __pfn_to_section(pfn);
+	struct page_ext *page_ext = READ_ONCE(section->page_ext);
+
+	/*
+	 * The sanity checks the page allocator does upon freeing a page can
+	 * reach here before the page_ext arrays are allocated when feeding a
+	 * range of pages to the allocator for the first time during bootup or
+	 * memory hotplug.
+	 */
+	if (page_ext_invalid(page_ext))
+		return NULL;
+	return page_ext_entry(page_ext, pfn);
+}
 #else
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
 	return true;
 }
+
+static __always_inline struct page_ext *__page_ext_lookup(unsigned long pfn)
+{
+	int nid = pfn_to_nid(pfn);
+	struct page_ext *base = NODE_DATA(nid)->node_page_ext;
+	unsigned long index;
+
+	/*
+	 * The sanity checks the page allocator does upon freeing a page can
+	 * reach here before the page_ext arrays are allocated when feeding a
+	 * range of pages to the allocator for the first time during bootup or
+	 * memory hotplug.
+	 */
+	if (unlikely(!base))
+		return NULL;
+	index = pfn - round_down(node_start_pfn(nid), MAX_ORDER_NR_PAGES);
+	return page_ext_entry(base, index);
+}
 #endif
 
 extern struct page_ext *page_ext_get(const struct page *page);
diff --git a/mm/page_ext.c b/mm/page_ext.c
index cfd20ed72884..63af3d62ed74 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -63,10 +63,6 @@
  * can utilize this callback to initialize the state of it correctly.
  */
 
-#ifdef CONFIG_SPARSEMEM
-#define PAGE_EXT_INVALID       (0x1)
-#endif
-
 #if defined(CONFIG_PAGE_IDLE_FLAG) && !defined(CONFIG_64BIT)
 static bool need_page_idle(void)
 {
@@ -180,33 +176,7 @@ static void __init invoke_init_callbacks(void)
 	}
 }
 
-static inline struct page_ext *get_entry(void *base, unsigned long index)
-{
-	return base + page_ext_size * index;
-}
-
 #ifndef CONFIG_SPARSEMEM
-static struct page_ext *lookup_page_ext(const struct page *page)
-{
-	unsigned long pfn = page_to_pfn(page);
-	unsigned long index;
-	struct page_ext *base;
-
-	WARN_ON_ONCE(!rcu_read_lock_held());
-	base = NODE_DATA(page_to_nid(page))->node_page_ext;
-	/*
-	 * The sanity checks the page allocator does upon freeing a
-	 * page can reach here before the page_ext arrays are
-	 * allocated when feeding a range of pages to the allocator
-	 * for the first time during bootup or memory hotplug.
-	 */
-	if (unlikely(!base))
-		return NULL;
-	index = pfn - round_down(node_start_pfn(page_to_nid(page)),
-					MAX_ORDER_NR_PAGES);
-	return get_entry(base, index);
-}
-
 static int __init alloc_node_page_ext(int nid)
 {
 	struct page_ext *base;
@@ -252,29 +222,6 @@ static int __init __page_ext_alloc(void)
 }
 
 #else /* CONFIG_SPARSEMEM */
-static bool page_ext_invalid(struct page_ext *page_ext)
-{
-	return !page_ext || (((unsigned long)page_ext & PAGE_EXT_INVALID) == PAGE_EXT_INVALID);
-}
-
-static struct page_ext *lookup_page_ext(const struct page *page)
-{
-	unsigned long pfn = page_to_pfn(page);
-	struct mem_section *section = __pfn_to_section(pfn);
-	struct page_ext *page_ext = READ_ONCE(section->page_ext);
-
-	WARN_ON_ONCE(!rcu_read_lock_held());
-	/*
-	 * The sanity checks the page allocator does upon freeing a
-	 * page can reach here before the page_ext arrays are
-	 * allocated when feeding a range of pages to the allocator
-	 * for the first time during bootup or memory hotplug.
-	 */
-	if (page_ext_invalid(page_ext))
-		return NULL;
-	return get_entry(page_ext, pfn);
-}
-
 static __ref void *alloc_page_ext(size_t size, int nid)
 {
 	void *addr;
@@ -365,7 +312,7 @@ static void __free_page_ext(unsigned long pfn)
 		base = (void *)base - PAGE_EXT_INVALID;
 	WRITE_ONCE(ms->page_ext, NULL);
 
-	base = get_entry(base, pfn);
+	base = page_ext_entry(base, pfn);
 	free_page_ext(base);
 }
 
@@ -508,7 +455,8 @@ void __init page_ext_init(void)
  */
 struct page_ext *page_ext_lookup(unsigned long pfn)
 {
-	return lookup_page_ext(pfn_to_page(pfn));
+	WARN_ON_ONCE(!rcu_read_lock_held());
+	return __page_ext_lookup(pfn);
 }
 
 /**
@@ -527,7 +475,7 @@ struct page_ext *page_ext_get(const struct page *page)
 	struct page_ext *page_ext;
 
 	rcu_read_lock();
-	page_ext = lookup_page_ext(page);
+	page_ext = page_ext_lookup(page_to_pfn(page));
 	if (!page_ext) {
 		rcu_read_unlock();
 		return NULL;
-- 
2.54.0

