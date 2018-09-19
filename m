Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D8487D923
	for <lwn-linux-doc@archive.lwn.net>; Wed, 19 Sep 2018 18:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387559AbeITAej (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 19 Sep 2018 20:34:39 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38826 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387548AbeITAei (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Sep 2018 20:34:38 -0400
Received: by mail-wr1-f67.google.com with SMTP id j8-v6so3142558wrw.5
        for <linux-doc@vger.kernel.org>; Wed, 19 Sep 2018 11:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8pJXKvzLB+e1tJ1Hv9TztYhic7mAKsr7ltM5Jvr+GUA=;
        b=RSGVy6Ay3KrzIUqWwv/VIcAW0HO7cVr2nUs+V4EzIDJMC+eescAuwUx6jPg+y7ZRSC
         CwpxO4q7mN7dtW4XG1FH0/6ZaNnKHzY4eI40IwAiTdZaZAOxQYZWoPxBRqdh3qxp6w08
         O+OIPMrqSfiA3DBaWK9GkyWxW6H9iRZ40oYPtlYJs6RzPjkYGChmE0xIjlkBhtYZoatS
         HU7Ce6ZcPbDxVzM7c+yOONxmzw5KhqXZs5MrExSkGOSUvLtluU3adnmErD6bRNYhiMKp
         ROSOV7iN4cRnsKYvKAmTG/Wn1PgLR7cpYISOMt7scoyppezouNaPS5jVwbLy3y+ch2BU
         Zwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8pJXKvzLB+e1tJ1Hv9TztYhic7mAKsr7ltM5Jvr+GUA=;
        b=VUBs0u/K0j6Xoc3l97KEV40SpFhK9t1O/TgVhASRGomrxY2Kcid/woTW6bSS2QfiJM
         42iwDSyZveXaatdYMQ+7NGwfOO2LvNYW3gi4lqpmYxlZuGPtJUKMxo7Un9Z2BZU+ur2R
         sTfXJSHJQV2SyiC/LjGbQaq/gPkHaD+eJHnIsh2s/mIEgL+Lu1Uv0wzBgAdAbcXotVAG
         pbUKgFURWqBVJ+fxNeauOBEgC3xSmoeyg1o4foJ0DHl2e7qVRJfsWzhkgsRkCkJZ/4wX
         ODPGWCq7Ohuwf3iptQpDtYVcUBqyurVJ7W0Bz3FCCRVkDuhiZwZQh9d34svoYLtiecw8
         xkkw==
X-Gm-Message-State: APzg51ANIEi3j4h/JVDSM4SOkIS2V/Oes8oIcBlBNbiEVSnH9240vvD5
        de44cCIneLmJOzCrPgPOVbFwxQ==
X-Google-Smtp-Source: ANB0VdZNjLwlO7+Wx7HL+D4ZNaVYjHeUF1fVI5wO9gQ8YjF80pGa7gqec/EbQRlsPW+CRevVCuOBdg==
X-Received: by 2002:a5d:4185:: with SMTP id m5-v6mr5167615wrp.8.1537383322708;
        Wed, 19 Sep 2018 11:55:22 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id b10-v6sm8510065wmc.28.2018.09.19.11.55.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Sep 2018 11:55:22 -0700 (PDT)
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
Subject: [PATCH v8 12/20] kasan, arm64: enable top byte ignore for the kernel
Date:   Wed, 19 Sep 2018 20:54:51 +0200
Message-Id: <5e610a513c44a69b2b78476c20f21960696259c6.1537383101.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.397.gdd90340f6a-goog
In-Reply-To: <cover.1537383101.git.andreyknvl@google.com>
References: <cover.1537383101.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tag-based KASAN uses the Top Byte Ignore feature of arm64 CPUs to store a
pointer tag in the top byte of each pointer. This commit enables the
TCR_TBI1 bit, which enables Top Byte Ignore for the kernel, when tag-based
KASAN is used.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/pgtable-hwdef.h | 1 +
 arch/arm64/mm/proc.S                   | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index fd208eac9f2a..483aceedad76 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -289,6 +289,7 @@
 #define TCR_A1			(UL(1) << 22)
 #define TCR_ASID16		(UL(1) << 36)
 #define TCR_TBI0		(UL(1) << 37)
+#define TCR_TBI1		(UL(1) << 38)
 #define TCR_HA			(UL(1) << 39)
 #define TCR_HD			(UL(1) << 40)
 #define TCR_NFD1		(UL(1) << 54)
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 03646e6a2ef4..b2b44dbdb063 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -47,6 +47,12 @@
 /* PTWs cacheable, inner/outer WBWA */
 #define TCR_CACHE_FLAGS	TCR_IRGN_WBWA | TCR_ORGN_WBWA
 
+#ifdef CONFIG_KASAN_SW_TAGS
+#define TCR_KASAN_FLAGS TCR_TBI1
+#else
+#define TCR_KASAN_FLAGS 0
+#endif
+
 #define MAIR(attr, mt)	((attr) << ((mt) * 8))
 
 /*
@@ -440,7 +446,7 @@ ENTRY(__cpu_setup)
 	 */
 	ldr	x10, =TCR_TxSZ(VA_BITS) | TCR_CACHE_FLAGS | TCR_SMP_FLAGS | \
 			TCR_TG_FLAGS | TCR_KASLR_FLAGS | TCR_ASID16 | \
-			TCR_TBI0 | TCR_A1
+			TCR_TBI0 | TCR_A1 | TCR_KASAN_FLAGS
 	tcr_set_idmap_t0sz	x10, x9
 
 	/*
-- 
2.19.0.397.gdd90340f6a-goog

