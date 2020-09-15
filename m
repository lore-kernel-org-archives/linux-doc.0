Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41871C433E2
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:39:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F368E20809
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:39:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="oYmwUA55"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgIPAjK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgIONXn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:23:43 -0400
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391C8C061221
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:21:17 -0700 (PDT)
Received: by mail-wr1-x449.google.com with SMTP id f18so1212850wrv.19
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=A4TgnPIs4KlOFwMVz2jZ7oTmV4CFA6JHdIybpn/o/fA=;
        b=oYmwUA55tcvUaLXjfS/MZrSItzoh7D6nc9NF+TniY3ZoIx24Ls8Q/UZyvcRB/q/Tad
         aCO/x2/UGHmC8tlOnbemPKF8Fz9QA6KXlPgcUFvuoWXJjhdLNUiERkK0AzVZtW4gc78I
         r3yZX58ua7derhVDvSUCiyP7P8dm372cj6OuHlfBrxf4Df7lXMGOHh1g3PSnwuNFTP+Z
         YnQPVErJVrlKvqOcU4kPbDBSx1gNCL07qGR9NTqDwNLaAk/mg2XSaRfIJ/yFwh6geFZD
         Mv189/jYStN4uSdfpvMjRCvsRILDaR83YRXOsHZHQYKtWbsGtVSpJV9evgpFF0v17Dhr
         JUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=A4TgnPIs4KlOFwMVz2jZ7oTmV4CFA6JHdIybpn/o/fA=;
        b=SBuGp9+YoDsVRzd4LvcAxvBdugikkBfq/SlIK88mxA0j7AsHmr/X9/t1gqlmvr+PZR
         pZxfACQhMZXX4f/Oi/El9ngVhM072SrscFmVzZT+S9Rc7uSNnzFPSZnhtqrws1YNr49O
         qzsZ5Rox0r/yk5PT2QQZwYN+alBhcht0FnLuDd96gy5uCclpK5DBjUftSZaoLNXnHgf6
         spbxrV9EuRb2nqTCg8kLvPwGvRPAaZ2oOUCOi/BxfKyj4rVUG37hpHj6W3trtqeFQqrt
         08cofTJeYgo92jF47ZrW0JBgpqRFctYnR5b7J6QXil8ppTHwsNddHkrVO6nMChEdDd7M
         3GAA==
X-Gm-Message-State: AOAM530q0wEVBWsCv84lrHK0xXCxyrKwbMhww9X9sGtPvt44/LdhDRFq
        kYQY3jrc9PxAW6+Hqa7oRUyLAwxnzA==
X-Google-Smtp-Source: ABdhPJwJ9IZxHT97cXa5uoGFBvjbuWBl7DGE0CrhPkVSiotm4bBDWmiGegcVd7G5e99XRLCFU6KLs1co6Q==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:a1c:80cd:: with SMTP id b196mr4760527wmd.104.1600176075555;
 Tue, 15 Sep 2020 06:21:15 -0700 (PDT)
Date:   Tue, 15 Sep 2020 15:20:43 +0200
In-Reply-To: <20200915132046.3332537-1-elver@google.com>
Message-Id: <20200915132046.3332537-8-elver@google.com>
Mime-Version: 1.0
References: <20200915132046.3332537-1-elver@google.com>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
Subject: [PATCH v2 07/10] kfence, kmemleak: make KFENCE compatible with KMEMLEAK
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

Add compatibility with KMEMLEAK, by making KMEMLEAK aware of the KFENCE
memory pool. This allows building debug kernels with both enabled, which
also helped in debugging KFENCE.

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
2.28.0.618.gf4bc123cb7-goog

