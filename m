Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AEBA57DF88
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 15:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754166AbeFTP0C (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 11:26:02 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:46868 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754077AbeFTPYh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jun 2018 11:24:37 -0400
Received: by mail-wr0-f194.google.com with SMTP id v13-v6so3708312wrp.13
        for <linux-doc@vger.kernel.org>; Wed, 20 Jun 2018 08:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0SdcYFgQOnNQJBlnlcaX0uJ4bOsKrRicmvs7y9kVSAg=;
        b=RaNvG3rpL9QFAwkfOD4I9SM046U787iU3B85YRqsuN5Yeu23YI522cJzYBjAfTBtEN
         lh+/9ZLiM1S0yf08/mT9u5qCYDldPMDKr8yJb2ZiZDu/Eh6oZYXAW+p8L6noF1rH5T1n
         Q0opphjG2XPih7UnNTJ6XTtOdspP5rVTGYw03vEoK0wHQGMPdqxq3CEdQFpvW3ODCa14
         rLuflyTTE+/VuGes4koZIsMrqS2/Yl+KzPpnfH+35T1fgVBq1747fWhUpnGDNnj7sKrc
         Gx81x4z25O5vYT2j2Tol7tkYXN6GgNp4w6BsyB7BDMMM9Pxu/4IGnS4Lm132kM9tB+Q1
         hqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0SdcYFgQOnNQJBlnlcaX0uJ4bOsKrRicmvs7y9kVSAg=;
        b=pLuiNMk39+xMPv4sCqY4M4LZrylos+DgJGHdyRO6lCxu0uawAvv0AgIHcaCF0FUr8t
         Yu4sdhVSlTythZpoYbDarHvWTAVrAxQDXlCv5Pf9vNu8V17fAMYj53wcdzGwbi4IoZKo
         OIDCEBfG8+1XWNlY9U5SjkZoq1CGacrkc05+1nY2fVLPzOoQPp615/j2/DhhhBi6wj4c
         UA1I9avqnVKdNzL4LukLORVgR1SmmmymPeiu1tuz/vyvpNf1i/ogM6XOJwnfA2IkzlsF
         Wa2Og0z1Wjr6nn8xvMC2OVVf3Fe+EYA3uY7B9xGNgsayEbJnab7FDiJjxojP69KqSQ3e
         AGcg==
X-Gm-Message-State: APt69E13HQB4FbQ8BabgWFT1rrUmnk4rypkiS18hrP6Q9uWnEA5VPQAT
        SpdgOx/+X17OGkraYlpeD/ww+g==
X-Google-Smtp-Source: ADUXVKLXT94yC0cFozFu3kmSJDBexRMscv440Gy63zDsomyYjwP//+06z4JAxvYtKPL1B+wvy3NnwQ==
X-Received: by 2002:adf:aca7:: with SMTP id o36-v6mr1408574wrc.258.1529508275965;
        Wed, 20 Jun 2018 08:24:35 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id c11-v6sm3959244wrm.65.2018.06.20.08.24.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jun 2018 08:24:34 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v4 4/7] mm, arm64: untag user addresses in mm/gup.c
Date:   Wed, 20 Jun 2018 17:24:23 +0200
Message-Id: <1203c510e5c34e97e5940688df075d69429e94de.1529507994.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.rc1.244.gcf134e6275-goog
In-Reply-To: <cover.1529507994.git.andreyknvl@google.com>
References: <cover.1529507994.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

mm/gup.c provides a kernel interface that accepts user addresses and
manipulates user pages directly (for example get_user_pages, that is used
by the futex syscall). Here we also need to handle the case of tagged user
pointers.

Add untagging to gup.c functions that use user pointers for vma lookup.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/gup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index b70d7ba7cc13..5bb351c91989 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -666,6 +666,8 @@ static long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
 	if (!nr_pages)
 		return 0;
 
+	start = untagged_addr(start);
+
 	VM_BUG_ON(!!pages != !!(gup_flags & FOLL_GET));
 
 	/*
@@ -820,6 +822,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
 	struct vm_area_struct *vma;
 	int ret, major = 0;
 
+	address = untagged_addr(address);
+
 	if (unlocked)
 		fault_flags |= FAULT_FLAG_ALLOW_RETRY;
 
-- 
2.18.0.rc1.244.gcf134e6275-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
