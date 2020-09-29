Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F632C47427
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:39:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 159B021D7D
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:39:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="er322a8g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730043AbgI2Ni7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 09:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730035AbgI2Ni6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 09:38:58 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E5FC061755
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:38:58 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id o14so2506205qve.7
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=3PLfj7Le+IfBX8a0VvW3RStHbDZmDhyxflksdHuR0eA=;
        b=er322a8geG68qcfF8M1guZNd7UF3m56ZBe9jI1gKY2Ai9rDqkC+XsPfeQe+Gxco71+
         st8n9YtVCR4QANduoS54PpgWIz6J6ookqFiPylQPXIYD80aa0kVkBrI0GQMqzxcB+L3d
         aK7WiVxjzJ7vvUxnxIXhu0PvEQrzs4dw2UMzTlKskDDz8x0rnH18gN/SfzheEov2h57l
         oFMlpwpiR91ep+fcSlbc+dDINYyQ4dbf4MDNW6tu4aGiRvHBQ4H9axwpHrbwzJ6MXPWd
         5BkMRw14eXNd/hu+SzMv1DIKxLS/ayUiiOLZSf5jQ1MonoUT6ctvp7gvSgeTZSRC51OM
         Yeaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=3PLfj7Le+IfBX8a0VvW3RStHbDZmDhyxflksdHuR0eA=;
        b=rC6j/Ciz7T42HoBXyc2tzbUBoVonitjoQ+ow+AQzCWHHfq9FE2lLmnFafbydLrPoYJ
         lOIRgj/jIklvWn2cbYSednqsDf3jXRy7pQ54UBOIxZ5glWeGtR+SjxnJbU44+mJqtAaE
         sNoArDYWFzLWziDk6CokMj3ZkFblIQNmmmR+0mphNqFEqZZ08MVq7ANCXc0jxFVBKr6O
         RUhYa7hLlMckW26r/9upcIgExFGUYr83r7mN5PsNIeCwYT/XGUFkakxC6pdRjLLwWtBU
         Pyucr3E5iKkiCwAul9+ym/wn1iGaXRTr9ZE24+xPxogDxZMVo3/5UZcwiJIY0OsIdr8a
         Xy4A==
X-Gm-Message-State: AOAM532318Mv42gy5poYfmY/da46MzLJdopHAenwl6IUrOZJf+YyvzKV
        7aAIHB9rs6ngpCCnjx3FiCXjIGVOCQ==
X-Google-Smtp-Source: ABdhPJxJbcDYckRS0wVuzRySp2nuYSOJOG2pvGym1ZUIs47gMLvaU61ksR2fPMifrMOlNYqiUa3bx3KdoA==
Sender: "elver via sendgmr" <elver@elver.muc.corp.google.com>
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:a05:6214:b0d:: with SMTP id
 u13mr4600352qvj.17.1601386737145; Tue, 29 Sep 2020 06:38:57 -0700 (PDT)
Date:   Tue, 29 Sep 2020 15:38:09 +0200
In-Reply-To: <20200929133814.2834621-1-elver@google.com>
Message-Id: <20200929133814.2834621-7-elver@google.com>
Mime-Version: 1.0
References: <20200929133814.2834621-1-elver@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v4 06/11] kfence, kasan: make KFENCE compatible with KASAN
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
2.28.0.709.gb0816b6eb0-goog

