Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1555E1B87C0
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 01:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782781722; cv=none; b=plj4b3WnwRPaHt0wVMMqRK0H4Gc7Oz1HpIcrkv8jZsHMLn+xdcC/Z1p+H8YmJ1SDWiBIQX1VX1CsNBSiY3gN58hMcpZgS6rCOIBkb7pBwxSCjAAh/CK0zKTYW+VIblmXPFR3JtqUaH91SfRtgE8slsocq7a5Yzlf0lZVJndsK6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782781722; c=relaxed/simple;
	bh=Ta+8IM8MGp8fjCoDYDkz/MpytL00oWVPxPoeXHHrRZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7aFKeSMdWS1SRfWAYep1K9gbwtaGdDvsSPFhF/f32Lm+ZPLPCx4SvW/7Ghmrwu4aVsG/DaFHWst8Tdbw6gnrWrtAxax9nsUn6Au+No65iLlLAj5kxFM8NLWGZqR52/GPo3QC3rIW26p6UsgSrM8s/sEcBr4U1/BdJfhuD7PFzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjPzJ8PW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjPzJ8PW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-847a52edeb2so54148b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 18:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782781720; x=1783386520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4DnE15DF2Fu15LvNAiz/waMqRGmi/eFj/KwCw6VduY=;
        b=LjPzJ8PW/djvi4aUwcVPsR/1tlB0g9vVrkICnJ2Vr0bpFMdBMVjPblvWAb1sPNeWQj
         3MskhuRmxOQac0tAQSrHx55XjzWQ0PCcObMMwcKU3BHlJrQIIu1DIsWTtvZzGS4Za48i
         XLlmdK8FToe4oPzgnFscmprNuyxj60s9zzEJKWTO5jCQg0z63+VrdoNOPm2IXTMHdJHl
         WUaF7upgVA5/JLcmNlS7H+1sQGgHzTwTRH7/GM7ms5Z0GCV8r3vD1JC2Ss8KbfnKALKf
         NfIdkblofI7xtgGJPGMjKhHTxtoe1tpx74hSVuzav9IWqZSiG5uDOJMOwx3mJM5lItPD
         2DBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782781720; x=1783386520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w4DnE15DF2Fu15LvNAiz/waMqRGmi/eFj/KwCw6VduY=;
        b=hPElp82Isw9hBLGNA5VXVe5iUNJWEZPP7hOwc57WwHljZ3JTeCH6cuePsn05+nyko1
         Rl79mG3eO3JmS6swZpjqoDT21BMuK/TzcWHzD28OOj20GdVPcRZ+YdzNjjzkwm905hx/
         O8xjIOcIzpZa1NAyiCAoZ8Atl/t63LzzevrgxkAxdVwwciOlCU0eUFPF7sLpm+J9lV0X
         dzWZaHQUxs88pIzhITX3HsiUTHLU9JUOAPvoODcCGsfjnTP2mPf+GWTvuuWcbptnUzeu
         0uWFbb31gFMRUdgTQtDAdLuHXtkkfEN6C3ZaA/sPTim8aPPCb7Ipl/FrGkqqTPxYWJFX
         u2cg==
X-Forwarded-Encrypted: i=1; AHgh+RrtYTeLxSwKhvPUE7NxaEnHuV5gRl/wAzbpU9rIjE9N6TqNChh/dv7T1HXPKUY3RZr2TIKFsze5Eg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGCK5ce/E+OKiabgQKdYBHN3k2Ndv8xwI2rPqxt+VHySEPSUP4
	AkrNgn6DKlFRyp8nYhyI7mwt0XNnIUnGJdf8Rhdy3bikZ2bbRU303a8m
X-Gm-Gg: AfdE7cnGHf4/r4zlovGMhMKG/XAQWqBZYYAt5oRanFZRlLRsxie8I49ugPEGDg4Sd/5
	Us1XNTl3JL4qtASmvde383XwG7eoT25swrcoNB6ZD2be6d3UdQ+zqN7JPtUPPv098V4mWvG9wGu
	pJ5/qEFEhgq2WerkTirIvEiitTXZWaRp+XAqEasiZPe87c7o/aSJpfKmk/i+caLPijbUJho5JJB
	+bt+KbqLq+AuWO8SruqtWAus96eJL6Xr7qmQgv/mMmekBBOUAnGVD+QUCtUaU/0Vl3AvbY2kfBX
	2pnXJMSo+r/W8ux/eYgbNSSB7r7JX/ythyhfBSvy8EZBLHhfvqLJm/H/ryJVVF9g/ZDyZh7Zlvy
	bB0mD+Diih5vpuqILlLf1UW96OGpOS4it/qe7A1cQvbqJndS7v060VapEcHQ+RcxyVzjvHqa5JK
	OLAqVjV8NN8AII8JcD5CAGPFq2izk6oAGqN2iliCJjay5E2nGRVXClrMnqoMY=
X-Received: by 2002:a05:6a00:3c93:b0:847:86d3:9326 with SMTP id d2e1a72fcca58-8479f1c72c4mr1252456b3a.26.1782781720328;
        Mon, 29 Jun 2026 18:08:40 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([203.18.50.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a005afbfsm653310b3a.27.2026.06.29.18.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:08:39 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Tue, 30 Jun 2026 09:08:18 +0800
Subject: [PATCH v5 2/3] mm: rename swap.c to folio_lru.c
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-ch-swap-series-plus-folio-lru-cleanup-v5-2-4627aba8ed1e@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1782781697; l=4010;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=Ta+8IM8MGp8fjCoDYDkz/MpytL00oWVPxPoeXHHrRZs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFAB3a8tJm+Ghq7mj2TMZxy9z8XOhuYkMAYrzIej6rWZLSS9EZLfLyasUPt3qY6Q3VjKr9KO7FO
 6ZJ1UEuVXVAQ=
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
Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
 Documentation/admin-guide/sysctl/vm.rst |  3 ---
 Documentation/core-api/mm-api.rst       |  2 +-
 MAINTAINERS                             |  3 +--
 mm/Makefile                             |  2 +-
 mm/{swap.c => folio_lru.c}              | 10 +++-------
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
index dd963b72c614..b92bd62dbe17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16906,7 +16906,7 @@ F:	Documentation/admin-guide/mm/multigen_lru.rst
 F:	Documentation/mm/multigen_lru.rst
 F:	include/linux/mm_inline.h
 F:	include/linux/mmzone.h
-F:	mm/swap.c
+F:	mm/folio_lru.c
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

