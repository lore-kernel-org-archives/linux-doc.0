Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086547;
	b=vreHSLNUYUfMOzpYf5IzKOb6p2O3Asw8BmnkweA7s8ipBv5sWsvXRFKrMaHvp6aEU3Nm
	 OL6Ti38NfgEVoRwBF7QGly/FtYDnOmuOE0m+0ztGw3ueCZCadb36lR/Jcq0+tYnBB1jMx
	 zbTIYgJc0CF42iv7W7vvQIvAnUR/Nx8pUTLNib/4ZhB5Rz1lZq6SNTjvKTmtDaEUSmb/q
	 /wk15Z5u+mUR5hnAqqST5YBTiuTi6zGNb81yYMhQ2S67/A6kr0nOd8H+PFaccvVOEB871
	 NYZA2JE8Pfz8o2iGVviowWZdRTxHvQCm0kzqiUr8WIkObXwEvZI5ybuM9ISJDAlTY7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=sN6UGPpUTXeJgZ2lTe0CetjR/EEvcG4cIahELjc1+Mo=;
	b=tCjMAWd8cxrAW8rpf8j7jrdswFImVcia6p8v2Ex0IA8w23Yn9qw1anXUktQAg7OVeyi3
	 g75fe2TuTCFMNZjI7zYiFnKqwVg7uZFW11cb6EpR/T49SjyrOcMKtwoA/gnj/SE4CWXya
	 9RgY2Jns7dN7OzBhU5N3uLpKzqFYMrtrulCscmDrZazb3JhBDomnk8YremPa5bivtNniM
	 Zet4wDoPBAuB45AN/XysIplhK49HpiHue/Wl/0t11kSjApZqJdjbbPAXbQRZnOxCSCjpF
	 Lyt/NPfQnP/yg29/rdsET5kkify4misn6snt9aFYRUDm3h4YsuuVrFkyBv5Vg5XDS6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=fAiXxZKB;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30392606A31D
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 07:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30392606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=fAiXxZKB
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso2009891b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 00:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086546; x=1793691346; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sN6UGPpUTXeJgZ2lTe0CetjR/EEvcG4cIahELjc1+Mo=;
        b=fAiXxZKBWY8H0gWlOOTToiLfSVY/mehDO8qgrRu+4YIETSxmnjYIO1QbkvuyOtWEJH
         Dqx5WyLbLDt1fRSP6vMZu93WK93ZrbmOpU76q3DEMVxZYZZgM9U/hQm8bHOMh7dgZsWY
         aIlVc7K6drYWA4kDzhZ1Y18RrgHzpDmMc1wG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086546; x=1793691346;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sN6UGPpUTXeJgZ2lTe0CetjR/EEvcG4cIahELjc1+Mo=;
        b=ZXnKK6H14WYBZzHI16K+yYHYy5uCWaGeN9utKX0oajQ8Om29ImYr+Dtw1vw2NdB29n
         ffmuk9mg+KNZL9U3rXfyI2Z151NnENs+kXxtiqlHUNVl26Hvnistj3nlWfYjKhIRu6YJ
         1AfLExmNbfMk5BMyQBeJdFk8y8o1778uaKMIcA1hqSYZ+DIlc8TeyLGeGBkFjNZAGEQh
         mwSYwvboU+qHWxxu9CWVGb3jeRp9WYWbuVmPBrXCkePBTXp5eP5g5q+XIh2C06P8Xgsv
         53i0wD7eDBZ2YfaVO8M/iEr88ouODrWDtRjAQZFKwIdAnrCGUxUGXNYMU1JS3yvrq61T
         vWng==
X-Forwarded-Encrypted: i=1; AKwUvBzfIYwUphYL/hF1jeALpujeg8syjYd/FRB3kplDdV2OeIPY91EwDdPk9QmFT7ECZHGoZ3jrtEBWl+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYINOpuICGGoA7SAU3Iv3LlStb3ECz2o0H9GCfqQnThuZOCey5o/
	pf5xpt/1NPLyVT60IkL9O0xQD2eR2j9/jBeFOoXhqqS1R0l4e88Zpvk6zSXn6eFL82Q=
X-Gm-Gg: AYBFou2IE49V4OMvztevxMLT0gsHlEzR1NottX4CMqu2maXnYlh8aTWK3VljtKrZr9i
	cyOZVeEC/NgbrwsjxdfqH/me0Thy/NY2LEAJJ3zzEigbTH0UK/QNhglTN3TiLSnYmDgntj2a463
	/lnFjb0Q8jqGkBXs6Jkvh26voCIlxTCanDqmHTlon7Mq9FAyty19SQccIV2UEDyS9roqzul04dq
	NJb25tE0Zg4OHijOUT/39YDLr62gi2ayKoHMH+5IU0nSp+/U3fSffb2ek49ORvBkQ2s48u0wYPo
	6xO9i57Ssf25P7xhksvm5vQNu6rhdlhJqCy5l1TbQmDAWRln9dP1+1pLcAnL9/O/RdyIArifDdK
	I2479TnTjR1hu07JwOXSfjGivL8AXHd7JxpnD0+T7/wtLAnvolzpScMSopiIIWQzs2f4wNNi1rk
	ZD4YBHGbzy6W7oghgHxTzF09Qw45QW+aVanUSB4dnH74UDRPXeltNDE33qvsjsPR3S+PcT3v+Bh
	5OcdACF1TjxxbJQIsjgxFk1l+LkyKhNNBPDS12wjAaFmKZjYNer2DZJhNJ1GW/GGfF8EyuXHwEW
	Jt5XNl9qU6d3UzXJMdpNV62dFJ/ui127iWKBp3J6RMcgcZtG8OthW2WJ9LAANh0LZ5ejhC4Qoox
	na/1DCB+FeHKjw69dYlHjZU8=
X-Received: by 2002:a17:90b:4b92:b0:3ac:6fcf:81a2 with SMTP id 98e67ed59e1d1-3adeb137d1cmr7346559a91.57.1793086546607;
        Tue, 27 Oct 2026 00:35:46 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614daasm2511140a91.4.2026.10.27.00.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:35:45 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:35:42 +0800
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
Subject: [PATCH 2/8] slub_kunit: Add a test for slab_freelist_hardened=
Message-ID: <b5bab23337f5448d8a134c71d42a9e3165ba3366.1793086056.git.chris@chrisdown.name>
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
 lib/tests/slub_kunit.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 mm/slub.c              |  2 ++
 2 files changed, 54 insertions(+)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index e3b63f0338d5..5ace73368523 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -9,6 +9,8 @@
 #include <linux/delay.h>
 #include <linux/perf_event.h>
 #include <linux/kprobes.h>
+#include <linux/string_choices.h>
+#include <linux/swab.h>
 #include "../mm/slab.h"
 
 static struct kunit_resource resource;
@@ -107,6 +109,54 @@ static void test_first_word(struct kunit *test)
 	kmem_cache_destroy(s);
 }
 
+static void test_freelist_hardened(struct kunit *test)
+{
+	struct kmem_cache *s = test_kmem_cache_create("TestSlub_freelist_hardened",
+					64, SLAB_CONSISTENCY_CHECKS);
+	bool hardened = slab_freelist_hardened_enabled();
+	unsigned long ptr_addr, raw;
+	void *a, *b, *c;
+
+	a = kmem_cache_alloc(s, GFP_KERNEL);
+	b = kmem_cache_alloc(s, GFP_KERNEL);
+	c = kmem_cache_alloc(s, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, a);
+	KUNIT_ASSERT_NOT_NULL(test, b);
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	if (virt_to_slab(a) != virt_to_slab(b) ||
+	    virt_to_slab(b) != virt_to_slab(c)) {
+		kmem_cache_free(s, a);
+		kmem_cache_free(s, b);
+		kmem_cache_free(s, c);
+		kmem_cache_destroy(s);
+		kunit_skip(test, "objects were allocated from different slabs");
+	}
+
+	/*
+	 * Caches with debug flags have no sheaves, so a and b are pushed onto
+	 * the slab freelist in that order.
+	 */
+	kmem_cache_free(s, a);
+	kmem_cache_free(s, b);
+
+	ptr_addr = (unsigned long)b + s->offset;
+	raw = *(unsigned long *)ptr_addr;
+
+	kunit_info(test, "freelist hardening is %s\n", str_on_off(hardened));
+	KUNIT_EXPECT_EQ(test, raw == (unsigned long)a, !hardened);
+#ifdef CONFIG_SLAB_FREELIST_HARDENED
+	if (hardened)
+		KUNIT_EXPECT_EQ(test, raw,
+				(unsigned long)a ^ s->random ^ swab(ptr_addr));
+#endif
+
+	kmem_cache_free(s, c);
+	validate_slab_cache(s);
+	KUNIT_EXPECT_EQ(test, 0, slab_errors);
+	kmem_cache_destroy(s);
+}
+
 static void test_clobber_50th_byte(struct kunit *test)
 {
 	struct kmem_cache *s = test_kmem_cache_create("TestSlub_50th_word_free",
@@ -480,6 +530,7 @@ static struct kunit_case test_cases[] = {
 #ifndef CONFIG_KASAN
 	KUNIT_CASE(test_next_pointer),
 	KUNIT_CASE(test_first_word),
+	KUNIT_CASE(test_freelist_hardened),
 	KUNIT_CASE(test_clobber_50th_byte),
 #endif
 
@@ -505,5 +556,6 @@ static struct kunit_suite test_suite = {
 };
 kunit_test_suite(test_suite);
 
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_DESCRIPTION("Kunit tests for slub allocator");
 MODULE_LICENSE("GPL");
diff --git a/mm/slub.c b/mm/slub.c
index c82bc626b657..de4937fcb293 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -46,6 +46,7 @@
 #include <linux/prandom.h>
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
+#include <kunit/visibility.h>
 #include <linux/sort.h>
 #include <linux/irq_work.h>
 #include <linux/kprobes.h>
@@ -220,6 +221,7 @@ static DEFINE_STATIC_KEY_FALSE(strict_numa);
  * so it must not change once the first slab has been populated.
  */
 DEFINE_STATIC_KEY_TRUE_RO(slab_freelist_hardened);
+EXPORT_SYMBOL_IF_KUNIT(slab_freelist_hardened);
 static bool slab_freelist_hardened_early __initdata = true;
 
 static int __init setup_slab_freelist_hardened(char *str)
-- 
2.54.0

