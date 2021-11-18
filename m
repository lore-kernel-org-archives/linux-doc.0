Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96F2C43219
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 08:14:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FEBD61B44
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 08:14:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244423AbhKRIRq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Nov 2021 03:17:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244247AbhKRIQ5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 03:16:57 -0500
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DBADC06122C
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:43 -0800 (PST)
Received: by mail-wr1-x449.google.com with SMTP id q17-20020adfcd91000000b0017bcb12ad4fso873207wrj.12
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=FxnGx7glVXa5fb5vt97IxdOcLQo6ydeIuX4RCBDcgdw=;
        b=JzkdiCAfhGg1puCqyu7Gsl+OgpTDx9etUPuyNiUexgDmRwNvmteFPISWaLcOxGAqLq
         9DosLJK7r1BjtZ7VJduWE8TJKifTcPcJfLgzlYGR3Z/kyu7tjT3NHRQHF9l24ehmTlCC
         orKe2mqttixGcaP/+prUUVqGluahucnMKt5EtPGuD0ppVMZmAzuCqMPxo7nPc3FNfKFz
         ATUxY5vds/9KHGWQHQ6sYWo/VlJRQ+rYWLpPTW6oGYbaZzWbbyAYQVUWXGYRAhjg302o
         o/DdWseUPPUOUUpUFbVVaoFnkBSoDqCEeTVPtHy2ouz2y3UlkvpRPpISS4SSx05GZlzo
         wxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FxnGx7glVXa5fb5vt97IxdOcLQo6ydeIuX4RCBDcgdw=;
        b=t6okYl95jlD9QwrHslrp6WBLSlTCpjuNu/8jP0eapm95CALZEWF8H/4rACqtJkVnYQ
         dPedZYf7iYn9LIIopySV/oGw0ZZHuXV7azgdGpxRGf3/v1MZoscTyAg8PF+S2iPOpPzr
         DWPXDi+o73C8lLPYXUibfakqs0nj7KRTGPRfkizS0hs/rbF7OHd73llvIHUwyxHjdgOV
         /18ZrZkyRMtpjansDzN8/3OFvoyR9+vBGWp4wSkKY6InXmYJZY/hzQPsw/FOxZ/qGdaZ
         woRXUc+dp0nJWKsMNL+KzNWvGJIQkGPkjcHAawD6q/SCOP8o7u1Esd7mkl0RdReMRO7s
         D7jA==
X-Gm-Message-State: AOAM532Y87Ra9J7YLnXfivx2VZKbRg1PsEzKOlANDPu0tofM8bWouQH1
        eo2pwFgB/4/GQhify/WzcnlzlH+jBg==
X-Google-Smtp-Source: ABdhPJz6FEP6GyzxCsPawUoKdjXDHZ0RCNsA/bONWiEy1yb4suQyU+ePefNEIdgwlRx7lrw+TRjThbgJRw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:7155:1b7:fca5:3926])
 (user=elver job=sendgmr) by 2002:a05:600c:1d01:: with SMTP id
 l1mr7928633wms.44.1637223102036; Thu, 18 Nov 2021 00:11:42 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:10:22 +0100
In-Reply-To: <20211118081027.3175699-1-elver@google.com>
Message-Id: <20211118081027.3175699-19-elver@google.com>
Mime-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2 18/23] x86/barriers, kcsan: Use generic instrumentation for
 non-smp barriers
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Prefix all barriers with __, now that asm-generic/barriers.h supports
defining the final instrumented version of these barriers. The change is
limited to barriers used by x86-64.

Signed-off-by: Marco Elver <elver@google.com>
---
 arch/x86/include/asm/barrier.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/barrier.h b/arch/x86/include/asm/barrier.h
index 3ba772a69cc8..35389b2af88e 100644
--- a/arch/x86/include/asm/barrier.h
+++ b/arch/x86/include/asm/barrier.h
@@ -19,9 +19,9 @@
 #define wmb() asm volatile(ALTERNATIVE("lock; addl $0,-4(%%esp)", "sfence", \
 				       X86_FEATURE_XMM2) ::: "memory", "cc")
 #else
-#define mb() 	asm volatile("mfence":::"memory")
-#define rmb()	asm volatile("lfence":::"memory")
-#define wmb()	asm volatile("sfence" ::: "memory")
+#define __mb()	asm volatile("mfence":::"memory")
+#define __rmb()	asm volatile("lfence":::"memory")
+#define __wmb()	asm volatile("sfence" ::: "memory")
 #endif
 
 /**
@@ -51,8 +51,8 @@ static inline unsigned long array_index_mask_nospec(unsigned long index,
 /* Prevent speculative execution past this barrier. */
 #define barrier_nospec() alternative("", "lfence", X86_FEATURE_LFENCE_RDTSC)
 
-#define dma_rmb()	barrier()
-#define dma_wmb()	barrier()
+#define __dma_rmb()	barrier()
+#define __dma_wmb()	barrier()
 
 #define __smp_mb()	asm volatile("lock; addl $0,-4(%%" _ASM_SP ")" ::: "memory", "cc")
 
-- 
2.34.0.rc2.393.gf8c9666880-goog

