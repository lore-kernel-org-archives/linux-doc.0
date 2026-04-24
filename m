Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7733DBD55;
	Fri, 24 Apr 2026 14:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777039292; cv=none; b=Hci/wqhvMRY5Z1UXLz+U9QuF0SYiD4MA/SHNmZXfSyKYHOj8I5ExD/mD0jOcyy++dv111SDXtd/14xNwUzf0ap/0ol/yesfb0GcuTevDo+aFeIDfkeYkjWo6E9V/Y8TxjTXe9pOEmKHZJTCX2UMttZ3CjeyLwLXiUBPvZsMlcek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777039292; c=relaxed/simple;
	bh=ArDqKUGEZwiJhWfrZPmHU41Dcmah9WrzPqg0XPgBvRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mm8DSY+uCvWrH64HOLpctsbBAgPNzJ+YIvUoFeIrH5Nm3Q4pctqWDoqP8QYvwgYP6uXQfTno588LeYbDUjRNL8Oi+6s394OZ2I590+WyMRwBb3QmGnFJqYkCuhE0/ARgVeDT5Zr63FdlQVF4oNcfiBYCzVaEPqpULwnRGRVs+kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaG0oB7y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaG0oB7y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E47CC19425;
	Fri, 24 Apr 2026 14:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777039292;
	bh=ArDqKUGEZwiJhWfrZPmHU41Dcmah9WrzPqg0XPgBvRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CaG0oB7yE/8MMkLVNptpROnS8QY0hY7zRDigwMad2xHJ4WdtE7xWL9Qy53kDSK4I+
	 vW8Zc/EkjFXCWK59rgGUEcHesVVv+GWXB6weOest7y+gCIf+ljKWTNcOkHW09GAHAD
	 fPcJPxYVJ9g7qDykJeX/fVPlBS11BRHXyzJGxNBBAO9ClIyUOFu0u+o/BY5UItOpfy
	 KOD7k7XOZkMkMqnnwxHCOmjXFqoXjCSEN0X2HwAP+tGW8z1DiPGx81VY8JjyttZGmQ
	 XDrPZR9EsX6fJwfl2Nwy+pawBhFinnvEg+H6Lmgy8aIrTEOqvEvExqFwDHdFpGqGjq
	 BCeAktUcwFnWg==
From: Sasha Levin <sashal@kernel.org>
To: akpm@linux-foundation.org,
	david@kernel.org,
	corbet@lwn.net
Cc: ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@nvidia.com>,
	Sanif Veeras <sveeras@nvidia.com>,
	"Claude:claude-opus-4-7" <noreply@anthropic.com>
Subject: [RFC 5/7] mm/page_alloc: integrate page consistency hooks
Date: Fri, 24 Apr 2026 10:00:54 -0400
Message-ID: <20260424140056.2094777-6-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424140056.2094777-1-sashal@kernel.org>
References: <20260424140056.2094777-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sasha Levin <sashal@nvidia.com>

Wire up the page consistency checker with the page allocator by adding
tracking hooks in the allocation and free paths. The hooks follow the
same pattern already established by page_owner and page_table_check,
inserting calls at the points where page state transitions occur.

In post_alloc_hook(), a call to page_consistency_alloc() is added after
the page_table_check_alloc() call. This records the allocation in both
bitmaps, setting the primary bit and clearing the secondary bit for each
page in the allocation.

In __free_pages_prepare(), calls to page_consistency_free() are added
in both the early-return path for the hwpoison check and the normal
exit path. These calls clear the primary bitmap and set the secondary
bitmap, maintaining the complementary relationship that enables
corruption detection. The free hook lives in the internal
__free_pages_prepare() rather than its free_pages_prepare() wrapper so
that every free path (including the bulk folio free path) is observed
exactly once.

Initialization is hooked into mm_core_init() immediately before
memblock_free_all(), while memblock is still active so it can use
memblock_alloc() for the bitmaps, and after kho_memory_init() so that
any memory handed back by a kexec-handover source has already been
accounted.

Based-on-patch-by: Sanif Veeras <sveeras@nvidia.com>
Assisted-by: Claude:claude-opus-4-7 <noreply@anthropic.com>
Signed-off-by: Sasha Levin <sashal@nvidia.com>
---
 mm/mm_init.c    | 9 +++++++++
 mm/page_alloc.c | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index df34797691bd..4d9495fb8789 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -22,6 +22,7 @@
 #include <linux/kmemleak.h>
 #include <linux/kfence.h>
 #include <linux/page_ext.h>
+#include <linux/page_consistency.h>
 #include <linux/pti.h>
 #include <linux/pgtable.h>
 #include <linux/stackdepot.h>
@@ -2717,6 +2718,14 @@ void __init mm_core_init(void)
 	 */
 	kho_memory_init();
 
+	/*
+	 * page_consistency_init() must run while memblock is active so it
+	 * can use memblock_alloc() for the bitmaps.  Boot-time reserved pages
+	 * may be freed before SYSTEM_RUNNING without ever having been allocated
+	 * through the buddy allocator, so the checker suppresses double-free
+	 * reports until boot has completed.
+	 */
+	page_consistency_init();
 	memblock_free_all();
 	mem_init();
 	kmem_cache_init();
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2d4b6f1a554e..ae8f619875e9 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -46,6 +46,7 @@
 #include <linux/sched/mm.h>
 #include <linux/page_owner.h>
 #include <linux/page_table_check.h>
+#include <linux/page_consistency.h>
 #include <linux/memcontrol.h>
 #include <linux/ftrace.h>
 #include <linux/lockdep.h>
@@ -1374,6 +1375,7 @@ __always_inline bool __free_pages_prepare(struct page *page,
 		/* Do not let hwpoison pages hit pcplists/buddy */
 		reset_page_owner(page, order);
 		page_table_check_free(page, order);
+		page_consistency_free(page, order);
 		pgalloc_tag_sub(page, 1 << order);
 
 		/*
@@ -1432,6 +1434,7 @@ __always_inline bool __free_pages_prepare(struct page *page,
 	page->private = 0;
 	reset_page_owner(page, order);
 	page_table_check_free(page, order);
+	page_consistency_free(page, order);
 	pgalloc_tag_sub(page, 1 << order);
 
 	if (!PageHighMem(page) && !(fpi_flags & FPI_TRYLOCK)) {
@@ -1888,6 +1891,7 @@ inline void post_alloc_hook(struct page *page, unsigned int order,
 
 	set_page_owner(page, order, gfp_flags);
 	page_table_check_alloc(page, order);
+	page_consistency_alloc(page, order);
 	pgalloc_tag_add(page, current, 1 << order);
 }
 
-- 
2.53.0

