Received: from outbound.baidu.com (mx15.baidu.com [111.202.115.100])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 87D783EF0C8;
	Wed, 27 May 2026 11:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.202.115.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880442; cv=none; b=utvxHajUNEG1GZLPYKp4s3mJ8xILnU8avaIXnq11jdBHHgRMOfzbznzk25OwGivC3Ca+774vCV8HqEtDmzuQ5muUiW+udGWJA9Wm6nb0/2dRnn8FbnA3i2n1N/ej4yS5RxVQZUH79N3ap8Rycm5+5iXlNwqF1mSoa7meEeEnE5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880442; c=relaxed/simple;
	bh=+ntxAJU7CWRpk8Gp0Yye7sfGmyHqt/UlncsFZhNiTjU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jfp278BmtSU99E7e4LDkD1d6o7DTlCIeYn1Eq3KcRSXu2OULOaeExBoNPYeRx6JKHqiOeSbNvwh5qnt2hT0dPuiEMV4qpYHBc0UzqpUHcEwasdiLqzeBehyUOhVOR0v1zsukJJbAb4OMJaM6EQcAvHM1FBUx8S3hEA3zU/kBvuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=TyLME1Kj; arc=none smtp.client-ip=111.202.115.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="TyLME1Kj"
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph
 Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
	<roman.gushchin@linux.dev>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] mm/mempool: use static key for boot-time debug enablement
Date: Wed, 27 May 2026 06:46:34 -0400
Message-ID: <20260527104634.2434-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjkjy-exc2.internal.baidu.com (172.31.50.46) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1779878807;
	bh=ttl9/NsuNFlHuotnHMTPmnULmKzmEYt9adzvKWukcR0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=TyLME1KjYS++De+RoUjtgkgAom/PrnGL6kHNs/qG7TSOYQGhvawAa61Vjh0bjVUIE
	 huti1SANeJ6mGP0bLz6xa9XZ/jayzJTdGqFQ/QJDYoTy11V7oBnmO7QSKZzZo3iQLX
	 iCkmgzLUs8JECZ8tCYBEpYXat0AjJs2hC2h4C4vGMuznNIx7zlBAK0IVhDJbi3p9ml
	 jysxW7uM6PtupMfVOGMj3+QYhptm6/NgRfHt96rB/ZETiSJjE8KYrCgu1EpriDxPWp
	 tkmXN3vOXD5YYNz/2Bk6DwZRdJaL9Mg29Xn/ok+KDKoSr2iin0YKyIydiJrQO2aYgN
	 2mUQmLOPSO+iw==

From: Li RongQing <lirongqing@baidu.com>

Replace the #ifdef CONFIG_SLUB_DEBUG_ON conditional compilation with a
static key (mempool_debug_enabled). This allows enabling mempool debugging
at boot time via:

    mempool_debug

Instead of requiring CONFIG_SLUB_DEBUG_ON at compile time. Benefits:

- Debugging can be enabled without rebuilding the kernel
- Uses standard kernel static_key mechanism with minimal overhead

Suggested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Signed-off-by: Li RongQing <lirongqing@baidu.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>
Cc: Christoph Lameter <cl@gentwo.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
---
 Documentation/admin-guide/kernel-parameters.txt |  5 ++++
 mm/mempool.c                                    | 32 ++++++++++++++++++-------
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 35ed9dc..5a070e6 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3998,6 +3998,11 @@ Kernel parameters
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
index db23e0e..4f429a1 100644
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
+	return 0;
+}
+early_param("mempool_debug", mempool_debug_setup);
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
@@ -73,6 +89,9 @@ static void __check_element(struct mempool *pool, void *element, size_t size)
 
 static void check_element(struct mempool *pool, void *element)
 {
+	if (!static_branch_unlikely(&mempool_debug_enabled))
+		return;
+
 	/* Skip checking: KASAN might save its metadata in the element. */
 	if (kasan_enabled())
 		return;
@@ -112,6 +131,9 @@ static void __poison_element(void *element, size_t size)
 
 static void poison_element(struct mempool *pool, void *element)
 {
+	if (!static_branch_unlikely(&mempool_debug_enabled))
+		return;
+
 	/* Skip poisoning: KASAN might save its metadata in the element. */
 	if (kasan_enabled())
 		return;
@@ -140,14 +162,6 @@ static void poison_element(struct mempool *pool, void *element)
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
-- 
2.9.4

