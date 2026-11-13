Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559915;
	b=XMdkyz8x0u6+ER1wwlWXt1neuKBXvMdJWChX8dRcC3/zsp51cU8GFTNOIHI6bF6g1NJr
	 042+sV85+GkK0nEDyF4O//+xfm43mEBtvCrAgjBwI3i035szbplXKmFr4539G1RH+gCwy
	 IASrySUU/Vec8PWRfkksrhlvq3zWzpOqn6uyBM3UMh84Efukf1mYdab6owkPIXh3NitcE
	 WsicPFhlN+gJEud1kR1dlH+xuBqNVyc4SEHCG76tdu/RMUKLL8L8hObTL3rD++bqrPNdz
	 UxN5W/rm0POKuP9DHbzkkpwuTAHYlHXiSnMjMZA7YIxHXAV23DI6SqFCOGm+2LADoCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=+SHVtZshJgR7EfVrq7tFY+459hSuxkLyCsM2otXIkPk=;
	b=YCDWlejE4HRgqrRDs3eMMJmL5lOk+Pp5eR0jkiQA8OI+jj/3FWug6pGiXPjbwBGB/JJ6
	 a+GTCBVznyh7zokHRViocR56G7tkx7OieteddjyOvo4P6x8nejzaNmMtP2VUQXcfxS2y7
	 FadgBbbtNLR9TIDW4Ak9+5nvWc6MVbkXPp/qe0N2n5xZi/XItVRSyXdLAiJN1sa7PLulC
	 uOFjaz61bv9DI69WFy6T6MnZZXCJ59Iwwcp8J2+J0dArcqL/ym7PAd9CGm0NnkJb725+x
	 ON2r//LVz5RPrwVExFE2EuWhu6ogzV0jnlwK9q5rmVkewtJbUa4WaHi3bnJ93gd2evg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=UZ6Lxa1P;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95A4606A334
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95A4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=UZ6Lxa1P
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so754052a91.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559914; x=1795164714; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+SHVtZshJgR7EfVrq7tFY+459hSuxkLyCsM2otXIkPk=;
        b=UZ6Lxa1PUPFlQVfHsq8c4m+2pmWrQpf5qKptnm6fWXQtGzJ1GxA+h4RU1RifcD8L+F
         3o0oYyP6cZbGmcMPFFUXPBM191qbaSnV2nR4Hd8iU0y/zl367LGLUboXN1ozRQM7gDCn
         ONv0EgoF0C36SeCQU2kBjmyW3a8AwTaLcjI9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559914; x=1795164714;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SHVtZshJgR7EfVrq7tFY+459hSuxkLyCsM2otXIkPk=;
        b=LW9uE6zBGXTDWjBSWhY+VUfIKBjW7NN8Kx7CX6Fwz6ZegfBhBSzvQGJ+zeCSQmH4zx
         3jmN9tJ/E2qdeUidEf1iF8VZiWbX1RSTn7cZ+ZG7sAXha2fMW3R0pAp2eqXgXq2dOwjv
         21Bf4b++9lxdcpIR5z+QeJvQ/YepAIquf8IFb7Sf/i1SjbW+bcqsUVbwQ1pAiHiQgEWc
         dyE4LvocBf6lIsdjA35TTbblLKGEx+s7HVWzWVm9KaTkdnXznmbWmBro6Ea5v5QdSBmY
         rXBFmmLeDfeXypzLT+bnYn61c7zLqUt0SYxKzNBTbWiK2usCqgRYMEb30Y9wdofx0vle
         p6uQ==
X-Forwarded-Encrypted: i=1; AL+hErHpX3NN75xgY4JV0DhoI0XvdF4VX1tNUqen/4zApAUTKohT4kgSf/xSEAZ234AxIF/MhvbyamD54e0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/736UharFO05q2IdDI09hAz+WQYpgX36fSsgGxgOMD/si/CfEJ
	YEBp0bT0MzoBFdAowSqpzhlkofFXSR/mxFNGuLabLGumZh83WbO9jm9kE6qEMhbFe6M=
X-Gm-Gg: AYBFou2+Q8xfzMWU0JixAAB+iGpqYevUANsM7xbrpNyUoxLK9zKTacfIFImI3G0rb9i
	ni/XSpMW2ILvbTdOZ300WFlAG62H88kRqcHYbNkmnMX1kxYpIDnabexojuGFvUdtAatafK9zrlp
	mZrqv190xE49T6t0R5EpDusPnX/I3R48bjpaUO9X2nhgPZuhZS7jhug5hTDgycPcNcMaMuWOOK6
	13YurHT/Ss9IfcdDAis83Vg+85n6Mcb2rjpo6xO4ZfcPw7yfcHECnBSt4VRGPysI8sLs4nsV7Uk
	xoLEvWTwQ8BqhvbxjtUxK5IWy5TnDdF/i6zqELvNcAsjJvbwOEMmYspCHh1cK/S2OMu62YeEcIT
	6axVWn/LwkLUxjHPvvfeIHxNBbJDN/M6nxHujuW4DUiQJR+RXwUhMJ4ok///KWt+HzBK2CCdp70
	ZSnIvO4knrUjB4/eJGxCqWGosQfEFgMRRMKOKj/c4i8MWnCAjTE52Lpo9gV8sXYLXGlYfYNx1T1
	n8DHgS5qCDQq5WoLRcp8mcb0gYUC2Uf1f0Bp2ukE0IHWaEu68FqMnQcymlky67vc3FFgpUEhHZO
	FQbhXBw4CeNiL9owTV2q5QD8jgmmWTobCd9a3ZugSZnalH3VHT6MvooCganaixZ/oiIOylvEn+E
	BXlCaENU6WYlsspP//RBd4KkY2FiE+Tok7M+0a8/O5X1D9XRGBFI1uh8bzclWutx7Cmz5CdXwN1
	5VDXsXkmBkyIeiEbfgoKG1kEXJTEwJy5HHfflk7MLJIjtSAvh4HTvJy8z45q8=
X-Received: by 2002:a17:90b:37cf:b0:3ac:9e76:aa76 with SMTP id 98e67ed59e1d1-3b1b09f3b85mr1586733a91.13.1794559914380;
        Fri, 13 Nov 2026 00:51:54 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm1115279a91.4.2026.11.13.00.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:53 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:47 -0800
Message-ID: <ef93230b8a053d234bcb02392f505ae4b0968e6f.1794506262.git.chris@chrisdown.name>
In-Reply-To: <cover.1794506262.git.chris@chrisdown.name>
References: <cover.1794506262.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 6/6] slub_kunit: Add a test for the kmalloc_partition boot
 parameter
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

Check that the kmalloc partitions are separate caches by default, and
alias the normal kmalloc caches when they're turned off with
kmalloc_partition=0. The test is skipped on kernels built without
CONFIG_KMALLOC_PARTITION_CACHES.

Make kmalloc_partition_enabled global and export it to KUnit so that
the test can see it.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 lib/tests/slub_kunit.c | 45 ++++++++++++++++++++++++++++++++++++++++++
 mm/slab.h              |  1 +
 mm/slab_common.c       |  3 ++-
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index 1af3f087134f..61227c242ae2 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -334,6 +334,50 @@ static void test_slab_buckets(struct kunit *test)
 	kfree(p);
 }
 
+/*
+ * Each partition copy is a separate cache, unless the copies were disabled
+ * with kmalloc_partition=0: then they alias the KMALLOC_NORMAL caches.
+ */
+static void test_kmalloc_partition(struct kunit *test)
+{
+	enum kmalloc_cache_type type;
+	struct kmem_cache *s;
+	unsigned int idx;
+	bool found;
+	void *p;
+
+	if (!IS_ENABLED(CONFIG_KMALLOC_PARTITION_CACHES))
+		kunit_skip(test, "requires CONFIG_KMALLOC_PARTITION_CACHES");
+
+	for (type = KMALLOC_PARTITION_START + 1; type <= KMALLOC_PARTITION_END; type++) {
+		for (idx = 0; idx < ARRAY_SIZE(kmalloc_caches[type]); idx++) {
+			struct kmem_cache *normal = kmalloc_caches[KMALLOC_NORMAL][idx];
+			struct kmem_cache *part = kmalloc_caches[type][idx];
+
+			if (!kmalloc_partition_enabled) {
+				KUNIT_EXPECT_PTR_EQ(test, part, normal);
+			} else if (normal) {
+				KUNIT_EXPECT_NOT_NULL(test, part);
+				KUNIT_EXPECT_PTR_NE(test, part, normal);
+			}
+		}
+	}
+
+	p = kmalloc(64, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, p);
+	s = virt_to_slab(p)->slab_cache;
+	idx = kmalloc_index(64);
+	if (!kmalloc_partition_enabled) {
+		KUNIT_EXPECT_PTR_EQ(test, s, kmalloc_caches[KMALLOC_NORMAL][idx]);
+	} else {
+		found = false;
+		for (type = KMALLOC_PARTITION_START; type <= KMALLOC_PARTITION_END; type++)
+			found |= s == kmalloc_caches[type][idx];
+		KUNIT_EXPECT_TRUE_MSG(test, found, "allocated from %s", s->name);
+	}
+	kfree(p);
+}
+
 #if defined(CONFIG_PERF_EVENTS) || (defined(CONFIG_KPROBES) && defined(CONFIG_SMP))
 #define NR_ITERATIONS 1000
 #define NR_OBJECTS 1000
@@ -528,6 +572,7 @@ static struct kunit_case test_cases[] = {
 	KUNIT_CASE(test_leak_destroy),
 	KUNIT_CASE(test_krealloc_redzone_zeroing),
 	KUNIT_CASE(test_slab_buckets),
+	KUNIT_CASE(test_kmalloc_partition),
 #ifdef CONFIG_PERF_EVENTS
 	KUNIT_CASE_SLOW(test_kmalloc_nolock_and_friends_perf),
 #endif
diff --git a/mm/slab.h b/mm/slab.h
index 6a28951f6d5d..2a9d6a9a9948 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -391,6 +391,7 @@ extern struct list_head slab_caches;
 extern struct kmem_cache *kmem_cache;
 
 extern bool slab_buckets_enabled;
+extern bool kmalloc_partition_enabled;
 
 /* A table of kmalloc cache names and sizes */
 extern const struct kmalloc_info_struct {
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 20b066d61703..d0695e4d2ab6 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -781,8 +781,9 @@ unsigned long random_kmalloc_seed __ro_after_init;
 EXPORT_SYMBOL(random_kmalloc_seed);
 #endif
 
-static bool kmalloc_partition_enabled __ro_after_init =
+bool kmalloc_partition_enabled __ro_after_init =
 	IS_ENABLED(CONFIG_KMALLOC_PARTITION_CACHES);
+EXPORT_SYMBOL_IF_KUNIT(kmalloc_partition_enabled);
 
 static int __init setup_kmalloc_partition(char *str)
 {
-- 
2.56.1

