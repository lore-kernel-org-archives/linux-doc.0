Return-Path: <SRS0=TOdD=C6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA31C43465
	for <linux-doc@archiver.kernel.org>; Mon, 21 Sep 2020 13:27:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CDB921789
	for <linux-doc@archiver.kernel.org>; Mon, 21 Sep 2020 13:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h0DABlib"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbgIUN1V (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Sep 2020 09:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727265AbgIUN0w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Sep 2020 09:26:52 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BCBC0613CF
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2020 06:26:52 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id h191so10907943qke.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2020 06:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=k1T9dYB7DJoZ+u+nVe3kaxMkFtqFlEoHZfLN0p/pvEE=;
        b=h0DABlibHB7v95H3LhOc4lIx2a+JuJCaG5dCjxY69vhbTwo2OewB2jqrcfxfSAWImf
         0rilrwD74EdgNZkNctrYhdK0BKQa1IFxA96Sn77Ss9MbjCIxt55LT+Db94EGESOvWC61
         FNhFsNV1l+s2LYwjRiVeyI/gY07VtoOl0G4eY13mJqePxG7L0c4mXQ3OowvJ26BmA67c
         26EMpkQ2n7OL6XdtoU4I2iAZTKdgLhn27yeHPdjeTgGW4u+Pr5ofUSUfQP/ixCP+f2or
         3yp/zGKOxnf1szBrwX417xIk13JJ29F0GqtqSoNssPh6hTcAf0X+yRRllGTo8pXmlpeV
         KA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=k1T9dYB7DJoZ+u+nVe3kaxMkFtqFlEoHZfLN0p/pvEE=;
        b=n3ltXTrF++aSc3lSpLNZkmw3bT8IMB+cTnMT+BPhpuo8Dx9MliOMiuZVnIaOT7hGEw
         GU2heCQrV4uNnxFbA1dfy5X3K/op1iMwYrXJQ7Bg2gqGaMM0X9KRmlmbXnWNvi/8aHwz
         N3kNdfxF32fvIjH4YmcE3hUWKEp1Px/zXntlu8JOQLdwn+NCBfQA4A2uMXP+/WqxSWyU
         BnrGfkOsEWIXxsske1P41WSzpg/p+DcZf9Av6qLUg8ueKsL24LiHlIuv0l1rPYWHSGaf
         Qd2K/9mksES/EDYYn7IHLq2fiTMyKAU7qJxdV1XzsEfy+KsReF7OKpQqNIv1NextpoUb
         ntDA==
X-Gm-Message-State: AOAM530mGfkbrCYrOGNVmQ4ZDeJhL2V7FuHFGn2C+WktN0+ZM/OaBKCG
        D6fbINJWTE0i79PkplNTFc3FTqyLIA==
X-Google-Smtp-Source: ABdhPJxI5BBppzUwl+FURSlYJ/XsuSII2/6RzrI0Ei9BEoIUMUq9N7cECIXnXgK6ZUjbLhwm9DwnPw5xLg==
Sender: "elver via sendgmr" <elver@elver.muc.corp.google.com>
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:ad4:4af4:: with SMTP id cp20mr30110353qvb.40.1600694811561;
 Mon, 21 Sep 2020 06:26:51 -0700 (PDT)
Date:   Mon, 21 Sep 2020 15:26:07 +0200
In-Reply-To: <20200921132611.1700350-1-elver@google.com>
Message-Id: <20200921132611.1700350-7-elver@google.com>
Mime-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v3 06/10] kfence, kasan: make KFENCE compatible with KASAN
From:   Marco Elver <elver@google.com>
To:     elver@google.com, akpm@linux-foundation.org, glider@google.com
Cc:     hpa@zytor.com, paulmck@kernel.org, andreyknvl@google.com,
        aryabinin@virtuozzo.com, luto@kernel.org, bp@alien8.de,
        catalin.marinas@arm.com, cl@linux.com, dave.hansen@linux.intel.com,
        rientjes@google.com, dvyukov@google.com, edumazet@google.com,
        gregkh@linuxfoundation.org, hdanton@sina.com, mingo@redhat.com,
        jannh@google.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
        iamjoonsoo.kim@lge.com, keescook@chromium.org,
        mark.rutland@arm.com, penberg@kernel.org, peterz@infradead.org,
        sjpark@amazon.com, tglx@linutronix.de, vbabka@suse.cz,
        will@kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
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
 lib/Kconfig.kfence | 2 +-
 mm/kasan/common.c  | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
index 4c2ea1c722de..6825c1c07a10 100644
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
2.28.0.681.g6f77f65b4e-goog

