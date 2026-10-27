Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086560;
	b=QpePapx7/zdd25evSK71Be7TUF95ZVWKEyhoJQFE5Z1w441H19mI76FB3g2R6jo3U8Ln
	 AKB2ee2doAKx9smQ/VshjmF1MlI3PdsMmjp5VHML9s1nDfqL0jaSCzGPh+J0/TrZq7Gfw
	 s4Qqyxngj8QVGukVeVELqYr4JdcNzSO9N08ZL4X/jA8l3AfpNq9KC/ZPFNxK8d2JvxnV3
	 TjG6HYd2A6spoLS2i+Mr+OinWtcDh5nezqY5MFOIEhXLiAL4YUX4crKDUe9BTZOmNuKrE
	 TPVwATfe98QnMWeIOdXV4o+9JTaAWK/pDHVqu69bLAOF8LYx8r2sVs/qF3eqBijINWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=hpIIV0W46trht3EV+1EEIjsc/ykz7v9qZcaLCd0bYkU=;
	b=DYbgpsveAcj3az8gRQXp11dQnlyxiFunGfNH1XVwZMMu2c7NSJ4j0LzQ/ECBOPZ0vQRZ
	 MHtVlOZKjbXpI+uJgzjJvpByuRrOEGhblJJ2rtM3KfNA55fneYcCWEvi3oABZr2pCpjV5
	 PbjCETTufRSUkF7EVL7xj/2AAVtEirXlBpXC41r0xQqMKP2wkqkTj13ojeWnErFZMFHIJ
	 z3zodJ1i+ZMasiV9VH6kShIx4X3f0cI9RW+50xRlk4L+k1nGRdL/7hSO1z7vfxz9FVt13
	 3mxkeHabSVE1Ymnd5i5SeKQ+jCxKEotniJDTx4Wb9bV/Tvqa66r++xgs4zT0gR7e4TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="Sya/jb27";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC5F60A2619
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 07:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC5F60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Sya/jb27
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so2063166a91.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 00:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086559; x=1793691359; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hpIIV0W46trht3EV+1EEIjsc/ykz7v9qZcaLCd0bYkU=;
        b=Sya/jb27lh0beXAqtnIJlVvq9EAFZBzGHClnjf9Q8/lNpvFZjHz4qKv6KgxaUI83CX
         YH0AuAup5If0GOe/Y0pNNRcTgzEvB5BIAaDI10ypdeUuhF+uXJVMgoAG3C4hoGSH+pw7
         lx0AtJLcOCdWWbJg3hx3ZankbSu70ySWHQ5Fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086559; x=1793691359;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpIIV0W46trht3EV+1EEIjsc/ykz7v9qZcaLCd0bYkU=;
        b=py4mJQz2VoJnpmLb9LBhTMo4ZgwvU9EaPcGe0gfMTHNbTYqhnVkaYr1Att0WfC2ccv
         PdH5TFJ+yeS9KgRl57T7682V1/XzZ5qLxp0C232THyEzQQsHyrhyeeZ0hDZr6N2zZA1B
         piL6ml4wCXUYKosxXSE/cDHgx3Zp5t2EUieFcb+/l4KbLM4Jj8FV00Vq9W4OvmQTsVia
         6QEWgSqCrela99IFo6kHexsn+0WNK++lwUAHJDrrd086uislqHogTIUggTg1cfV0L1WC
         e9pSXM7FBSaqi30NfGcS2uWpMzxn/rlSHSnAPz5CI7u57kF5Ws0kkyL98B8AjSlAafmH
         cSBg==
X-Forwarded-Encrypted: i=1; AKwUvBx6bcsBb0C4SulHOl/7cLGZOtNQl5dv3Udbhe8izwwdDYx7vAG6oummvW38tEGcmTHWOLzf8ekMpj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0QU7ui7rYh9Vbl3WhryaHjJiVIjwNqaVNU3vkwMv7PCbiGyY1
	ySHW8MQw8GjirfE9liOSgppMS/2qI1Ma+fNBsHKTF/f0OSGCkKq+UGdGwk++p+HXGAI=
X-Gm-Gg: AYBFou1ngb8Y7O4Vagsj6V2PZiS++GVxMLccTGH4FvNiJfbNQiKAk3RJmRt5Fo1KjDV
	u9ESEx41Hws6vH3ODic6wDqPElYMELC66XNXASLk7yn/iKDbXPmhuff8l+JDY4NzwLheKphd5IO
	YX3IY3/nJtpCY34ys+NKzXdm+amGuyhTQX2BQrEf5RW1M4yQsqDQLZIRoXTSHyFCZofEhoQyRhl
	a18okoycqpnrQ6e6MeBLLdVfRhU6OWZLqOS5xa1+R1PAILG1OEK0bEft6lU2tod0KUycrao0SK5
	PuPyNyE8X+JvZ5+OMgL5ftrKLhmZp3TQjGpj+N/hQn3bNZIDNogYTHcDcP5NOWJzlnCew8PMVUQ
	hK9XPybwdpEfFTbwNCOkijsXTXlYkte7BQqHZywXPVmHpzfZDub63pIzUo/4+ULmRgvttKy0CT9
	l+kl8655Qrusm6ueP1pZuPfNQWcjLFIGVoo4E/Uyl+LqONxaLHMUpxlPIlc79Db6abmmOO8OJkE
	s3W21Fvileg56XoH/pEQBuWqGsLCpCByInYRmKU2pbOqEBGp96jiTzpkTn7gBS8uFhMKdeEiecr
	JKIkB3vLij8iBmD99tEZOjwsaRK8ml5AmienoTObxhbtQAONxIsF3cs9kG7ZTze8BeM2YizlJOo
	y576aGblHVvT/S0ZWqRauaXF9vKi2OdT/Ea2pMPnWLrw2pDqa+IZa/CEXxvaPddSABvpC1bem
X-Received: by 2002:a17:90b:5408:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3ade9b2f216mr7575308a91.7.1793086559188;
        Tue, 27 Oct 2026 00:35:59 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb0dda7sm7230307a91.4.2026.10.27.00.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:35:58 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:35:54 +0800
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
Subject: [PATCH 4/8] slub_kunit: Add a test for slab_freelist_random=
Message-ID: <0af4fc45ca8e1d7027ceaad079f8f9eaac663c76.1793086056.git.chris@chrisdown.name>
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
 lib/tests/slub_kunit.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 mm/slab.h              |  3 +++
 mm/slub.c              |  3 ++-
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index 5ace73368523..49b9942bc564 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -190,6 +190,56 @@ static void test_clobber_redzone_free(struct kunit *test)
 	kmem_cache_destroy(s);
 }
 
+static void test_freelist_random(struct kunit *test)
+{
+	struct kmem_cache *s = test_kmem_cache_create("TestSlub_freelist_random",
+					64, SLAB_CONSISTENCY_CHECKS);
+	bool random = false;
+	unsigned int i, nr, nr_linear = 0;
+	void **objs, *first;
+
+#ifdef CONFIG_SLAB_FREELIST_RANDOM
+	random = slab_freelist_random;
+	KUNIT_EXPECT_EQ(test, !!s->random_seq, random);
+#endif
+	kunit_info(test, "freelist randomisation is %s\n", str_on_off(random));
+
+	/*
+	 * Caches with debug flags have no sheaves, so objects come straight
+	 * off the slab freelist.
+	 */
+	first = kmem_cache_alloc(s, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, first);
+	nr = virt_to_slab(first)->objects;
+	objs = kunit_kcalloc(test, nr, sizeof(*objs), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, objs);
+	objs[0] = first;
+
+	for (i = 1; i < nr; i++) {
+		objs[i] = kmem_cache_alloc(s, GFP_KERNEL);
+		KUNIT_ASSERT_NOT_NULL(test, objs[i]);
+	}
+
+	for (i = 1; i < nr; i++) {
+		if (virt_to_slab(objs[i]) != virt_to_slab(objs[0]))
+			break;
+		if (objs[i] == objs[i - 1] + s->size)
+			nr_linear++;
+	}
+
+	if (i == nr) {
+		/* Without randomisation, objects are handed out in address order. */
+		KUNIT_EXPECT_EQ(test, nr_linear == nr - 1, !random);
+	} else {
+		kunit_info(test, "objects were allocated from different slabs\n");
+	}
+
+	for (i = 0; i < nr; i++)
+		kmem_cache_free(s, objs[i]);
+	kmem_cache_destroy(s);
+	KUNIT_EXPECT_EQ(test, 0, slab_errors);
+}
+
 static void test_kmalloc_redzone_access(struct kunit *test)
 {
 	struct kmem_cache *s = test_kmem_cache_create("TestSlub_RZ_kmalloc", 32,
@@ -535,6 +585,7 @@ static struct kunit_case test_cases[] = {
 #endif
 
 	KUNIT_CASE(test_clobber_redzone_free),
+	KUNIT_CASE(test_freelist_random),
 	KUNIT_CASE(test_kmalloc_redzone_access),
 	KUNIT_CASE(test_kfree_rcu),
 	KUNIT_CASE(test_kfree_rcu_wq_destroy),
diff --git a/mm/slab.h b/mm/slab.h
index 8187ddb2face..b648b33f25c3 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -887,6 +887,9 @@ static inline void dump_unreclaimable_slab(void)
 void ___cache_free(struct kmem_cache *cache, void *x, unsigned long addr);
 
 #ifdef CONFIG_SLAB_FREELIST_RANDOM
+#if IS_ENABLED(CONFIG_KUNIT)
+extern bool slab_freelist_random;
+#endif
 int cache_random_seq_create(struct kmem_cache *cachep, unsigned int count,
 			gfp_t gfp);
 void cache_random_seq_destroy(struct kmem_cache *cachep);
diff --git a/mm/slub.c b/mm/slub.c
index 7e9dadda3d10..8c7b46c2052f 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3424,7 +3424,8 @@ static inline struct slab *alloc_slab_page(gfp_t flags, int node,
 }
 
 #ifdef CONFIG_SLAB_FREELIST_RANDOM
-static bool slab_freelist_random __ro_after_init = true;
+VISIBLE_IF_KUNIT bool slab_freelist_random __ro_after_init = true;
+EXPORT_SYMBOL_IF_KUNIT(slab_freelist_random);
 
 static int __init setup_slab_freelist_random(char *str)
 {
-- 
2.54.0

