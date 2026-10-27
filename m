Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086581;
	b=UQRAr6eREH2uMU02Y+4SFjjAughO5ci5ukxqvFIvje0QYGGv9jMLsKBzVYhn/NMsOIi1
	 mcA2v5ZhIsc8iYlmD7edgM/fKQ2CNIqFWmRFrc7RjfrKsbU9u9/+xsyrZ8VU6o9u3tc4g
	 5vxfXuedhoVh7qjw0oUOKarsZx2DyHbRlcP+nWMD5SEuzI0SGs5f4BAGCA2+I7sKK/6rG
	 g671PJYkfCKRQRP5dbonIlOLsoa/EnKgN/K+tTq8Qcy7ArqqMdASRcpI6iJ+XDGw+KXoE
	 cZoWQh9f1cd3V0Pp/QGeMkcX4EuVPQRuavxBo2iLT/Lt9JSm3SLpbtiCG6ZSqmiXwlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=WsDVlDiCyeeoi6YHVgqDovvrMD/IKVknSNFW9xBDDdM=;
	b=p5Fv8aujvaCunWqsgHUmqZWPbwL3FkQrfToE5xiFtGXcFSGlXifeda5CWwNFjx0FPFVb
	 Sh2mCmHNXq44RPSg+McGYQzBLpy76KQpkR5JMdhtvCLWo53LpVLDU4DJSfmcfMjPmAKwd
	 tw5JjIIrydV8vDsIlJox4wng27Pqa8Hlx0JMIwJOGhocEbepRXOWh2EuudvMdDQO4s5zO
	 y1VIm3gu+yTHsYyePdkWFJ0AXppwWo650YxEgMM5Shm7JQyrSKNnhOyXeLPa74T5BEK2W
	 Od6s4xqwaNrNYErEGCL3lbsX2FeUbzwCTxOQeMCWxX/5Z/f2+OTfrZ/bWvEZNzqoHew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=oXS3sM3f;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AD660A260E
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 07:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52AD660A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=oXS3sM3f
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1275370a12.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 00:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086581; x=1793691381; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WsDVlDiCyeeoi6YHVgqDovvrMD/IKVknSNFW9xBDDdM=;
        b=oXS3sM3fj2XUadb1vc02xfYY7JbNUjMzEB1ySQjFATcVV+4RJ6CNOqYCN+U9s9XxSP
         si6YHQT30AZD9j6WiJrWoLTheN6jeOPZ5ePo8ir8ejCjumrJJtV83vfg56+xUpAoOkT6
         5qjOKS1SP2re90ySQ0wAQXmiVC9h3nJ/zmoyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086581; x=1793691381;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsDVlDiCyeeoi6YHVgqDovvrMD/IKVknSNFW9xBDDdM=;
        b=V+tfYkvNCxzdkJTqnRDmqFITH6Cf/dOjoC5Mg/N7v2Mau+xU+1kKXKIItG1KLu+JfY
         8iXwFAxnomVX2DE776BgrNF8oOo4roIP+d4Q6uY8PigqHxoSLIBAmj0dkIz/RZ1iA4PY
         zBWLXXG2y/WMWpJE7jyBAU6nJe/z1dz7VSfLExlnCpiPAdo4HcVd1x76mkzLx77xJYzb
         SNTH+w9VFkXxNRau3e2/iMVYqX+y51cZvz7ZNeJWoRY413fewcfNpPL+rjGx2d9LOtrw
         xuVy3oDkZUvAU9jv+PTZuA3FUxPibYh+wJOoeI+A/jXuaGB1+RhsD/NfSjdaDoPItaEu
         AxBg==
X-Forwarded-Encrypted: i=1; AKwUvBypsR58eMi3OIrOHVePmiIsTyoGEtQ7XHgqRFGr6zEdULyBjQCeroFsM22BYbc0QpuIWmWsT9TumDw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRfpNz13lgjL1EoF2aNaWrjlt7oIfFumaGYkUmH46hKbPtGeb3
	lsbKRECEnY7K5j9xvlnPCH6DMRreLKn0hukjEHOdSzmZkunE4rapICsgCfA8xxfYgyw=
X-Gm-Gg: AYBFou1LFBXeVFE4lyPHYCxGbx/bNYM/jFKnbSjnqtzZgKyGuyaxGD2H9Q5vHpKY30C
	aW4a0XmraP2nZyk+9LLipedK1vh93yxbRfX3vskK3lROtv0Fikzdrh7lw18uEzFc7kNgTOqeEZV
	ca/kS8L3wDNIGdzzc6rNK3Ba23nYag5Rkl+n4418MQzOSoYO+HbrfXIwJmVqhRviPWY/H3Cdwwq
	hw4TEylGixHMW/x/ByYn93LpNew4i4l4fW6kcr3VHXXmys6/HFyBdc84v5LVL01bgF12VShD9/N
	v7qlnstm7xVLU/ui+LUM4Ymp2GG7gbEhk5AmXM0DB0Hubo2OGSVTmUpRTs0pB5SOmp7GOlbkYQ2
	rEXj+ez6+Nuy/SCp4zUj6v8dRkj1KFujlcoo4+yurw9DB3plBJnVpQPEmHt3UhLI+8zWdM6sION
	/OaioGdZu2bTttAaqvDex5ziAxwnMkorFVTy+sGbajRyR1KBXc9Fe+PN2+FKAt3bkKgG4zqJJMy
	7cWwRLIIST+zl6lRn47B0gPEUPzKloxzgCZt7NtW0YKuQ+2iBKRPGPkOZWCfj1tDAKYtXeA/kHj
	ZfiEQBvVQ4mom5kSBrTHa4XRRrJvYGkXzIwY76OhLTamPYItmzgzxWRNoXRbxwatxAV99cGb7ZQ
	j6116Ax8ztBSKr4SDZysj/nw=
X-Received: by 2002:a17:90b:35c6:b0:3ad:a17d:f46c with SMTP id 98e67ed59e1d1-3adeb194872mr6931650a91.62.1793086580701;
        Tue, 27 Oct 2026 00:36:20 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614d7dsm2480038a91.3.2026.10.27.00.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:36:20 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:36:16 +0800
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
Subject: [PATCH 8/8] slub_kunit: Add a test for the kmalloc_partition boot
 parameter
Message-ID: <7c619e0ff37d83b825549ee257bb60a82bc8006f.1793086056.git.chris@chrisdown.name>
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

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 lib/tests/slub_kunit.c | 46 ++++++++++++++++++++++++++++++++++++++++++
 mm/slab.h              |  4 ++++
 mm/slab_common.c       |  3 ++-
 3 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index 646596663b33..0fe10cbfc83d 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -430,6 +430,49 @@ static void test_slab_buckets(struct kunit *test)
 }
 #endif
 
+#ifdef CONFIG_KMALLOC_PARTITION_CACHES
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
+#endif
+
 #if defined(CONFIG_PERF_EVENTS) || (defined(CONFIG_KPROBES) && defined(CONFIG_SMP))
 #define NR_ITERATIONS 1000
 #define NR_OBJECTS 1000
@@ -628,6 +671,9 @@ static struct kunit_case test_cases[] = {
 #ifdef CONFIG_SLAB_BUCKETS
 	KUNIT_CASE(test_slab_buckets),
 #endif
+#ifdef CONFIG_KMALLOC_PARTITION_CACHES
+	KUNIT_CASE(test_kmalloc_partition),
+#endif
 #ifdef CONFIG_PERF_EVENTS
 	KUNIT_CASE_SLOW(test_kmalloc_nolock_and_friends_perf),
 #endif
diff --git a/mm/slab.h b/mm/slab.h
index 185df5e68419..934b9db1ef6b 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -394,6 +394,10 @@ extern struct kmem_cache *kmem_cache;
 extern bool slab_buckets_enabled;
 #endif
 
+#if IS_ENABLED(CONFIG_KUNIT) && defined(CONFIG_KMALLOC_PARTITION_CACHES)
+extern bool kmalloc_partition_enabled;
+#endif
+
 /* A table of kmalloc cache names and sizes */
 extern const struct kmalloc_info_struct {
 	const char *name[NR_KMALLOC_TYPES];
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 5391149a2eed..406e8688ee0e 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -782,7 +782,8 @@ EXPORT_SYMBOL(random_kmalloc_seed);
 #endif
 
 #ifdef CONFIG_KMALLOC_PARTITION_CACHES
-static bool kmalloc_partition_enabled __ro_after_init = true;
+VISIBLE_IF_KUNIT bool kmalloc_partition_enabled __ro_after_init = true;
+EXPORT_SYMBOL_IF_KUNIT(kmalloc_partition_enabled);
 
 static int __init setup_kmalloc_partition(char *str)
 {
-- 
2.54.0

