Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918BCC433E2
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:38:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 518192080C
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:38:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="d3vnLLe0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgIPAh6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgIONXn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:23:43 -0400
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C964EC061225
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:21:18 -0700 (PDT)
Received: by mail-ed1-x549.google.com with SMTP id c3so1244158edm.7
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=PB2wGlTtPDen/ye2PAmCBJ5c7LyFB91+1y/zC60t16Q=;
        b=d3vnLLe0U27rdkUw/utMWI85Xqzo+BSvZHBoRRA5UpSEUiwObUd8MUdZPiQgUmCxJE
         UU7k9SmgcCbhS4xrIxHj/eIp9ga6OFHSD46K5FKAmZYBXjgdal+8pkIlzG+mp0MI0XOB
         HujQdhVlUlkQxdr6yevSBsMmhuVb5bbisjqvlAf1r15ix/2aSUTJ2Utmuf7L0CqvDx7Y
         /laxAwwfx+jMKKTFN6ycu3qqnSv2HlzUfsdq9YQyJ8lfYi2Z8kg4YXMkBRuJuKfzcpjO
         zz2n+hfmdsfxaSK8J2mJIbjQ6WNkfgf8NRADMQVSV6ljxs+unDr1HFk+WXNbQE28Rmen
         p5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=PB2wGlTtPDen/ye2PAmCBJ5c7LyFB91+1y/zC60t16Q=;
        b=lGsfviku/PkBdADkuYSncKKUjheZDY53snUO6QQOoySMwLjgiI7xmDOZV6rG6WeEVI
         hRr9by4N1CVf76Yvl/bM8RN+Gl6i+Y2jYJRghSlYM3w2EuN4kVJffTc+gQmFVtJSZgn5
         TJNHZeuJz4r1tZ9yNDzdjXNqgbkgNQdNy8cNIZ9j7HKYFMxp1QuBvMiquYARIv27daB3
         qAvz0o3ZOqMPqRmUjRUJnmBq6JxqiDn+/AxslaR+VR/GAsc4BF3Qt/fy/iPQcLp5f/VU
         ttSbCGZNRRQwcoSLY+wHp5/tTJt6zbH+nTxhvDRzpKVEJjdUUpMbqPCJq8cyHF4bYUvf
         ukjQ==
X-Gm-Message-State: AOAM532I0mBCSYx8r/FaWsIS7nh8NWNILXEn5L931yK91Hy3apy/YJD8
        VURJ8zubkNYlUsuIkiMIO44YLr6tCg==
X-Google-Smtp-Source: ABdhPJyR9PqthVFqW2D/mp1NRmsTwOdF86pvoPu4AcBXbRv/V6Z/eH3CtUVQX2fa/YvMlBOBYNXzgwBGqQ==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:a17:907:264c:: with SMTP id
 ar12mr20711635ejc.80.1600176073238; Tue, 15 Sep 2020 06:21:13 -0700 (PDT)
Date:   Tue, 15 Sep 2020 15:20:42 +0200
In-Reply-To: <20200915132046.3332537-1-elver@google.com>
Message-Id: <20200915132046.3332537-7-elver@google.com>
Mime-Version: 1.0
References: <20200915132046.3332537-1-elver@google.com>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
Subject: [PATCH v2 06/10] kfence, kasan: make KFENCE compatible with KASAN
From:   Marco Elver <elver@google.com>
To:     elver@google.com, akpm@linux-foundation.org, glider@google.com
Cc:     hpa@zytor.com, paulmck@kernel.org, andreyknvl@google.com,
        aryabinin@virtuozzo.com, luto@kernel.org, bp@alien8.de,
        catalin.marinas@arm.com, cl@linux.com, dave.hansen@linux.intel.com,
        rientjes@google.com, dvyukov@google.com, edumazet@google.com,
        gregkh@linuxfoundation.org, mingo@redhat.com, jannh@google.com,
        Jonathan.Cameron@huawei.com, corbet@lwn.net,
        iamjoonsoo.kim@lge.com, keescook@chromium.org,
        mark.rutland@arm.com, penberg@kernel.org, peterz@infradead.org,
        cai@lca.pw, tglx@linutronix.de, vbabka@suse.cz, will@kernel.org,
        x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alexander Potapenko <glider@google.com>

We make KFENCE compatible with KASAN for testing KFENCE itself. In
particular, KASAN helps to catch any potential corruptions to KFENCE
state, or other corruptions that may be a result of freepointer
corruptions in the main allocators.

To indicate that the combination of the two is generally discouraged,
CONFIG_EXPERT=y should be set. It also gives us the nice property that
KFENCE will be build-tested by allyesconfig builds.

Co-developed-by: Marco Elver <elver@google.com>
Signed-off-by: Marco Elver <elver@google.com>
Signed-off-by: Alexander Potapenko <glider@google.com>
---
 lib/Kconfig.kfence | 2 +-
 mm/kasan/common.c  | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
index 6a90fef41832..872bcbdd8cc4 100644
--- a/lib/Kconfig.kfence
+++ b/lib/Kconfig.kfence
@@ -10,7 +10,7 @@ config HAVE_ARCH_KFENCE_STATIC_POOL
 
 menuconfig KFENCE
 	bool "KFENCE: low-overhead sampling-based memory safety error detector"
-	depends on HAVE_ARCH_KFENCE && !KASAN && (SLAB || SLUB)
+	depends on HAVE_ARCH_KFENCE && (!KASAN || EXPERT) && (SLAB || SLUB)
 	depends on JUMP_LABEL # To ensure performance, require jump labels
 	select STACKTRACE
 	help
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 950fd372a07e..f5c49f0fdeff 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/kasan.h>
 #include <linux/kernel.h>
+#include <linux/kfence.h>
 #include <linux/kmemleak.h>
 #include <linux/linkage.h>
 #include <linux/memblock.h>
@@ -396,6 +397,9 @@ static bool __kasan_slab_free(struct kmem_cache *cache, void *object,
 	tagged_object = object;
 	object = reset_tag(object);
 
+	if (is_kfence_address(object))
+		return false;
+
 	if (unlikely(nearest_obj(cache, virt_to_head_page(object), object) !=
 	    object)) {
 		kasan_report_invalid_free(tagged_object, ip);
@@ -444,6 +448,9 @@ static void *__kasan_kmalloc(struct kmem_cache *cache, const void *object,
 	if (unlikely(object == NULL))
 		return NULL;
 
+	if (is_kfence_address(object))
+		return (void *)object;
+
 	redzone_start = round_up((unsigned long)(object + size),
 				KASAN_SHADOW_SCALE_SIZE);
 	redzone_end = round_up((unsigned long)object + cache->object_size,
-- 
2.28.0.618.gf4bc123cb7-goog

