Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF28C2D0A3
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 13:17:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4973B20732
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 13:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kQJZtCyA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgJ2NRQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Oct 2020 09:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgJ2NRP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 09:17:15 -0400
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37151C0613CF
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 06:17:15 -0700 (PDT)
Received: by mail-wm1-x34a.google.com with SMTP id y13so465788wmj.7
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 06:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=MDxWQURSl79g8vKPdG5uHAVWcBR/CQ6D0GDay6Dns1U=;
        b=kQJZtCyAjs6lBIZl6M96SWe1LnR8kpabQD8Fy+8pAgMgKbEuOFIyCrpy6wfOXCw2/p
         9ZagryngHTQS2HvLFfpcG9gPJ+G1tXFcG2pbAW5wd2iBRpwHNRPdvcatZG3UhMoqpAF2
         ZZiC7KFjIpRZOvWEtiYrwNGwupA73SczxDjpZwhnuaWaN0Ke5NtQM3//jXL9XWjOHmXZ
         MkGZ73JdSkLq+TxhjDetAIxGstREfAbKu7WPvQ231Lv+4LGRoRm3tLfpwZwDIbAnoFkx
         E5kILUZJ60tJnonGxepa3ElL6illiCAPgpl6vE1zbwnzRtEcmGmWRQ+IKAcFRDnvdGuY
         Nj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=MDxWQURSl79g8vKPdG5uHAVWcBR/CQ6D0GDay6Dns1U=;
        b=cBzIhnqPwUTSeL7ZpylX+Lsur9fuy2vkKX0LGz1Anh4SDzeaEfmA22EJ4HFGRwNPxQ
         7Sh8tAK2JIjqerAsmkGhJbYZJ0w3vzZ5nn4omLygnQsKzmdhaBsQ/ZJFljCcdMkhS/vN
         XIS6NF70wdg8heRXGHXir9oDLb16uCTmrKwepvZc5p6y84r0qW1xoJGuuefVX/uk/IlD
         JHktDk1qIsCk7J1fqSgJzHcDjMzjKfZp1TxiSdhNYN3BqfHzqH8B/RtkBSatzzgXYUVW
         77V5fNI0GK3VjPOAihiTZ6Wv0QqSZDTppbfY7vovcQ5MZP9SnHKUloIsPO/K8pwqHBmb
         p06Q==
X-Gm-Message-State: AOAM530UyZAclq/mnS3e9efRyFDklelJuqRpGu/GCN1coYRzTSF/oRy4
        13Rj1hNqfF8qLVSQqP7ifuDgEF7jGg==
X-Google-Smtp-Source: ABdhPJwtl8iFb0b8559uBiSux7XVBqCBPqzo+++eeYJgPPUGzTPe4wnLZlOGRZttf8xQ8fTS3kLmR6uqjQ==
Sender: "elver via sendgmr" <elver@elver.muc.corp.google.com>
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:a1c:2901:: with SMTP id p1mr4533662wmp.170.1603977433686;
 Thu, 29 Oct 2020 06:17:13 -0700 (PDT)
Date:   Thu, 29 Oct 2020 14:16:46 +0100
In-Reply-To: <20201029131649.182037-1-elver@google.com>
Message-Id: <20201029131649.182037-7-elver@google.com>
Mime-Version: 1.0
References: <20201029131649.182037-1-elver@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v6 6/9] kfence, kasan: make KFENCE compatible with KASAN
From:   Marco Elver <elver@google.com>
To:     elver@google.com, akpm@linux-foundation.org, glider@google.com
Cc:     hpa@zytor.com, paulmck@kernel.org, andreyknvl@google.com,
        aryabinin@virtuozzo.com, luto@kernel.org, bp@alien8.de,
        catalin.marinas@arm.com, cl@linux.com, dave.hansen@linux.intel.com,
        rientjes@google.com, dvyukov@google.com, edumazet@google.com,
        gregkh@linuxfoundation.org, hdanton@sina.com, mingo@redhat.com,
        jannh@google.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
        iamjoonsoo.kim@lge.com, joern@purestorage.com,
        keescook@chromium.org, mark.rutland@arm.com, penberg@kernel.org,
        peterz@infradead.org, sjpark@amazon.com, tglx@linutronix.de,
        vbabka@suse.cz, will@kernel.org, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
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

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Co-developed-by: Marco Elver <elver@google.com>
Signed-off-by: Marco Elver <elver@google.com>
Signed-off-by: Alexander Potapenko <glider@google.com>
---
v5:
* Also guard kasan_unpoison_shadow with is_kfence_address(), as it may
  be called from SL*B internals, currently ksize().
* Make kasan_record_aux_stack() compatible with KFENCE, which may be
  called from outside KASAN runtime.
---
 lib/Kconfig.kfence |  2 +-
 mm/kasan/common.c  | 15 +++++++++++++++
 mm/kasan/generic.c |  3 ++-
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
index d24baa3bce4a..639b48cc75d4 100644
--- a/lib/Kconfig.kfence
+++ b/lib/Kconfig.kfence
@@ -5,7 +5,7 @@ config HAVE_ARCH_KFENCE
 
 menuconfig KFENCE
 	bool "KFENCE: low-overhead sampling-based memory safety error detector"
-	depends on HAVE_ARCH_KFENCE && !KASAN && (SLAB || SLUB)
+	depends on HAVE_ARCH_KFENCE && (!KASAN || EXPERT) && (SLAB || SLUB)
 	depends on JUMP_LABEL # To ensure performance, require jump labels
 	select STACKTRACE
 	help
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 950fd372a07e..ac1d404fb41e 100644
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
@@ -141,6 +142,14 @@ void kasan_unpoison_shadow(const void *address, size_t size)
 	 */
 	address = reset_tag(address);
 
+	/*
+	 * We may be called from SL*B internals, such as ksize(): with a size
+	 * not a multiple of machine-word size, avoid poisoning the invalid
+	 * portion of the word for KFENCE memory.
+	 */
+	if (is_kfence_address(address))
+		return;
+
 	kasan_poison_shadow(address, size, tag);
 
 	if (size & KASAN_SHADOW_MASK) {
@@ -396,6 +405,9 @@ static bool __kasan_slab_free(struct kmem_cache *cache, void *object,
 	tagged_object = object;
 	object = reset_tag(object);
 
+	if (is_kfence_address(object))
+		return false;
+
 	if (unlikely(nearest_obj(cache, virt_to_head_page(object), object) !=
 	    object)) {
 		kasan_report_invalid_free(tagged_object, ip);
@@ -444,6 +456,9 @@ static void *__kasan_kmalloc(struct kmem_cache *cache, const void *object,
 	if (unlikely(object == NULL))
 		return NULL;
 
+	if (is_kfence_address(object))
+		return (void *)object;
+
 	redzone_start = round_up((unsigned long)(object + size),
 				KASAN_SHADOW_SCALE_SIZE);
 	redzone_end = round_up((unsigned long)object + cache->object_size,
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 248264b9cb76..1069ecd1cd55 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -21,6 +21,7 @@
 #include <linux/init.h>
 #include <linux/kasan.h>
 #include <linux/kernel.h>
+#include <linux/kfence.h>
 #include <linux/kmemleak.h>
 #include <linux/linkage.h>
 #include <linux/memblock.h>
@@ -332,7 +333,7 @@ void kasan_record_aux_stack(void *addr)
 	struct kasan_alloc_meta *alloc_info;
 	void *object;
 
-	if (!(page && PageSlab(page)))
+	if (is_kfence_address(addr) || !(page && PageSlab(page)))
 		return;
 
 	cache = page->slab_cache;
-- 
2.29.1.341.ge80a0c044ae-goog

