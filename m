Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4206F7DF8A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 17:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754521AbeFTRqx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 13:46:53 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:39047 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754618AbeFTRkT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jun 2018 13:40:19 -0400
Received: by mail-wm0-f65.google.com with SMTP id p11-v6so971947wmc.4
        for <linux-doc@vger.kernel.org>; Wed, 20 Jun 2018 10:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p85QUjRuow4dpc/B2Caf2sJdJzBwj5MZiQXcRPnXZZs=;
        b=cKMog7X2WPJDh2SetkEA2LzVcfeVlPSabg492BhqyjJtuk+uD7mTbXUGHMgXgkX0+z
         nce3cY4HpUrBw2dF+w26cohuQ4LNOVcnNXjygWthLCk5admFeUUoeT0ZzaFLe4N4HFjx
         fKpPqS151IMpsM7atSDyWsyMpcCrNy9NQlI2dNd4Du2t4dOjlcjw00mWxwEZWwpfndjG
         3EWMUA95vJDt0+oxJwNAjTg5w4uOiJKAvYJnJZM0head/QBtWLMSQ9Z84Hk09NAOo4YB
         lU0wq9CXKzi00S9pI0LIKDVfcUUf8vgBMRQOCs7XSLki1DUDDpXZ2akjY+iCFrfUVKk/
         6VyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p85QUjRuow4dpc/B2Caf2sJdJzBwj5MZiQXcRPnXZZs=;
        b=aUajGuF1h97y+SpjF25eMuCCForg0PWhjlfJDvwrP+mqYfxONmOkqj8EozEOuaxJJI
         3BwJnhDc/na9zDfaNLucxcmTg35T2zjYy17PiHg3ltQCB9Z8BKDHrtnvXe6rPeCgj6Nh
         gMDm3J+AGR4VncdWdOW8bUw+5qIJWEUmHqb705bL4T5PDNNZfKFBXMdvBCqTFJreQbx1
         j6jnu8r3yb0OvZ8QghTVZG55SZ+Srj1ymbYwXQ0lI2x1AHdlHXAxweiJHnFtvI+5xQmX
         CH6vVmYlj37YyMW/Hm/WCvDgGZUQVEpqpyW/f4GGWxdbz/GcCG3ypgd1Jww77qY95pu5
         pAeg==
X-Gm-Message-State: APt69E3BBkqJz3gxrDdh3eYuvsZpHg3+TXiZfJepYg0zMWkC0fl3Be1F
        5Dvsi/mD2iT3fuiO9hC7bBxmiw==
X-Google-Smtp-Source: ADUXVKI9lnsolI1QB0qhbD0NkTANy1JGmjbguTtaYpBwlZAz0SNSWmijMIO+Jx4xdTEuQeLjLXl71Q==
X-Received: by 2002:a1c:4adb:: with SMTP id n88-v6mr2543982wmi.121.1529516418195;
        Wed, 20 Jun 2018 10:40:18 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id f18-v6sm4388598wro.1.2018.06.20.10.40.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jun 2018 10:40:17 -0700 (PDT)
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
Subject: [PATCH v3 07/17] khwasan, arm64: fix up fault handling logic
Date:   Wed, 20 Jun 2018 19:39:53 +0200
Message-Id: <719e17667dcf93c2789c2b6c873aa424cfe378b9.1529515183.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.rc1.244.gcf134e6275-goog
In-Reply-To: <cover.1529515183.git.andreyknvl@google.com>
References: <cover.1529515183.git.andreyknvl@google.com>
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
2.18.0.rc1.244.gcf134e6275-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
