Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B3F48097F
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 13:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491961; cv=none; b=Z/ekGpoq11RXcDTDL0MwkYvlZU2AG+t7CSg93HRura0HFixE7VDdIMmJvc0/DXPh1pRvyIymjFvRlTD/W2ugNbQ6ze0EnvKWWFK+c3OYCLk+KZ1Im587jS3PX18cwXveakMmyCy6qk0tzSAhmVf76wOHCKiKMJ0CWYBqssiMGA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491961; c=relaxed/simple;
	bh=fe/ffXXpEMnAu0iQ+HjGa5E0GG/1Zp1/KxR6Zcf8GxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Skx7Y3nAHjff3MZJuEpDzvlUDLGAzC/7GYJZ3+GXz4fUAN7fj+279+JvoOMeeGjV1Mu+jJ9VddMfuV7Ltv1zhw6ejd4krE0tJykvVmy4bHHAY6x67ll/Rzc3yfF60PfZGkjkK2NM2yoQoDakBnVoC/NZTov2ZyiHlbH2EkWbJnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYs/zsd5; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYs/zsd5"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8423f52af13so2425940b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 06:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780491959; x=1781096759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0z7POWPxUcFIdIcrd03eVKzZ+Q9s/sXeL4bwE5y/l2Q=;
        b=cYs/zsd5W3tUUd9vl7J6N+7qhBvJ3QK0y3U/KGCnCQ3VAdjnHdo0VDUPuQTrlgjzho
         KNQBIpQmGGgCq2JieaFK+y02CghBBjVs9VmPOqyJcShaprnqfOBWzgTM/9uZPgdC1Qkj
         vuUGDuGGI/15n/gww+pgB7nIpNIm8Jz+SQMkVgxvM8vX74DIeWJfL2rGixjl0W05CUwu
         Hu4GXy6bzJQmcmkEB2c5GltN5ItJkpCu+Ytkko/wi7HeThpIusGOxbaaYD4VHnPD4i5Y
         r3wrrG3LqTzXyWAqZ/oU4bGgPxKkekrQcZWtMzyb2B8cq+BTOT67gmF8245/TYL/wlOG
         oHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491959; x=1781096759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0z7POWPxUcFIdIcrd03eVKzZ+Q9s/sXeL4bwE5y/l2Q=;
        b=VtqbtTMqIahIuOZxnAwooXWFxJxjXTrQtvBM4/9xR25ud2XMcyNqhQs0y/lNpXhmJa
         BkaE0vtVjAG30LthbZdpuO0uzwt/1MtRI0y1XMCqTVq5dbpLRkdSP7ILUTtTFtsbsEk9
         2ShKt7n6N/xmH+wtL5/lPhqYkCMAqseilwtmsL9DkDGQ8XqmSYGhF6vmj2YnxyO/1WRW
         1xKHgIFmIcN3MgtOvbpySm4crTAa3XzRWr438vPR19MpHeB4g013Gjq8zGqEkiEFmlV9
         fjgNaZsFEc/jmy/ObcArTjATdfdjoO0CZ2x4KQum5/CQH21vzxBl33fKuyYSUtNYxmZ4
         eVWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xwGh7M5877diXWV0EK7pTVEbXBw6zeRRHNYYF/HtNf3ft6/NwI4PfavdKhx3idKHHda6C2a5g71c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMolYAdxCjJ3YhI0bI1h+uMaZCjogAO21Ls56fqaJ4rgBWG/Ka
	a7tuhyUC5BTS/Zr0vvTL1rfy9TRCf2Wg0W2bcmPiBz2/aJXpJR7fjp4v
X-Gm-Gg: Acq92OHDArru2CojWfZ0Q/aCERKM0DHYEjRGq+mlxY+5IX33nfLO0+HPvT+z5xv/fst
	TaArj3bY1CQkPZX30zPxh6NpceYNphO75SlPtgyhkfWVoawAd6nV6JPvCbYx3EmKE/3fa6hHKmJ
	UCo9IYV1ldGMuM7nvkjbnqm0AwSVFnYIoOAUSyiBP+cCxhCNIpRvqs/Y4ZQrHSZO7kIKRyoQJZR
	3l/ZF1P2UWbpCdBBgK3hxNG8EPTdIkAGzcOCS9C0PV+56djUgxDr4zxPFp9KC2vY8/IoC0X1//X
	8Q4y3x0uuGN+q0UWa76U/YiE/IFD3p7clrNKK40P+5l06/aEt60IDww/cTPWHjZvNbLnABsGsou
	6I1BVj3EVMWJ53ShkSFfMu0PEzI1d/eKcc5g/X9Co2EFaQVO9YyYnf8aXMFZt+e8nFyWdyieXRe
	uX6VQQXMDaH3ykedqYEUvbmtDYwu+8lyuMXbAOmBIp7kUkSSKyWv8v/pLzSPu4dvHvytANcs14J
	Q3Q4ZWMUNA=
X-Received: by 2002:a05:6a00:a588:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-84284f2ab8dmr3244777b3a.48.1780491959261;
        Wed, 03 Jun 2026 06:05:59 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828821d0sm3018661b3a.28.2026.06.03.06.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:05:58 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 03 Jun 2026 21:05:33 +0800
Subject: [PATCH v4 2/3] mm: rename swap.c to folio_lru.c
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-2-ce0219e100d9@gmail.com>
References: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
In-Reply-To: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1780491936; l=3861;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=fe/ffXXpEMnAu0iQ+HjGa5E0GG/1Zp1/KxR6Zcf8GxY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFMGdSY7BAbK8+cAIhTQmlj4XbCHh0sKNvEnlqBKWenwp5XcnSXEtNnzgQ5T5Q5dW+PSUXUNHaL
 Meb9KsDapkQs=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

Rename mm/swap.c to mm/folio_lru.c so the filename better matches
the code's main responsibility.

This keeps the implementation split from swap-specific code without
changing the published LRU helper interfaces.

Update MAINTAINERS and the remaining mm/swap.c documentation references
after the rename.

Suggested-by: Baoquan He <bhe@redhat.com>
Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 Documentation/admin-guide/sysctl/vm.rst |  3 ---
 Documentation/core-api/mm-api.rst       |  2 +-
 MAINTAINERS                             |  3 +--
 mm/Makefile                             |  2 +-
 mm/{swap.c => folio_lru.c}              | 10 +++-------
 5 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 97e12359775c..2b9513371324 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -19,9 +19,6 @@ The files in this directory can be used to tune the operation
 of the virtual memory (VM) subsystem of the Linux kernel and
 the writeout of dirty data to disk.
 
-Default values and initialization routines for most of these
-files can be found in mm/swap.c.
-
 Currently, these files are in /proc/sys/vm:
 
 - admin_reserve_kbytes
diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index aabdd3cba58e..d6d189b9a996 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -117,7 +117,7 @@ More Memory Management Functions
 .. #kernel-doc:: mm/hmm.c (build warnings)
 .. kernel-doc:: mm/memremap.c
 .. kernel-doc:: mm/hugetlb.c
-.. kernel-doc:: mm/swap.c
+.. kernel-doc:: mm/folio_lru.c
 .. kernel-doc:: mm/memcontrol.c
 .. #kernel-doc:: mm/memory-tiers.c (build warnings)
 .. kernel-doc:: mm/shmem.c
diff --git a/MAINTAINERS b/MAINTAINERS
index e3ee97f5474e..6bd39e0afceb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16900,7 +16900,7 @@ F:	Documentation/admin-guide/mm/multigen_lru.rst
 F:	Documentation/mm/multigen_lru.rst
 F:	include/linux/mm_inline.h
 F:	include/linux/mmzone.h
-F:	mm/swap.c
+F:	mm/folio_lru.c
 F:	mm/vmscan.c
 F:	mm/workingset.c
 
@@ -17045,7 +17045,6 @@ F:	include/linux/swap.h
 F:	include/linux/swapfile.h
 F:	include/linux/swapops.h
 F:	mm/page_io.c
-F:	mm/swap.c
 F:	mm/swap.h
 F:	mm/swap_table.h
 F:	mm/swap_state.c
diff --git a/mm/Makefile b/mm/Makefile
index eff9f9e7e061..5f712f9bbe73 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -50,7 +50,7 @@ endif
 
 obj-y			:= filemap.o mempool.o oom_kill.o fadvise.o \
 			   maccess.o page-writeback.o folio-compat.o \
-			   readahead.o swap.o truncate.o vmscan.o shrinker.o \
+			   readahead.o folio_lru.o truncate.o vmscan.o shrinker.o \
 			   shmem.o util.o mmzone.o vmstat.o backing-dev.o \
 			   mm_init.o percpu.o slab_common.o \
 			   compaction.o show_mem.o \
diff --git a/mm/swap.c b/mm/folio_lru.c
similarity index 99%
rename from mm/swap.c
rename to mm/folio_lru.c
index e4b3dadaa6dc..46924a797ead 100644
--- a/mm/swap.c
+++ b/mm/folio_lru.c
@@ -1,17 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- *  linux/mm/swap.c
+ *  linux/mm/folio_lru.c
  *
  *  Copyright (C) 1991, 1992, 1993, 1994  Linus Torvalds
  */
 
 /*
- * This file contains the default values for the operation of the
- * Linux VM subsystem. Fine-tuning documentation can be found in
- * Documentation/admin-guide/sysctl/vm.rst.
- * Started 18.12.91
- * Swap aging added 23.2.95, Stephen Tweedie.
- * Buffermem limits added 12.3.98, Rik van Riel.
+ * Folio LRU helpers: add/remove folios from LRU lists, batching,
+ * activation/deactivation, and page cache release paths.
  */
 
 #include <linux/mm.h>

-- 
2.43.0

