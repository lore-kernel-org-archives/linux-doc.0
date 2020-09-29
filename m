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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B9AC4742A
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:39:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D474E20848
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:39:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UOSBvRZB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730161AbgI2NjQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 09:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729958AbgI2NjD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 09:39:03 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36EDC0613D4
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:39:02 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id p43so2971299qtb.23
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=vVOlNt/WCejDp1JOCEsvSSdVHILjJnc43Mcb0PKSl94=;
        b=UOSBvRZBZKrpnksJMXA3OOhNYA+IsYKy4qy9MiaMAWv4Qmco6I0lGG/1E1y4vY58vz
         CZBn6KJFIpSQPzI+0qHZF+n9AKpdnR1c/FcXU2vi9d6AcLaxN+0h2+6lKxpJ+VwD/Fb0
         l3hIQBgDmYX4Qqem9eqXPEynllsNkpk/ipyQ/c4kOJwGgN0Mahu/+1w7p7blTpkFPPDH
         eBthRpEWp+J41zyd12Z9gm0BLrS+hsDfGa9rRHXKGig2x9ktsb/VO1/Z+5uzlxgK3Imv
         TxFCLtBlLbW0IQrbRuWQz26NF7uEVM4FpTthHS8NRQsg6B3mcVsX1dkd9vbBMEbwjd3+
         Bw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=vVOlNt/WCejDp1JOCEsvSSdVHILjJnc43Mcb0PKSl94=;
        b=DbNI+gETKJ3hGCnZlYzS7SmoyYquTuw/QhCKTjvYoSKNYGQPW99V8D6u0nYZVBOU5v
         d9xln3YSxvUnjqpOLFw3V2nbWKjuosWWU3XaGvwRTmrtWeJwUPiyc9V9VzwYN6xKtreR
         1+wFnNOXyeDXKs7VAiku+DvF52NoAkwPE7WzMMHxR9HIpn1Qp17kx6BePTBU1F4YqVVe
         ww0TKLZWgTDnstj9AWMw5QnVpqJunn0DY/mHykH7NA4PcYsGXuYmnloJNELJ6l7BlSqn
         EklaUW8PA6aFyfXOMWKTiXOzEjYCgXX8b2lgrAW1bIJUbxLLpoQ61lBgnTGi//EX5INY
         eCxA==
X-Gm-Message-State: AOAM530mVtkvaRMfguVEeKjQHFJF3GBGub/SOO/vjMj757Yltaprvk5+
        LVxJmHRWDQLRYzIeejxbA3kIolUJtA==
X-Google-Smtp-Source: ABdhPJxPHumSkQ+1sRW54lJFlDtPVwTgrVQLDVfUTBhLd4jdPTbPDJavbzzqCAAj2yGSJ8AXrL9sZ4EW2w==
Sender: "elver via sendgmr" <elver@elver.muc.corp.google.com>
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:a0c:f6c4:: with SMTP id d4mr4373033qvo.41.1601386741788;
 Tue, 29 Sep 2020 06:39:01 -0700 (PDT)
Date:   Tue, 29 Sep 2020 15:38:11 +0200
In-Reply-To: <20200929133814.2834621-1-elver@google.com>
Message-Id: <20200929133814.2834621-9-elver@google.com>
Mime-Version: 1.0
References: <20200929133814.2834621-1-elver@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v4 08/11] kfence, lockdep: make KFENCE compatible with lockdep
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
2.28.0.709.gb0816b6eb0-goog

