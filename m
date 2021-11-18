Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF5EC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 08:15:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AB6561B44
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 08:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244406AbhKRISh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Nov 2021 03:18:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244418AbhKRIRp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 03:17:45 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0EFDC079791
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:50 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id m14-20020a05600c3b0e00b0033308dcc933so2713055wms.7
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=SnYVQxLC6YSHg0QBspCa3KEICf+BvvptqJyS2cHTmDQ=;
        b=q8lE9LF6eLo1vbVpYF4n1ICfJW3NoJ/hLMQz3VMTmpM/aEhlGa4qJ6VUiOnKyvLK8Q
         Oi8I7HXmebdHANR+j99BGIGfFBKv5r18aWiXgSYXRVP+oCwHVORXPU/n08+bF4aC070o
         4Ddh/74+9xIYByQdLDGSqWdmcWUMiKT/dn+E4fzNssfR267fHQ5ri4ABmCuCPmZeXHeD
         EQjo7hnV0pCiRiNZv8eV91KK/GgzYotgsm8DHEB9YlvAUqfjBr4xHiWPvUOGJ3uOlx7E
         GIIMcoADGq6ms0hdPAyC6mEshUnBV6rKSFIlvCkQp+UWhxWcwb1dZnrw8PR2VDwbIjW2
         E28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SnYVQxLC6YSHg0QBspCa3KEICf+BvvptqJyS2cHTmDQ=;
        b=FPAcjPhI+0YPCOAcP+O0s9lDEILtKjOE4d62gOF18iQHpMEa+EdqazpcJFypkmtlam
         UM8qiJOj2sKwiNbCF3kNqEtNMl1ba9xNII/8hj1WhT73zIqyxerPgZPmtpZefFLUTQ7w
         C2Gr8mQMr5IjS4lWXoFN2hQSTIG+7E75C4qcjam6+c84BpNBrd0MgGqu7HaRcaRjfsQB
         PAhfqVTZx274RM9sS6GnfNDlsFbCgbr52pqFD7/mdO/jFBxvmGRqD2n+lwrusrJvRC0Y
         FPfRNPV7xo1K6F2fobg93c7ZJulJZv/LEVQxw08S3wvriL/DSclA8kIEFhujSlafLeAm
         JVrw==
X-Gm-Message-State: AOAM532I8dttA3Y/i0cF99LhQz84MJZT/enBawyTcGDz8edhzT8ZSYHg
        8RqqIqHAR+KnsH3GlCwwT6GrvBtypQ==
X-Google-Smtp-Source: ABdhPJztL2viLMNJ4W40F+xMcVTMDTh0cI7ELMsOn6MVEO+vm91uJrlBHQ/y6vYeh7i2nbNPusXRUVe71A==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:7155:1b7:fca5:3926])
 (user=elver job=sendgmr) by 2002:a05:600c:1987:: with SMTP id
 t7mr7663727wmq.24.1637223109239; Thu, 18 Nov 2021 00:11:49 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:10:25 +0100
In-Reply-To: <20211118081027.3175699-1-elver@google.com>
Message-Id: <20211118081027.3175699-22-elver@google.com>
Mime-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2 21/23] sched, kcsan: Enable memory barrier instrumentation
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

There's no fundamental reason to disable KCSAN for scheduler code,
except for excessive noise and performance concerns (instrumenting
scheduler code is usually a good way to stress test KCSAN itself).

However, several core sched functions imply memory barriers that are
invisible to KCSAN without instrumentation, but are required to avoid
false positives. Therefore, unconditionally enable instrumentation of
memory barriers in scheduler code. Also update the comment to reflect
this and be a bit more brief.

Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/sched/Makefile | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/Makefile b/kernel/sched/Makefile
index c7421f2d05e1..c83b37af155b 100644
--- a/kernel/sched/Makefile
+++ b/kernel/sched/Makefile
@@ -11,11 +11,10 @@ ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
 # that is not a function of syscall inputs. E.g. involuntary context switches.
 KCOV_INSTRUMENT := n
 
-# There are numerous data races here, however, most of them are due to plain accesses.
-# This would make it even harder for syzbot to find reproducers, because these
-# bugs trigger without specific input. Disable by default, but should re-enable
-# eventually.
+# Disable KCSAN to avoid excessive noise and performance degradation. To avoid
+# false positives ensure barriers implied by sched functions are instrumented.
 KCSAN_SANITIZE := n
+KCSAN_INSTRUMENT_BARRIERS := y
 
 ifneq ($(CONFIG_SCHED_OMIT_FRAME_POINTER),y)
 # According to Alan Modra <alan@linuxcare.com.au>, the -fno-omit-frame-pointer is
-- 
2.34.0.rc2.393.gf8c9666880-goog

