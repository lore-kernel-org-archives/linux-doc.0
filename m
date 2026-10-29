Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254112;
	b=mOgUDIfu0Ts8xTvmMGeVXhXB0b1+78uNRJTXqI5fjLnfmlGZuOrteV/ARNZCt4jjayYS
	 xSL5y0ceKJdAIRHFdQNWiuxXoP4ZfcxLsM2UcDyrrLi3PpWmlaH02z/I1iU1Rh3DodQCu
	 6h8v8fjLRxxLXYIbg/IkzzJ6lLpPme5/ETjn5z92WTZt+YhKAnK+Lu0AX5cGJXRDVr9VN
	 Dr8ToRfi20pUPl2s2RApbFvP6iYC1QUc/rZ8Rdc0TBscotssyyjdN8xKvD5AgHexe5q5M
	 5vKdgr/FXWQQwuMtxRlmUocrteC0agotLF+SVcVLLT6qR3a7JmzOvDprfBsad44Rraw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=AIl6fbfmDXkFv/6QB6yZBSNCnJVQUdZCsXNNMxV+Aus=;
	b=lES3zmT96JGmLrTCf2gr6wfMO5d6XDQERstKuITljTFDs6/vO9bSCr+NoumlMJQ2aBzM
	 tP5lqTImrt7IDIx+lMAJtpk7f1i/euzn1w36ony+ef07aG3Vg+nZS0JjJzrFkHbi1BqDq
	 8XkjKvDvajEzx+6cnh9+X5o2EkSU9dRmpS4JEuSeCv/YMFwZJCHuWbDfaJfcZvnK4XBU7
	 q2ODvsQO7li2oOyae6rcx1aZk2dhBeRT3Ij9Xmyai0zF848rmYiEMKoiB4LSwqL4v+Mb+
	 JnE2YAOOxgdH8VeHsUB6kto1OGRBJq6Q4VNQdN3GwhK+sW9XX51jhSg8ysDpY4xLr3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=YdQeHm9m;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09AB606A31A
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 06:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=YdQeHm9m
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1548327a91.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 23:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793254111; x=1793858911; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AIl6fbfmDXkFv/6QB6yZBSNCnJVQUdZCsXNNMxV+Aus=;
        b=YdQeHm9mGxX1Lunxk0PVrEIAEiqhwvc/LgxAQL4FsXznfijWqULjLngpg7PpOmJ26a
         vy3l3hX0sR0eGGKoPEsCS6jmcGzhzgNesvhNiTI7uFwhIVDgxM8MQEZhY+aiwh30uJB/
         Z7k2pE+PvxvHyPckRRzfs+PHvw+PDNvhxhYn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254111; x=1793858911;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIl6fbfmDXkFv/6QB6yZBSNCnJVQUdZCsXNNMxV+Aus=;
        b=QIK2WYIrWUCBH2dwcg0FT3WLPyd7GQS98LF7vmKB2VX0wGp32x0MH0SofiZZIwLnGr
         8eRIuVy8K+boTj8OaGk/cXxQDo5Ij0GlCMQKfAiqQFTXljcSxqLkSkqUeqm+jAR1B/2i
         M0cHB+Rcn6QDtfynLBD07NLFeDdbgEDxvuFJCnk/GOI7xNRh/dAQ+7P7mH6InviyDgsy
         +HmHm/ymOJOQ7yqEz09Q0BULLWJbY62Z/zM9W7XIJ9MFKuTFAUFv1x5219A4kAuQLg6K
         dYiCOFvdV8mbC2VkTmjyBoVA//3II2PIrhRax7jHZXbdpJTzsllOhcMXYJF5S9qYEPXe
         +8Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxZvYDW2hXVSw+7w++BRhgzEFouMt433Cx+9zmj2Y4ephnlaICGnO4ckftFB5/9cfpfP3NRWA9Pk7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ769955PnuE93VMAP6xYKO+TOvyCw22YHJa5GmfoB71fldLJ+
	gwdBSMtzntbvBACt2x34dvNOQfNEmjZQfZydt4FQ9xwW38qjkKYMF/X376cQlIbPalc=
X-Gm-Gg: AYBFou3c2Le5TdVvbSzkELUeGoFyOIVcX4ky4DFxAvkO+Tvg5j28zcby4M47xdWWshd
	bnnkvnmL1Tq9Od5C7sHZZQEsOPcgDz8AN9P5ZklZnTcy08EZDU/8avTC6HROTmDyvZTS3roNmD/
	O/Zi8/SBkgycciMbr1NTASkVEF/nU5UAIKgCN3Lu/fgzRX/AsCG3mOT0jKlM+vE/RZERPQeWOkb
	cXVEAEIo3d4Nz7+f5CF1AKMKv1u+OsQbetImCrR6faFMUokdGni8Kc7vz4Ly/yWXMdkje84A4Rv
	EcIWmB+3eJv9N0u2m5ZHiAWAaZd9wOicNNfVN3qP18SzLS43o3OVopWYdMgkAar9CQXdT+J+ogf
	uG1p21XxobBi6FTwVbJk8i3olnd6S5Wst3ny8Sj/PwUsbNCfwfMfY7KcfUo8RHp1ida8e/v+nzF
	n8SeKuFtasZEPo7jQP7VPE21k8UHYC4XDhfg9cCQcjEwq4GkqGjWaR8IYSAUSp3I4JZUl1+Ki5s
	Zge78h4CPH7ZcWKunpeVAc21f1fu/bpNmsLK8p6JTJbkthv3FX15xwEiep1tTE6vhdqk8yRU3CA
	KixjxUuar/9hmVpd454K7TRIR8hpKJctF5hlAe1n1KfadAhHh4riENyJx0hDibqPAStwzkbOHsm
	DjoBbSsydZRiQ5e1LfuI77b1boIA/FK3Ns+k/WAIYV5tyn+hkcsWpzU3r+3QRgSFiomzNcTgI
X-Received: by 2002:a17:90b:264d:b0:3ac:9d83:8856 with SMTP id 98e67ed59e1d1-3ae57e3d6c1mr3582035a91.9.1793254111060;
        Wed, 28 Oct 2026 23:08:31 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm2602046a91.0.2026.10.28.23.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:08:30 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:08:25 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 3/6] mm/slab: Support disabling SLAB_BUCKETS at boot
Message-ID: <9a68a4d95830352ad3821437c2e22c30a673055b.1793253633.git.chris@chrisdown.name>
References: <cover.1793253633.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793253633.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

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
index 68647ff4bdd2..de2fd6963a16 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7001,6 +7001,14 @@ Kernel parameters
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
index 92ff97ff24fb..48078c1fd26f 100644
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
index e66c0778ee98..b7a46c368ab1 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -410,6 +410,16 @@ EXPORT_SYMBOL(__kmem_cache_create_args);
 
 static struct kmem_cache *kmem_buckets_cache __ro_after_init;
 
+static bool slab_buckets_enabled __ro_after_init = IS_ENABLED(CONFIG_SLAB_BUCKETS);
+
+#ifdef CONFIG_SLAB_BUCKETS
+static int __init setup_slab_buckets(char *str)
+{
+	return kstrtobool(str, &slab_buckets_enabled);
+}
+early_param("slab_buckets", setup_slab_buckets);
+#endif
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
2.54.0

