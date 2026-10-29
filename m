Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254168;
	b=aH+fndPv9FZS0KBaeRBR+cnwzm5cCtXGeOyvZdzthmRoqf2jvwQahfcBwVbv9nsS61t8
	 5k3N6cgGzfQdTNRAuwzvD/R7MH7Y19NCxCjMp0Q3pVe+S3YFYBwAHoCw8NwiWkMcf6oP2
	 jTbXgEY9mRWi3eLXWRSu+muQ/gcXMijKax79aZ+VRl4pmIr4Kv0f+jRA+ddY0cdrneaOd
	 j+cgfZdiRIyCbF9mWHe/Ni5GNc7Hk8G8KvxyiTQnGM8ynMNLzXVWhWeKtHaSCwdj/cxgK
	 IxHDL9aUlQYtKQBa96o5oSXi0TXqGliuVamLqYhXaDsjVMnPlBTaSkEsYZW6VeoVMlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=kJG/RgFaRLdMkGdKAhf/ALFLkcE1J6knB1UbEQSKpbg=;
	b=bBGf/hiWDyxtuaKsMz4QCJVBqB5EeFCArDVz/2skF46JRCxX7Kr4Eh6173qPkTeNTA9+
	 53Ft1cK5L7MVBpF5h1c47Abt2s9BhqUaIvX3ABeaV2rScgWEPUuQCCMmQ8dO3u5lRGCZQ
	 bmpS8Hw9BNIWWLd8vuCT5SoJ9LQBJ1X/c4dArAQ1GprC60IcQ/AjxnaDipkLNTvuzNOeB
	 fFqi9rZ0DkLr272LSvnKMk/jve6r5cJWzR9Q95xWcDC5tFnXhu63NEJ+wdIS5lPC+Ef2L
	 I9lEIEEGMjWg3RxUQQOw84TK1AyJ1G/BH1jvDekW3kgnV6vA52mqmtonGzvppQ1Y3gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pMUDAr53;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B131F606A31E
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 06:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B131F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pMUDAr53
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso1114174a91.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 23:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793254167; x=1793858967; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kJG/RgFaRLdMkGdKAhf/ALFLkcE1J6knB1UbEQSKpbg=;
        b=pMUDAr53zakRhaLJRVoGZnpBNpg+AvPmFK3NgAImketf4vC+bXEYoxFmM2aSzlfvqc
         WNysp2JFWyGstElcXHyq5UvOTgNKsjOswBALDB782GOi+X6llgskMhqceVSNVE/AThMc
         B5UTBEchSVKgfYwES5o33SSemWTSUzV7Nnzxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254167; x=1793858967;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJG/RgFaRLdMkGdKAhf/ALFLkcE1J6knB1UbEQSKpbg=;
        b=LAJ0HenVmqY+lAnyXDFzFRSV/trepOFhyqhKQ7Davx4ZniXbi2Knwxmj90LwQME8mD
         y9O9prgvFH3fJLvS/cDYykgBXR8z6XL+uVkvfgxNJtbMgKlw+ACsNcqD8rOhIYpS4yEu
         j1HhiK8gV4jzcePsRGRrfTXKOWitlCSZl/4MNTDUb6QbUYtn7lUwdxmwGAqkJxbpvVHh
         O4aGe/vtIjd0oloxMZiYky0ICBoq7p340xE0/cqvZcB4X0NtPLDUD6UHbt4Y2Wr/yBdE
         q4PZ2BK6ClOP6abWCx7MbA1BSHfAce4LKG5zg0gi7MIFqtZFm7H7lOLwgKDe8K6CSiUx
         GUqQ==
X-Forwarded-Encrypted: i=1; AKwUvByCtmdFpEbuRzurmGZNLZ8fbdpfu3j9txGxuygQU8Ly/35qz0/KHf8wApHRcFT3dSCwfF8wgP4HWXE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJKXzpdwHhhfS5HKtk3KJP5UUE2zdeprtkXCH1bjpNUEsbWCQu
	gFoYz1taX6m1AKwa+ail6E/8iSc5WCoZ50ShNm7iMCbfFsDn0MsGj8KxbC/aWCJ/vpQ=
X-Gm-Gg: AYBFou03UB9RAxRccEfY5KJznTvBdH1ABLPwJ61tfaDRVt454FNd3UKeLeSVotJ0RKS
	tvFn9rzwexodCVx9MS1yjh3pLVPOEa0F4sv45fjg2yGm6pYKASMKADhDqhWE/Qmn3da82/xYjXp
	JaXEb2fZ4h3jRXpveekqvzMzt0LXURp6yw+R7neU8TDJ/Pdv7jt+BS+TrT7QOgrXWa7rGCC9/yq
	9wZDiw6pgG0bzACOgQMBXqTQwmNeAQ8CxaaDb+noj+vOalAeDK97s7Mj9zNMPaIyzfYNjaMoNsC
	KhzxQGBNxU4DZ9IQDea0H+NUQ+vjjmURCfmxg/WPcSDBkrOx4WLrSkqfBAQQJbiABBAadRBEm/5
	+uv+fbNLLOM6zXSq/uRI0l0Qo3C63/vVNuT/F4n+H6YTeLbqyveLuFuabW6j+PalM3DrbSBFEPR
	DLDynp+3L94tl8b4eWiLckAd17Qwcu9Y/ryHpyBvcvGcDCq8/JnI1ayQ3XkikSO3oUyBdlCjQeB
	L/7ybacZRDnYgDzEDfWyT8CTaT55Z++ED6YZKdea7RybqW/hhJWao76dH/Eb9g6mUOxw3h973EF
	kXRpDcTkSChOzWyQEdL7KpE4a3/6pe7xqbNZjFBm4qgrYdMayNAzaHkFW0qWl/819Q+CfBrTVi5
	cw8q1KPoFENSnkJ3dkFQaW4XD8i7XQF/OeFPJ6XQOWJug90y7mYnnIzbuxZ6IUmjnO034aS8XAV
	zDLnM7TjrzG/8gECv+6T4=
X-Received: by 2002:a17:90b:4cd2:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3ae57f96d53mr3126592a91.9.1793254167010;
        Wed, 28 Oct 2026 23:09:27 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9bc6f7sm2447023a91.16.2026.10.28.23.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:09:26 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:09:21 +0800
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
Subject: [PATCH v2 6/6] slub_kunit: Add a test for the kmalloc_partition boot
 parameter
Message-ID: <66f981ce04dfb01d02d1683bb18ba6db1c4eabd1.1793253633.git.chris@chrisdown.name>
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

Check that the kmalloc partitions are separate caches by default, and
alias the normal kmalloc caches when they're turned off with
kmalloc_partition=0.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 lib/tests/slub_kunit.c | 46 ++++++++++++++++++++++++++++++++++++++++++
 mm/slab.h              |  4 ++++
 mm/slab_common.c       |  3 ++-
 3 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index 670645875b27..e3035864577d 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -333,6 +333,49 @@ static void test_slab_buckets(struct kunit *test)
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
@@ -529,6 +572,9 @@ static struct kunit_case test_cases[] = {
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
index b5b344d6e402..8e1e5a3f044b 100644
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

