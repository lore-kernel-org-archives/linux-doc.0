Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 143877D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Dec 2018 13:30:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbeLRNam (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 18 Dec 2018 08:30:42 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37057 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbeLRNam (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Dec 2018 08:30:42 -0500
Received: by mail-wm1-f68.google.com with SMTP id g67so2816471wmd.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Dec 2018 05:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1DLr9hZIqfTBfQ8vZM5TVqGu/0wSU0e2RGylEo0U1xk=;
        b=b6CeLxm48QORSNimPysCsqnEvAwvbwCEMK3zZ2IeU55RUe8jfEaoKD7B2W5pu4GMVM
         ZMfAqk8UVGyjCZdWBu94z+/d06Nqhr39DI+oBkGQF6PQNRAP48V2nHE1nMmWB13EyfCm
         NtxsSWQvTBxTL+Fd0/UOOq7DzicVsxlDHD16s9b1lX0C6x/VSR5lAuzePhQ9L1d5Oul8
         VXrACEN0B09HGP6S1WtlkS87efzvH+4OfJy778AP3n08axpCT24ejrd+gQ8n9Wv0ZFss
         zNcku1rhZAk/DpR9yt64U57aTzC8whKP5MKSsmn/EKNweqDVHhOPHIVAgeVnlG4EPeY4
         Oa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1DLr9hZIqfTBfQ8vZM5TVqGu/0wSU0e2RGylEo0U1xk=;
        b=Mk2ucF3KFadol4hEwhRnCqyZc3QWIYB2KdkULZ95Lt5wgEXPKD/vdlMGZFiD5mYpAO
         VCmFsGHBFop73zlz7l5EaHdgVqtRiTwTD8XZIMCdKYp5u1I55fiiuovAwFNtIk3hyt6L
         d02/gFLkJ8XKw0mxBU1ZwUwYAfX1VGWNeHCF36WdKtZ2ymlGf55pxwAKjic079sGVkPJ
         p+UF16Iq2k3M7YEBq7N4HdsBniDKRgftJfxWBV+BPrT3K1HdmAPszUZzK8ToqgEMeiew
         r1BSmLUBaTGZFnkjNruW7z6T6eZh9/I492FpFijIao1mwk0eH2gcfuvfLU/eO37cjoa1
         0RXw==
X-Gm-Message-State: AA+aEWZ2efvlby+WXmKyUW1WrmECsjJDDDIVzetfPWEnui425uLzMbiS
        s8MqZFjeqU4vXKqP1p+1au0JOg==
X-Google-Smtp-Source: AFSGD/Vk4dHI/WjETFO6q3mGOkSMUeOtBy8kBD/BEP66o/kq3hhOh6hYuClxgxsdrN7KcTWqc7mrIQ==
X-Received: by 2002:a1c:a104:: with SMTP id k4mr3226049wme.54.1545139839904;
        Tue, 18 Dec 2018 05:30:39 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id g188sm1995927wmf.32.2018.12.18.05.30.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Dec 2018 05:30:38 -0800 (PST)
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
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
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
Subject: [PATCH mm] kasan, arm64: use ARCH_SLAB_MINALIGN instead of manual aligning
Date:   Tue, 18 Dec 2018 14:30:33 +0100
Message-Id: <706da77adfceb0c324e824d03b52d58a752577ea.1545139710.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.0.405.gbc1bbc6f85-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Instead of changing cache->align to be aligned to KASAN_SHADOW_SCALE_SIZE
in kasan_cache_create() we can reuse the ARCH_SLAB_MINALIGN macro.

Suggested-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/kasan.h | 4 ++++
 mm/kasan/common.c              | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kasan.h b/arch/arm64/include/asm/kasan.h
index b52aacd2c526..ba26150d578d 100644
--- a/arch/arm64/include/asm/kasan.h
+++ b/arch/arm64/include/asm/kasan.h
@@ -36,6 +36,10 @@
 #define KASAN_SHADOW_OFFSET     (KASAN_SHADOW_END - (1ULL << \
 					(64 - KASAN_SHADOW_SCALE_SHIFT)))
 
+#ifdef CONFIG_KASAN_SW_TAGS
+#define ARCH_SLAB_MINALIGN	(1ULL << KASAN_SHADOW_SCALE_SHIFT)
+#endif
+
 void kasan_init(void);
 void kasan_copy_shadow(pgd_t *pgdir);
 asmlinkage void kasan_early_init(void);
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 03d5d1374ca7..44390392d4c9 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -298,8 +298,6 @@ void kasan_cache_create(struct kmem_cache *cache, unsigned int *size,
 		return;
 	}
 
-	cache->align = round_up(cache->align, KASAN_SHADOW_SCALE_SIZE);
-
 	*flags |= SLAB_KASAN;
 }
 
-- 
2.20.0.405.gbc1bbc6f85-goog

