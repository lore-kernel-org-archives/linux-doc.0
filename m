Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7847C47428
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A8B821924
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:39:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B8oKuahj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730214AbgI2NjQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 09:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730094AbgI2NjC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 09:39:02 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E45C061755
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:39:00 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id f21so2513255qve.9
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=3tnm6vmpSMHKvgeLXX0r5hzQnU0w3hMCi/2IZuY8XC4=;
        b=B8oKuahjPhaobOS0+ZDZGeKP9b3kVA3jwzCcxNIsL5l1hg6A5Zc2U7KFaMS3MAGMY0
         O2hL41mHABBucJ709F1NABK5TlE3h6kkzR3QjUDxvA69lT2Vmg+yqtS1B3XgMaAjvzE+
         4mgLADkAmStachF+w18Th9hgSjlkxnNdA2E+2i5jhFaedCK3jmA81x81mzqGH5xIBIyK
         TkMYQ2Kj9iLx5+B4T/SPDvnT0Vw3vVftV8o6Nh1/NgB6hH97rCmgsyRflrUvp714+JV1
         oewV3A8DvxbQp4xOKTchYf3ipkGxIuyOJaeI8Huuw90A7+lq5iDbB1TqBs3kuFRIJ003
         1ODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=3tnm6vmpSMHKvgeLXX0r5hzQnU0w3hMCi/2IZuY8XC4=;
        b=lkBYtkvUFgmuF8dpo+G8z4CbVlwH87idEYhWYxKWX5Xn8KAUFd5WwAuIXAWmtHf8Fl
         KjM/V7s6rr9w2SeVtUeJWbslNOdfahmSSNyhe/RQvFePMeIY9wrcKDBm/XO63L0zTit7
         2t3lrJrfAhR8tFqG5yjD0CtLNbGOxfkYdurYeJ5S6U+5wI+EDGCv9UPAJsuZCgEb6CXd
         Agudkqphyqx8Geulohbr1Hwfb6K3uihxT1BQKjTUA+iwrGHCkwhmpHYiTatdgicJt/JA
         6FO3fl0s9EBf65G1E31thDCiahti91L7q3u+blqGvgAl9nuEPBOmIyA6nAqpUYRV2S1+
         IizA==
X-Gm-Message-State: AOAM532YNNiD8gHCbBXTSeEv3y3bMZXGFQHGJDR3ff7cLC+z8r4/WFj1
        UpOKixTSjtqkxWqa8h9PTJhtaye2fw==
X-Google-Smtp-Source: ABdhPJwtIaHl0p1/67p2AF0f5fwhdcugbouYy5zrrvCrbYXz74CVzZuBR+e9JMHZddr7RXMLFJNheXoidg==
Sender: "elver via sendgmr" <elver@elver.muc.corp.google.com>
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:a0c:fe8b:: with SMTP id d11mr4599326qvs.48.1601386739523;
 Tue, 29 Sep 2020 06:38:59 -0700 (PDT)
Date:   Tue, 29 Sep 2020 15:38:10 +0200
In-Reply-To: <20200929133814.2834621-1-elver@google.com>
Message-Id: <20200929133814.2834621-8-elver@google.com>
Mime-Version: 1.0
References: <20200929133814.2834621-1-elver@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v4 07/11] kfence, kmemleak: make KFENCE compatible with KMEMLEAK
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

Add compatibility with KMEMLEAK, by making KMEMLEAK aware of the KFENCE
memory pool. This allows building debug kernels with both enabled, which
also helped in debugging KFENCE.

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Co-developed-by: Marco Elver <elver@google.com>
Signed-off-by: Marco Elver <elver@google.com>
Signed-off-by: Alexander Potapenko <glider@google.com>
---
v2:
* Rework using delete_object_part() [suggested by Catalin Marinas].
---
 mm/kmemleak.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 5e252d91eb14..feff16068e8e 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -97,6 +97,7 @@
 #include <linux/atomic.h>
 
 #include <linux/kasan.h>
+#include <linux/kfence.h>
 #include <linux/kmemleak.h>
 #include <linux/memory_hotplug.h>
 
@@ -1948,6 +1949,11 @@ void __init kmemleak_init(void)
 		      KMEMLEAK_GREY, GFP_ATOMIC);
 	create_object((unsigned long)__bss_start, __bss_stop - __bss_start,
 		      KMEMLEAK_GREY, GFP_ATOMIC);
+#if defined(CONFIG_KFENCE) && defined(CONFIG_HAVE_ARCH_KFENCE_STATIC_POOL)
+	/* KFENCE objects are located in .bss, which may confuse kmemleak. Skip them. */
+	delete_object_part((unsigned long)__kfence_pool, KFENCE_POOL_SIZE);
+#endif
+
 	/* only register .data..ro_after_init if not within .data */
 	if (&__start_ro_after_init < &_sdata || &__end_ro_after_init > &_edata)
 		create_object((unsigned long)__start_ro_after_init,
-- 
2.28.0.709.gb0816b6eb0-goog

