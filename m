Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5777F7D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 17:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389700AbeKGC67 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 21:58:59 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36141 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389702AbeKGC5H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 21:57:07 -0500
Received: by mail-wr1-f67.google.com with SMTP id z13-v6so12090698wrs.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Nov 2018 09:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zR59Oh4f3YmUUjWQVuUWbISM47BcdXN0TxZaGQsGruw=;
        b=KYgRkNeECJs3IElsm0p/zMKWz/tzGt+6DJSzEuOn81O+jW9wjUl7WlsyE44DwW2UBJ
         IGjSnu8L6/Px81VwxB66DoNIWe9Fv13N1ZxhAB1MOHFuxbZpt5gBXpIC08ZcsnoU//06
         p6ZwWNCogZ6ijzbJ2QLRUniM6z71avQSO6O3Dpg2UYO2qU8fsC6elqb+ah3SvDv1lQ0v
         D9t2T4M5r4m1nXUM/NX8cheOTr7DtYbhC9LBM/lc/47TWAtYevFH5WcZYmfAbmPPZwG6
         CHwa7OZJXdLdFCnVq1AdWznvOE+WGHUxDfCZ5LT1J7r+8k29rGlpDeXzjJ8OYkGlKfR9
         I2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zR59Oh4f3YmUUjWQVuUWbISM47BcdXN0TxZaGQsGruw=;
        b=eMwJUr9xw2mlYERi6K5cpsSUYEBJ13emBCQ5G2LuSSpBLUY5a/He3pwNHcMFhqUxI6
         4+/OWgsEqjwxSbFbtNNGPSNtgw48islqmpGmvHHWpIwmHihJlxs4pgsw7IG9MApWm/lN
         CId+rplMAgydf23bH1M9dMED3oUgGLpXpcyAimAftPtboyzr8Erh8XLh/DhVZyKr10x8
         jC4UZ7CilMQvNIJCuyrgEOz2gU59TdvbI+4OybpJkFhYqPp6ivtHjLsPUpGHLRE2jSdW
         0AgQLQZ7DdkngoqdZ+wJqPGA+0klL5ODKvAfWb84SJPCtpd976UZsFd2e8rY4Qey7koy
         VjCg==
X-Gm-Message-State: AGRZ1gISHZzYii6Zmh7t3pLIN8sz06M1Z+8Di/bcHO+S0PEMrx0jozD2
        a3go0LUgYqsoWgdBXnx+fJVS5Q==
X-Google-Smtp-Source: AJdET5eezPyu5zivf/GdDpGQTMhCVkl0xj8xUSgzntxDQd3ItQFM5kt+5hhSTXC4DgW6e/T6ozoIbw==
X-Received: by 2002:adf:9589:: with SMTP id p9-v6mr24794256wrp.270.1541525451174;
        Tue, 06 Nov 2018 09:30:51 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id z17-v6sm16328416wrm.65.2018.11.06.09.30.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Nov 2018 09:30:50 -0800 (PST)
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
Subject: [PATCH v10 06/22] kasan, arm64: adjust shadow size for tag-based mode
Date:   Tue,  6 Nov 2018 18:30:21 +0100
Message-Id: <86d1b17c755d8bfd6e44e6869a16f4a409e7bd06.1541525354.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <cover.1541525354.git.andreyknvl@google.com>
References: <cover.1541525354.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tag-based KASAN uses 1 shadow byte for 16 bytes of kernel memory, so it
requires 1/16th of the kernel virtual address space for the shadow memory.

This commit sets KASAN_SHADOW_SCALE_SHIFT to 4 when the tag-based KASAN
mode is enabled.

Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/Makefile             |  2 +-
 arch/arm64/include/asm/memory.h | 13 +++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 6cb9fc7e9382..9887492381d9 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -94,7 +94,7 @@ endif
 # KASAN_SHADOW_OFFSET = VA_START + (1 << (VA_BITS - KASAN_SHADOW_SCALE_SHIFT))
 #				 - (1 << (64 - KASAN_SHADOW_SCALE_SHIFT))
 # in 32-bit arithmetic
-KASAN_SHADOW_SCALE_SHIFT := 3
+KASAN_SHADOW_SCALE_SHIFT := $(if $(CONFIG_KASAN_SW_TAGS), 4, 3)
 KASAN_SHADOW_OFFSET := $(shell printf "0x%08x00000000\n" $$(( \
 	(0xffffffff & (-1 << ($(CONFIG_ARM64_VA_BITS) - 32))) \
 	+ (1 << ($(CONFIG_ARM64_VA_BITS) - 32 - $(KASAN_SHADOW_SCALE_SHIFT))) \
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index b96442960aea..0f1e024a951f 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -74,12 +74,17 @@
 #define KERNEL_END        _end
 
 /*
- * KASAN requires 1/8th of the kernel virtual address space for the shadow
- * region. KASAN can bloat the stack significantly, so double the (minimum)
- * stack size when KASAN is in use.
+ * Generic and tag-based KASAN require 1/8th and 1/16th of the kernel virtual
+ * address space for the shadow region respectively. They can bloat the stack
+ * significantly, so double the (minimum) stack size when they are in use.
  */
-#ifdef CONFIG_KASAN
+#ifdef CONFIG_KASAN_GENERIC
 #define KASAN_SHADOW_SCALE_SHIFT 3
+#endif
+#ifdef CONFIG_KASAN_SW_TAGS
+#define KASAN_SHADOW_SCALE_SHIFT 4
+#endif
+#ifdef CONFIG_KASAN
 #define KASAN_SHADOW_SIZE	(UL(1) << (VA_BITS - KASAN_SHADOW_SCALE_SHIFT))
 #define KASAN_THREAD_SHIFT	1
 #else
-- 
2.19.1.930.g4563a0d9d0-goog

