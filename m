Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 478307D2EE
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 Aug 2018 11:36:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728569AbeH2PcM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 Aug 2018 11:32:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44774 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728547AbeH2PcM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Aug 2018 11:32:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id v16-v6so4485078wro.11
        for <linux-doc@vger.kernel.org>; Wed, 29 Aug 2018 04:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/C7rrwe4N6BQx9M4EE8DtUTnDGQn+bG0YjkQ0aHndSs=;
        b=dU/Fx2LaujUbvtHauwsP0t1aA/m2D+06oXMHwZ3eXwP1Nzw3gC8PebFtKC1EnSsH69
         c0BZGLLNtAdh454C93JmrKX65W2EMHdPt55gfbxnmI6ZBwf48jJ0+K0uyUO+N5x56L61
         H05vabh86vY1pFtsPWG7/c0vwk/TX9FzE/hL4njIAk0P4vbuWYNdMbg1msffocHP+j4S
         02zcVCF+LR2Gffm0s0xI7A0hw2Fm44sDbs+XriYfO7scgMEmeWN4DNgjhPtc4Br6jBit
         X9y0Oa4JtjU3dat2ZfvzOzi9tZrU9ASdv/eeSGhQIx4BwERGx2cCYod7MNlV1snr6UJ0
         XzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/C7rrwe4N6BQx9M4EE8DtUTnDGQn+bG0YjkQ0aHndSs=;
        b=mWcOsRP4qeHFTCtOtWqNxYBhlBLELCaCeMPfB6Iqe3/rkjWLSIpfY5sPq5KaSXA80K
         PkO0jRDQYBl+zZt2GKMaaHdhu89NFshpC3e8U7oVXmWQBLtSqvoE/VZ3ateRPb4w5u3W
         tTaYBYW+CJ4S15nkETWPnBFQiuyikbRUmeAxLt5IY9YaonvhJHXU6aMZNG9ZQSq01a8F
         IjS8gEV6M9czSUy1HYe0pK8yDIvKt87FeJ0c/CJHuY6ADiaml7hkJqngvOIhjMrM1Sn7
         SAroEMcjYMiiRrA3WNDpKlcVslQ8ejITF/9l5MlGsfaLpc33iYA9w+y1cSIyP0mpCugr
         EMZQ==
X-Gm-Message-State: APzg51DXkSVfBQMiJqi4gKRsDHpnKwUOJ0xYsJTdumDv6oaT5XMZETqA
        /2Z/zI/gbcWczZMUaj4v1XNiZw==
X-Google-Smtp-Source: ANB0Vdb2BlaS8zRz1NV8bmHOiV24XFb36lvecxL3punEHE/BVCiUxdBbrADrOo26tG+iGem0MA87hQ==
X-Received: by 2002:adf:f608:: with SMTP id t8-v6mr4068969wrp.186.1535542542109;
        Wed, 29 Aug 2018 04:35:42 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id s10-v6sm7800454wmd.22.2018.08.29.04.35.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Aug 2018 04:35:41 -0700 (PDT)
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
Subject: [PATCH v6 09/18] khwasan, arm64: fix up fault handling logic
Date:   Wed, 29 Aug 2018 13:35:13 +0200
Message-Id: <4da4495dc20525db1654d3dd9d578b7965d98507.1535462971.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.rc0.228.g281dcd1b4d0-goog
In-Reply-To: <cover.1535462971.git.andreyknvl@google.com>
References: <cover.1535462971.git.andreyknvl@google.com>
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
index 50b30ff30de4..35feee78a9bd 100644
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
2.19.0.rc0.228.g281dcd1b4d0-goog

