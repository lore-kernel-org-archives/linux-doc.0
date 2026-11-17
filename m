Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917264;
	b=OPqZYIBxTX4J8d+GTRlgkmzXZEWFRmxutJWBP7Qkg6jfi4fHzS8mK6tecLpNgRtRFNEo
	 rEbpCCkG6l9aFmd8X+Qadm3Uqdpjld4n4GO1nVH1itn7eTOKBl2pGOSUspv1+xZcTIQAh
	 mpZ1xyg+RdQE5fUxut+U2fO1eOPp0ZGH78pFoqVK8dmqt8eet3gcoX6YXXZw8osBZcft0
	 MnJQxMFS5Fk0HBeuP0+bPFbDcbJDypwQFY19DJq2t0jSUGf2WVQQk2y4UzZJhB+QIt4z2
	 iaNJSAXZCSCRGdDv46MVO0gOffegTfwPHQ/QlRgleO9DBR+rFpbrMijEHCMAEt0SgCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WC9KwNg7vzWFhqtQelwms4WX3k2rA90664GjYEiCkuE=;
	b=xLM7ZQkcGaaGcSA5nlazHoY6Al2vudyiePj3QJxtbZL+TcnVtVbj1lUicwgUULNjyOSp
	 6J0iUQR+tczRaBKZamw0y9ZXyfjOMb/XrKk8KmFSLThuK2bdysFHQNfDpsWdFNbd82Pdb
	 Gq6lwtJJoABtOEsnK0PRannK61wDOU/2TzQdpvXn3xiYSYeGXO4YmMbE+NYAt7Ea3bdnV
	 CB4wCor2E2YiXl6KI0ERg4XpMFA8NtwoHZ/kOBGR1SZuhyWpEnIT6Yy4xX2cEwFpz2nM0
	 oxjo411nJ9m1FPxJi3dNxpcTaxjiyDPDLkdLzpVXW0PEOFmVt/KhxF0UGHEko9j1tYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=OH3nOcJA;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84354606A32A
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 12:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84354606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=OH3nOcJA
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3b4944a0eso2383068c88.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917264; x=1795522064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC9KwNg7vzWFhqtQelwms4WX3k2rA90664GjYEiCkuE=;
        b=OH3nOcJAMTPkOQ1KS7I5dCMwge4FxCGG7GCPCcmXEBWhq4pTfi5WmX6e7ySJhyyXLl
         doNqvgrNSDK+SHK+oRiPi/xOI5tZtoGS2agOZXEcxA9h7waJuXDLJF5hr9BkPAZCx1nR
         tsaydE/G3avsL4YrUe7ZaEP2xrgNjoesVTbWPanklpBiLJrhtSb45tui3lIEifF0iUBD
         4I7hMo3W39FERFd3fj648q682KwOjFlhmvjjEZfalgIKOX3i6+NTQjHpLDtT+b0RpPf0
         leljXejV7Oeb/ajlgwuhrCmQFyJGdlVvopfKgW2mOZLuvSzUD6ExzqQ9Qg+0y3chu/3v
         pYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917264; x=1795522064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WC9KwNg7vzWFhqtQelwms4WX3k2rA90664GjYEiCkuE=;
        b=2CWuhrlH5d/1m8a8GFBfx5b3eZuzjN/EGQQEgQydCSVb5j/xjwE5VrcNutSRynNAmM
         9aYPJnQU3y7EVCqQgj9mxUMRrErMnEs8EfnmHwWgGnq585WXaURTCdy4LvhZVlvZBCZx
         9oKrwPeAE09P+GU5uvOYi4XD00wxcZKnqB1DUaZBre9SHuvmmQR5jfofNz6QZqbzs7CD
         ncTunqjHzfV/9fh7B384oSNP0VghL/mM10nFg+Rh4cWO9BgRf0m77sCXuttYg2grUDvn
         T2cmbAydUTJnkBlPkCuH/IUtJyNp945G3zh0fuZq9vGdY+GijSWay6vSzr3WEEn4LggA
         qy2Q==
X-Forwarded-Encrypted: i=1; AL+hErGpes/JBHYiVP1gc9XX1SLlQJmngmRuJZZz881IglhYSQ4oG81bUO8ACNw+y0OIMuaaimLEyCfsq4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M1lJh+rUiP1XbwzrR3PJl38AAsvehorPQjRkrnNSl/l/S5nE2
	7IwLu+1oK/Ugsd0euzI+DG44hPdFeZ7xpuAJzlPzkdbMFdsMV+uy8OF1vqPGQk11sW4=
X-Gm-Gg: AYBFou1mKRyAA7ri2xs+IEg8XgC5wK9l8wOTAZsl8GTN5/xa3LVqhB1SbPfLPUwQW3F
	apnJHNy/ZAK4ll2kq/aklp0r61baGg6/JA0PfpfGFXUdgEagIKj/sSmdz1yIUGt8EM5SlGhVugw
	LcFckuBnsmi+2lUGxp3tLIO7pPkeOPFoOz/xkMmIFMkScyhp7HvrxbN7IEyZ57pHOZdQa76R7LV
	uMKI8SffeX2pdcf4MkmX7oqbpt0exUjC18ghSdE6S8iQOXbJ2Fwxl8XmNflObl/wJMDBNAZX7ns
	Veu5hP25tZm5cUwChJpjmcAAi5eQmBx/aMV9NnIs3ZfY7aQyERU2LkYgVblA4Ta6WC0Vxgt+qMv
	4G9vNTCgqBZwTqaHR6DncHP19QFM1WreBvx2t+BF7FFqCQmK8hu4SCMjIMTw0HcxcBrVGKjO4yB
	PU4WaVUpCi17KCO3DBkLit88ki5H7W1G+jAYgC6NBIVA9veBAEG9MEYN+p1r4/Hi29l1PW9WQo7
	wcdyz3gEY3mjpJ+m4idHJO55SMLSbNhhD7DWm82pJ8oVhVM71wKFaIrdolT7MB7OMjT2Un7T88b
	zAWpXpqeV33uYbaU6QC9tR4oda8Tnx8quTOnIUDSHZfsAQyxxJf/E9BSzTgu6+SjCq0=
X-Received: by 2002:a05:7022:f116:b0:1b3:af3a:e793 with SMTP id a92af1059eb24-1b502fe37c6mr12306756c88.0.1794917263484;
        Tue, 17 Nov 2026 04:07:43 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:43 -0800 (PST)
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
Subject: [PATCH v2 6/7] mm/page_ext: inline unchecked page extension lookup
Date: Tue, 17 Nov 2026 20:06:26 +0800
Message-ID: <20261117120627.50601-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117120627.50601-1-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
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
---
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
index 2910727e99e2..0f31e2da2611 100644
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
@@ -175,33 +171,7 @@ static void __init invoke_init_callbacks(void)
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
@@ -247,29 +217,6 @@ static int __init __page_ext_alloc(void)
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
@@ -360,7 +307,7 @@ static void __free_page_ext(unsigned long pfn)
 		base = (void *)base - PAGE_EXT_INVALID;
 	WRITE_ONCE(ms->page_ext, NULL);
 
-	base = get_entry(base, pfn);
+	base = page_ext_entry(base, pfn);
 	free_page_ext(base);
 }
 
@@ -503,7 +450,8 @@ void __init page_ext_init(void)
  */
 struct page_ext *page_ext_lookup(unsigned long pfn)
 {
-	return lookup_page_ext(pfn_to_page(pfn));
+	WARN_ON_ONCE(!rcu_read_lock_held());
+	return __page_ext_lookup(pfn);
 }
 
 /**
@@ -522,7 +470,7 @@ struct page_ext *page_ext_get(const struct page *page)
 	struct page_ext *page_ext;
 
 	rcu_read_lock();
-	page_ext = lookup_page_ext(page);
+	page_ext = page_ext_lookup(page_to_pfn(page));
 	if (!page_ext) {
 		rcu_read_unlock();
 		return NULL;
-- 
2.54.0

