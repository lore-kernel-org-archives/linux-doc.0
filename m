Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CDEC433F5
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 11:01:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5126861186
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 11:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234335AbhJELDP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Oct 2021 07:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234534AbhJELCq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 07:02:46 -0400
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4BCC0617BE
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 04:00:19 -0700 (PDT)
Received: by mail-wm1-x34a.google.com with SMTP id z22-20020a7bc7d6000000b0030d5c26120fso923479wmk.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 04:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bAriFda77KQSvkeLAdzIsmSKLo4uFZFQooRrd/rm25s=;
        b=ets2sLEUSeqf2WMRaL5hYWDn8l6wE1b2w/7sDfXLO4KLhXBCQaC4kOgTp19Encefnw
         jYlLY4PKK2IXcJgFESqwEwHrZ5Td7G1niHpPxgaOkxLTiG61GgRatpK7/qrJkQXD7oP9
         yaY9tMHF1HG+L9wTNS1oF4p+m/n35XBPrQDyduB0jHpnbJDmIoe1ltVAk5mXWxmU1jVM
         pUH1claWzDggDOIxpc04wW2LCQRNVt+OSpPe5M8kEB7gcagf6pi5RmJ/PcJruJkwx9UN
         cJTZy5YARZkTft5TnnPUQHgutpPljmQ+lyq6vgDFFUpJk/MWohfufIVbaPqOOABrRjWb
         6kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bAriFda77KQSvkeLAdzIsmSKLo4uFZFQooRrd/rm25s=;
        b=ys4EEzaLeTmqGQE4VfZt/a/1Vx1tRiBjltmyVBrtiqsoyBktwG+AwNSpl2+FXWNXkg
         osEAeCVcgWTbI2Br03m89+HLBdS7llrY52lUvHdfQb99ZL7Kvp9mFF6qOR0r1NYvKHXT
         LIsS7oVCYPTRslWN3mAKC8OMeAmnQCssmqry/D3hH5tq2GxjSZXuAmLtc8UM7n9H90jj
         fmWHhB4uLeJyw6efYQ36h1dwyDxEv3ZNt0M4KVOEwMjUdf1CePMn7psIEW6iKnE9Aj85
         tQrnQIGvfEgBv5RbJdjjpaLDopT5TP9SYy72afUcXBO5oVyOAvuoUG6Wn0DfLdyHSxZZ
         AAMA==
X-Gm-Message-State: AOAM532jb/enWcky5fQzelxbYHd5QuCq1ThXV2QB2acmNXeAolBuHDfO
        ZDdO4OWR2PIJjr3VaVZRPH+ky1WZew==
X-Google-Smtp-Source: ABdhPJxwiOSTStDBneaFQWWQkzxn7TeSivNZJE5WBv37pW+d6gP/rGHoYZw5KmilYcs0foSm3DlIC4Lt7Q==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:e44f:5054:55f8:fcb8])
 (user=elver job=sendgmr) by 2002:a5d:6084:: with SMTP id w4mr17452146wrt.176.1633431618057;
 Tue, 05 Oct 2021 04:00:18 -0700 (PDT)
Date:   Tue,  5 Oct 2021 12:58:57 +0200
In-Reply-To: <20211005105905.1994700-1-elver@google.com>
Message-Id: <20211005105905.1994700-16-elver@google.com>
Mime-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH -rcu/kcsan 15/23] locking/barriers, kcsan: Support generic instrumentation
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E . McKenney" <paulmck@kernel.org>
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

Thus far only smp_*() barriers had been defined by asm-generic/barrier.h
based on __smp_*() barriers, because the !SMP case is usually generic.

With the introduction of instrumentation, it also makes sense to have
asm-generic/barrier.h assist in the definition of instrumented versions
of mb(), rmb(), wmb(), dma_rmb(), and dma_wmb().

Because there is no requirement to distinguish the !SMP case, the
definition can be simpler: we can avoid also providing fallbacks for the
__ prefixed cases, and only check if `defined(__<barrier>)`, to finally
define the KCSAN-instrumented versions.

This also allows for the compiler to complain if an architecture
accidentally defines both the normal and __ prefixed variant.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/asm-generic/barrier.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
index 27a9c9edfef6..02c4339c8eeb 100644
--- a/include/asm-generic/barrier.h
+++ b/include/asm-generic/barrier.h
@@ -21,6 +21,31 @@
 #define nop()	asm volatile ("nop")
 #endif
 
+/*
+ * Architectures that want generic instrumentation can define __ prefixed
+ * variants of all barriers.
+ */
+
+#ifdef __mb
+#define mb()	do { kcsan_mb(); __mb(); } while (0)
+#endif
+
+#ifdef __rmb
+#define rmb()	do { kcsan_rmb(); __rmb(); } while (0)
+#endif
+
+#ifdef __wmb
+#define wmb()	do { kcsan_wmb(); __wmb(); } while (0)
+#endif
+
+#ifdef __dma_rmb
+#define dma_rmb()	do { kcsan_rmb(); __dma_rmb(); } while (0)
+#endif
+
+#ifdef __dma_wmb
+#define dma_wmb()	do { kcsan_wmb(); __dma_wmb(); } while (0)
+#endif
+
 /*
  * Force strict CPU ordering. And yes, this is required on UP too when we're
  * talking to devices.
-- 
2.33.0.800.g4c38ced690-goog

