Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4008C7DE59
	for <lwn-linux-doc@archive.lwn.net>; Thu,  9 Aug 2018 19:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727603AbeHIVrp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 9 Aug 2018 17:47:45 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45044 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbeHIVrp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Aug 2018 17:47:45 -0400
Received: by mail-wr1-f65.google.com with SMTP id r16-v6so6057683wrt.11
        for <linux-doc@vger.kernel.org>; Thu, 09 Aug 2018 12:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8+04WRzIPiPgey4OPz4HFnYO/J88O5syronaT3xg5j0=;
        b=nxQ591Vhu03jnMxTYftvDNh225xeMHTn98JxuP6moeqXBbN9Wz89hlVBaEjcdTix/Q
         JRwhpBR80Gj1SHIRxBzEIJpPHE0ATKaojKZcNppqoD3eSLfSwJt62hQcbI+yB1lR5U0g
         2EctZIagziNIyXWykgBIYJMtOuzWS4CSipKmJoUvEfFlMHcj2uAwIxJ7RR5ZA4IPAUhu
         5w9rpydzp/Auhu1I81jLZccIFqUC+UGbqcwsEghtsA0vN32f/VyWRYK9wFnoNr4dHP6k
         kjHB0RKkKxr6fPi5vhpNLvGvoiUJVpk4pPHrJNama0hpw7dPu9m1uD3R+oeqfeucRXyC
         GqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8+04WRzIPiPgey4OPz4HFnYO/J88O5syronaT3xg5j0=;
        b=IEalphrlGpPbLGCItabbjX4Op5CO8LRapmuuOUbXXGl6xCdX0hQTxQzLdc07nkVFo3
         rtoTLRc4ufcODV9ktKU1+EPICzXPyul9Qls+8Brxr3UmzrkVEazeosJOqUi8WDxtP51z
         UyyiMeOMLgjjEhZyA3Lm89qceFeZoUmxf7z5GKbj+7dDJYdtgnqG74nRs9WBu2Fb/HyU
         Xt2a7p3vjoV/+0rXgA19fZpctw0TLhzc2u0BlKPWmR+ZMX6O/pKzEMlKAF/r+/PDltGs
         zOD+kD/EEYbLBBDwBGDlb2Kd9koOLH98ZLsc+mqEacL1tPYLtniuB6ebSQIBTM0DmQoX
         8FnA==
X-Gm-Message-State: AOUpUlEunWNyraEqvdPcgpBOQZuPfwT3jXmA7Nqv8N+DDR0bq58FqIHu
        FLNvjL/ikB1UR+fcqels9LRssg==
X-Google-Smtp-Source: AA+uWPwd82lZWG8HymUYNafSfNQe3iX/xSKDivVKRCbcK1qe34tzRwCCiSDAxySAScuUxsFNJYa/KA==
X-Received: by 2002:adf:a789:: with SMTP id j9-v6mr2120826wrc.277.1533842489885;
        Thu, 09 Aug 2018 12:21:29 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id o14-v6sm14738797wmd.35.2018.08.09.12.21.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Aug 2018 12:21:29 -0700 (PDT)
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
        Vishwath Mohan <vishwath@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v5 09/18] khwasan, arm64: fix up fault handling logic
Date:   Thu,  9 Aug 2018 21:21:01 +0200
Message-Id: <ae3bce648f4d9c1793ba937613a75072ce3d0d24.1533842385.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.597.ga71716f1ad-goog
In-Reply-To: <cover.1533842385.git.andreyknvl@google.com>
References: <cover.1533842385.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
2.18.0.597.ga71716f1ad-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
