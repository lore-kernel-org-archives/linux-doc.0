Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5AFCD7DF8F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 17:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754614AbeFTRrN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 13:47:13 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36093 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754273AbeFTRkO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jun 2018 13:40:14 -0400
Received: by mail-wm0-f68.google.com with SMTP id v131-v6so1009525wma.1
        for <linux-doc@vger.kernel.org>; Wed, 20 Jun 2018 10:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tB4UWhMaNQffoQbAPM7NOHomrrfVksNGHY9yx1VD2yU=;
        b=RZAjwNiPmjyJp29bPlp8gxw3rG0h9l2DKYUD3bs9ne+Yn5OMNkHRuzb+/GUfGVDB04
         N/6mPlVH2DM4bySGoit/dM64qclMS60gDhBjSlwUDXjayhHKXBoS6KlS60a70zt/TjGH
         9hQp1Ayb5tv6Kbr9udS7AEcArs0BGAf0N6AJSC0YJIeXui2Fi4kWRDfUjrybQI2IyNMp
         d0B14jS2FrBnFozmKgI5zfIiD28jHGTx0RzxBuIB9/JzYsaJnHdt7lQBRv1UKc2D8I1z
         GCcdLc/YlmWoj62QWCzRyT00Hpkfc+YLQlpYqWevSPCLSc0if+oLpbRa7t4TnDk/xJHH
         Twpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tB4UWhMaNQffoQbAPM7NOHomrrfVksNGHY9yx1VD2yU=;
        b=lU8Jq7OvPhf8YDBU5v+Fa7zHFMCIy8GntEVBEh6SYuvLQ7uaTqsjyJQH0f1xHMgSGy
         Hjs1sea4Wznr+FCXJeRkl7CYaP8Mu9ll2bKzEBwVLl6CrDrppOo9SMRMpoIUJfb+azf/
         4d8Zanx7vgMsnh5Hmj952xBivZ4Ht9AV+BKgMQBPyvvNMFEwOr/GLRTnvsnU9NKwfX46
         n3YUY5/ASFNpKIjsRQSYGoayvta3uKhGY2evhee2cQAJlsyIw7gE9+dUOESwSK+BDsk4
         P5QnsdxpfBWmVCGrOAHm987VBO4iux5Gw8Bmva3uR04BQs7w/FWyGJZX6iyc+cVGY3eN
         o4UA==
X-Gm-Message-State: APt69E0Fr0f51aDnfXonxA3pR8ysFWx4CgZPWWrKUTSGtY2o6MCNfqQC
        0DvSR8jnoHbL0bbNmFjFBWSRUw==
X-Google-Smtp-Source: ADUXVKKc2qUfzDyQAC8oFyJzKs2oHOk+fDpwj3O8IpWEMp1rs5cMpoOeRq48d6eJGtXDJlJDu6mymw==
X-Received: by 2002:a1c:630b:: with SMTP id x11-v6mr2578729wmb.104.1529516413222;
        Wed, 20 Jun 2018 10:40:13 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id f18-v6sm4388598wro.1.2018.06.20.10.40.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jun 2018 10:40:12 -0700 (PDT)
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
Subject: [PATCH v3 04/17] khwasan, arm64: adjust shadow size for CONFIG_KASAN_HW
Date:   Wed, 20 Jun 2018 19:39:50 +0200
Message-Id: <44cfb47c7d8b485b03f17eb406037e3c01a52fa9.1529515183.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.rc1.244.gcf134e6275-goog
In-Reply-To: <cover.1529515183.git.andreyknvl@google.com>
References: <cover.1529515183.git.andreyknvl@google.com>
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
2.18.0.rc1.244.gcf134e6275-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
