Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071711;
	b=4UoKk24RNZCVq8rRxPxndn66ZbwfyXTIhHuyTNBiTyDHZgmXpW3nqOhONcrTocnP+IUn
	 9DZUdSDIrXzUdE4hBmYX7mHwCLFlw/au3HaitKKIh2qDeV4N8LoymmNhnpG6+i9CLbeuo
	 U/NQFQk/qOFTp7kaYF9EK3G/+eJV8C1xkSKS5ZhYts3OKzUFh4vN1eHJtvUI+prcn6tJI
	 BSIEAlGb3ahaaGs4qW87sGFkq8hY48GSq3nOE+Oviu2B8ou9BXwpg5rUBs8kbKfQePhgb
	 qGCljsrpLRIAOVMC1QjUhes0oFPf8QPHdKqpalGRDLpfi/jDRbwoxVwoTyQVgxuA29Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wa6FffWSifqy9byjf3TnSCSaUIR9pC+Hc3W0NorYeDA=;
	b=Yta/Gssu8EkHu62YOmys3Pn2ScDDP6UHfpkmRajGIMJ8Y2etcADG7eH+EsniRz1DFJuI
	 7cEybDbPdz9FZOvGmmC/mL9Fomuk2lT0IlWJsBKUYH60XivVPgKG/LEiGr6AueqYXfUzM
	 HMsClpfEt2Lp7MEKM1kSrWF1lYTB6wyKV6Edk8/7kOsBr9Q28hF6h9E2mEcJf6FJqeH0O
	 OoXSWQlXQIxGKh0KJgYzj9mFL2rzb5nnrFjRzOY3bztYWy3FQ/AYtMfVzu0RBakm9sYAg
	 UtQ+RMXN4ZFD32QTp2h19hesclrSHRI4JGOzkWIRe89kaOvtoQn12wtIJSpMqEU+sLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=OWxGc8ul;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B5A606A320
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 07:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97B5A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=OWxGc8ul
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1382967a12.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 23:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071710; x=1795676510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wa6FffWSifqy9byjf3TnSCSaUIR9pC+Hc3W0NorYeDA=;
        b=OWxGc8ulAKiSoE29y2RfI3mhfCrDbDKt04aHs9njeS6LMiH8YaOX6ncJxzOtdqrCC7
         pH6Wv7jy2hyhJLJ9u4NEfyMmzE/+gILHTOPrq37A4MOwyqz7ZhuaUgygMAf+KlCUzBNw
         /Pb57ziIKcNgY18Js14OZgu5Lbk+/ijfLrvhE0iImzsy5zJtY/1WCwNrn97koYob/d7a
         GlthzItKBlfAkUV0GSko4rxNTM9lC0u/yuqxPFl8vdFx2tNJU/5vByqOzSN+mP5di6eZ
         DcvzqKVTC8ysvcB7hDpSW26M9btMB9DNofHgMd0sZ+L9GkzcdZtXlajbz0G3FjZX/quL
         4Qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071710; x=1795676510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wa6FffWSifqy9byjf3TnSCSaUIR9pC+Hc3W0NorYeDA=;
        b=mOHGbYjoOD6vCtWzhtE4qrG1xcx2lPIbgM1rw/qcwlNuZhFsg/ZKdJN3Xf3bmiyJ7I
         UIVbhaVnHJJQ3x5415uEBLJF+8qasFLxRkcw/62FoT40+bOikxBAMd4PmUUfm+S2RHDV
         LiniOFxppFI1b2rTkJZg6xCQ5QxUGse+iV1qMt277DaNrPRF5FTNrZDleOx5uEp8Rb66
         AG6OMrqvgkS6zSQo/2RDddTkFyGM0NMEIXbl9fgOD2OjnR4BlsPuzlypyLTxjToKP7/Q
         GGBcnymTuSJw58oF2XyrQd7UiNdZ0O5S/DDrt4ocyL2bJzZVvscXb8ujgMoIe5q5sFVm
         KQgQ==
X-Forwarded-Encrypted: i=1; AL+hErHdINxnm/XpKwsD+qda8p6aJHPSzQmvCmH3Myc/w5yTb8THGToaB66jNWQfol2IodNDZMhyjdAo738=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B2ioXeGaPSfJ2IX8v2SdXQkb2OjTaoE22zoDWectR3hyT9lrT
	Wzf6TPx5vmNXmw9iLmtyv7Pp/HYfPJEqgjsRBXaA0aRjvBWcuTX8rL/nQ0zaj6dyOaM=
X-Gm-Gg: AZFdTZdGbwZt59YtTBz8Qwluh24MZCSlqAVzUYRAgjHrpI3iaGcMO0k0ajyiV+rr93y
	LFA8pwH0y+Cq7D5NvYkiHNAt12tQAqz2fKMXr0yYsg1WJ9moWs9uMLrDsmi+aiBt+LuvG1bYgO5
	gVpnqPDs3yUUf6XMG/rxs4d/S/7obqO8+fDDe6Fb3OOx1hj4kxYiKS85IQBKjOAsDkfH0lR8wAA
	TVgmnCog+of2cjQ/U6hCizIUeuHZL6RAhEVdjXu5E4t0qCBE7b3DGtxDioJ2Qm6se8/9uxMotJF
	Px8mW309jIwZbCrBqEA5yEynF1AVxQwXlKUG1U81Zs0P1/tJdlX8COCn25f0Wl+1aFu6GUN7Tbq
	IQXSCyFF6RqRzo9ovUsp0cbX0fVfVWvFKzEuC5M1x8Reg0CMJcaIDK7E7Eb0/NfUdUOs93kzbPT
	mR2xvQTjsTH3xEEQJ1Y1yHt5rEPtfdoNuv6DgnKcgPotXUnpz4yabKNVBoXar+CfXJJohPPGbTZ
	0sQ+ZTt5Wj+xnehQbMEtLUbZcO1tVOnfnh9tedIlQ1mQhtZCIWMSgw2tFp+oOsg0jzM5zZwLVxm
	HTXuKw+ypsg6Q9UTIuOYGz7ty69hVqCCGAw2w5QcyVqw05ufxEv0qMedXas=
X-Received: by 2002:a17:90a:ec88:b0:3b4:a63:d57a with SMTP id 98e67ed59e1d1-3b40a63da9fmr231139a91.1.1795071709630;
        Wed, 18 Nov 2026 23:01:49 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.23.01.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:01:49 -0800 (PST)
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
Subject: [PATCH v3 7/7] kmsan: fix metadata loss during HugeTLB struct page reinitialization
Date: Thu, 19 Nov 2026 14:58:12 +0800
Message-ID: <20261119065812.89959-8-songmuchun@bytedance.com>
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

KMSAN stores each page's shadow and origin pointers in struct page.
Boot-time gigantic HugeTLB pages are reinitialized after
kmsan_init_shadow() installs these pointers, dropping the mappings and
leaving the allocated metadata pages unreachable.

Move the pointers to page_ext, whose boot-time storage is available
before kmsan_init_shadow() and survives struct page reinitialization.
Use the inline unchecked lookup under notrace preemption so metadata
lookup cannot recurse through instrumented hooks.

This shrinks struct page from 80 to 64 bytes on x86-64 KMSAN builds,
making its size a power of two and allowing HugeTLB Vmemmap Optimization
with KMSAN.

Fixes: fde1c4ecf916 ("mm: hugetlb: skip initialization of gigantic tail struct pages if freed by HVO")
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ac161ba4-30cc-4bd3-b93c-ab7af8a6f64f
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
---
v3:
- Collect Reviewed-by and Tested-by from Chris Down

v2:
- Update __mm_zero_struct_page() for the smaller struct page.
- Keep the unchecked lookup inline in KMSAN and leave page_ext.c
  instrumented (suggested by Chris Down)
- Document page_ext metadata storage and KMSAN HVO support (suggested
  by Chris Down)
- Use the common boot-time page_ext allocation instead of need_early
---
 Documentation/dev-tools/kmsan.rst |  8 +++---
 include/linux/kmsan.h             |  2 ++
 include/linux/mm.h                | 12 +++------
 include/linux/mm_types.h          | 12 ---------
 lib/Kconfig.kmsan                 |  1 +
 mm/kmsan/shadow.c                 | 45 ++++++++++++++++++++++++++-----
 mm/page_ext.c                     |  4 +++
 7 files changed, 52 insertions(+), 32 deletions(-)

diff --git a/Documentation/dev-tools/kmsan.rst b/Documentation/dev-tools/kmsan.rst
index 0dc668b183f6..5330d21d141d 100644
--- a/Documentation/dev-tools/kmsan.rst
+++ b/Documentation/dev-tools/kmsan.rst
@@ -376,13 +376,11 @@ Metadata allocation
 
 There are several places in the kernel for which the metadata is stored.
 
-1. Each ``struct page`` instance contains two pointers to its shadow and
-origin pages::
+1. Each page frame has a corresponding ``struct page_metadata`` entry containing
+two pointers to its shadow and origin pages::
 
-  struct page {
-    ...
+  struct page_metadata {
     struct page *shadow, *origin;
-    ...
   };
 
 At boot-time, the kernel allocates shadow and origin pages for every available
diff --git a/include/linux/kmsan.h b/include/linux/kmsan.h
index 7da9fd506b39..08fb79566235 100644
--- a/include/linux/kmsan.h
+++ b/include/linux/kmsan.h
@@ -15,12 +15,14 @@
 #include <linux/types.h>
 
 struct page;
+struct page_ext_operations;
 struct kmem_cache;
 struct task_struct;
 struct scatterlist;
 struct urb;
 
 #ifdef CONFIG_KMSAN
+extern struct page_ext_operations kmsan_ops;
 
 /**
  * kmsan_task_create() - Initialize KMSAN state for the task.
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3578f53ea9cc..e04cd6289546 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -134,7 +134,7 @@ extern int mmap_rnd_compat_bits __read_mostly;
  * define their own version of this macro in <asm/pgtable.h>
  */
 #if BITS_PER_LONG == 64
-/* This function must be updated when the size of struct page grows above 96
+/* This function must be updated when the size of struct page grows above 80
  * or reduces below 56. The idea that compiler optimizes out switch()
  * statement, and only leaves move/store instructions. Also the compiler can
  * combine write statements if they are both assignments and can be reordered,
@@ -145,18 +145,12 @@ static inline void __mm_zero_struct_page(struct page *page)
 {
 	unsigned long *_pp = (void *)page;
 
-	 /* Check that struct page is either 56, 64, 72, 80, 88 or 96 bytes */
+	/* Check that struct page is either 56, 64, 72 or 80 bytes */
 	BUILD_BUG_ON(sizeof(struct page) & 7);
 	BUILD_BUG_ON(sizeof(struct page) < 56);
-	BUILD_BUG_ON(sizeof(struct page) > 96);
+	BUILD_BUG_ON(sizeof(struct page) > 80);
 
 	switch (sizeof(struct page)) {
-	case 96:
-		_pp[11] = 0;
-		fallthrough;
-	case 88:
-		_pp[10] = 0;
-		fallthrough;
 	case 80:
 		_pp[9] = 0;
 		fallthrough;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 1ed35d258d2e..dc73f9f5a51b 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -208,18 +208,6 @@ struct page {
 #ifdef LAST_CPUPID_NOT_IN_PAGE_FLAGS
 	int _last_cpupid;
 #endif
-
-#ifdef CONFIG_KMSAN
-	/*
-	 * KMSAN metadata for this page:
-	 *  - shadow page: every bit indicates whether the corresponding
-	 *    bit of the original page is initialized (0) or not (1);
-	 *  - origin page: every 4 bytes contain an id of the stack trace
-	 *    where the uninitialized value was created.
-	 */
-	struct page *kmsan_shadow;
-	struct page *kmsan_origin;
-#endif
 } _struct_page_alignment;
 
 /*
diff --git a/lib/Kconfig.kmsan b/lib/Kconfig.kmsan
index cae1ddcc18e1..015e85c70793 100644
--- a/lib/Kconfig.kmsan
+++ b/lib/Kconfig.kmsan
@@ -10,6 +10,7 @@ config KMSAN
 	depends on HAVE_ARCH_KMSAN && HAVE_KMSAN_COMPILER
 	depends on DEBUG_KERNEL && !KASAN && !KCSAN
 	depends on !PREEMPT_RT
+	select PAGE_EXTENSION
 	select STACKDEPOT
 	select STACKDEPOT_ALWAYS_INIT
 	help
diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
index 300b48818af1..fa2a403d87c2 100644
--- a/mm/kmsan/shadow.c
+++ b/mm/kmsan/shadow.c
@@ -13,6 +13,7 @@
 #include <linux/cacheflush.h>
 #include <linux/memblock.h>
 #include <linux/mm_types.h>
+#include <linux/page_ext.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
 #include <linux/stddef.h>
@@ -24,23 +25,55 @@
 #define KMSAN_META_MASK_SHADOW		BIT(0)
 #define KMSAN_META_MASK_ORIGIN		BIT(1)
 
+/*
+ * KMSAN metadata for this page:
+ *  - shadow page: every bit indicates whether the corresponding
+ *    bit of the original page is initialized (0) or not (1);
+ *  - origin page: every 4 bytes contain an id of the stack trace
+ *    where the uninitialized value was created.
+ */
 struct page_metadata {
 	struct page *shadow;
 	struct page *origin;
 };
 
+static __init bool need_page_metadata(void)
+{
+	return true;
+}
+
+struct page_ext_operations kmsan_ops = {
+	.size	= sizeof(struct page_metadata),
+	.need	= need_page_metadata,
+};
+
 static inline struct page_metadata get_page_metadata(struct page *page)
 {
-	return (struct page_metadata) {
-		.shadow = page->kmsan_shadow,
-		.origin = page->kmsan_origin,
-	};
+	struct page_metadata meta = {};
+	struct page_ext *page_ext;
+
+	/*
+	 * Avoid instrumented preemption debug and tracing hooks while resolving
+	 * KMSAN metadata, as they would recurse back into metadata lookup.
+	 */
+	preempt_disable_notrace();
+	page_ext = __page_ext_lookup(page_to_pfn(page));
+	if (page_ext)
+		meta = *(struct page_metadata *)page_ext_data(page_ext, &kmsan_ops);
+	preempt_enable_no_resched_notrace();
+
+	return meta;
 }
 
 static inline void set_page_metadata(struct page *page, struct page_metadata meta)
 {
-	page->kmsan_shadow = meta.shadow;
-	page->kmsan_origin = meta.origin;
+	struct page_ext *page_ext;
+
+	preempt_disable_notrace();
+	page_ext = __page_ext_lookup(page_to_pfn(page));
+	if (page_ext)
+		*(struct page_metadata *)page_ext_data(page_ext, &kmsan_ops) = meta;
+	preempt_enable_no_resched_notrace();
 }
 
 static inline void *shadow_ptr_for(struct page_metadata meta)
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 63af3d62ed74..985595bdf420 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -12,6 +12,7 @@
 #include <linux/rcupdate.h>
 #include <linux/pgalloc_tag.h>
 #include <linux/iommu-debug-pagealloc.h>
+#include <linux/kmsan.h>
 #include <linux/slab.h>
 
 /*
@@ -87,6 +88,9 @@ static struct page_ext_operations *page_ext_ops[] __initdata = {
 #ifdef CONFIG_PAGE_TABLE_CHECK
 	&page_table_check_ops,
 #endif
+#ifdef CONFIG_KMSAN
+	&kmsan_ops,
+#endif
 #ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
 	&page_iommu_debug_ops,
 #endif
-- 
2.54.0

