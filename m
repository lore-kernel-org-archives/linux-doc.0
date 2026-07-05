Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9643815E2
	for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2026 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783260796; cv=none; b=IUWVUdw2gerxC+LQHJd4DhRYE/sSp6Hge+vjmLy6O2bx/OaKXO10cQjjv9X3rvTcBVKafYloh9mobX/wLDBfhJvq3NOD8r/uS/eDBuiZI6uQEhlz33oroW/QQLwiGMo68wH3Hsx0xiiZ77ktttZefLFgdwy8pSh+FL7BBi4jVGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783260796; c=relaxed/simple;
	bh=/7iPqMA5mKh6rewx4QRPNnz3zQ/Y5wisYDNlXA9Fp8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6U8yxvnttvfqYNt6/RfRMrXgvR3GjuSR5H7xCjQORxrull90IwrLdV13Nvm6A3ZvVMQV5NjF5pM5B508lzj1MxiFlAjDX5iti4T3lLUQhYOXRFsamRncrrEDF3Oklkfi55cYrA37nboM4VOtfJcUe8VCyPBBd/qySTvrBT93tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdZATz12; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdZATz12"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc891373e0so2631065ad.2
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 07:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783260795; x=1783865595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGC2Ga0WI22Vh20UZ+KA1glCOikUfi8xAvRltv8rDAE=;
        b=SdZATz129Xg9P+hF+C0nuisj5XTK7FUNIKeOlaMSXei+jqafjR5iFYAkFS8/TetP40
         tYjwvxQ4pBPwzkIYAwnDED8XeIv7PDFit+HvfsQQy0hwtiYMpKbVfUUy2ApZh8WaibMe
         xB8POX1eRm0hyYiDz9ocuQv6aYPDEIGdjlkhJ2d79DFJOUq6vrnU1oCc4KCjea25lZ3K
         BQ4j/hr702W8scimnE2kv2AFX872L6APoIlUtGOwmTXmGAQuNiLT5c26yR3OQtL6Lofr
         AQTtz1DCMdefq0XBFTFVHJaePOxHDjb5SwUX3kelKzbLMjIgztPDJBIvRkeKx1Lt4N2B
         VXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783260795; x=1783865595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AGC2Ga0WI22Vh20UZ+KA1glCOikUfi8xAvRltv8rDAE=;
        b=N7bAT6UX9jSh+WaI3752NyGVWWlGLnv/ppniSJbWSXUaSLEYKUrZk8gG6/4hBz4uXh
         3uBBXs80azWgwyJfLKyT14DH0nmrSrj43cRm4GGK97pEX9tHdrE1CPCB5ILdB5Vift6/
         0mlWP7WvDcuE8e31Cn9T/SjhsTCl+V1oqA/wMbSPeFzw8mLPiK6cbr/uMCw2mr+kj9OP
         c7ziYWcFdb/M3jvZoJHiyEiflAW0ObwLac5A5qRwkoAj3oYOqpUDbTnV8dZu5t3/yFAa
         0DcNbut4NywMiw560H7wdreWWahoepwNpOYuue2uUKMEajlWN0u3pbKBFfB6+ID+1nhG
         PkZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXarCTAy6GUcVZdrsd35NSjMgmRXLmAgL5tQuw3BTzcelfp7Do6MbAq5YLqRKiZJceCgnBNHYGXfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwKP7C/rs3eDYSI1okIEHOX1sf3R7lx7UuwvC10r8Qk1Z7OdCR
	dNZmyl9d4/1GjKHuF/pjhgaEaEzlRWWzkhF4jJ5nBl7XSkTz9BD5gic+
X-Gm-Gg: AfdE7cnGxhwXV3NnqEzaipQ36XMivheFUFasCaXIC552ezFStx1jzZ+e36NH4QaEojM
	bHdel1Lkijznr4kWvnIoLWzY5+ZWkBOXRTu8DOAqTNNM7KCIR9scfmmWAfOO2EvwDFImUqWu+Ol
	tZgPC23ppJZcblIriexKkLcR7PC76HXwxX+svJygRZwBmcPAuNFGOL8prX9MeopzIthvWePyGr9
	0FTJsnhAmzUpmef5zE7BAqNKkRE4f/xTTRih/Wxw6f/zgHjyGuUip+OT5SH3YzUF+xGML5s2TOL
	P5U5nppROjTeVjN3zBMy/CFk7IK9xwGdvyCrKtYrTNASFECZcho/Eh4ns1vTk2TIQcY3FrEHmZM
	mYjZdgjJEOy6vRsJX92PvMVZW9kLvU4RI8oZzRYjLAqYCd2tPcrWJqZgEklUhFCIAluHJaRUdnO
	BzbJy9zAZcllUdyD9mayEI5lAMCsii51i9jg740ZBejm9A/fKOZQqfUlnh2IW76lBF8HTASt5o1
	w==
X-Received: by 2002:a17:903:943:b0:2c9:c6f3:457a with SMTP id d9443c01a7336-2cbb9eaae60mr66571845ad.31.1783260794464;
        Sun, 05 Jul 2026 07:13:14 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260basm34169155ad.16.2026.07.05.07.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 07:13:13 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Sun, 05 Jul 2026 22:12:31 +0800
Subject: [PATCH v7 1/3] mm/swap: colocate page-cluster sysctl with swap
 readahead
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-1-a028e8b5fc3d@gmail.com>
References: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-0-a028e8b5fc3d@gmail.com>
In-Reply-To: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-0-a028e8b5fc3d@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1783260776; l=6143;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=/7iPqMA5mKh6rewx4QRPNnz3zQ/Y5wisYDNlXA9Fp8o=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIX6ahO5IjnkUcegFAIck8lY1CahYT8PGJfzeSvYxhb0QGvAHsWHlqcMqn95hEZpHvjv7qk+sUk
 gPAMtOuwHDQw=
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
Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
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
index 58e4eff698cc..b3ea30edbaad 100644
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
@@ -1176,35 +1172,3 @@ void lru_reparent_memcg(struct mem_cgroup *memcg, struct mem_cgroup *parent, int
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
index 44ab8e1e595b..624ea8ff3d0d 100644
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
index 6fd6e3415b71..a9f5b944172b 100644
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
index f40cfe9d703b..ae710027d546 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7646,7 +7646,7 @@ static int __init kswapd_init(void)
 {
 	int nid;
 
-	swap_setup();
+	swap_readahead_setup();
 	for_each_node_state(nid, N_MEMORY)
  		kswapd_run(nid);
 	register_sysctl_init("vm", vmscan_sysctl_table);

-- 
2.43.0

