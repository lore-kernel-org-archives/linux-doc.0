Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4460E7D062
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 13:20:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933990AbeFZNUD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 09:20:03 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35064 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935480AbeFZNPt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jun 2018 09:15:49 -0400
Received: by mail-wm0-f66.google.com with SMTP id z137-v6so1824467wmc.0
        for <linux-doc@vger.kernel.org>; Tue, 26 Jun 2018 06:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HVZ6yIjTM13mswNjnQk6+zabyo8SS7fb5UklqkhM58w=;
        b=K0T/BGtTWmwZIbXc0p7bznJ2J1hlkZXaH4Na6xLHuqk3/fvwfKwCuSFhGdI+We10Qm
         FBzoOkizeuy6DDOVYS71GGrq3NDkoqMMtkOBWyJAvD+9Dl9j34GnaTto7tqDxuB41zVj
         14W6fsFQiWjKP0Z5lkERDCdurq1mmgoYrRjEbnX14OmMd1BevlI5zYPzLXzfEgJ7f3Tp
         iOc5qRaVsBgNxfwQs6IRlIj5ol3KoZGMfvVhTM06DKRaSSTP+Dfm0c52lX+VH5X0BpkY
         hi801AoIZdfrhkGBjCDv5mkztBDUJfP4Sw5P1JxkNe8kb7ym7PfBTXi4/bc1ke6Ms4oq
         K5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HVZ6yIjTM13mswNjnQk6+zabyo8SS7fb5UklqkhM58w=;
        b=scz/IbTZXJD5160qWZ1szARuYsiKlgoVGL7h/RJij8xjAn4hsHWMmtpJ6Kjv0ckc3y
         fvLTdlIYwKPgFaoZyeoPAFQwCCWm5nOYEqxQVYgrQ4oxy/mgn3sLAij4Ck1rwR2U4m7F
         45hDKMxRof1yatyJzSg9D5HD6h0+CBiIr3UY8QLENosdsjV2oqoW2rglyc5obLEoF0+r
         4300FEyefy4Mq5UlZvwZZUXi+tJgFcM0JE6HFYkkEcr+LV4UabNTBnzsosOklsMIN6ov
         k9o2ss5envywnQV3Ar45QoV9Q7u2YjsEH5STeqw2erUTN8cRU39m1Pj3STOCSEjnHBfj
         yqCg==
X-Gm-Message-State: APt69E3Ab4fgHpVdrgLnmGVmLoMtoA/k5A+tuWT/Fb0u4eImTT/I5l9i
        PlMepjVfeuKUoc2VI8wNMnFa1g==
X-Google-Smtp-Source: AAOMgpcuL71s6ITvRElHRCV0fhXpbdNKVTBvRFWyz74HHMzJAqrfEwh7IMXX26xQEeCg/QmJNqgXZA==
X-Received: by 2002:a1c:d388:: with SMTP id k130-v6mr1588299wmg.66.1530018947902;
        Tue, 26 Jun 2018 06:15:47 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id w15-v6sm2162639wrn.25.2018.06.26.06.15.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jun 2018 06:15:46 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sparse@vger.kernel.org, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org
Cc:     Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v4 08/17] khwasan, arm64: fix up fault handling logic
Date:   Tue, 26 Jun 2018 15:15:18 +0200
Message-Id: <9f3e30f8144682c989bbf9fdac081501258a0b06.1530018818.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.rc2.346.g013aa6912e-goog
In-Reply-To: <cover.1530018818.git.andreyknvl@google.com>
References: <cover.1530018818.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

show_pte in arm64 fault handling relies on the fact that the top byte of
a kernel pointer is 0xff, which isn't always the case with KHWASAN enabled.
Reset the top byte.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/mm/fault.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index b8eecc7b9531..b7b152783d54 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -32,6 +32,7 @@
 #include <linux/perf_event.h>
 #include <linux/preempt.h>
 #include <linux/hugetlb.h>
+#include <linux/kasan.h>
 
 #include <asm/bug.h>
 #include <asm/cmpxchg.h>
@@ -134,6 +135,8 @@ void show_pte(unsigned long addr)
 	pgd_t *pgdp;
 	pgd_t pgd;
 
+	addr = (unsigned long)khwasan_reset_tag((void *)addr);
+
 	if (addr < TASK_SIZE) {
 		/* TTBR0 */
 		mm = current->active_mm;
-- 
2.18.0.rc2.346.g013aa6912e-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
