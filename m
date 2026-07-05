Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E823815E7
	for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2026 14:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783260804; cv=none; b=IOfBOYoPaDRkdSeDZfFMb/u4aGUTQ8xv1e80MpSqi7RghCEV50ZThE22f0cPC5QqTz86iUUl+vCj8aWbVhjSejuzO0OGOovu1//UihST4zc49tf7PYJ0Km+uMjN46zp4QJ0vIQl/30wvt62I1kgGkQoeH4FgWJ2nJ1gNwrNt2JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783260804; c=relaxed/simple;
	bh=gZdtwf9QOc/tBmuNw32enXCtInpJnxCz76ZA5ZAemXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gd6+aOnCHS607tHQI+nmWjkIky2JbyV0C9A+jDG7vlByve7UyLoh/mPdX1PrtV0LqTJkaBYdKp9jos7NaD5oxko0bvlGI1i5P5lwZdRhG3T/lnhKTGw8x1Z2gHDzTvW5B6hcBDHEoSV8fyi43Hce8UkcL0rWr6zIjHAB4j7Q4kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxxJzH94; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxxJzH94"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caced6038eso21386835ad.0
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 07:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783260802; x=1783865602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1aah+v1fwTFgbFWRTfwbYRHEyBQupbQOxJrOmO9ni0=;
        b=QxxJzH94mrQ8tKZKSA+j22zdxrbydQXtwZj8C1n86NE7CIDBicS3c3WDvcw9hTCG/I
         slgZvcmJvDyrin0H922N5FyftNZ8hk9ZBMB9h3Fb5s2vXEMn+Ptu7VEuQAZySg+Hla/z
         fUNPAawQhqqX7qR8qP1yJ6nlTAYyBxV2Kgex3RnUWG2UwMoUYx1GX4q5kicOffTYjUXQ
         W5PhhfKm9wTapHQIfnS6uGuiisXbq3LKY1mTu3b3OXKOHhSVnWv+b4r9D5+6X+04SxIx
         vXnSvmhd1ydyAr9uq8NJeKN0e4btC03K5RyEezx7TO2WT4T19Xh/RWGIIf+DyNfiBiNX
         Iomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783260802; x=1783865602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e1aah+v1fwTFgbFWRTfwbYRHEyBQupbQOxJrOmO9ni0=;
        b=i2bi5SASeXrwZjMJBe9pD7mHMxgnQuJi/vw4yxns8nbzF4XnxegfA5eHr6NxvQmUaC
         uRWaaG7k9DYnsW0hpHlzWe227HexUw3huj2rM+JOqikpwx8rdPrDJCxKJ0EY3w7YLSN+
         suCM13oko9RdFtVG2KV0mQ0WVKcJQ/UCbGumONINmhTqlpTbZoLFeF2t9NeKgtY8kEu3
         Pb9mou4x6+2xcz33mWSJTuKlS2W/jhi4QPAd48zyhCBQAq6aBeo1So4VL5joghSU0BRt
         AQFzz1nc5fwfXI3cdpS5rMYDBlK8a4K6HPHFvdTZhgzHq9CheuonaXgRT+8lT1haa3Iz
         TL1A==
X-Forwarded-Encrypted: i=1; AHgh+RrvonmoZ/d9T9fOv5MD9v4EAmSg0aWX1vSrpXV3zkFX33jpUS6His/5fEmQXxRLwS02FAiXTpyo4gQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmlrknx8k2sYa0UPnaziZbYblWZCCNuWB5pVuDZdZMcWJwjwil
	+hi8UvcmXr7qnw+XASUZmQ8lU3qgCmN2psa7teNRwEWH18aXty+ZpCtd
X-Gm-Gg: AfdE7ckhwqwQCqGxXn+zctkLhLibYI9W5/natTq/EJhtpvuvqcQgHj4pTBpqqSmpnXu
	9EgTonXw9FROjNmIkucDbGcdxaQkh3/FUgYHFCPG47zj5LWPWrpA2uYYB/4bXf7WPSQDFSZ582x
	Ir0gqscBkgpW6rntU/vZus3AuGbx0yOFWnWGGT2FMeig2uyr0jemysVSSpx+gkmj1x5zDt5QcOn
	KiEJ5XQgUDs5a6sMRdLhuVIrDGq0HGl1IzE4o6XV8udF0Vjlw2wJEpb+d+APYUrAdvY2+FntBlq
	48JJm4KwDNcebg16S7pdZOSHFfK+hlvulcwj8onsINTHVJ0MdkmmhvziS9b0UCBC/wSpoBKO1j0
	r0C5F6ZarShSDYgeZwGrXlVrxKWlJAkaE0KxwZBQgOvzEpxfi5O8aUuRn5LqlkrQ/TXKgS8Xmk7
	Qo8u2dloQ1eWG1UUID9uPgZdpDis6odWSE9zPoRsbI6N41cTt87qWq/FBxgfZdPmIVwbzerL+9e
	A==
X-Received: by 2002:a17:903:943:b0:2c9:97a7:3283 with SMTP id d9443c01a7336-2cc0b241bfdmr47850655ad.23.1783260802010;
        Sun, 05 Jul 2026 07:13:22 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260basm34169155ad.16.2026.07.05.07.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 07:13:21 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Sun, 05 Jul 2026 22:12:32 +0800
Subject: [PATCH v7 2/3] mm: rename swap.c to folio.c
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-2-a028e8b5fc3d@gmail.com>
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
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>, 
 Matthew Wilcox <willy@infradead.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1783260776; l=4030;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=gZdtwf9QOc/tBmuNw32enXCtInpJnxCz76ZA5ZAemXA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNRqFSXfwbK9+JX7YECaRc8sMpjCXwvoabrB1f6fYYyNqfm8TAK6hO4MmqqaT6fNBJktyFHSgMt
 AzhPH0rK9Kwc=
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
Suggested-by: Matthew Wilcox <willy@infradead.org>
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
index 22cc54cac3b2..5b318d17aa4b 100644
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
index 4df7d5edbee5..c1d03a5a2a19 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -118,7 +118,7 @@ More Memory Management Functions
 .. #kernel-doc:: mm/hmm.c (build warnings)
 .. kernel-doc:: mm/memremap.c
 .. kernel-doc:: mm/hugetlb.c
-.. kernel-doc:: mm/swap.c
+.. kernel-doc:: mm/folio.c
 .. kernel-doc:: mm/memcontrol.c
 .. #kernel-doc:: mm/memory-tiers.c (build warnings)
 .. kernel-doc:: mm/shmem.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 29c302e9c17b..e853622a9b96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17086,7 +17086,7 @@ F:	Documentation/admin-guide/mm/multigen_lru.rst
 F:	Documentation/mm/multigen_lru.rst
 F:	include/linux/mm_inline.h
 F:	include/linux/mmzone.h
-F:	mm/swap.c
+F:	mm/folio.c
 F:	mm/vmscan.c
 F:	mm/workingset.c
 
@@ -17237,7 +17237,6 @@ F:	include/linux/swap.h
 F:	include/linux/swapfile.h
 F:	include/linux/swapops.h
 F:	mm/page_io.c
-F:	mm/swap.c
 F:	mm/swap.h
 F:	mm/swap_table.h
 F:	mm/swap_state.c
diff --git a/mm/Makefile b/mm/Makefile
index 4fc713867b9b..8e7e964b99a4 100644
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
index b3ea30edbaad..4acad3e94cbd 100644
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

