Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086542;
	b=lFcVSSmY8rdJ86vty0r5VudtQuw4OWoOwd0qOnfETtDTleGB5oUl7S1LEQqfd9vjdO1s
	 n1HHHHMrdwAIXRnH3NFJxI5Jy/L34UYD0/MvHzGJeatcPC6O2R4rjheXgFuFLa3mUKz9w
	 kGSwHRHBdvQfWPAeHaHBmhU9Unp6Lr2iQwcetfba1cDFexg6IKZSW39qLHYWXCtmjVyAC
	 mx17RaeIEJC7sdIUbphnNmfDoFbbdjXl23M1YoPOo0adns0K8Z5f1m/gfi8LWJd0PhwET
	 GNLPzPJTTGAcup8abkjiokO22WTyIc20wWSTLF2me6G/xAvU5Az7rBTynMM7uTGvHzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=HiOeizALgL+htPryz91jPJKAKWQ4nNVAQkQrkPjqDpY=;
	b=3jdP0BdjAwUogQbRO3RLWna5Lacf38G6w8eTHGDs1WVx4FWvY4yC5JApOXkz035nOdRC
	 xMHHRPhHez05Jx/2ZXCaRgazz5zcNGFOzVkGFZrY389sVsyU1/GM9FC6hp5nsXHfcC71D
	 jF0yT97EaVWFLAEGWsQgim+j36biTkAikMa+B4l+vF9EReIQNUPj9W/iaowcW53hUoRMd
	 pUowfbfScMaKhAW6d9KMQuXfv6L6xLOHtmBYUPot+HHoNegbffNF1nkK2LrJVAwaUFovJ
	 YC56oqMpuPtSjMke8+4VhLekNc7oanVNS+MkudGig4iz5CsiwZBi7TJyT8kFARoBrJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=jzfqJxMi;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43893606A31D
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 07:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43893606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=jzfqJxMi
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1987828a91.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 00:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086540; x=1793691340; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HiOeizALgL+htPryz91jPJKAKWQ4nNVAQkQrkPjqDpY=;
        b=jzfqJxMiyzjoTvcRto6vUwLyT33Ld/PNM/3tkguq4PFX+DIggDYGi6V6flUSLkahdj
         6ZmvHrWdlWHCmg8BKTXgS6EQhe4iVzvsfVlyweCJp8pE6sBO9tMUHrMDVTZzAlqH1rVv
         NElchlsi/IxicXGawloh114Wnh52mXfgGhKek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086540; x=1793691340;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HiOeizALgL+htPryz91jPJKAKWQ4nNVAQkQrkPjqDpY=;
        b=O4Xn6ziVzSatIFniRfrISMdKrd+WwhpAC623ak0HuxmTyCveIfRqsUxgpvD2l81/GH
         0m93tXDo8WH0KYyI1W9NPgRZ+ND5Cp0fJe8iJnDVdTioolFcqEODEtaO+QbIAbEpfh9z
         lM+TuS2d0RtUfCekOqgLtNVm2/ZxfsKrl1L1MIXFsCqT5Yc/12GxZtRk+zqAx0hGVhhK
         3uN/hYzeo9WV5IwNmRa2EAxPx17P/8eym7DWPbhkku7UpIq3OnarGGOlZT6HtV5r3PJ2
         SEXjUr239xBlCi9P8Pg6QdwpeiOHznco6Q87bZ2Gi/k/jZ6BRWMWSBtDGTWFduIBVgRL
         q0LA==
X-Forwarded-Encrypted: i=1; AKwUvBwmlcqR90pWJm0ZwGGGODYfmgFwbxNdRLrVyYboAdRn1pQ5j5n0qLu0ii+fL7SiloTGkq1Fh3iYa9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYII4CyrVYasMjpL5Peuf2uEim1NBVT26Mfob3Wmgk828XVstVDM
	MoSy0L292dPiXrvpxnwKKrx56Yd3+zJOIPhXZV4dMzSZ/r+02qSX3OZNH2yBrWZmtB4=
X-Gm-Gg: AYBFou2q6L1t3bnFOrwoYU0WvLUnUq8b04fE/dPfKhuteekN4iya6feRnDWcIfhvArP
	XvTsVZr2fcjKOd4cPnHslvTVfrMM81XjHHOMbDuArKNOMlhd8W03JBiecSSNPA8TER5LslpC91x
	ptAgsRQs0Kdku2OnpyXC2C3PZ6h+C1CG+c/YDIuh7zEndpNMSYYfahPw7/6niQL3ahImsk2yxXF
	GTZYDJvdD1sm9egfTxIuUiH/mTHBfA2waL62rjCGCD1IzTNgjcYkProBBdDko4FlGAWsRCRAlrY
	g0vujabbpzEZ1VLYV2BpEmP4D5V5FH3FgZD1vaWRi8eSJJEPOQ9K1WSA9sSGofwZ8F4uNlGfveM
	HBcp3uhOxysDRhPblKEE12R7sQIAdJw0caPg5mQcbB0vADMFLuxyS1MNPeSQJQ+zoMq2Zj+wHh4
	hHZdKuw8TxZtwswlYeLSS5no8Rlao/x9pix2WknQJHOzt6zmNhJj/VDNIml3ZZYAu/CMqIKMq9g
	kzG5/h37kthjO3T0MY/XZZy1F/DfjNffOj3odfDErNkNnWAs24OmH9A7kJC+j9NYG4bVICZ8SRh
	TOIUWyKq4IeVmoiB07M2ZoNgjyTlgLZtqpgaCWESPoyOyPauxuwajsCeD83tGOFOsgWw2LV44+H
	P5v936EOiK6VDkC/3IT2bufw=
X-Received: by 2002:a17:90b:3b45:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3ade9b2cff5mr8340964a91.1.1793086540437;
        Tue, 27 Oct 2026 00:35:40 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb06c57sm7546810a91.3.2026.10.27.00.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:35:39 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:35:35 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 1/8] mm/slub: Support disabling freelist hardening at boot
Message-ID: <d244124ec287b576470a405c828432df69b4e9cb.1793086056.git.chris@chrisdown.name>
References: <cover.1793086056.git.chris@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793086056.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Add the slab_freelist_hardened= early parameter, enabled by default on
kernels built with CONFIG_SLAB_FREELIST_HARDENED=y.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  7 +++
 mm/Kconfig                                    |  3 ++
 mm/slab.h                                     | 13 +++++
 mm/slub.c                                     | 49 +++++++++++++++----
 scripts/gdb/linux/slab.py                     |  8 ++-
 5 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..ddf2f6fd60be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7014,6 +7014,13 @@ Kernel parameters
 			option which can be undone by adding the
 			"hash_pointers=always" option.
 
+	slab_freelist_hardened= [MM,EARLY]
+			Format: <bool>
+			Enable or disable slab freelist hardening on kernels
+			built with CONFIG_SLAB_FREELIST_HARDENED=y. Ignored
+			without that option.
+			Default: on.
+
 	slab_max_order= [MM]
 			Determines the maximum allowed order for slabs.
 			A high setting may cause OOMs due to memory
diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acb..3ae97fec9946 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -214,6 +214,9 @@ config SLAB_FREELIST_HARDENED
 	  sacrifices to harden the kernel slab allocator against common
 	  freelist exploit methods.
 
+	  The hardening is enabled by default and can be disabled at boot
+	  with "slab_freelist_hardened=0".
+
 config SLAB_BUCKETS
 	bool "Support allocation from separate kmalloc buckets"
 	depends on !SLUB_TINY
diff --git a/mm/slab.h b/mm/slab.h
index e94ac63d10dc..8187ddb2face 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -540,6 +540,19 @@ static inline bool kmem_cache_debug_flags(struct kmem_cache *s, slab_flags_t fla
 	return false;
 }
 
+#ifdef CONFIG_SLAB_FREELIST_HARDENED
+DECLARE_STATIC_KEY_TRUE(slab_freelist_hardened);
+#endif
+
+static inline bool slab_freelist_hardened_enabled(void)
+{
+#ifdef CONFIG_SLAB_FREELIST_HARDENED
+	return static_branch_likely(&slab_freelist_hardened);
+#else
+	return false;
+#endif
+}
+
 #if IS_ENABLED(CONFIG_SLUB_DEBUG) && IS_ENABLED(CONFIG_KUNIT)
 bool slab_in_kunit_test(void);
 #else
diff --git a/mm/slub.c b/mm/slub.c
index 8fbc6bf8ebc5..c82bc626b657 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -214,6 +214,32 @@ DEFINE_STATIC_KEY_FALSE(slub_debug_enabled);
 static DEFINE_STATIC_KEY_FALSE(strict_numa);
 #endif
 
+#ifdef CONFIG_SLAB_FREELIST_HARDENED
+/*
+ * Free pointers stored inside free objects are encoded according to this key,
+ * so it must not change once the first slab has been populated.
+ */
+DEFINE_STATIC_KEY_TRUE_RO(slab_freelist_hardened);
+static bool slab_freelist_hardened_early __initdata = true;
+
+static int __init setup_slab_freelist_hardened(char *str)
+{
+	return kstrtobool(str, &slab_freelist_hardened_early);
+}
+early_param("slab_freelist_hardened", setup_slab_freelist_hardened);
+
+static void __init init_freelist_hardening(void)
+{
+	if (slab_freelist_hardened_early)
+		return;
+
+	static_branch_disable(&slab_freelist_hardened);
+	pr_info("SLUB: freelist hardening disabled\n");
+}
+#else
+static inline void init_freelist_hardening(void) { }
+#endif
+
 #ifdef CONFIG_MEM_ALLOC_PROFILING
 DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
 			slab_obj_ext_has_codetag_key);
@@ -565,10 +591,10 @@ static inline freeptr_t freelist_ptr_encode(const struct kmem_cache *s,
 {
 	unsigned long encoded;
 
-#ifdef CONFIG_SLAB_FREELIST_HARDENED
-	encoded = (unsigned long)ptr ^ s->random ^ swab(ptr_addr);
-#else
 	encoded = (unsigned long)ptr;
+#ifdef CONFIG_SLAB_FREELIST_HARDENED
+	if (slab_freelist_hardened_enabled())
+		encoded ^= s->random ^ swab(ptr_addr);
 #endif
 	return (freeptr_t){.v = encoded};
 }
@@ -578,10 +604,10 @@ static inline void *freelist_ptr_decode(const struct kmem_cache *s,
 {
 	void *decoded;
 
-#ifdef CONFIG_SLAB_FREELIST_HARDENED
-	decoded = (void *)(ptr.v ^ s->random ^ swab(ptr_addr));
-#else
 	decoded = (void *)ptr.v;
+#ifdef CONFIG_SLAB_FREELIST_HARDENED
+	if (slab_freelist_hardened_enabled())
+		decoded = (void *)(ptr.v ^ s->random ^ swab(ptr_addr));
 #endif
 	return decoded;
 }
@@ -601,9 +627,9 @@ static inline void set_freepointer(struct kmem_cache *s, void *object, void *fp)
 {
 	unsigned long freeptr_addr = (unsigned long)object + s->offset;
 
-#ifdef CONFIG_SLAB_FREELIST_HARDENED
-	BUG_ON(object == fp); /* naive detection of double free or corruption */
-#endif
+	/* naive detection of double free or corruption */
+	if (slab_freelist_hardened_enabled())
+		BUG_ON(object == fp);
 
 	freeptr_addr = (unsigned long)kasan_reset_tag((void *)freeptr_addr);
 	*(freeptr_t *)freeptr_addr = freelist_ptr_encode(s, fp, freeptr_addr);
@@ -6730,7 +6756,7 @@ void kmem_cache_free(struct kmem_cache *s, void *x)
 
 	slab = virt_to_slab(x);
 
-	if (IS_ENABLED(CONFIG_SLAB_FREELIST_HARDENED) ||
+	if (slab_freelist_hardened_enabled() ||
 	    kmem_cache_debug_flags(s, SLAB_CONSISTENCY_CHECKS)) {
 
 		/*
@@ -8766,6 +8792,9 @@ void __init kmem_cache_init(void)
 	if (debug_guardpage_minorder())
 		slub_max_order = 0;
 
+	/* Must be settled before any free pointer is written. */
+	init_freelist_hardening();
+
 	/* Inform pointer hashing choice about slub debugging state. */
 	hash_pointers_finalize(__slub_debug_enabled());
 
diff --git a/scripts/gdb/linux/slab.py b/scripts/gdb/linux/slab.py
index ddde25aeca8d..eab6cf44b54b 100644
--- a/scripts/gdb/linux/slab.py
+++ b/scripts/gdb/linux/slab.py
@@ -96,8 +96,14 @@ def swab64(x):
     ((x & 0xff00000000000000) >> 56))
     return result
 
+def freelist_hardened():
+    if not constants.LX_CONFIG_SLAB_FREELIST_HARDENED:
+        return False
+    key = gdb.parse_and_eval("slab_freelist_hardened")
+    return int(key['key']['enabled']['counter']) > 0
+
 def freelist_ptr_decode(cache, ptr, ptr_addr):
-    if constants.LX_CONFIG_SLAB_FREELIST_HARDENED:
+    if freelist_hardened():
         return ptr['v'] ^ cache['random'] ^ swab64(int(ptr_addr))
     else:
         return ptr['v']
-- 
2.54.0

