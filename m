Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4628642EEA2
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510642; cv=none; b=Axa/mrW424D+Qa4UePg/iLc+bc7KvlO0gWRSYSEySQkL90OE8Wzy1/YsGxRx7GsalIzPMlfrNVxZQn90tPlYxGug9a5hrfm1YBx2lIE0jAT6nyhCI4Cz6d0OG6eQL6T/A5hGT4cq9frLf7NexiPVZ1H6gZcVTL1nHCVMHNlhR2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510642; c=relaxed/simple;
	bh=KGxOwAYZ7vHV9hZpL4rzDKx+pwJ0+0rkmt8rvsjthpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4CNPAV7ZrY3CFZNCxSi0izBDKCZn2aVdlC1FRwMPImAEftbz5nOis/9oNRjkxzz9wlSok8s4vQyGqiOYltzSn7D0zZZJhBa4xOeUMaiDJTFSBhOvG57ZUpamtH9YYMTq06beGSA81QqDgRV4CaNcZyBcWy2cH3VFwwxz2L/etY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1Ox0X18; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1Ox0X18"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so402605a12.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 04:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783510639; x=1784115439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9KelEc/lur7aRZA0dSSKGcLt9wGz9DkT1jITO75cYs=;
        b=A1Ox0X18/HfWgX8YO5JIaoLYVwkFVTIVfLYvmzJC9/oujuGOtFeL+U+EMvEvHCnsdl
         VJP5WUjC2s4Ikj62I1xx9YfhsAoXdrHEESJpOu/kF+OwpYmpyZEDTlWY4fgMBEE2m6SV
         Sx4zWFgjU4dB3umWjURLqiCtLtjDFLSuD+qJqVUaXcClYTN6RntRVAMVNaNvrWN6nHif
         OLRHYGBggSPS44rTaXi+mCUShefKPPMi0o1V5V1SI9HK4p+s+KOXRRr14LR7GnlnKjir
         TKzSDC+2keDgmeBzmglJ0nMeJaPogIC1DjCC7X2GGQRDHEhVks1TB66Z+ylRxd4ZdQX2
         7AXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510639; x=1784115439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9KelEc/lur7aRZA0dSSKGcLt9wGz9DkT1jITO75cYs=;
        b=WBKnw48aT7C8wJ/gZ91b8cRVnAsM72yEsoMfJ5E+X9G6+APeaxdBSN2CZoSeMbQESN
         2fmJy2CEr2LoMS5KSuptdvISuurelqasJ2rfbscojDyH0js4SRWYWfnnsRQYzpdZQQYR
         i2ZgwtAqJg/Nv87Xp7o6f2c8ilpekaI1Ts37xwRXORPQ5aKqs7yoHIjVBLKYcJ2ZzLa7
         j5PqBfa+PqeACqTx9kM4Nhdm15WxdOQrnIeyIVMdptKIGDE7XT3slsaet2rAD685VMAV
         +Nk9VNeFiWQ9rG/mgO95ruGjS3MW/KioglcszYBzMSJAwmUd9ixHmSOdScRvNSKiqfmP
         nk+w==
X-Forwarded-Encrypted: i=1; AHgh+RqL8QCcffJ4/dzhxfzg3LiPEypldbiirPK0KVW0JdJfzjIRKbez0li6cI4FAHUZsyTy6rHU4nVLAKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW881/nueYrG/fIS4LCqRiKelIJNEmMygatfSvqvxzFC2qaWQ7
	uK50UCWp5lttJeWuAirYOsQ/oNU1Z4TSEd11BSXcyv+72phDvtLfAXL4
X-Gm-Gg: AfdE7cno9yEy0T50tSn/ZZ4E0uHDGlGf0PucFojMRrpr0dmj/+DIm2oj3ctmpkChx8e
	L8/8zQ2SN0HpclkQ3fF3IhjiOMEad7jxZjj0mCHrL0y7FCmL+UjqjV2Sjh0mT+dffhkhLAq7LSH
	P4iOsEbTJj57lY8zEBgU0wvtjl3t76W/vQLYDAFAH6K8oFmAg/9xtTECfIquDAldLz/qOVmldIY
	athl/yVqAzmVmFL+y7LGeTJoNqNe9XORURX7BmS02jKb1aSBtDeAktV/OempTmlkYlYiSFoxmOk
	kCm2FbDPFD8x3dTWgNNffoBc63Wd12fSG5V+vqMCQtSHjr2pBRb4lAqInj/VKyEB1tLjojG1fEe
	3VGh/kvK0fx1/sx/NTucIzf+0JebLOOwAoYUB0QlhcsXBkqW0PVsCxexXQIpCA+nH9n0zgFD81T
	Za20//F8L4grN8CWpZGNDdHU3ckSQQrOwy8Y7lQB2ktx4mEc6wgFOHLipS3rA=
X-Received: by 2002:a05:6a21:4d8e:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c0bca47d59mr2582996637.31.1783510639405;
        Wed, 08 Jul 2026 04:37:19 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([203.18.50.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3a2e42bsm2260788a12.30.2026.07.08.04.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:37:18 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 08 Jul 2026 19:35:43 +0800
Subject: [PATCH v9 1/3] mm/swap: colocate page-cluster sysctl with swap
 readahead
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ch-swap-series-plus-folio-lru-cleanup-v9-1-2bc72b4f8730@gmail.com>
References: <20260708-ch-swap-series-plus-folio-lru-cleanup-v9-0-2bc72b4f8730@gmail.com>
In-Reply-To: <20260708-ch-swap-series-plus-folio-lru-cleanup-v9-0-2bc72b4f8730@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
 Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>, 
 Matthew Wilcox <willy@infradead.org>, Baoquan He <baoquan.he@linux.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1783510625; l=6347;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=KGxOwAYZ7vHV9hZpL4rzDKx+pwJ0+0rkmt8rvsjthpg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGjwQeFlFTXXA8I17uwgpK0sErgmRpUT6KnOfdqbzYpuWvutuP01WgezoQ8k3H4chJY+Bmc9m/P
 gQCWH7xRH1AY=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

page_cluster and the vm.page-cluster sysctl are only used by swap-in
readahead in swap_state.c. Move them out of swap.c together with
swap_readahead_setup(), and make page_cluster static to that file.

Rename swap_setup() while moving it as well. The helper is internal to
MM and now only sets up swap readahead defaults and its sysctl hook, so
the more specific name matches its reduced scope.

Call swap_readahead_setup() from swap_init() after moving it, keeping
the readahead defaults and sysctl registration with swap_state.c
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
Suggested-by: Matthew Wilcox <willy@infradead.org>
Reviewed-by: Kairui Song <kasong@tencent.com>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 include/linux/swap.h |  1 -
 mm/swap.c            | 36 ------------------------------------
 mm/swap.h            |  2 --
 mm/swap_state.c      | 50 ++++++++++++++++++++++++++++++++++++++++++++++++--
 mm/vmscan.c          |  1 -
 5 files changed, 48 insertions(+), 42 deletions(-)

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
index 44ab8e1e595b..b51ad3071a73 100644
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
diff --git a/mm/swap_state.c b/mm/swap_state.c
index 6fd6e3415b71..1444d20a40e9 100644
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
@@ -985,6 +990,35 @@ struct folio *swapin_readahead(swp_entry_t entry, gfp_t gfp_mask,
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
@@ -1014,7 +1048,7 @@ static const struct attribute_group swap_attr_group = {
 	.attrs = swap_attrs,
 };
 
-static int __init swap_init(void)
+static int __init swap_sysfs_init(void)
 {
 	int err;
 	struct kobject *swap_kobj;
@@ -1037,5 +1071,17 @@ static int __init swap_init(void)
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

