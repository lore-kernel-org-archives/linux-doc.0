Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2B03DBD4F;
	Fri, 24 Apr 2026 14:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777039287; cv=none; b=h4nS3OmwzcxBjnAW2slg0QcMhe6vL6cGBXjhLtK0P4H4WLjhp57A0feXFuooBJ6JuyS75AXuKwYVlw7+5ksDX4jN+SOL95uvG+Afi4xH5YXWdyjYnHpKDyD6+tJvTI9LEzrFeG8pWgbLCvg3wYttTuHYbiOl3NQ04Yr1vbzYBMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777039287; c=relaxed/simple;
	bh=OMk8G83SwVj9TZi6pSd7RKvp6NWeeiZOhOo5iK9u9hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcWNwikIx1QhSeni1TJYwb4YUt3Xu6eEIKmM2hDILQ6slLtd89edS0DwF0BJTKWUE44XNM4gaFCs5G/0DO8jzzMAzgU9u3XmmBTsHBJuk7l/m7MMAuR2lu0X/3MuHS/MbhKikHd5CG37gFN+vI/5sAyUeBsa/OEz6ob0pp4QstU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3/mycHd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3/mycHd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D1CC2BCB5;
	Fri, 24 Apr 2026 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777039286;
	bh=OMk8G83SwVj9TZi6pSd7RKvp6NWeeiZOhOo5iK9u9hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g3/mycHdG1w/wHSq1REskac8ra3x8JGBb1lHFVdN7P1hhPz4Y0FiwTGP9U5OFZxIi
	 dYhnt5nfG9T3kn2yS21djgpX2Ka6gViUNDTCqV8LO7TWnxnfM9q4jlg2LxGQNcPlvK
	 Ib2XS1nIVnxGi2NIi9+0gs3M7ijhNPin3sYOoANBE2DQOul5r2n5IaV1r+N0vcLiXr
	 nK3vUQ/xjUNY5n7Kn4nTCwnXXNTci6GmJREghaIm2+UQYMn/YZOo5a/GD5qiOvMTLh
	 TGcGpTLT/bfxLUj6ha8qaheYrBhIZg9m7mMYIpD2urYuIaLP8Hk4kpelirNJPO0Tsx
	 kGLemIdZExQEw==
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
Subject: [RFC 2/7] mm: add page consistency checker header
Date: Fri, 24 Apr 2026 10:00:51 -0400
Message-ID: <20260424140056.2094777-3-sashal@kernel.org>
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

Define the interface for CONFIG_DEBUG_PAGE_CONSISTENCY. The API mirrors
the pattern used by page_table_check: inline wrapper functions check a
static key before calling the out-of-line tracking implementation, so
that callers in the allocator hot path only pay for a predicted-not-taken
branch when the feature is built in but not active.

The header is kept separate from the implementation so the hooks in
page_alloc.c can be added without pulling in implementation details.

Based-on-patch-by: Sanif Veeras <sveeras@nvidia.com>
Assisted-by: Claude:claude-opus-4-7 <noreply@anthropic.com>
Signed-off-by: Sasha Levin <sashal@nvidia.com>
---
 include/linux/page_consistency.h | 84 ++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 include/linux/page_consistency.h

diff --git a/include/linux/page_consistency.h b/include/linux/page_consistency.h
new file mode 100644
index 000000000000..f335fa3d6c5d
--- /dev/null
+++ b/include/linux/page_consistency.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Dual-bitmap page consistency checking
+ *
+ * Provides corruption detection for page allocations using complementary
+ * bitmaps where the invariant (primary == ~secondary) must hold.
+ *
+ * Based on NVIDIA safety research.
+ */
+#ifndef _LINUX_PAGE_CONSISTENCY_H
+#define _LINUX_PAGE_CONSISTENCY_H
+
+#include <linux/types.h>
+#include <linux/mm_types.h>
+
+/* Return codes for page consistency checking */
+enum page_consistency_result {
+	PAGE_CONSISTENCY_OK = 0,
+	PAGE_CONSISTENCY_MISMATCH,
+	PAGE_CONSISTENCY_NOT_TRACKED,
+};
+
+#ifdef CONFIG_DEBUG_PAGE_CONSISTENCY
+
+#include <linux/jump_label.h>
+DECLARE_STATIC_KEY_FALSE(page_consistency_enabled);
+
+/* Initialization - called during mm_core_init() */
+void __init page_consistency_init(void);
+
+/* Core tracking functions */
+void __page_consistency_alloc(struct page *page, unsigned int order);
+void __page_consistency_free(struct page *page, unsigned int order);
+
+/* Validation functions */
+enum page_consistency_result page_consistency_check_page(struct page *page);
+enum page_consistency_result page_consistency_validate_all(void);
+
+/**
+ * page_consistency_alloc - Track page allocation
+ * @page: Allocated page
+ * @order: Allocation order
+ *
+ * Called from post_alloc_hook() to track page allocations.
+ * The static key avoids the out-of-line tracking call until initialization.
+ */
+static inline void page_consistency_alloc(struct page *page, unsigned int order)
+{
+	if (static_branch_unlikely(&page_consistency_enabled))
+		__page_consistency_alloc(page, order);
+}
+
+/**
+ * page_consistency_free - Track page free
+ * @page: Page being freed
+ * @order: Free order
+ *
+ * Called from free_pages_prepare() to track page frees.
+ * The static key avoids the out-of-line tracking call until initialization.
+ */
+static inline void page_consistency_free(struct page *page, unsigned int order)
+{
+	if (static_branch_unlikely(&page_consistency_enabled))
+		__page_consistency_free(page, order);
+}
+
+#else /* !CONFIG_DEBUG_PAGE_CONSISTENCY */
+
+static inline void __init page_consistency_init(void) {}
+static inline void page_consistency_alloc(struct page *page, unsigned int order) {}
+static inline void page_consistency_free(struct page *page, unsigned int order) {}
+
+static inline enum page_consistency_result page_consistency_check_page(struct page *page)
+{
+	return PAGE_CONSISTENCY_OK;
+}
+
+static inline enum page_consistency_result page_consistency_validate_all(void)
+{
+	return PAGE_CONSISTENCY_OK;
+}
+
+#endif /* CONFIG_DEBUG_PAGE_CONSISTENCY */
+#endif /* _LINUX_PAGE_CONSISTENCY_H */
-- 
2.53.0

