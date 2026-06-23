Received: from outbound.baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8605873463;
	Tue, 23 Jun 2026 12:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216934; cv=none; b=D7Z+jyxdbKRbMDAdqfUWMusfDKJWWPbZlIzOn5wTxm6XGwW/F/bTZseh2X1gIvCK3VmcISM/ov7SB60egTRIO9en4Tyu0rrOe+tCd2M8dTSEJo25sSlBCRx2vr/fl02sn2uBXRf5C2MOu9QSVZZWIBU5oEf5ELNxKZeLc/7F0U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216934; c=relaxed/simple;
	bh=ND1QIm7GqBz8tZ6UkdQCxgSgz667gRnIYXyLZrX+o2k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sosX54OG+sWT1Fzx0SHv9+QCOctaHsW4y2KSatgTnzpjQhJ7SBQFEi1tJ5uKhJjX92zh6rwzkSI1TvTXg20vftFvn+jiE0yEW8lNku2CSDeoL4jJxjDWM4Q+TB7LUoLGmJ+LF93SJ4wTV6pZevdiMWvoUopk6YXNeFaIi4BGWrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=BsjtnMxl; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="BsjtnMxl"
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
	<liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH][v2] mm/dmapool: Untangle CONFIG_SLUB_DEBUG_ON abuse and switch to static key
Date: Tue, 23 Jun 2026 20:12:45 +0800
Message-ID: <20260623121245.2221-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjhj-exc8.internal.baidu.com (172.31.3.18) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1782216792;
	bh=avYC+UsIp5M7XTGxSLfoEhSS9f43NSp9rS9DnHBspgA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=BsjtnMxlE/F2xauemLHcKSSxfyKnLnOs3x4ES2x9UVx4VSBrZ5nB0QCL23tLNk2/8
	 LUtSfcxZjBv+tK69D+iO+IbIa/YW8rkTaOMaLhzSybGOcdgEN042Pi+IELuDmG5sbD
	 M26/JLfgy5k5HcYOrzVLjH1MALdQ0F7GwkA+Q3sFXpTJFJIyFKlTFWTHCA6CoGfTBY
	 pOBFhs3HRkTYPq3dJTCFBazs4r9fQkSJjvBOAR3H2Xwu6kwhpxcIDBFmNsqVjKnc5Y
	 62JtnOlZJVTyIQrCvGg4REgbJ7IfH7j+hGB22wxbo5rPkEIaMi7gxFqRSzYOfrd847
	 kHr9REoL8qU0A==

From: Li RongQing <lirongqing@baidu.com>

The dmapool subsystem historically wrapped its debugging logic inside an
This approach is fundamentally flawed because CONFIG_SLUB_DEBUG_ON
merely defines compile-time defaults for SLUB and caused two flaws:

On production kernels where CONFIG_SLUB_DEBUG=y but
CONFIG_SLUB_DEBUG_ON=n, dmapool debugging was completely compiled out
at compile time, leaving no way to enable it without rebuilding the
kernel.

On kernels with CONFIG_SLUB_DEBUG_ON=y, dmapool debugging stayed
unconditionally active even if a user explicitly disabled slub debugging
at boot time.

Clean up this mess by removing the #ifdef and switching to a runtime
static key (dmapool_debug_enabled), allowing dmapool debugging to be
toggled cleanly via its own boot parameter: dmapool_debug

Suggested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Signed-off-by: Li RongQing <lirongqing@baidu.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Liam R. Howlett <liam@infradead.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
---
Diff with v1:  Move the static key check out of pool_init_page etc 

 Documentation/admin-guide/kernel-parameters.txt |  5 +++
 mm/dmapool.c                                    | 57 ++++++++++++++-----------
 2 files changed, 38 insertions(+), 24 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 19c9a19..66d853c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1304,6 +1304,11 @@ Kernel parameters
 
 	dis_ucode_ldr	[X86] Disable the microcode loader.
 
+	dmapool_debug	[MM]
+			Enable DMA pool debugging. This enables memory
+			poisoning and validation for DMA pool allocations.
+			Useful for debugging DMA API misuse.
+
 	dma_debug=off	If the kernel is compiled with DMA_API_DEBUG support,
 			this option disables the debugging code at boot.
 
diff --git a/mm/dmapool.c b/mm/dmapool.c
index 5d8af6e..7bd037a 100644
--- a/mm/dmapool.c
+++ b/mm/dmapool.c
@@ -35,10 +35,23 @@
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/wait.h>
+#include <linux/static_key.h>
+#include <linux/init.h>
 
-#ifdef CONFIG_SLUB_DEBUG_ON
-#define DMAPOOL_DEBUG 1
-#endif
+/*
+ * Debugging support for dmapool using static key.
+ *
+ * This allows enabling dmapool debug at boot time via:
+ *   dmapool_debug
+ */
+static DEFINE_STATIC_KEY_FALSE(dmapool_debug_enabled);
+
+static int __init dmapool_debug_setup(char *str)
+{
+	static_branch_enable(&dmapool_debug_enabled);
+	return 1;
+}
+__setup("dmapool_debug", dmapool_debug_setup);
 
 struct dma_block {
 	struct dma_block *next_block;
@@ -92,7 +105,6 @@ static ssize_t pools_show(struct device *dev, struct device_attribute *attr, cha
 
 static DEVICE_ATTR_RO(pools);
 
-#ifdef DMAPOOL_DEBUG
 static void pool_check_block(struct dma_pool *pool, struct dma_block *block,
 			     gfp_t mem_flags)
 {
@@ -161,23 +173,6 @@ static void pool_init_page(struct dma_pool *pool, struct dma_page *page)
 {
 	memset(page->vaddr, POOL_POISON_FREED, pool->allocation);
 }
-#else
-static void pool_check_block(struct dma_pool *pool, struct dma_block *block,
-			     gfp_t mem_flags)
-{
-}
-
-static bool pool_block_err(struct dma_pool *pool, void *vaddr, dma_addr_t dma)
-{
-	if (want_init_on_free())
-		memset(vaddr, 0, pool->size);
-	return false;
-}
-
-static void pool_init_page(struct dma_pool *pool, struct dma_page *page)
-{
-}
-#endif
 
 static struct dma_block *pool_block_pop(struct dma_pool *pool)
 {
@@ -305,7 +300,9 @@ static void pool_initialise_page(struct dma_pool *pool, struct dma_page *page)
 	unsigned int next_boundary = pool->boundary, offset = 0;
 	struct dma_block *block, *first = NULL, *last = NULL;
 
-	pool_init_page(pool, page);
+	if (static_branch_unlikely(&dmapool_debug_enabled))
+		pool_init_page(pool, page);
+
 	while (offset + pool->size <= pool->allocation) {
 		if (offset + pool->size > next_boundary) {
 			offset = next_boundary;
@@ -433,7 +430,10 @@ void *dma_pool_alloc(struct dma_pool *pool, gfp_t mem_flags,
 	spin_unlock_irqrestore(&pool->lock, flags);
 
 	*handle = block->dma;
-	pool_check_block(pool, block, mem_flags);
+
+	if (static_branch_unlikely(&dmapool_debug_enabled))
+		pool_check_block(pool, block, mem_flags);
+
 	if (want_init_on_alloc(mem_flags))
 		memset(block, 0, pool->size);
 
@@ -454,9 +454,18 @@ void dma_pool_free(struct dma_pool *pool, void *vaddr, dma_addr_t dma)
 {
 	struct dma_block *block = vaddr;
 	unsigned long flags;
+	bool err = false;
 
 	spin_lock_irqsave(&pool->lock, flags);
-	if (!pool_block_err(pool, vaddr, dma)) {
+
+	if (static_branch_unlikely(&dmapool_debug_enabled))
+		err = pool_block_err(pool, vaddr, dma);
+	else {
+		if (want_init_on_free())
+			memset(vaddr, 0, pool->size);
+	}
+
+	if (!err) {
 		pool_block_push(pool, block, dma);
 		pool->nr_active--;
 	}
-- 
2.9.4

