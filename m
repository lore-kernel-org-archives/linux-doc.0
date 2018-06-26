Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1F60C7D062
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 13:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935412AbeFZNUo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 09:20:44 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:36710 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964930AbeFZNPl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jun 2018 09:15:41 -0400
Received: by mail-wr0-f196.google.com with SMTP id f16-v6so17238793wrm.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Jun 2018 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YhNLQluC3zPdVMeBvR8Lp3d958WDaREzBrtKu3hGG6k=;
        b=RwV4diPI5VZPDDv5Zq8UsZ/Wk67TJvBxzP6g9IZUzZGKVf+VNmstYYfQWZsJZ/V0k5
         kAGn6M69HRK9FZmOqol0Eujoa+GaZYCZXTCNBVvhD0E2dshKwkWAu1lPbilKNvNtAgRC
         9sa+ZHs0eVFwO+Jc5oKtsJPREpBD2NVSdf1bsCDNzGPHXBvBig5iOm9PGRfd6gKMgupm
         +5g2h6ETCHP7/i9e/AUa3UezW+aAi2E4ZUz5XIr3RXUMzmWrdXUHKChNE1ij00G1qdSo
         BPejbwPfDWDB0ZVftjMIp3fLSmKWo7+XACY67IRLpaUtBvgzIIQ5rVx7RGuZe+qSw13u
         0NcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YhNLQluC3zPdVMeBvR8Lp3d958WDaREzBrtKu3hGG6k=;
        b=j8OUZj3TVfJa9fbzvnlm5h3Xhbmk1YGfTSX21pEVVJMBkywwFdALe8QP6y98CcToyK
         3U6txuF3XJINsp/Dpb45+l1kTQTnf8cbfqmvf+9j88iyp9X3O6/lj2LjtaWpzBxkGrqi
         8ph773sNhVF4dJa30QGmLwSbGQ8/qrdPsjGzz6OMDogLAQRqZmDtbfgtjalLmhH+f135
         ftD/F7foFH7KwmVIBxYFrQv2ifDeWbfgwZMMH+5+ka2BDBD5UG5gWZyFmteyNlD9elmg
         JLC34UOw3nXJeDddUw4IwHe+nE6fBAwqCo5CrqF7T89K3Ghz7jKK3i5DvIF/sZFSPCYC
         J/5A==
X-Gm-Message-State: APt69E03zxVyl0xLBvmC3oA8XheGYfXveQsejfDfrIZZugO6gQ5o3jtx
        1Eae5w8RG6c4VoPR39y+ZA6i0A==
X-Google-Smtp-Source: AAOMgpe73aw5AlVm35tCVu9KNcKwev8Ou8kNvcNlIjMYYsOqNt5bqVLG2IwOrZEwRCFZ4OVr7mUFFg==
X-Received: by 2002:adf:88e3:: with SMTP id g32-v6mr1411208wrg.62.1530018939538;
        Tue, 26 Jun 2018 06:15:39 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id w15-v6sm2162639wrn.25.2018.06.26.06.15.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jun 2018 06:15:38 -0700 (PDT)
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
Subject: [PATCH v4 04/17] khwasan, arm64: adjust shadow size for CONFIG_KASAN_HW
Date:   Tue, 26 Jun 2018 15:15:14 +0200
Message-Id: <7bd08c76830e4cd23f90d1ed25721fca3c5f3205.1530018818.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.rc2.346.g013aa6912e-goog
In-Reply-To: <cover.1530018818.git.andreyknvl@google.com>
References: <cover.1530018818.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

KWHASAN uses 1 shadow byte for 16 bytes of kernel memory, so it requires
1/16th of the kernel virtual address space for the shadow memory.

This commit sets KASAN_SHADOW_SCALE_SHIFT to 4 when KHWASAN is enabled.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/Makefile             |  2 +-
 arch/arm64/include/asm/memory.h | 13 +++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 45272266dafb..191a649f34e7 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -93,7 +93,7 @@ endif
 # KASAN_SHADOW_OFFSET = VA_START + (1 << (VA_BITS - KASAN_SHADOW_SCALE_SHIFT))
 #				 - (1 << (64 - KASAN_SHADOW_SCALE_SHIFT))
 # in 32-bit arithmetic
-KASAN_SHADOW_SCALE_SHIFT := 3
+KASAN_SHADOW_SCALE_SHIFT := $(if $(CONFIG_KASAN_HW), 4, 3)
 KASAN_SHADOW_OFFSET := $(shell printf "0x%08x00000000\n" $$(( \
 	(0xffffffff & (-1 << ($(CONFIG_ARM64_VA_BITS) - 32))) \
 	+ (1 << ($(CONFIG_ARM64_VA_BITS) - 32 - $(KASAN_SHADOW_SCALE_SHIFT))) \
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index 49d99214f43c..6d084431b7f7 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -74,12 +74,17 @@
 #define KERNEL_END        _end
 
 /*
- * KASAN requires 1/8th of the kernel virtual address space for the shadow
- * region. KASAN can bloat the stack significantly, so double the (minimum)
- * stack size when KASAN is in use.
+ * KASAN and KHWASAN require 1/8th and 1/16th of the kernel virtual address
+ * space for the shadow region respectively. They can bloat the stack
+ * significantly, so double the (minimum) stack size when they are in use.
  */
-#ifdef CONFIG_KASAN
+#ifdef CONFIG_KASAN_GENERIC
 #define KASAN_SHADOW_SCALE_SHIFT 3
+#endif
+#ifdef CONFIG_KASAN_HW
+#define KASAN_SHADOW_SCALE_SHIFT 4
+#endif
+#ifdef CONFIG_KASAN
 #define KASAN_SHADOW_SIZE	(UL(1) << (VA_BITS - KASAN_SHADOW_SCALE_SHIFT))
 #define KASAN_THREAD_SHIFT	1
 #else
-- 
2.18.0.rc2.346.g013aa6912e-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
