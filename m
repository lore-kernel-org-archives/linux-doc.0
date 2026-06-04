Received: from outbound.baidu.com (mx21.baidu.com [220.181.3.85])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D8E8E3FF8AD;
	Thu,  4 Jun 2026 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.181.3.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571025; cv=none; b=YJsbktxmCONPCi9hINyZd3/8S0iqx9rjih1g6GICGyev74a6cIuaELza6AHaJGQMKMOMcqvQPcz1xLzkvbrhT+bEBoxYVgWWr6ZlRS0RaIx3JNH2ODzxTuTY5xeIN5d+KwFSNePE10bE0jF4Y9Oj8u+CL7mAhOaH92Be0VGxKzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571025; c=relaxed/simple;
	bh=B763B9+unHBop31HaoJAygF33pX5idMg+uQx+hflpHw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pRYoo+g6gslDeT2Ului+HhhBBY6FtMRbm5+g1YWVMJHxyAP30ZO1ZX7gQRugsHKASOOEeleqLD8H17ImhAvCSrE8cTEhaIzHa0uEWiO81GM7XJPWJILImxLafD12fDRhmNxORYokBmk9Px2ymrbpWUFZZsFjj1Dky9Jyev15IZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=N1c+ApV/; arc=none smtp.client-ip=220.181.3.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="N1c+ApV/"
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph
 Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
	<roman.gushchin@linux.dev>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: Li RongQing <lirongqing@baidu.com>, Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v3] mm/mempool: Untangle CONFIG_SLUB_DEBUG_ON abuse and switch to static key
Date: Thu, 4 Jun 2026 19:03:18 +0800
Message-ID: <20260604110318.2089-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjhj-exc4.internal.baidu.com (172.31.3.14) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1780571009;
	bh=w92cZ2nK9Zp3rFwz53YEnnxqHwDnKWU566oE80egZhQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=N1c+ApV/0pkSLxt4fczPqkwaZ4ftA8kmr7FB0uM/rwDL6ilndlCEGjbyKuyVfTel2
	 Tw4OBAPybFtKpvmttiIdbi7v6+7UeSrV5SBmsZX2pawVtEdHng35VLGrjXBKpGMNdI
	 y836GFNAz684i44gvTxKYvVaPONvgcjjENr8LD9RhQx61gTbnir7xt9wFF4BS9J8zx
	 YEDUeqJPOyoJDFyEhHwqH/4aJ0lJxJBLeNMuO8h4gxK3cPKIdg/V+mH4LPoNmblSDJ
	 L40ZOTA3XI/GVZRFJMH9F4+e50p2r2IF1btMO5CYvDr8bL3d/UW6iOmnel8Ebt2g2m
	 s6dP76NwaIZCQ==

From: Li RongQing <lirongqing@baidu.com>

The mempool subsystem historically wrapped its debugging logic inside an
merely defines compile-time defaults for SLUB and caused two flaws:

1. On production kernels where CONFIG_SLUB_DEBUG=y but
   CONFIG_SLUB_DEBUG_ON=n, mempool debugging was completely compiled out
   at compile time.
2. On kernels with CONFIG_SLUB_DEBUG_ON=y, mempool debugging stayed active
   even if a user explicitly disabled slub debugging at boot time.

Clean up this mess by removing the #ifdef and switching to a runtime static
key (mempool_debug_enabled), allowing mempool debugging to be toggled
cleanly via its own boot parameter.

Suggested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Signed-off-by: Li RongQing <lirongqing@baidu.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>
Cc: Christoph Lameter <cl@gentwo.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Usama Arif <usama.arif@linux.dev>
---
Diff with v2: Move the check out of check_element/poison_element 
Diff with v1: Rewrite commit message, change early_param to __setup

 Documentation/admin-guide/kernel-parameters.txt |  5 ++++
 mm/mempool.c                                    | 35 +++++++++++++++++--------
 2 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 642659b..89b5994 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3980,6 +3980,11 @@ Kernel parameters
 			Note that even when enabled, there are a few cases where
 			the feature is not effective.
 
+	mempool_debug	[MM]
+			Enable mempool debugging. This enables element
+			poison checking when freeing elements back to the
+			pool. Useful for debugging mempool corruption.
+
 	memtest=	[KNL,X86,ARM,M68K,PPC,RISCV,EARLY] Enable memtest
 			Format: <integer>
 			default : 0 <disable>
diff --git a/mm/mempool.c b/mm/mempool.c
index db23e0e..dabe05c 100644
--- a/mm/mempool.c
+++ b/mm/mempool.c
@@ -16,11 +16,28 @@
 #include <linux/export.h>
 #include <linux/mempool.h>
 #include <linux/writeback.h>
+#include <linux/static_key.h>
+#include <linux/init.h>
 #include "slab.h"
 
 static DECLARE_FAULT_ATTR(fail_mempool_alloc);
 static DECLARE_FAULT_ATTR(fail_mempool_alloc_bulk);
 
+/*
+ * Debugging support for mempool using static key.
+ *
+ * This allows enabling mempool debug at boot time via:
+ *   mempool_debug
+ */
+static DEFINE_STATIC_KEY_FALSE(mempool_debug_enabled);
+
+static int __init mempool_debug_setup(char *str)
+{
+	static_branch_enable(&mempool_debug_enabled);
+	return 1;
+}
+__setup("mempool_debug", mempool_debug_setup);
+
 static int __init mempool_faul_inject_init(void)
 {
 	int error;
@@ -37,7 +54,6 @@ static int __init mempool_faul_inject_init(void)
 }
 late_initcall(mempool_faul_inject_init);
 
-#ifdef CONFIG_SLUB_DEBUG_ON
 static void poison_error(struct mempool *pool, void *element, size_t size,
 			 size_t byte)
 {
@@ -140,14 +156,6 @@ static void poison_element(struct mempool *pool, void *element)
 #endif
 	}
 }
-#else /* CONFIG_SLUB_DEBUG_ON */
-static inline void check_element(struct mempool *pool, void *element)
-{
-}
-static inline void poison_element(struct mempool *pool, void *element)
-{
-}
-#endif /* CONFIG_SLUB_DEBUG_ON */
 
 static __always_inline bool kasan_poison_element(struct mempool *pool,
 		void *element)
@@ -175,7 +183,10 @@ static void kasan_unpoison_element(struct mempool *pool, void *element)
 static __always_inline void add_element(struct mempool *pool, void *element)
 {
 	BUG_ON(pool->min_nr != 0 && pool->curr_nr >= pool->min_nr);
-	poison_element(pool, element);
+
+	if (static_branch_unlikely(&mempool_debug_enabled))
+		poison_element(pool, element);
+
 	if (kasan_poison_element(pool, element))
 		pool->elements[pool->curr_nr++] = element;
 }
@@ -186,7 +197,9 @@ static void *remove_element(struct mempool *pool)
 
 	BUG_ON(pool->curr_nr < 0);
 	kasan_unpoison_element(pool, element);
-	check_element(pool, element);
+
+	if (static_branch_unlikely(&mempool_debug_enabled))
+		check_element(pool, element);
 	return element;
 }
 
-- 
2.9.4

