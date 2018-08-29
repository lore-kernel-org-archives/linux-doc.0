Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E193C7D581
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 Aug 2018 11:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728518AbeH2PcI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 Aug 2018 11:32:08 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:38187 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728494AbeH2PcH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Aug 2018 11:32:07 -0400
Received: by mail-wm0-f65.google.com with SMTP id t25-v6so5153790wmi.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Aug 2018 04:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ScyVG8/8R+wHPT40gRo57Kpvm4BCgl84gWeZYScmJuw=;
        b=wTs5ODdO4PrsRaq9SSLTEZ7b10s0WzDZC6bvpJQCQ8IlNuv8Tm13ZusPLCWI9u5B6h
         dnuPVb6nNahHsbJlKRNbyTLXNJ/IrGoLuhN0DBBkhShgRKNswPDo36xTMxq9+X8I7ByY
         Z81NYIk6kveEH6yEiQK5WwgIHPjxiGp1gTsfDHqRN4/FjAOY4vYjr/1t6prtIAlo4x8y
         C9VP5vf6Ywf4tNQ72tAz0ab4zeeMok9lxjqUAxNz9ZlYoT8Dwgd0SsM6S5SRkdvlI+fi
         kBtB/ZVfI13XLo2seU5UAo9VpCDwoSqBWnOlSmXFjGovS8hYAI20T+2ppjFYW1flvuWs
         kqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ScyVG8/8R+wHPT40gRo57Kpvm4BCgl84gWeZYScmJuw=;
        b=NGdT613NdTzX3+YmwnF1uhcGXBYimjhRcmFuH3zttgTLtQpwAuAvag0TjLIL4oGmHO
         DCfQ5GAuMDn1LC095zuffqplMIdfzdQBOd6/ZJ37/VNgtLzhvuMb7wh0Fu+Q5fdvLk7y
         Hphuq1J8spvkUn0SpWHMbuPPuWZ/roa03vE9ig6KvlJtiEWI5I0/kwQafB5qkUG/Crto
         czkTZvDA9+F3DfMbuuofsef9cqKn6Bof3odV56MiBriBmMqsVUjtTV5bgFQGbUD6E0tm
         0dv/pDD6XqvpJ03ILwMrq3oqf7txLe736LQAGhlLpMta8UBhl+eoP2GFq/IFzvwN5MtP
         mpmA==
X-Gm-Message-State: APzg51AuAT12l6iEwqDBdqzGjB52ZItv1Si9WU4Ea7HTmjcjfaG4Uhj+
        2IjeCK4cM3twsicfCkEg9bRdyg==
X-Google-Smtp-Source: ANB0VdZKr6B7zINhz15rEPoFBPLoEFhgTfNWmBJ1/WdmOFNn442wB60NAMI8yonkTKESWF427Y1E1A==
X-Received: by 2002:a1c:1182:: with SMTP id 124-v6mr4036911wmr.75.1535542537152;
        Wed, 29 Aug 2018 04:35:37 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id s10-v6sm7800454wmd.22.2018.08.29.04.35.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Aug 2018 04:35:36 -0700 (PDT)
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
Subject: [PATCH v6 06/18] khwasan, arm64: untag virt address in __kimg_to_phys and _virt_addr_is_linear
Date:   Wed, 29 Aug 2018 13:35:10 +0200
Message-Id: <19d757c2cafc277f0143a8ac34e179061f3487f5.1535462971.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.rc0.228.g281dcd1b4d0-goog
In-Reply-To: <cover.1535462971.git.andreyknvl@google.com>
References: <cover.1535462971.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

__kimg_to_phys (which is used by virt_to_phys) and _virt_addr_is_linear
(which is used by virt_addr_valid) assume that the top byte of the address
is 0xff, which isn't always the case with KHWASAN enabled.

The solution is to reset the tag in those macros.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/memory.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index f5e262ee76c1..f5e2953b7009 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -92,6 +92,13 @@
 #define KASAN_THREAD_SHIFT	0
 #endif
 
+#ifdef CONFIG_KASAN_HW
+#define KASAN_TAG_SHIFTED(tag)		((unsigned long)(tag) << 56)
+#define KASAN_SET_TAG(addr, tag)	(((addr) & ~KASAN_TAG_SHIFTED(0xff)) | \
+						KASAN_TAG_SHIFTED(tag))
+#define KASAN_RESET_TAG(addr)		KASAN_SET_TAG(addr, 0xff)
+#endif
+
 #define MIN_THREAD_SHIFT	(14 + KASAN_THREAD_SHIFT)
 
 /*
@@ -232,7 +239,12 @@ static inline unsigned long kaslr_offset(void)
 #define __is_lm_address(addr)	(!!((addr) & BIT(VA_BITS - 1)))
 
 #define __lm_to_phys(addr)	(((addr) & ~PAGE_OFFSET) + PHYS_OFFSET)
+
+#ifdef CONFIG_KASAN_HW
+#define __kimg_to_phys(addr)	(KASAN_RESET_TAG(addr) - kimage_voffset)
+#else
 #define __kimg_to_phys(addr)	((addr) - kimage_voffset)
+#endif
 
 #define __virt_to_phys_nodebug(x) ({					\
 	phys_addr_t __x = (phys_addr_t)(x);				\
@@ -308,7 +320,13 @@ static inline void *phys_to_virt(phys_addr_t x)
 #endif
 #endif
 
+#ifdef CONFIG_KASAN_HW
+#define _virt_addr_is_linear(kaddr)	(KASAN_RESET_TAG((u64)(kaddr)) >= \
+						PAGE_OFFSET)
+#else
 #define _virt_addr_is_linear(kaddr)	(((u64)(kaddr)) >= PAGE_OFFSET)
+#endif
+
 #define virt_addr_valid(kaddr)		(_virt_addr_is_linear(kaddr) && \
 					 _virt_addr_valid(kaddr))
 
-- 
2.19.0.rc0.228.g281dcd1b4d0-goog

