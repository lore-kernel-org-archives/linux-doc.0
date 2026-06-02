Received: from outbound.baidu.com (mx21.baidu.com [220.181.3.85])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 8E7412E7F39;
	Tue,  2 Jun 2026 06:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.181.3.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780381324; cv=none; b=mnmTWdZRskqtUvVchUN2+WJxlSp+SVIl48kjsqkzTc2T8ogZNKOqucfGbHgtdW8K/ZgfvzOeLTt1UKVeMiIrbtSX9M3cXit8ngX8RSfVtx5rfP26+2y7ohpWWVuDCR+5/UTxEW+M+fFtR9EGXjVdMAMalCstRCVtzrQoWt/7hss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780381324; c=relaxed/simple;
	bh=UCampyD53bPnSyM0B6ONAmrFee8hi5bD4X1UJZOEVys=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HrnGtrcoVmQsLidLEqQHZRBWQg/4QCHt3i/NNFCXzxcyRSF4T+2QC9cab2FPudw91/dFuKUltF6bu2+C77wZkyTbiKDBoriKS/SQH1VR0mPSBcIYW+pXWPXTpk1U/80xq3v10yWyV+kAXqvHHXJu/9CN4Evdi8CFxznmqnuYnHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=eZoTWzSY; arc=none smtp.client-ip=220.181.3.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="eZoTWzSY"
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
Subject: [PATCH][v2] mm/mempool: Untangle CONFIG_SLUB_DEBUG_ON abuse and switch to static key
Date: Tue, 2 Jun 2026 02:21:42 -0400
Message-ID: <20260602062142.1790-1-lirongqing@baidu.com>
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
	s=selector1; t=1780381319;
	bh=DaOgBQX2Bprj5SEr7V1aHONGUCzeW+2n3CTATOhVeeA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=eZoTWzSYLb0DMIw8U5wsd4eZpq9YxToIlc0hZA/sMZatsWnIV5sapyswkv7hG3arn
	 +klF8Rl+o6hFfntvAKk8oPhqJ4FaO04rxho0mqh0Sk2kr/HnTsK2znTYZR3EsSw+Qg
	 J9ZvXqJ0EaVNrXYDMJl98rHy52gBKugjyc008ZJ3THMBwywDZgU/uY83TJsua+/6a+
	 X0ICdDT4NKffrCQig2hy27NXdHxhU//Two5ArjWrhVmqMElcP/XfiabpnoxsCVGIJ5
	 R+18PjaAyW1yGyg/IeoX1y/RQ/F8e1rW8bIrV3uY7nkN1972gXniRTDXZpNEv+9BtF
	 O88kkGWA6lkgg==

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
Diff with v1:
	Rewrite commit message, change early_param to __setup

 Documentation/admin-guide/kernel-parameters.txt |  5 ++++
 mm/mempool.c                                    | 32 ++++++++++++++++++-------
 2 files changed, 28 insertions(+), 9 deletions(-)

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
index db23e0e..71e4b54 100644
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

