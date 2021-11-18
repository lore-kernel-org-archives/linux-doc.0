Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09344C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 08:14:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E602361B44
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 08:14:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244358AbhKRIRz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Nov 2021 03:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244345AbhKRIRQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 03:17:16 -0500
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F002C061208
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:48 -0800 (PST)
Received: by mail-wr1-x449.google.com with SMTP id v17-20020adfedd1000000b0017c5e737b02so869753wro.18
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rzdCErYR7QVJMqQ7C8iOEn+pKBOJL+BpLP2uqDT2sRI=;
        b=lywc3NBHZZG/l/NByd9QMLrak/0JWSxz9fkaHSvQpFiu6THhd/Nji8+4etKEu/FWb1
         DUr7dTzctJFdTqeiReLlmlOSBqRVuxOd5rYx5nJHm3aM+ZmXYgZ3vl4Ce8tFrt0Av3T1
         bf9NeFQD3uLC7xCUpZwxhl9alcSmSnW523ahX1+J5WE1eN8IqUpB8WLaFMwKtqyVR2H5
         VBmh+uW9lUYfpnV9Dv/+zhxWz2y1F+L14D0bQuciTgOc/C7axKYJxr+/2pkCLLBSQ4sB
         E1t7FIYUwhm4GLpE9UPOpx8Eww9R6mgkFTE33GQnZrk37IxG6T6TO6OsAK9RCGF/iBpM
         yZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rzdCErYR7QVJMqQ7C8iOEn+pKBOJL+BpLP2uqDT2sRI=;
        b=dOckqaqKeO+7LLILjyDh3CCnHSwm/iq1vqG0bnpd6Bi8sYBkUgSz+ROzrJSKmCcFlV
         9bUyRMCgS4OrMuoXlSHwDP4plh5Zh/EcCpJB9RbnHBHZUlkxycSMPKs+m+ucf7UORWa5
         WCf4SxxAlJ1Owv8A1rvLWGD293z/BZC0XGg2DHTuKcAJsUXcqzGeEh2LwnjwFpD6M4T1
         N7gh8yY7jUB5bA6SDfq4EVHw2A423fjFPcAbp0MKET8k0Fut+bhejYTtSZ5kV1Sz1PZp
         rB0j0iU7FsN8AKlbdhEymFR0sODNpkqmJvTX/HjlxYZmo9Qtnp2oSevm0zTBz+IbqDIX
         6CTg==
X-Gm-Message-State: AOAM53283TR3tCEwpFLOD3IbBTb/Y7MWpoDksR8EoHfiBYLguSsc4YWO
        NcZBZ3McijHPbpVleJ+X7Ncf/MmBsw==
X-Google-Smtp-Source: ABdhPJxAWh/BZwpokjufV74uSy9dmYvaQlEFQf441y59AQVEiD0veafOsEsU+5qgKzAWHYtjU5201SdIww==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:7155:1b7:fca5:3926])
 (user=elver job=sendgmr) by 2002:a5d:6043:: with SMTP id j3mr28104905wrt.375.1637223106899;
 Thu, 18 Nov 2021 00:11:46 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:10:24 +0100
In-Reply-To: <20211118081027.3175699-1-elver@google.com>
Message-Id: <20211118081027.3175699-21-elver@google.com>
Mime-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2 20/23] mm, kcsan: Enable barrier instrumentation
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

Some memory management calls imply memory barriers that are required to
avoid false positives. For example, without the correct instrumentation,
we could observe data races of the following variant:

                   T0           |           T1
        ------------------------+------------------------
                                |
         *a = 42;    ---+       |
         kfree(a);      |       |
                        |       | b = kmalloc(..); // b == a
          <reordered> <-+       | *b = 42;         // not a data race!
                                |

Therefore, instrument memory barriers in all allocator code currently
not being instrumented in a default build.

Signed-off-by: Marco Elver <elver@google.com>
---
 mm/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/Makefile b/mm/Makefile
index d6c0042e3aa0..7919cd7f13f2 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -15,6 +15,8 @@ KCSAN_SANITIZE_slab_common.o := n
 KCSAN_SANITIZE_slab.o := n
 KCSAN_SANITIZE_slub.o := n
 KCSAN_SANITIZE_page_alloc.o := n
+# But enable explicit instrumentation for memory barriers.
+KCSAN_INSTRUMENT_BARRIERS := y
 
 # These files are disabled because they produce non-interesting and/or
 # flaky coverage that is not a function of syscall inputs. E.g. slab is out of
-- 
2.34.0.rc2.393.gf8c9666880-goog

