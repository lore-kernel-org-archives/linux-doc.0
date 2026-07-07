Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3966F432BDB
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 16:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440714; cv=none; b=DgrQ92Rsv1/PhvRbLc5OF9GMUnLRTXvuRQQR5RAlA6Sauhi+6TwUt/2eqt5evzJD/RQ1zdQn6mevnVuzp7fs5i16MUBy1Lzm7ooDM2YoQzp1L/aqdJTA3G2CRjF8Zs8QMZtkDGH0JjRlafFzP7ThCdTI64/rbYoHmK00cuQX5eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440714; c=relaxed/simple;
	bh=Bfxm9viN41z6KBcPZ+DAXQmBddfe6h9567L6LJ8GoD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DTkN0r+GnDS2pT2kRO2qHrF7/H6ClSjak6gIxklcaqcn9W7B8mve0vOFCnq318KOVffFutU60lYk6I5UhpuHsWQ4zdRJNM2Vruy2jn0ZW6VwOEqlVC6YuuTxNJEiPVR/viTxJhtuhep+OAMyV4Am8OCf2/GWqMTWamTroyPHhWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVE4u85w; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVE4u85w"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cacb8416a1so37077255ad.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 09:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783440712; x=1784045512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q08e42D6zw562DgOrRUU1GdgKThXKtrHfZYWO7DdVjw=;
        b=RVE4u85wM3z2T8E5ie+ITn+nkHg2YI2fbEjtUJT9gJqTmS+jvPWI7WYqyGIT6GxKdE
         wwIAYG6lmuVlbZf0TjoVXMSWch22v8u/zLjH1IIvV6H5h8HCbE9QCxnM1x0dparI1NhL
         K0i+HY4GQ4GSdbRGCAwRE73BS/4fLdeySJb8g7oXlLnb/82XXlqOoMjrOIfkVhEqkLiY
         RGsVKHL3HuRfuL30OgoUuj5dn+yI6rhWxDJzswjsKpCq+lZ6CseMGcjpoqk10YLgYK0C
         e8rPRLgDy4+HzsocyreTJmQpRwPAdn5NlMH4DO9xiivwGF1Ra9kghNlmJdEU9asIzbh5
         m9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783440712; x=1784045512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q08e42D6zw562DgOrRUU1GdgKThXKtrHfZYWO7DdVjw=;
        b=ZiKf60RqqcncIcHgr54KKYfuKnyR4hUZ7oU1HBK3D99qfkS8VPkgztGtXHmsNYrrZy
         EVgPiRRZanyOfYx01QD63zrdbsZ+3wa7Zy2uGPcG5nss7oOMK7QeAYrMXv1olWvMHZ+0
         JxhsebV61O3zfMNIYpC/dhP/FrRotpavgenjClaj4TRjlrWANTPHx91xiYy2Nq4yKv+F
         NoPnJkbQKghQY+T0L7sNqKUcuVnIPgvR0KZZI12OBe0qovVxHacntDwlzR62J67zVSrW
         1K39q4PYOGiCB1KdUIbqQcVQ1OfhqO9hCgVShuNAuo+uWqMMpMf7V2G3f5Vw00iGZh0M
         pywQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwOGhgmiQpoNz1PGzpUMXDJVbwK7QjNDx+cnCLrVusTinb9dq2g8J3Jy80TTVXQhCoHeCl2BewYwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/10JUZv21gqVFI1zVcwqgGLlVBWzzlGSwddyzonNF0zDCStPK
	2VVaqwuIPDWmgIX3aCpbQreJzqNpzZ8yW2lruTYH1J6NulDE22DHstvy
X-Gm-Gg: AfdE7ckVn04KwvlZYZQwFZxd7gyvZe3eK3KpehDMJjFMuEJHEwlFmPuMBGAjJP8stoX
	gvseeODrzZGRtuj8c+1PjlGfHrhV1UxSJqFuEKgGUiy2wcyJbWP1TsLsAQowYITAGaXVgmIT1/A
	IAMKDEYU030IedysoSfMInNAlD7yGvtVfU3pljDp7YMbl2btLtxexuDHlS12gtN54cad6AJx+3j
	6jaC4YkH4D1uo1lZFlJgNfk6eqg1+k8n2cseLKTKb6mP61o6Ml1SylqAsxPZudZ8S9ejklmUU4B
	FdSthSb0bwjXJM+1n7iaA9SrQ3Z3GRAAbX5H/BUzp6T3QWtrdTJHTPHbzehP0HNZMBIuTwC39NN
	+iglOhej34doPdLN05oR1mRV/jqh/Yw5KttV6uuCNZML9sw6CokQMbk28szDlUEYw+U/ao2i5Mp
	rdtqyyNIpUkdfGdfNIf6sX2Q4cRCgDuzCSFhKT+gaPrgHFbHa9O8MLKaCh74ealp+0YAO6EPQBm
	InzDIcQ/etgwMlztYeLl93775x8Fg==
X-Received: by 2002:a17:902:e950:b0:2ca:e106:8e69 with SMTP id d9443c01a7336-2ccbe615e87mr60008085ad.10.1783440711151;
        Tue, 07 Jul 2026 09:11:51 -0700 (PDT)
Received: from [127.0.1.1] (ec2-18-162-112-89.ap-east-1.compute.amazonaws.com. [18.162.112.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfd443sm14712115ad.30.2026.07.07.09.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:11:50 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 08 Jul 2026 00:11:27 +0800
Subject: [PATCH v8 1/3] mm/swap: colocate page-cluster sysctl with swap
 readahead
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ch-swap-series-plus-folio-lru-cleanup-v8-1-e816812698a8@gmail.com>
References: <20260708-ch-swap-series-plus-folio-lru-cleanup-v8-0-e816812698a8@gmail.com>
In-Reply-To: <20260708-ch-swap-series-plus-folio-lru-cleanup-v8-0-e816812698a8@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
 Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Baoquan He <baoquan.he@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783440691; l=6654;
 i=wujianyue000@gmail.com; s=linux; h=from:subject:message-id;
 bh=Bfxm9viN41z6KBcPZ+DAXQmBddfe6h9567L6LJ8GoD4=;
 b=ky/dSOHS1ubZOUvyoU+rjll/uXGIHnie3NlfCBeYsPlGWWDCoYTjQkSKFR/3D2CtOZKdmu3zZ
 l1Lmf6mlXuSCI88/U6HVQ+U+gBW7DP7OttWmQWYNG9bH0X4YJ0KX8G9
X-Developer-Key: i=wujianyue000@gmail.com; a=ed25519;
 pk=49tqjvkqDVX1TtHEyTCiJGlKLg6SQ4BmgzG+HoHQW6E=

page_cluster and the vm.page-cluster sysctl are only used by swap-in
readahead in swap_state.c. Move them out of swap.c together with
swap_readahead_setup(), and make page_cluster static to that file.

Rename swap_setup() while moving it as well. The helper is internal to
MM and now only sets up swap readahead defaults and its sysctl hook, so
the more specific name matches its reduced scope.

Call swap_readahead_setup() from swap_init() after moving it, keeping the
readahead defaults and sysctl registration with swap_state.c
initialization.

swap_setup() previously lived in mm/swap.c, which is built
unconditionally, so the vm.page-cluster sysctl was registered also on
CONFIG_SWAP=n kernels. After moving the setup into swap_state.c, which
is built only when CONFIG_SWAP is enabled, vm.page-cluster is no
longer registered there. The knob only tunes swap-in readahead and
had no effect without swap.

Suggested-by: Baoquan He <bhe@redhat.com>
Suggested-by: Barry Song <baohua@kernel.org>
Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Reviewed-by: Kairui Song <kasong@tencent.com>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 include/linux/swap.h |  1 -
 mm/swap.c            | 36 -----------------------------------
 mm/swap.h            |  3 +--
 mm/swap_state.c      | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 mm/vmscan.c          |  1 -
 5 files changed, 52 insertions(+), 42 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 3f31b6a56788..45656ca9792d 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -340,7 +340,6 @@ extern void lru_add_drain_cpu_zone(struct zone *zone);
 extern void lru_add_drain_all(void);
 void folio_deactivate(struct folio *folio);
 void folio_mark_lazyfree(struct folio *folio);
-extern void swap_setup(void);
 
 /* linux/mm/vmscan.c */
 extern unsigned long zone_reclaimable_pages(struct zone *zone);
diff --git a/mm/swap.c b/mm/swap.c
index d25131305c94..c88643e56af7 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -44,10 +44,6 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/pagemap.h>
 
-/* How many pages do we try to swap or page in/out together? As a power of 2 */
-int page_cluster;
-static const int page_cluster_max = 31;
-
 struct cpu_fbatches {
 	/*
 	 * The following folio batches are grouped together because they are protected
@@ -1177,35 +1173,3 @@ void lru_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent, int
 		lruvec_reparent_lru(child_lruvec, parent_lruvec, lru, nid);
 }
 #endif
-
-static const struct ctl_table swap_sysctl_table[] = {
-	{
-		.procname	= "page-cluster",
-		.data		= &page_cluster,
-		.maxlen		= sizeof(int),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= (void *)&page_cluster_max,
-	}
-};
-
-/*
- * Perform any setup for the swap system
- */
-void __init swap_setup(void)
-{
-	unsigned long megs = PAGES_TO_MB(totalram_pages());
-
-	/* Use a smaller cluster for small-memory machines */
-	if (megs < 16)
-		page_cluster = 2;
-	else
-		page_cluster = 3;
-	/*
-	 * Right now other parts of the system means that we
-	 * _really_ don't want to cluster much more
-	 */
-
-	register_sysctl_init("vm", swap_sysctl_table);
-}
diff --git a/mm/swap.h b/mm/swap.h
index 44ab8e1e595b..ae81c1fa388d 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -8,8 +8,6 @@ struct mempolicy;
 struct swap_iocb;
 struct swap_memcg_table;
 
-extern int page_cluster;
-
 #if defined(MAX_POSSIBLE_PHYSMEM_BITS)
 #define SWAP_CACHE_PFN_BITS (MAX_POSSIBLE_PHYSMEM_BITS - PAGE_SHIFT)
 #elif defined(MAX_PHYSMEM_BITS)
@@ -336,6 +334,7 @@ static inline unsigned int folio_swap_flags(struct folio *folio)
 
 #else /* CONFIG_SWAP */
 struct swap_iocb;
+
 static inline struct swap_cluster_info *swap_cluster_lock(
 	struct swap_info_struct *si, pgoff_t offset, bool irq)
 {
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 6fd6e3415b71..df6fda588938 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -22,10 +22,15 @@
 #include <linux/vmalloc.h>
 #include <linux/huge_mm.h>
 #include <linux/shmem_fs.h>
+#include <linux/sysctl.h>
 #include "internal.h"
 #include "swap_table.h"
 #include "swap.h"
 
+/* Swap readahead cluster size, as a power of 2 pages. */
+static int page_cluster;
+static const int page_cluster_max = 31;
+
 /*
  * swapper_space is a fiction, retained to simplify the path through
  * vmscan's shrink_folio_list.
@@ -985,6 +990,38 @@ struct folio *swapin_readahead(swp_entry_t entry, gfp_t gfp_mask,
 	return folio;
 }
 
+static const struct ctl_table swap_readahead_sysctl_table[] = {
+	{
+		.procname	= "page-cluster",
+		.data		= &page_cluster,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= (void *)&page_cluster_max,
+	}
+};
+
+/**
+ * swap_readahead_setup - defaults and sysctl for swap cache readahead clustering
+ */
+static void __init swap_readahead_setup(void)
+{
+	unsigned long megs = PAGES_TO_MB(totalram_pages());
+
+	/* Use a smaller cluster for small-memory machines */
+	if (megs < 16)
+		page_cluster = 2;
+	else
+		page_cluster = 3;
+	/*
+	 * Right now other parts of the system means that we
+	 * _really_ don't want to cluster much more
+	 */
+
+	register_sysctl_init("vm", swap_readahead_sysctl_table);
+}
+
 #ifdef CONFIG_SYSFS
 static ssize_t vma_ra_enabled_show(struct kobject *kobj,
 				     struct kobj_attribute *attr, char *buf)
@@ -1014,7 +1051,7 @@ static const struct attribute_group swap_attr_group = {
 	.attrs = swap_attrs,
 };
 
-static int __init swap_init(void)
+static int __init swap_sysfs_init(void)
 {
 	int err;
 	struct kobject *swap_kobj;
@@ -1037,5 +1074,17 @@ static int __init swap_init(void)
 	kobject_put(swap_kobj);
 	return err;
 }
-subsys_initcall(swap_init);
+#else
+static int __init swap_sysfs_init(void)
+{
+	return 0;
+}
 #endif
+
+static int __init swap_init(void)
+{
+	swap_readahead_setup();
+
+	return swap_sysfs_init();
+}
+subsys_initcall(swap_init);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 1474a7234ea1..74b43c12fbc0 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7647,7 +7647,6 @@ static int __init kswapd_init(void)
 {
 	int nid;
 
-	swap_setup();
 	for_each_node_state(nid, N_MEMORY)
  		kswapd_run(nid);
 	register_sysctl_init("vm", vmscan_sysctl_table);

-- 
2.43.0

