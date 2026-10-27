Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086571;
	b=Je2NmAmX/XZBRVaC0xCBRQO2ihJ+looOVnszo0tIcSObZvzmOb6q+yPsLBYrapI55d9g
	 WI6Ot18b3w99IGVC36s0v9eZsmfO0+Ci6RGGXfoofLqna3wiXxIhmMRsUTUiz3UeRzJTR
	 7sc4u1wYFGFilHJOholmELB5Ac53u32A2gqTlcd60wiZiOpXp7BSfQG+LF1lufc18rFvq
	 QOYyRIoIuwabnRrzgF0V3frUAeHFV5DUB0BBSAlYl4xQXWQiTqeZZn2luG9uHghf/hyKa
	 nxxtFJHp/fvAZm8fiDtaA8uGVx37B5zilWrDYgP1fGcW3xAcHN0GFNy/qqiayEAchSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=NjMmv6pm0tIRvcDaHQJ8L51He0Pq3qbg9jRbmDfBhFY=;
	b=j1EOG9BcFpqfrilk6SWf1ixNVXmSpbX/BLSZ6tjSAqupmcYMyaZlO6rm921A/IFu5QVF
	 KfL+GER5VbvfPCvrTjwaaniopuUxe1Eu7C+gmAaPysx4j1H0jEyiZGTsLGxqsYfBOmORv
	 3ed4jLFLrndKDfcg4cZGm7GA/jR1hQm7NKwZctBTSk7GWGi9VVo+YCba+uuZmW6OBxiDn
	 0/vBoD1jQVpHik9unAxkP6KN4hqzY42U5IKhT0IQJuJebJCJQZLfcMiIRGc1aUN1Gk2Ci
	 Yjvd8Y2/7q9m82tV5nqsQEMjBYgMV0plmVAVXwzjlYPUsyyM68ZqUKvQfp/lA3LGBRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=TXVGWLxh;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5BA606A31A
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 07:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD5BA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=TXVGWLxh
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so1156013a12.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 00:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086570; x=1793691370; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NjMmv6pm0tIRvcDaHQJ8L51He0Pq3qbg9jRbmDfBhFY=;
        b=TXVGWLxhSB+Gb9nT63eM3MKUj//nPu0qw/Is2VaTnaKtdgIY2B2xrhKI49AsLoPREN
         HWaWxakSBSdsj1awp/r1EAWprRg9ltlHF4Pvbi9idT7sXLkJNd1U26ZELH/DMaDT0ThL
         2e2GoUAl8WKn20EnkkTZYx+VCRCQWoc0HwsDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086570; x=1793691370;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjMmv6pm0tIRvcDaHQJ8L51He0Pq3qbg9jRbmDfBhFY=;
        b=pxZilXB+Y2k6pWnOSRDWESPi2QUvkh6EJuB2i0nMW/mnIsWfqbQ76/zTxbzyeLaOrw
         iG65/JwndcS3JuF4LjD4M0g1NDYT6Qf18zz1AdXfVKdjrjQ/24MvDR5Zt2VoOwxQvRH0
         HiA6YFAPw0GXpzK2O8e/rkpiNE3MXlC91n02q8nXQhdtsSt9mhbyclWcyxlEKax6Z5Zc
         z04tvDfoRIb0I9LPYQ4NCw6lFybqSotKuQk7FdcUr8oI0a9Eu8aky7DgYRBQSLyNfPG4
         2d9sdm2cypyu0ahrjp/K/A1G2QdUWElbX2ilQIY/WXvE8hKYxKaz5KgRtoTrKEdNSvno
         UhvA==
X-Forwarded-Encrypted: i=1; AKwUvBy6wValx+5O4IoKwp6bZNzvqT+XVM3ym8bLbBoIkExtxBnZBeMxdbqEcxEiAQDpI/uc471FqXkzm4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzUUMKxPqsFUzWXChxVIbor6LXDSHewvG6GNOVDl2NLLnOgmdY
	u+FLxHxSb8qjhiLcWw0kgq/bDmLQ+2Ha5SI+R/z5eR8fkRsV+p5KsSWR1piQNg721Cg=
X-Gm-Gg: AYBFou0+vw1ncPse35aAr9xbPk6GuVAFOEIsjt2HlMD2rdcjz3AJFDO0yd37Pd0YTfv
	GRoXEky5TN/NSGReXqM7HrvHQ+grQO8ali3lHMPh/GEILRyar7RRcoayIwcUj0mA5jL8InwJ41b
	DQ/WNg6D/mtHu0LxJXWZ0IXK1m/bOyT79mNihVKFZX4YF9pCBy5bHgUFpN1p08Ne+WsR7jBge84
	h+0VKOqLjcPG5I0XfMupkYYfupzt5m49gJ3lRk6R/WGYUS98f84SVll/x22ciiioFpnA1R2RZpU
	YCQHsQeJrRCWmJKEgCB8iQ1yZb6nEWkMejwfhRkxarl7F+hhi2PaVU4IK9VFHh1FGW6IRMoeeDv
	OVnlM4VFatCb47MPzxuwjPkkWq+ZKJxcT3H/2hs767tTJmuDVQcvYZzt3WtXxhg+KA6GuxKsOV0
	a4mmmxmcVqdL3L7Vy5z7aYld8vlLUOAZ2wOrzlasYO7BRTjBdIUf3aUFjYwd2K95zeIDkjqTN56
	6p2Cd4mYyAzaE8N3Ffzmtw7RqQXv8gvhBLihjI8c/M9nBU/rnFggnuN/CWZk7RsFfjel26n3aO9
	JnC9bW/v8KsApexQFIqyMXG9sjP5Hs+tu6lzCGFnsaJPa4vtuZKibkTRppxuypxK/hYk7jc+qPe
	tU2bXFSdAIIEfKpgWj5I5sqw=
X-Received: by 2002:a17:90b:4c92:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3adeafc7dd4mr7341488a91.51.1793086570089;
        Tue, 27 Oct 2026 00:36:10 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adf8f3f22csm6639832a91.3.2026.10.27.00.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:36:09 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:36:05 +0800
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
Subject: [PATCH 6/8] slub_kunit: Add a test for the slab_buckets boot
 parameter
Message-ID: <92d3b7ad95c9b7cdc76eb8f361cc2b374c018edb.1793086056.git.chris@chrisdown.name>
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
 lib/tests/slub_kunit.c | 37 +++++++++++++++++++++++++++++++++++++
 mm/slab.h              |  4 ++++
 mm/slab_common.c       |  4 +++-
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index 49b9942bc564..646596663b33 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -11,6 +11,8 @@
 #include <linux/kprobes.h>
 #include <linux/string_choices.h>
 #include <linux/swab.h>
+#include <linux/mman.h>
+#include <linux/string.h>
 #include "../mm/slab.h"
 
 static struct kunit_resource resource;
@@ -396,6 +398,38 @@ static void test_krealloc_redzone_zeroing(struct kunit *test)
 	kmem_cache_destroy(s);
 }
 
+#ifdef CONFIG_SLAB_BUCKETS
+static void test_slab_buckets(struct kunit *test)
+{
+	unsigned long user_addr;
+	const char *name;
+	void *p;
+
+	if (!slab_buckets_enabled)
+		KUNIT_EXPECT_NULL(test, kmem_buckets_create("TestSlub_buckets",
+							    0, 0, INT_MAX, NULL));
+
+	user_addr = kunit_vm_mmap(test, NULL, 0, PAGE_SIZE,
+				  PROT_READ | PROT_WRITE,
+				  MAP_ANONYMOUS | MAP_PRIVATE, 0);
+	KUNIT_ASSERT_NE_MSG(test, user_addr, 0, "Could not create userspace mm");
+	KUNIT_ASSERT_LT_MSG(test, user_addr, (unsigned long)TASK_SIZE,
+			    "Failed to allocate user memory");
+
+	p = memdup_user((void __user *)user_addr, 64);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, p);
+
+	name = virt_to_slab(p)->slab_cache->name;
+	if (slab_buckets_enabled)
+		KUNIT_EXPECT_TRUE_MSG(test, strstarts(name, "memdup_user-"),
+				      "allocated from %s", name);
+	else
+		KUNIT_EXPECT_TRUE_MSG(test, strstarts(name, "kmalloc-"),
+				      "allocated from %s", name);
+	kfree(p);
+}
+#endif
+
 #if defined(CONFIG_PERF_EVENTS) || (defined(CONFIG_KPROBES) && defined(CONFIG_SMP))
 #define NR_ITERATIONS 1000
 #define NR_OBJECTS 1000
@@ -591,6 +625,9 @@ static struct kunit_case test_cases[] = {
 	KUNIT_CASE(test_kfree_rcu_wq_destroy),
 	KUNIT_CASE(test_leak_destroy),
 	KUNIT_CASE(test_krealloc_redzone_zeroing),
+#ifdef CONFIG_SLAB_BUCKETS
+	KUNIT_CASE(test_slab_buckets),
+#endif
 #ifdef CONFIG_PERF_EVENTS
 	KUNIT_CASE_SLOW(test_kmalloc_nolock_and_friends_perf),
 #endif
diff --git a/mm/slab.h b/mm/slab.h
index b648b33f25c3..185df5e68419 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -390,6 +390,10 @@ extern struct list_head slab_caches;
 /* The slab cache that manages slab cache information */
 extern struct kmem_cache *kmem_cache;
 
+#if IS_ENABLED(CONFIG_KUNIT)
+extern bool slab_buckets_enabled;
+#endif
+
 /* A table of kmalloc cache names and sizes */
 extern const struct kmalloc_info_struct {
 	const char *name[NR_KMALLOC_TYPES];
diff --git a/mm/slab_common.c b/mm/slab_common.c
index b7a46c368ab1..9fe48da12010 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -29,6 +29,7 @@
 #include <linux/memcontrol.h>
 #include <linux/stackdepot.h>
 #include <trace/events/rcu.h>
+#include <kunit/visibility.h>
 
 #include "../kernel/rcu/rcu.h"
 #include "internal.h"
@@ -410,7 +411,8 @@ EXPORT_SYMBOL(__kmem_cache_create_args);
 
 static struct kmem_cache *kmem_buckets_cache __ro_after_init;
 
-static bool slab_buckets_enabled __ro_after_init = IS_ENABLED(CONFIG_SLAB_BUCKETS);
+VISIBLE_IF_KUNIT bool slab_buckets_enabled __ro_after_init = IS_ENABLED(CONFIG_SLAB_BUCKETS);
+EXPORT_SYMBOL_IF_KUNIT(slab_buckets_enabled);
 
 #ifdef CONFIG_SLAB_BUCKETS
 static int __init setup_slab_buckets(char *str)
-- 
2.54.0

