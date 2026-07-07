Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC65432BD2
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 16:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440725; cv=none; b=WtQQowtMpi63NgIoaBbQNeex1iPBLY8Ti7NhBOBk9A6cmIsCmd7VWEEdrBKklIter20cDXWRSir0yO3bzlW55HV6R1PhS7/Ei3NfJVFs0zaDzvTxsUIAz7qcDsLLQP5BTzpEaqOWgS4AZ2X0+Qpu21x4w7aWn3YfA+3nWpfQh2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440725; c=relaxed/simple;
	bh=yq5j8WJXfLbQ2tXMHiZDbuoRUdTLBMAg9V0gGqHlseI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9uPRQJmsG5prQX5DxE0D7ic/p4hPpCamb8sffPP3am4OehbdzBBS4f7c/GjN3h8ocK29j5QknahLbUXnyKHKl9FuqPocd8zrrlIt7H0t6JVn5AP3OqbNo6HQnFH9Cp9+g49jKoM8uOQ0HmTLHmgztuzvmZM4kJuRbe79bEzp+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mggMll5S; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mggMll5S"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381891a9525so4158249a91.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 09:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783440724; x=1784045524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdtacZ9QZNs8NBfbxYniGWvkfMZyXJuYZ+uj6tlE4eE=;
        b=mggMll5SVcC2nHjtFbKS/JA9OXN6wBYMrB950r37gR7MIJbX58Y3vSXnldDffPCbV9
         94Q014U3Wjrdxgi8Tp64qkvAqIu9uhESHPUDZ8NGVAA/q9kY8prfKhL9eP8aBo3vwQzC
         h/b7AOWoovwaAbkn7xCEvUtg8H4EuWbYtjTfRb9r/EzrD32YJuV3DMi4Y2moPAvUDJ9R
         X1XmjOHeAd8YxZPIPlm6NPavtpfY6IfWrF8NE+cxX9VOmmmBCvhjliZU30zuS3rJnBQR
         D4HOtsi2rG+nQ3zuVwYADJTxNVZcloKGJoBf0XNsDzfbhHSfXvCqh2CsyfO/cNUAgkQv
         sExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783440724; x=1784045524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdtacZ9QZNs8NBfbxYniGWvkfMZyXJuYZ+uj6tlE4eE=;
        b=GTN1QF73qcq5VQaFw4iJZsEsbEhZ6cxqtM8Qr838D0O33RVG9bNq0ozYbXNTW+uaOv
         Lr4ArwgQq39g/9VgCGlkYWqD7Xhn8V1RdXxRzTezNZ4ITpbA0UDAyY6c6v9DgM4KwTIW
         gZATJ3qjCmuRwW6gW5mmpM1qkPFnkiJKNM/7qdkXZuf52gdadvP47GPpyLiJEJIrKZEm
         DX0E0dCbYSVXDTEC7J3+cXYHhAPDLtkxcWsO9Rvq1UHITVacd8bLJ7dYpso60n9uUgQD
         TQ+58VSFfLVrUG/jKKjD+9ll6GV7qqBrPXRdCz7wAWrJCznvSUkgxgvlnBr9C8SKhaMP
         AzzA==
X-Forwarded-Encrypted: i=1; AHgh+RoUmi4KTU1Jitu4aUn6wcQfAQF3aVFbEuLH+hQm+/kfmvpd3lwi5CgLp/U2c7cr9lCtAmg/NEWh8rw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTL7pZUJbihReP2sEkcMdbiOQSfhW6gPiJ1lZ82XqYdr7fgheX
	qcaQhOIhHD1vJET/BC4dW+u1s6awg/GGLsWOt2Yw7+6UNSCvWCLsUK9N
X-Gm-Gg: AfdE7ckEG3apJmQ/+1MnYR0KtHu/GbU9SoMj61qduoxkt/cYlKVaIs1c//VHPUfFir9
	gsTUAh3mtJzZVBlBTwY9BgqF8JP6sQDFySuadRibfKPeX+68Gi9xv0YEERWbB2yLqiubBwVwm5T
	h90pCySR34v8xV9j/jfWjt+0X3xahEK8K8rOzwbiqBKZ6TZ4Z97fhq+oSlbdRWD21qLZpFiMAsq
	3caH910YWkMl8fLM8oRXaCH5dlKMmmZferGDRkkf9QxLomsqv5KZtbM5kcgR/VLDIaTWBn21tnA
	WZmb8oa7MB5nVf2v31UGrxAQR4D0Si2umXabQbCAckaMwBcCtV1r04VyD86ZsKOuA4nuGJ0Dfy1
	9CCcs4XnGqKsR3nnzvEQKaBH+DWK9x57R8OupmM00k0lHQzLMby4vT0G0nyc6LQ6MWk/v0OS8Rc
	nQK6IV/uSzbYqDP6wMtgUVx0fxRxW3QOhVf1XTiwkOPVlFOMU0I0yhO/2DadWaeplt1Fhe3Bk5r
	kVUUrhXiHNy1Gh3C4/eTdiAdB6lMg==
X-Received: by 2002:a17:90b:390e:b0:381:270c:4dd1 with SMTP id 98e67ed59e1d1-387572b2e6amr5654864a91.20.1783440720732;
        Tue, 07 Jul 2026 09:12:00 -0700 (PDT)
Received: from [127.0.1.1] (ec2-18-162-112-89.ap-east-1.compute.amazonaws.com. [18.162.112.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfd443sm14712115ad.30.2026.07.07.09.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:11:59 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 08 Jul 2026 00:11:28 +0800
Subject: [PATCH v8 2/3] mm: rename swap.c to folio.c
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ch-swap-series-plus-folio-lru-cleanup-v8-2-e816812698a8@gmail.com>
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
 linux-doc@vger.kernel.org, Jianyue Wu <wujianyue000@gmail.com>, 
 Matthew Wilcox <willy@infradead.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783440691; l=4030;
 i=wujianyue000@gmail.com; s=linux; h=from:subject:message-id;
 bh=yq5j8WJXfLbQ2tXMHiZDbuoRUdTLBMAg9V0gGqHlseI=;
 b=NJEaBL4+AOhOrHGWbF/kPX3jLuw2n2Y4XYsEhov8CvK30sYd6ByGXTw9d7ln8OZGjjU6uHBw0
 tDSqDrQhw+RD9vu5kF0vIsfiHrJg6eaNGmrQIwTn4WQrc3nsiNflpkB
X-Developer-Key: i=wujianyue000@gmail.com; a=ed25519;
 pk=49tqjvkqDVX1TtHEyTCiJGlKLg6SQ4BmgzG+HoHQW6E=

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
index b359ff4e0a1a..c39707e9ce9c 100644
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
 
@@ -17238,7 +17238,6 @@ F:	include/linux/swap.h
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
index c88643e56af7..d2937600cf72 100644
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

