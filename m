Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8E478E5B
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 16:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836886; cv=none; b=ug/4r3P0nCh6exPoL4p8W9XLkLV1bZm+4jnFtAjUWC2gdKIxhFzNg/mohl1td6yI2O2rAvR399OhJUDi9C0rh0Asje/cffvdZMA5fxaYwQ82pud+0sVnZzbXhUp88399mCBsIVrAMtc06D696D8q8SF6VTgnDkpdsUjh8la829w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836886; c=relaxed/simple;
	bh=FTvafjf4Npw/hqGNx/UkHTpH/v3A7Pg1RRq3orgcb4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ca3IyMvDbSlIQBAac2CIU5Ak0P6fwhU8rZnWl02MmPAc/wxkrVtPL9LEU/Iv48ULwH2dOcdUz+3UyQTX3+gUXbGngWaBp7O9iA/OxNTssrWiXlH0M4OHYMFl0P0j3ujf3jjSzZZLTeDj1c3XDNBOeXKo7GmyFhgPFuRRqGzIS2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OguV1o/y; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OguV1o/y"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c9f44ddf26so10487945ad.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 09:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782836882; x=1783441682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZgrcX9Ksd+pEXazTowNu2E/DXILDGl1RE+rsoxUjNk=;
        b=OguV1o/yypYcKqOlLI9rm/pADDKzItoJlp8ush6AtbpHnoXHaBOtFuKkmcSSL3f2zB
         /gM+55nEtwCZKjjY28fynl6zoUCP0rIeW3avu7OkFmPUaXaI6bZDYQtDE6LIu7+wW4al
         yHHHlMBeNgcsGVSv9PpyYLN0Bmg3ou0LEp/kRQrMpJowyOR8W33zDGYiktKwu8/W6Ifi
         lDWOgAouRi6lfudyWtuhtFWJ46fjflekOG0bux0tsYIUD+vnpymkzT+Ns8kGCiGbKgM4
         oFLzjMTTjp1LNm10G+AotaUaB2GdvpfurenPU3gLDc5FEPIOpB9xxnW7WYu3LL988UMc
         59fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782836882; x=1783441682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OZgrcX9Ksd+pEXazTowNu2E/DXILDGl1RE+rsoxUjNk=;
        b=f4evZjf6JJbfAIxO9CxRwmcxWDlOQn1/y0JbAuYjzqwVh4yxlct722eZ6o6CC+vO3P
         a1piUSpsKqUltPGAMRkfs0zLWykqH0Vn/NQiQ8ZRlMyCvlu10ftriVC4UbEBzQTuaFxL
         AfoJFthPCqG3lr95MjG5HGogJw70t1lQ2I21j99v1r6OLu5JP1Ky2h/hVrFozwU0MiTB
         ElNNlCtu7Z0UcDslypDKgxuZu71UzLmrv4JHRMkSFV1wQ22/BtIK7w91JlmpD/L/tZli
         HwTbZcCJ7wwzmOBwnz3TkT5hxJkszw8Zwk+BaUcUq+VjeZleUD7PlDiSfYiAhwqD4Hlq
         hM0g==
X-Forwarded-Encrypted: i=1; AHgh+RoZpRMOEF07rNAGIbsiMS22sziLhQzOYzoaqXTI8Vn2F0j2EEMewURtlvReGNN2NA1EI/tu4kIWJYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2BLhOFAdEq3YmiYWdX0iax8lp2fIpvR6nY7XMZ5mG0s2sn5MF
	8EcvGa7B2wo7c9e38naAxT8JtzsaiLcwBGO94NwDnT+XwFQsKbTOwoJf
X-Gm-Gg: AfdE7clArwuIA6kBk1Hf//Rqu9fpXpqOoKg928KaFkiKzkIxgj9Gbmt4j9s/a0iky+r
	L4MlLArPrVHGa2wfgEMivT0xzwcG7y4KsDf5EbirusrVkgaldtOtKJuDyzcWn58BGQSRYiS3RE0
	ajZfapQUVF56wJDHArf/b2UufC0lUTaZQmJ1myFnG+BNH1wnyjxxZJQdI4Wotn1AuZddc5Gme22
	vTB8SGJ1aL2xofnNeqvOX6xL/G9sjyIwfGH8tc5NcshT0gQ47O7UouBwKl+8ojDojBi3Fsben5T
	tWKBWhj1Vq6K2EaNHUxkg66bpbgCA9of7sSkltxBz46u6lFGrPIHmAlNdd3xilIrvGMDU4VIBlH
	XC9UP1KeSWleWe3zHhu6epm99uHYnCOxdmhFlpnx+qI9Wy2aiHiyzxcFyTnqFGEsBwOqe+GKldN
	uP2hL9+6Opfn0/zdTyQ8L270VwQF8MzFrSAqSMB/r211zV6hFn/vk0ehfiUjoLQQ==
X-Received: by 2002:a17:903:1a30:b0:2c9:aae1:a611 with SMTP id d9443c01a7336-2ca5a5eb883mr11552395ad.23.1782836882450;
        Tue, 30 Jun 2026 09:28:02 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bcesm17829375ad.29.2026.06.30.09.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:28:01 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 01 Jul 2026 00:27:33 +0800
Subject: [PATCH v6 2/3] mm: rename swap.c to folio.c
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-2-d4f648963382@gmail.com>
References: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-0-d4f648963382@gmail.com>
In-Reply-To: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-0-d4f648963382@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1782836859; l=3978;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=FTvafjf4Npw/hqGNx/UkHTpH/v3A7Pg1RRq3orgcb4A=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QB2vgpugJ2P6MKxAU/vvMv+qIkH6SjUmjrKHAOLMUwih5vQG8q69bE0K8K9uQJxFx98f+L37KKM
 YA+C7jnZ5tQY=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg

Rename mm/swap.c to mm/folio.c so the filename better matches
the code's main responsibility.

This keeps the implementation split from swap-specific code without
changing the published LRU helper interfaces.

Update MAINTAINERS and the remaining mm/swap.c documentation references
after the rename.

Suggested-by: Baoquan He <bhe@redhat.com>
Suggested-by: David Hildenbrand <david@kernel.org>
Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 Documentation/admin-guide/sysctl/vm.rst |  3 ---
 Documentation/core-api/mm-api.rst       |  2 +-
 MAINTAINERS                             |  3 +--
 mm/Makefile                             |  2 +-
 mm/{swap.c => folio.c}                  | 10 +++-------
 5 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index b9b0c218bfb4..c84ebc62a218 100644
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
index aabdd3cba58e..9c3f75092b8e 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -117,7 +117,7 @@ More Memory Management Functions
 .. #kernel-doc:: mm/hmm.c (build warnings)
 .. kernel-doc:: mm/memremap.c
 .. kernel-doc:: mm/hugetlb.c
-.. kernel-doc:: mm/swap.c
+.. kernel-doc:: mm/folio.c
 .. kernel-doc:: mm/memcontrol.c
 .. #kernel-doc:: mm/memory-tiers.c (build warnings)
 .. kernel-doc:: mm/shmem.c
diff --git a/MAINTAINERS b/MAINTAINERS
index dd963b72c614..bc17b1958c99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16906,7 +16906,7 @@ F:	Documentation/admin-guide/mm/multigen_lru.rst
 F:	Documentation/mm/multigen_lru.rst
 F:	include/linux/mm_inline.h
 F:	include/linux/mmzone.h
-F:	mm/swap.c
+F:	mm/folio.c
 F:	mm/vmscan.c
 F:	mm/workingset.c
 
@@ -17057,7 +17057,6 @@ F:	include/linux/swap.h
 F:	include/linux/swapfile.h
 F:	include/linux/swapops.h
 F:	mm/page_io.c
-F:	mm/swap.c
 F:	mm/swap.h
 F:	mm/swap_table.h
 F:	mm/swap_state.c
diff --git a/mm/Makefile b/mm/Makefile
index eff9f9e7e061..889e7f9f9086 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -50,7 +50,7 @@ endif
 
 obj-y			:= filemap.o mempool.o oom_kill.o fadvise.o \
 			   maccess.o page-writeback.o folio-compat.o \
-			   readahead.o swap.o truncate.o vmscan.o shrinker.o \
+			   readahead.o folio.o truncate.o vmscan.o shrinker.o \
 			   shmem.o util.o mmzone.o vmstat.o backing-dev.o \
 			   mm_init.o percpu.o slab_common.o \
 			   compaction.o show_mem.o \
diff --git a/mm/swap.c b/mm/folio.c
similarity index 99%
rename from mm/swap.c
rename to mm/folio.c
index e4b3dadaa6dc..bcb621c26615 100644
--- a/mm/swap.c
+++ b/mm/folio.c
@@ -1,17 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- *  linux/mm/swap.c
+ *  linux/mm/folio.c
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

