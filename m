Received: from outbound.baidu.com (mx15.baidu.com [111.202.115.100])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 022491EEE6;
	Sun, 24 May 2026 03:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.202.115.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779594047; cv=none; b=r5LL6Imlm7XxHMbKC2/GMawOCcZHkBx14lIFi6V1d0KH19DTg2CV3wXqV7m242Rex3yRqDx/7AkMKaTIO+ZF9LA9lmlD/2yQy27jEdhBOGDLvtP+q5EPh5aU03GY0lfo7RKXnpnHCOz3jSbXUUltSgBXJrXKjlHXSN23N6Dow4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779594047; c=relaxed/simple;
	bh=TTMcFEgS05TesDbxW/WAMF5khbNWWESvl8qqMzSMtso=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i6AYfaxh1gCdQC41lk0DWZ5cuGe8ev14U4ElR86HHC9o7THKQHEubAI0PdRJhAjDTwM8XKn1kwJn0kM39ds9MJKvXmhONMiYIOwTgIdSAlwOYVbHDcJjWJPlrt+Ev64SJ2yldM4dEMIg/9antJ0+pXF8WjYeNNY5Jx32eTWXP9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=QE3QCUwG; arc=none smtp.client-ip=111.202.115.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="QE3QCUwG"
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
	<liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux-doc@vger.kernel.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] mm/dmapool: use static key for boot-time debug enablement
Date: Sat, 23 May 2026 23:40:15 -0400
Message-ID: <20260524034015.1830-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjkjy-exc5.internal.baidu.com (172.31.50.49) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1779594034;
	bh=auEp3spqgbRyV4sCde7hRJzHFuKPJdXALEUCtoAvLcE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=QE3QCUwGI/DujzhE8vDKfe9pde7/bghEybQBvcw4mcs/xnn+LyfJaVL8SqWLL7iDA
	 zg6Lzqxx3nCTOFbKqdhiwPmCKrcMQslcYUfFk/lpepWe0bhFwYGosIdqJ+tfdkiXf8
	 oDYvHCVLi3Ajb9g/tGke6RMoCeRowoucTLqYvkFF7zNqYiqoXY18VYPJbV5r7Wld9n
	 oFgVoIKRczD6+Ix9M1w4Zq9W9LwNjaBqlopFnyIo+k9JvIh2RMkvs8l92lVz9a+Yhj
	 ybEo0YAPGiVzhmmqk5Cxo7KevrvwvzwDtLI6wWl0AXV+1pDIRH5Z70YkxhglqiWdWX
	 VzH248hBxeSDQ==

From: Li RongQing <lirongqing@baidu.com>

Replace the #ifdef CONFIG_SLUB_DEBUG_ON conditional compilation with a
static key (dmapool_debug_enabled). This allows enabling dmapool debugging
at boot time via:

    dmapool_debug

Instead of requiring CONFIG_SLUB_DEBUG_ON at compile time. Benefits:

- Debugging can be enabled without rebuilding the kernel
- Uses standard kernel static_key mechanism with minimal overhead

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
 Documentation/admin-guide/kernel-parameters.txt |  5 +++
 mm/dmapool.c                                    | 52 ++++++++++++++-----------
 2 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4d0f545..35ed9dc 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1333,6 +1333,11 @@ Kernel parameters
 
 	dis_ucode_ldr	[X86] Disable the microcode loader.
 
+	dmapool_debug	[MM]
+			Enable DMA pool debugging. This enables memory
+			poisoning and validation for DMA pool allocations.
+			Useful for debugging DMA API misuse.
+
 	dma_debug=off	If the kernel is compiled with DMA_API_DEBUG support,
 			this option disables the debugging code at boot.
 
diff --git a/mm/dmapool.c b/mm/dmapool.c
index 5d8af6e..d26f19c 100644
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
@@ -92,13 +105,15 @@ static ssize_t pools_show(struct device *dev, struct device_attribute *attr, cha
 
 static DEVICE_ATTR_RO(pools);
 
-#ifdef DMAPOOL_DEBUG
 static void pool_check_block(struct dma_pool *pool, struct dma_block *block,
 			     gfp_t mem_flags)
 {
 	u8 *data = (void *)block;
 	int i;
 
+	if (!static_branch_unlikely(&dmapool_debug_enabled))
+		return;
+
 	for (i = sizeof(struct dma_block); i < pool->size; i++) {
 		if (data[i] == POOL_POISON_FREED)
 			continue;
@@ -133,8 +148,14 @@ static struct dma_page *pool_find_page(struct dma_pool *pool, dma_addr_t dma)
 
 static bool pool_block_err(struct dma_pool *pool, void *vaddr, dma_addr_t dma)
 {
-	struct dma_block *block = pool->next_block;
 	struct dma_page *page;
+	struct dma_block *block;
+
+	if (!static_branch_unlikely(&dmapool_debug_enabled)) {
+		if (want_init_on_free())
+			memset(vaddr, 0, pool->size);
+		return false;
+	}
 
 	page = pool_find_page(pool, dma);
 	if (!page) {
@@ -143,6 +164,7 @@ static bool pool_block_err(struct dma_pool *pool, void *vaddr, dma_addr_t dma)
 		return true;
 	}
 
+	block = pool->next_block;
 	while (block) {
 		if (block != vaddr) {
 			block = block->next_block;
@@ -159,25 +181,9 @@ static bool pool_block_err(struct dma_pool *pool, void *vaddr, dma_addr_t dma)
 
 static void pool_init_page(struct dma_pool *pool, struct dma_page *page)
 {
-	memset(page->vaddr, POOL_POISON_FREED, pool->allocation);
-}
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
+	if (static_branch_unlikely(&dmapool_debug_enabled))
+		memset(page->vaddr, POOL_POISON_FREED, pool->allocation);
 }
-#endif
 
 static struct dma_block *pool_block_pop(struct dma_pool *pool)
 {
-- 
2.9.4

