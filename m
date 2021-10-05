Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87271C4332F
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 11:02:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73032610A4
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 11:02:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234734AbhJELD5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Oct 2021 07:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234739AbhJELDd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 07:03:33 -0400
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F4AC061340
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 04:00:36 -0700 (PDT)
Received: by mail-wr1-x449.google.com with SMTP id k2-20020adff5c2000000b00160b12639a5so1398384wrp.3
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 04:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=HKI+TnuwkVzGQacqSxDdhV83/KyiTPOZkFDvUOmoq5w=;
        b=drtT1iGcO3gVywE5+7iiUB+0nkm0x2iHratGhz1+VgZ3S9aL3d85rt7o2hkguAv57j
         mYu/ECwQYFZKPddmRj18p6tT9dppN3hIRKLF/GDbnWAhASokfzi971xdwXFJUWzX/OVB
         IrfukrFN921mvm9vOqZqpJB4Cw82TTkrdJ0gyTWK3Hj1qEp9c15e8MmxKCo3Wk155Sht
         daLsdqNyd894MD9YepBYTRw81E3D1q838qAaUrFaUNRaCD8L1rAGhpvD+dyphBPQNEds
         Ghc1MsrGDBNuQQDgTGlUeYdgZUt3Q/TVBpyVfX4gbszogoVCovBzfct5itUMq1L63oB7
         Iolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=HKI+TnuwkVzGQacqSxDdhV83/KyiTPOZkFDvUOmoq5w=;
        b=OTBa/io9oHzKvoPSSa5ds/YhIWyOV3E5QIQj/IzkydTdCvc5vjztk21KNaOc9JI7Jo
         vpysorRc0ae50NFzoKoMqPo103LQYzxrA4EiMnuz16shGG5E3RJ0N08XjuCSU80/LSi/
         ILT+zQ1ntnmI6LKnXQcj4fbIb6eXyN7XIAOCkgBr5ehbGCm1SvF4DcmvOn0Z8VwH/6tz
         5QCfhfrcKdsIK6csVueb5dZwfmsOYh00YMM34cOd6W8DvCGxHOlcXMMrRvGCzQFxD2qA
         MIp5lmmldTatsaj1EpA/mNQJUoU/usU7ECmkDvKskz8hqGx3dokdtPXKggivR2SzfsIm
         br9A==
X-Gm-Message-State: AOAM532Fo9VXNqlN3oTLffQU1t4mQtvgp+GCRvVzef5L73fxr3tCTonE
        kkURaVTokwI2m+D5Zp4BQBHqLlWwcQ==
X-Google-Smtp-Source: ABdhPJwXAWBk8ymGDBMpf3SYMhCr7mdIwIo84alxZ309ddgJ/+Ku3X3widAzFVRKQyAwYDxE9VpI1KyKrg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:e44f:5054:55f8:fcb8])
 (user=elver job=sendgmr) by 2002:a05:600c:3b26:: with SMTP id
 m38mr554577wms.0.1633431634472; Tue, 05 Oct 2021 04:00:34 -0700 (PDT)
Date:   Tue,  5 Oct 2021 12:59:04 +0200
In-Reply-To: <20211005105905.1994700-1-elver@google.com>
Message-Id: <20211005105905.1994700-23-elver@google.com>
Mime-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH -rcu/kcsan 22/23] objtool, kcsan: Add memory barrier
 instrumentation to whitelist
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

Adds KCSAN's memory barrier instrumentation to objtool's uaccess
whitelist.

Signed-off-by: Marco Elver <elver@google.com>
---
 tools/objtool/check.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index e5947fbb9e7a..7e8cd3ba5482 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -651,6 +651,10 @@ static const char *uaccess_safe_builtin[] = {
 	"__asan_report_store16_noabort",
 	/* KCSAN */
 	"__kcsan_check_access",
+	"__kcsan_mb",
+	"__kcsan_wmb",
+	"__kcsan_rmb",
+	"__kcsan_release",
 	"kcsan_found_watchpoint",
 	"kcsan_setup_watchpoint",
 	"kcsan_check_scoped_accesses",
-- 
2.33.0.800.g4c38ced690-goog

