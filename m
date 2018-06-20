Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9008E7DF90
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 17:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932947AbeFTRqK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 13:46:10 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35360 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754647AbeFTRkX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jun 2018 13:40:23 -0400
Received: by mail-wm0-f68.google.com with SMTP id j15-v6so1028444wme.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Jun 2018 10:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NNTjp1zLzU5TrkbNCH/i6H4SroEd7wqmKsanmk6nVVo=;
        b=bFsStUkrQ0iQlrPVOiBmoBIbL39mZFNIc0wIbZll5jQQpzGkz4MbKilvlXwwlEuhSu
         0Y0XIZKORt0shALA72NzNHucE9NOplJC+ZsJmZcH08JY+9K7M+6VZkK+TXZ4uOKFUuQ8
         D66xYyXBH6zYcG7jlf9CGRPtkDOB8q9dkXOzBAySr4xbBEZigcnPierMx+uJwxP3GhAO
         UqG+8s7pCsI4W6JGf5xd27Hj9jrL97vRm9pKVfJT1YZZhUxC4z7T4bMcYRc2fTob6obF
         jlUnW87SdLRkh/dARxA/xlOwS1RNXdnvgH8wH1RP/BJxHEYT8UWxydE28B7/a0QcGcBp
         psAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NNTjp1zLzU5TrkbNCH/i6H4SroEd7wqmKsanmk6nVVo=;
        b=mxp7wFkvZRrtUlANbrs9FR5NqHipF+0jSEtyYSbBOuXaP3B9/Omr3ynVIyDxymoWve
         FdYLIl3d9L1vlTF3b2v1c5TVGEKGhf6rCAdzHorxo1rvydZ0B8kQgj2lpiOSNmOkWU66
         druGx5yXxxshld5JL6A/wQ0UaGDyykZUefdTz5DNIimdk3Brn/5FhC7AfUYYyD6Ok5ps
         dNUM/rmluHwSrAHLNxiPqTYD3g7MsQAlYdjCEfesMDPZbRdDEVSHfWzRZus3fRyHfSgl
         hlBU2AMEx05MVEIz8DJpWYyUhGWkkEUrhb+XRLaBoomsKB8zQ91EIuEoO9V6WZVSnqbS
         q5Jg==
X-Gm-Message-State: APt69E1pEEvZw2tNE7LNAK9guP1cGfBFokOfskRwA8w2rXE6lYVQtzZu
        5tJg5F/baBeZMTEAzW2/YnA0Ow==
X-Google-Smtp-Source: ADUXVKKR5vFQo+Ie2U5T/+P6vWrH+ix/bPBkxBVosLpjbv2YqXISbPE7Ei1/evj/LtcPzKS7oTWTrw==
X-Received: by 2002:a1c:71db:: with SMTP id d88-v6mr2586324wmi.117.1529516421542;
        Wed, 20 Jun 2018 10:40:21 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id f18-v6sm4388598wro.1.2018.06.20.10.40.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jun 2018 10:40:20 -0700 (PDT)
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
Subject: [PATCH v3 09/17] khwasan, arm64: enable top byte ignore for the kernel
Date:   Wed, 20 Jun 2018 19:39:55 +0200
Message-Id: <4d55f61003bfb55d2b37320a5127f182c3a71111.1529515183.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.rc1.244.gcf134e6275-goog
In-Reply-To: <cover.1529515183.git.andreyknvl@google.com>
References: <cover.1529515183.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

KHWASAN uses the Top Byte Ignore feature of arm64 CPUs to store a pointer
tag in the top byte of each pointer. This commit enables the TCR_TBI1 bit,
which enables Top Byte Ignore for the kernel, when KHWASAN is used.

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
index 5f9a73a4452c..f3dfcd74a285 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -47,6 +47,12 @@
 /* PTWs cacheable, inner/outer WBWA */
 #define TCR_CACHE_FLAGS	TCR_IRGN_WBWA | TCR_ORGN_WBWA
 
+#ifdef CONFIG_KASAN_HW
+#define TCR_KASAN_FLAGS TCR_TBI1
+#else
+#define TCR_KASAN_FLAGS 0
+#endif
+
 #define MAIR(attr, mt)	((attr) << ((mt) * 8))
 
 /*
@@ -439,7 +445,7 @@ ENTRY(__cpu_setup)
 	 */
 	ldr	x10, =TCR_TxSZ(VA_BITS) | TCR_CACHE_FLAGS | TCR_SMP_FLAGS | \
 			TCR_TG_FLAGS | TCR_KASLR_FLAGS | TCR_ASID16 | \
-			TCR_TBI0 | TCR_A1
+			TCR_TBI0 | TCR_A1 | TCR_KASAN_FLAGS
 	tcr_set_idmap_t0sz	x10, x9
 
 	/*
-- 
2.18.0.rc1.244.gcf134e6275-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
