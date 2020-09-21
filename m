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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8F8C4346A
	for <linux-doc@archiver.kernel.org>; Mon, 21 Sep 2020 13:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72ED221BE5
	for <linux-doc@archiver.kernel.org>; Mon, 21 Sep 2020 13:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AwQ3SH4R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbgIUN1N (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Sep 2020 09:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbgIUN05 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Sep 2020 09:26:57 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66277C061755
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2020 06:26:57 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id a16so12817784qtj.7
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2020 06:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=+R3FkgLg/uUxAfttfYVSjxdiI+HJZltSBRxJWgKHPWI=;
        b=AwQ3SH4RPdmBRFAyoSOJHU//nXO51R9eb6z2HWBBP/5KLsyCveVvAjoS/15dev1nHk
         C1V6mTtovAY3Pzkn8XqqyXRcPtoZVTxMDg8Lp1weN8lPN8YN3uLOinjVacYCllLMgok5
         f8ha/FnRT9SaJb+NLdV7pTTsSpCC3hub0bb12gt3j8skHWk/JUktSY1U4lt6/xjuVoYP
         Y8nZ69cULu3nVdjxXK3zwVHwE7HMrbUr9dFp35w3c6SkDDqYTt2E/6153FiTwMQdZRnX
         Q2lU7puug9u1gp2aen8hAYYse1dBtG4FTtkn9TLUxm7/9W/TmRC5Poh9NfcYqpi2wrIH
         RplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+R3FkgLg/uUxAfttfYVSjxdiI+HJZltSBRxJWgKHPWI=;
        b=XlXN8soy276pCAb3/Fvo+k3iCI9rSlhEu3w/7n/veBIlr7gsE7NPbLDVAHwWePWFC6
         uLJ6aJiBmEw+I4NZ0bPXosz2Kzlj3hn/V4ZItQlLJSkjwnC/lCSX52u1Or1JItmo5nFY
         pqBPmHXqoPmcAxWBa767RD80UwrC/G1+kCQUf76D5fRiHfqpvfBk874ywbaCxjm5QqRm
         GfOXg/mGH4WldP6cM/HIQNvZHZKqWAp2d7GDrPjPtHZeUXL1DrbUc7771gr5/l3n8eDu
         9TLA1aEbVrSnKYblA5tiLJrf/KajIJOo4PwRjoXizSahdE1dORzn6B3FdhMpyhMUg/Bn
         vyeg==
X-Gm-Message-State: AOAM5328E4ydMpgedVcXCunaezpO3KGu+DsmiOA6AyDqisn2Q8V9RUgm
        4hu7BTpLzGFe84rO3DjPtgv8S4W26g==
X-Google-Smtp-Source: ABdhPJzdcj1vXa9IRzgIJT+0KIMH13pc+xxOpm4AAO5fmze8y5104JWt6jdjS+3w6lHF/NGj6w+Ksxvu5Q==
Sender: "elver via sendgmr" <elver@elver.muc.corp.google.com>
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:a0c:c709:: with SMTP id w9mr46105935qvi.26.1600694816482;
 Mon, 21 Sep 2020 06:26:56 -0700 (PDT)
Date:   Mon, 21 Sep 2020 15:26:09 +0200
In-Reply-To: <20200921132611.1700350-1-elver@google.com>
Message-Id: <20200921132611.1700350-9-elver@google.com>
Mime-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v3 08/10] kfence, lockdep: make KFENCE compatible with lockdep
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

Lockdep checks that dynamic key registration is only performed on keys
that are not static objects. With KFENCE, it is possible that such a
dynamically allocated key is a KFENCE object which may, however, be
allocated from a static memory pool (if HAVE_ARCH_KFENCE_STATIC_POOL).

Therefore, ignore KFENCE-allocated objects in static_obj().

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Co-developed-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/locking/lockdep.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 54b74fabf40c..0cf5d5ecbd31 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -38,6 +38,7 @@
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/kallsyms.h>
+#include <linux/kfence.h>
 #include <linux/interrupt.h>
 #include <linux/stacktrace.h>
 #include <linux/debug_locks.h>
@@ -755,6 +756,13 @@ static int static_obj(const void *obj)
 	if (arch_is_kernel_initmem_freed(addr))
 		return 0;
 
+	/*
+	 * KFENCE objects may be allocated from a static memory pool, but are
+	 * not actually static objects.
+	 */
+	if (is_kfence_address(obj))
+		return 0;
+
 	/*
 	 * static variable?
 	 */
-- 
2.28.0.681.g6f77f65b4e-goog

