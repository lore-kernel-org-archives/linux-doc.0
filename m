Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559897;
	b=q5cOZ7lSfoX6kgeHKOqd8hdTdeo/ynLnAppfmU+CswpR6a0UdVyL420FMBWRaEE23GN6
	 C8HHY6fxh/Hgn3iZAXLfq4tzt+4CsUibzEJiKnuceUR0iQTIg0N7RF4cyk+uC7asLzmBu
	 5wbOGlrfudQUD/fPEGmUJ9SBOPnjBTLfNoK2BvNQlqOf7CebnJqbtL8/lUFlxr28PlxHr
	 iZ15bk3zRN95rieqGHsvlCmE96p3eHoSBqB+TcsYM5WV4vSwJqnbCN+jYeJhK0lgsMAMd
	 5LoEdjHJGOCxY1jTyofibxy+naFIux+yU246Sf/8SQS0+64OnQSeCOWkP++J/2jng5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=UnWUSSllMVMhg7PktgO/3YoCDA/za9YFOUp/rF6lTqM=;
	b=04vj33Sxk6dO832IOjxRj4L+mC9K0njUoLcRXcyQ55ztWil41FFv8E8Ea4PxvIFz763h
	 4zq/N9KJfAS/aERcYgQBoIAsfBP2rkozwZHfMOJsB8+pq8rCt3OqZLjacXAN9bY70eZWF
	 CxPli1DcSkuQsU46mjNZBZ2/nCYYTc5BJT6TVnfEHFL1xLUdzuwd8WflDMcT+YNfzW2QJ
	 YT/hMy2Ho4NrLewv1v1MS+406CyYlvbdK7TiB+a5flqcvOqhCkY5vV3sfgMas4BAFZ/hc
	 EKzfCHBvbO6UgfrZrGPUXxhI2oS1SQ2WgjIN+H76EcJ91w9ODKLIVg/Uq8ByS2GyimQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=EYH8iN2h;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F492606CB2C
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F492606CB2C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=EYH8iN2h
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed11653a91so6645295ad.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559896; x=1795164696; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UnWUSSllMVMhg7PktgO/3YoCDA/za9YFOUp/rF6lTqM=;
        b=EYH8iN2hkzgAfrtHXuplF1LouLGhOz3dEt5cfTghhvoh7BuMSLeV4tMpXaAl6x62Y1
         MRu3KIfolqdUXq4lDK9GTG+UTI3aI6y0TWtxe4FE8uBDY8D5WKgGTL73DcQfszX1QaiD
         yyr8a85huV/i8IY7fJXfu1cemmwY4fvz2Sc68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559896; x=1795164696;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnWUSSllMVMhg7PktgO/3YoCDA/za9YFOUp/rF6lTqM=;
        b=qMxbHjgpVOV34xwCqjwxogeSDcRmBhe/q4541qXcPtR1oe0Uyb+wH70e53jhyZzNEo
         +nLYcIKz1r/b2Nb6lq1zw0zj61V3GF+htYbiNk8ms6RcC1p0duYtNqi4hwxfFb9kRDJd
         Kxg8Z009Fd1tJ8Q4Te/+9i0mha8dxcp3yiukUfw9GBVW5IYrDEh5slQ87o1XDQW6BLas
         jEvJTt4tKKBzOtippvu7mOoqKkIQTOhNNHqYN8BW/wV55F00DEZpHeMTlUt1twKPh9Dw
         CRcrHgtvRF2S/93f+vOt9f8mSFHQ5EzEXqAND23uXEf1gS20Xq6x805Wztnnbu84ulP/
         nvFA==
X-Forwarded-Encrypted: i=1; AL+hErEJlXgVmt9WvhfCWcMT3ITGJM7aEDj/xy0K9AXnkHGx2dde0icPMkIR2mL9Gj2sAQ6uLTSMhL6goR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wkFyUxbTf+sUI8jGkHWsN3zV3FLpmpxLBr7Tm2A/Ud7i5QI8g
	VH3D2Dk0Spg64J6SRL9n8bXWhd6CoTcLr15bwUUFhlyJRsA3H/CEOtmC6rB01+780jY=
X-Gm-Gg: AYBFou27Ox6lUYrfymcMAZ2VMkc0Y38t2+ZL8nR+tXSLcaamy2OSrugkZ7M3Zq5hiHk
	l9lJkEPL8J6nJus/y8t+q52ZBpJFWyfyLUy5sYRQGkvJKh3FnvMTt4feBhjpj93Sa4gbI3viu9R
	HFKfw1953/EYgEjIAc31vqw6zc7ZI1Zf1UEXK6uPrqBAsF71Y89h/DYJTJSB/ULwQKYh9bDq2M6
	YDQPyjRDp15qDAIUfb01D5qTVY+36IJsE4NSzayuoVBqtMF1YfIShbhvpbAfT3kJzoTren1sctK
	Uu/dfyLtzVOC3tpJIyfJ29h242g9Y+LPNNf7GSVHHLt9Z3bKU/lPDPy4mjYfI4cwBbsv8wJ+POu
	ZmH//lsPyuIaDDKI9dia9jVEzL+Ww/yHyD62WKTG1sFufm8i/7H/NrtCi2KpNr458kpbhv3/3yG
	mRSfjDHCqwWQ4pPNSAT4HH9UtlRTWlI4F13KnLB1ZTVJKoF4kgQdjfwV0i+4BAvj193761yMc95
	8WC7+tNeiK/ccY4+Sg1qMUdbzRNHug//pmsr7IBWIfP0C3dlmBWQm8MIfxDaDK/n2FfSL40Q8IR
	C6zR8lB7Zlu0AJWSJ7pgplhcRee0wyO3RnlAjWfPkgYRvaFwCBnFxfKJlF2pI6kz7OdZqvDKENE
	cNai0lqMYBILmipAMaElHDDupB2Nv+KkEvex4ki9jEZJQupEfC6Cc2Bzrj54zO5ILiwoBk7rc9o
	fMTgGg1JdsP1ijh7Tj5+BaC9wf8TXu/XHnG7Ce0vB+tOXiuyfqWZahHu+Wj94=
X-Received: by 2002:a17:902:e88d:b0:2ed:acb:aa96 with SMTP id d9443c01a7336-2ee0dad0247mr21324925ad.24.1794559895887;
        Fri, 13 Nov 2026 00:51:35 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75c86asm7039685ad.23.2026.11.13.00.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:35 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:32 -0800
Message-ID: <843f0f05bbe3ff36efd22d490e83b0260f8d2f81.1794506262.git.chris@chrisdown.name>
In-Reply-To: <cover.1794506262.git.chris@chrisdown.name>
References: <cover.1794506262.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 3/6] mm/slab: Support disabling SLAB_BUCKETS at boot
To: Vlastimil Babka <vbabka@kernel.org>,
    Harry Yoo <harry@kernel.org>,
    Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>,
    Christoph Lameter <cl@gentwo.org>,
    David Rientjes <rientjes@google.com>,
    Roman Gushchin <roman.gushchin@linux.dev>,
    Kees Cook <kees@kernel.org>,
    Marco Elver <elver@google.com>,
    GONG Ruiqi <gongruiqi@huaweicloud.com>,
    Jonathan Corbet <corbet@lwn.net>,
    linux-mm@kvack.org,
    linux-hardening@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

SLAB_BUCKETS gives allocations with user-controlled size and contents,
like memdup_user() and msg_msg, their own set of kmalloc caches, at the
cost of the memory for those caches. It can only be chosen at build
time, so hosts which want it and hosts which would rather not pay for it
need separate kernels.

Add a slab_buckets= early parameter, enabled by default on kernels built
with CONFIG_SLAB_BUCKETS=y, so that it can be turned off at boot.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  8 ++++++
 mm/Kconfig                                    |  4 +++
 mm/slab_common.c                              | 26 +++++++++++++++----
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..c27bbe205051 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6990,6 +6990,14 @@ Kernel parameters
 			apic=verbose is specified.
 			Example: apic=debug show_lapic=all
 
+	slab_buckets= [MM,EARLY]
+			Format: <bool>
+			Enable or disable separate kmalloc buckets on kernels
+			built with CONFIG_SLAB_BUCKETS=y. When disabled,
+			allocations use regular kmalloc caches. Ignored
+			without that option.
+			Default: on.
+
 	slab_debug[=options[,slabs][;[options[,slabs]]...]]	[MM]
 			Enabling slab_debug allows one to determine the
 			culprit if slab objects become corrupted. Enabling
diff --git a/mm/Kconfig b/mm/Kconfig
index d174537d941e..e602ebabd6e4 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -231,6 +231,10 @@ config SLAB_BUCKETS
 	  of extra pages since the bulk of user-controlled allocations
 	  are relatively long-lived.
 
+	  The separate buckets can be disabled at boot with the
+	  "slab_buckets=0" kernel parameter, in which case these
+	  allocations use the regular kmalloc caches.
+
 	  If unsure, say Y.
 
 config SLUB_STATS
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 01c64ef661e7..272d22f411c2 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -410,6 +410,16 @@ EXPORT_SYMBOL(__kmem_cache_create_args);
 
 static struct kmem_cache *kmem_buckets_cache __ro_after_init;
 
+static bool slab_buckets_enabled __ro_after_init = IS_ENABLED(CONFIG_SLAB_BUCKETS);
+
+static int __init setup_slab_buckets(char *str)
+{
+	if (!IS_ENABLED(CONFIG_SLAB_BUCKETS))
+		return 0;
+	return kstrtobool(str, &slab_buckets_enabled);
+}
+early_param("slab_buckets", setup_slab_buckets);
+
 /**
  * kmem_buckets_create - Create a set of caches that handle dynamic sized
  *			 allocations via kmem_buckets_alloc()
@@ -424,10 +434,12 @@ static struct kmem_cache *kmem_buckets_cache __ro_after_init;
  *
  * Context: Cannot be called within an interrupt, but can be interrupted.
  *
- * Return: a pointer to the cache on success, NULL on failure. When
- * CONFIG_SLAB_BUCKETS is not enabled, ZERO_SIZE_PTR is returned, and
- * subsequent calls to kmem_buckets_alloc() will fall back to kmalloc().
- * (i.e. callers only need to check for NULL on failure.)
+ * Return: a pointer to the cache on success, NULL on failure or when the
+ * separate buckets were disabled with the "slab_buckets=0" boot parameter.
+ * When CONFIG_SLAB_BUCKETS is not enabled, ZERO_SIZE_PTR is returned. In all
+ * of these cases subsequent calls to kmem_buckets_alloc() with the returned
+ * value fall back to kmalloc(), so callers that can live without separate
+ * buckets do not need to check the return value.
  */
 kmem_buckets *kmem_buckets_create(const char *name, slab_flags_t flags,
 				  unsigned int useroffset,
@@ -448,6 +460,10 @@ kmem_buckets *kmem_buckets_create(const char *name, slab_flags_t flags,
 	if (!IS_ENABLED(CONFIG_SLAB_BUCKETS))
 		return ZERO_SIZE_PTR;
 
+	/* NULL makes kmalloc_slab() use the regular kmalloc caches. */
+	if (!slab_buckets_enabled)
+		return NULL;
+
 	if (WARN_ON(!kmem_buckets_cache))
 		return NULL;
 
@@ -1059,7 +1075,7 @@ void __init create_kmalloc_caches(void)
 	/* Kmalloc array is now usable */
 	slab_state = UP;
 
-	if (IS_ENABLED(CONFIG_SLAB_BUCKETS))
+	if (IS_ENABLED(CONFIG_SLAB_BUCKETS) && slab_buckets_enabled)
 		kmem_buckets_cache = kmem_cache_create("kmalloc_buckets",
 						       sizeof(kmem_buckets),
 						       0, SLAB_NO_MERGE, NULL);
-- 
2.56.1

