Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37C8223328
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 01:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782781716; cv=none; b=VT5yp7uWVHFsnzXvRhkLOv7gwEjRmyn7Ru7ZFxmUJp5GsydstPb7PlP7HbIicdeLLeGpBPpFr+csUjSP2gtffsXYPATv7MAeXEZXSVxWbKu4HdpFfLmNh3gRVX+Mt9BbBE2qImTOxz8Q50s6gnyvgMjL0EYqZ80iosThnujXKTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782781716; c=relaxed/simple;
	bh=5H6jS4OceC8ZRadpvqo2NMSUlsJ/HouhQ86dEL84t0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NoE9J0InKb6VYYAf4b7TE/fLgPA1/XRAuHotlbQYd6JMQos2ZHJScARSKMhyqECrEquF5e0rL/2CXrd89bT4+Op/DwTGPbVa755yw2bZ6QVnmNtq5IiL5huyg7tQEtVKtB6CYJ1noHIR4AOeuFRZCnNViSZGl+3VnhwvXQ7fDQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bml4tIco; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bml4tIco"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845eb7b96feso1075942b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 18:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782781713; x=1783386513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJUOKeF8iBbH9kuKTuF3QvNMT8clYN8OLshkYoNx0Kg=;
        b=Bml4tIco5nxIXsjozB0VW7f/xrIjhbcfhQASyHwIlmHKXFy+XQVeOGk9IPD1pzpO8X
         Wiatha8ureVUwHlMV4J8dqbiCU2a1FbQnpekolzndZopZKEPIJtLDPpAprvXf/GbMHty
         Y1lrOmou6PRokqwcq/eLmKHX8WAlqiMeZlExUmkK6UOEklXGv5yr7RLAdQoao8EhLkfb
         xGx0D0vms5mXLP+sjtwPRWbTsAEQMF7t5zWMU3A3yNtoExCs8Wrm4bnE832QDoL+FpD4
         LETsoU3jd3KDO0/Ldrb/VIz0g2yqxBoJEt7NuCrs05rfrsBjpgRgwAUoxX33zrAkp4mj
         rzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782781713; x=1783386513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MJUOKeF8iBbH9kuKTuF3QvNMT8clYN8OLshkYoNx0Kg=;
        b=C7yLnBsfd17tVMZcR66qg6MmdN1wWavrM58LoJrPX4yFlVyBu2eHRnQnsBfv4C3PUZ
         aVCDCdIg9DddwYw/G2l2NGox4RT4WzZECtsz7NFMncrsA6aLe5/2K7aDrH4jehjQIr8g
         NKgnfWRdFJ6stMOjXwspvyfRKmTuyIGMzWACeqYqosFbu0chAP5kFSjz2fkxC82OG5ab
         FC9XBjKipl07kPpjsHXcH/9EtTkcOM9vru8jrfe4wbtfgaqF0wAtzZ5+KWfrrgjKIUn8
         HnsYa+WQeRj/KHg+0xh7KXBbii2vxGkBQ3qJgNcszqi2l3P5BDijQ72XV5uYMhr2oAB9
         h2og==
X-Forwarded-Encrypted: i=1; AFNElJ/zDc2Ah0L0izNan17uz3FXD3cE8J4zwpKTmR73WYUffqjfQ41vYwaCdWG+gzb2ZgH2X4BxiAjxd4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YysGntFID/jhUS1pOAUXDHjValqnBhLz1TeQCyonrkjDUQOk2vU
	XtGjD1CEyO69+EAOtu/26fOLfctUKhrkaGpcfVpOXKfNW+HVC67CKwRL
X-Gm-Gg: AfdE7ckByXxDDNGR6nyeV/QSjWZI9PFAgcq+SpCjJyvepsw9mkv8vhu6zemacLwuuSp
	aO9CRIE/ETx4SA/nZo6LEnUfLi3W3VuaqvHTPak1kcrcUod0MB+GtvNmAN5UUfc34WUXXpk7Dly
	ap5du5AAIdMKZNsgURIkmEm87FOVceVhER0ZMfeiPs06Ki5noMSN8xsPoXprlS3LNFC6iP+JfGe
	Dbvgw2VsGy4Inya/MZrfQ83T79Xfs6wYvPpvqTIEqCx1QQcsN8t/hRPyrFwn0fNOCrPbmgeJ3V/
	LU3xpMHtPhgr2xAWVo48l4Rt0bAxt/yE9YXgkWW6WHEOSySeFeoSmM7Ew1PcshCOkFcFEg6+4Ln
	HNXACqmq17n68/JBGhkbNFXeC/AvY0Vpj0vVfQalQxpWkgu3hliJejPF1CwCE6EcXNEUp96+Jbi
	sMNasVDmF5eSYNtEMSi8K5gD0C3q2QRSw12g9zMm3U506oynqbOldlhZuzyOBCe470DMGBRw==
X-Received: by 2002:a05:6a00:4214:b0:847:99bb:b6d8 with SMTP id d2e1a72fcca58-8479f17addamr1209373b3a.26.1782781713116;
        Mon, 29 Jun 2026 18:08:33 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([203.18.50.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a005afbfsm653310b3a.27.2026.06.29.18.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:08:32 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Tue, 30 Jun 2026 09:08:17 +0800
Subject: [PATCH v5 1/3] mm/swap: colocate page-cluster sysctl with swap
 readahead
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-ch-swap-series-plus-folio-lru-cleanup-v5-1-4627aba8ed1e@gmail.com>
References: <20260630-ch-swap-series-plus-folio-lru-cleanup-v5-0-4627aba8ed1e@gmail.com>
In-Reply-To: <20260630-ch-swap-series-plus-folio-lru-cleanup-v5-0-4627aba8ed1e@gmail.com>
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
 Baoquan He <baoquan.he@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1782781697; l=6043;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=5H6jS4OceC8ZRadpvqo2NMSUlsJ/HouhQ86dEL84t0Y=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKgZYDdWdy1yZ0mK8Zmk7hRvcQzBrf6rOmRUfAyEDmVfJ+qgUx/f/r+vxV1famtvuUJ83DLryYi
 r6hZdN0vDAwM=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

page_cluster and the vm.page-cluster sysctl are only used by swap-in
readahead in swap_state.c. Move them out of swap.c together with
swap_readahead_setup(), and make page_cluster static to that file.

Rename swap_setup() while moving it as well. The helper is internal to
MM and now only sets up swap readahead defaults and its sysctl hook, so
the more specific name matches its reduced scope.

swap_setup() previously lived in mm/swap.c, which is built
unconditionally, so the vm.page-cluster sysctl was registered also on
CONFIG_SWAP=n kernels. swap_readahead_setup() is now a no-op stub when
CONFIG_SWAP is disabled, so vm.page-cluster is no longer registered
there. The knob only tunes swap-in readahead and had no effect without
swap.

Suggested-by: Baoquan He <bhe@redhat.com>
Suggested-by: Barry Song <baohua@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 include/linux/swap.h |  1 -
 mm/swap.c            | 36 ------------------------------------
 mm/swap.h            |  9 +++++++--
 mm/swap_state.c      | 37 +++++++++++++++++++++++++++++++++++++
 mm/vmscan.c          |  2 +-
 5 files changed, 45 insertions(+), 40 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 8f0f68e245ba..48cbcbe534bd 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -346,7 +346,6 @@ extern void lru_add_drain_cpu_zone(struct zone *zone);
 extern void lru_add_drain_all(void);
 void folio_deactivate(struct folio *folio);
 void folio_mark_lazyfree(struct folio *folio);
-extern void swap_setup(void);
 
 /* linux/mm/vmscan.c */
 extern unsigned long zone_reclaimable_pages(struct zone *zone);
diff --git a/mm/swap.c b/mm/swap.c
index 588f50d8f1a8..e4b3dadaa6dc 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -43,10 +43,6 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/pagemap.h>
 
-/* How many pages do we try to swap or page in/out together? As a power of 2 */
-int page_cluster;
-static const int page_cluster_max = 31;
-
 struct cpu_fbatches {
 	/*
 	 * The following folio batches are grouped together because they are protected
@@ -1171,35 +1167,3 @@ void lru_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent, int
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
index 77d2d14eda42..0911bdfe03f0 100644
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
@@ -79,6 +77,8 @@ enum swap_cluster_flags {
 };
 
 #ifdef CONFIG_SWAP
+void swap_readahead_setup(void);
+
 #include <linux/swapops.h> /* for swp_offset */
 #include <linux/blk_types.h> /* for bio_end_io_t */
 
@@ -336,6 +336,11 @@ static inline unsigned int folio_swap_flags(struct folio *folio)
 
 #else /* CONFIG_SWAP */
 struct swap_iocb;
+
+static inline void swap_readahead_setup(void)
+{
+}
+
 static inline struct swap_cluster_info *swap_cluster_lock(
 	struct swap_info_struct *si, pgoff_t offset, bool irq)
 {
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 9c3a5cf99778..d06f8bc46e77 100644
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
@@ -987,6 +992,38 @@ struct folio *swapin_readahead(swp_entry_t entry, gfp_t gfp_mask,
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
+void __init swap_readahead_setup(void)
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
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 8190c4abec84..ecd92ec21ac5 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7654,7 +7654,7 @@ static int __init kswapd_init(void)
 {
 	int nid;
 
-	swap_setup();
+	swap_readahead_setup();
 	for_each_node_state(nid, N_MEMORY)
  		kswapd_run(nid);
 	register_sysctl_init("vm", vmscan_sysctl_table);

-- 
2.43.0

