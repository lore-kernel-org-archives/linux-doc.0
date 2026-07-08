Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142BD3AC0FE
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 11:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510648; cv=none; b=PVWTUZsy6vjdHZid/cfQchVBAfdNTkovIGV8gAk8xob/ATQNeQtFywcs050mbGwaZM6D1bWG6b//t+y4NiVN4HBsBy8MmFzpfIdjoaUQbWNly7mMNoR2rlkp9o0pFIdiyVuqVElwzgoyKT3khFnja5jiSG6XiIDvxD/z3gZ1aaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510648; c=relaxed/simple;
	bh=K79N77ymBE96cKlxeMxOGPW8IV82mvdJP8Cyahphp3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FrbiOQcoDR1eriPiyZRURgzB2+nAiTiCmRbdO2xrS6oNcMyK7lOLSv2CHdHqJgWVxxtVmKRhu6YHiprIgjogedj3fgJ5pEqg/eOK11e0tR6tSy27UcmWvwnjfQDWUk5sN+UvzFpdJAMqKVmKXPwGGjOqyLsRZA03Xl8GWe/jxgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPmuDQ8d; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPmuDQ8d"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84794e800f4so352574b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 04:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783510646; x=1784115446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fz/wglSNwwdj3pp8/wV9b1HdpJVBsVZyoCTNB/KAx7Q=;
        b=bPmuDQ8dzN6vaLtaVaN0v1B9yvQldLMMBm/uIba8DJVHYPnVE664McZz5PBXVaGHGm
         cI6cLl3WcFFB4WIoOtOGnRu6QrR40y6awutZbOXpvMvbRyLgCDyQUC86rryVrC2jZdLt
         3VetSBet7EFY1+EroDlpoSW9GTIduTpyYaQmxSb+hkc5HpZtZrkM5A6XStZuJO8xswX+
         nOSL+j28Ah67eF7xw2dwFOJsSqujFboKFZHV1yILUB9i/yn0M891k+bwEl0a0b/3LV9i
         2hA7bBl/uTVevg4zx+VRzztx/5NQb94slJ3DOD1GM9rMjc1E88HEC5jPLTryfeD0LlDH
         a/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510646; x=1784115446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fz/wglSNwwdj3pp8/wV9b1HdpJVBsVZyoCTNB/KAx7Q=;
        b=jxjJW110P31mp1uddxSmoJo+cb9H8VM3xv68Gc7YabMz1GjQ6+qHQtnvIEsBKwHkGG
         fzzAPaWpkCGoq09t8gEi9Rp+b9xqDIArw5OQNMJpSN3gDYOqzDj1Hsx4QYwoJXj+T12q
         SGsYpHgRVjzwDNqnESHiaxxqPvafHtiM/GrJHUK+imQrzbot1gAU35YyU9cZ7LQQYDE+
         tN1I0POGGdYOnRb39UA/s9/bdi7lg16fUYXEmK3R3ObwY1fM6Eqqm8Kfpdt1be2r1Yd2
         +LqyXAe0bK+jOyVuhvr7ey8OI8dILo/5dsfHD9zc6hqJIv1ErjY8HgqPfdLfXFO/Luqe
         dxew==
X-Forwarded-Encrypted: i=1; AHgh+RrXurAQ9fnxvEX9DBigQTHnmTyk7HNYLI7z+wSQU3dcHM5LLwsZf7sA/Ih7za50zBnafQ12YyDdAlY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy07OFJcvrz5pnapowBRChEoq9D+zKqhi3slfMHwbfs4NKYmnm+
	CNRrqKtkFxUr3gzd1W0/ISYUK1IdJWK63AwkoyGJqotRaSJjunIIgNlt
X-Gm-Gg: AfdE7cmlrjIZxovUXFIopxdwN3N7mbzxVHF7guT1jWMoNGEtWppqBTlVYOBp4Zw35rS
	P4EAM43Hmbds9pC0VlZVh7zw1zaz0v7+WabdI+kkOR1oZhhDEy0/In3jA7iVJye5t6jcOQvBZ/D
	VAOR4xtozxJKp7kUKfAYuwUMh9mAvn3tnFYmfpio5dYQiuj+kK6amgBRU3d8OQF10Vu8JiMiY36
	OFZb2VPIKhSHU31GB0tRA2kUU3gMgxmCSYUyaVoT3o6TxUtbEbWu+rfNkY8jsKx91QeB1DshHpU
	/YLDlRk8/0J7rQN5cjLmOaSSbyL+8+pkdq2Q5lKoCbrCEYr7zmDd7Ks4/1ibV4lEyaGCVe8SYjA
	F2C0Y1J0RLHWIRSKYLLwjZJtXoxExQB47ePkzQtjoSwvOxFqAqyhjGBgme/kwg9ghBRsc+oSq4G
	ReYxYT6rIBA54bdWAraH4mtoaPZw2x1oB+bOCXpnnh/pXW+ZT+D7Dgoz6u9d45A9VkEVkw+g==
X-Received: by 2002:a05:6a00:6f0d:b0:848:438d:3665 with SMTP id d2e1a72fcca58-848438d3bb1mr1976271b3a.41.1783510646291;
        Wed, 08 Jul 2026 04:37:26 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([203.18.50.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3a2e42bsm2260788a12.30.2026.07.08.04.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:37:25 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 08 Jul 2026 19:35:44 +0800
Subject: [PATCH v9 2/3] mm: rename swap.c to folio.c
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ch-swap-series-plus-folio-lru-cleanup-v9-2-2bc72b4f8730@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1783510625; l=4030;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=K79N77ymBE96cKlxeMxOGPW8IV82mvdJP8Cyahphp3g=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBu1Q6XYzv2szD4iwDNl+m4CtzNdIuGsnX3rdmoMwfThCclJc82d8b7MtaTqgG70f2w8SMv1ECd
 ZHhFCYHFJ2As=
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
index d19822d574fd..c3e535ca4bef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17085,7 +17085,7 @@ F:	Documentation/admin-guide/mm/multigen_lru.rst
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

