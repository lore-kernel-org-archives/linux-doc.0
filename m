Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 24A887E957
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 18:31:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404221AbeKTDve (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 22:51:34 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38974 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404632AbeKTDvd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 22:51:33 -0500
Received: by mail-wm1-f66.google.com with SMTP id u13-v6so6070655wmc.4
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 09:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nn1bGI0lAecZVd/Nr8NjkoGpex3MA1HD9KRsJD9iBaE=;
        b=al3YzVeCj0YHhNT6cg0Cjcm8u0ncAy2aMGzZTXZmBtegGLPp2r2vS/AJZTwT7SL1V1
         G7ymRvAYBgYbSCnWsgyJUCkbY4M087bjjhgwKwffeoOJZkm4H5MVbig26lZWKrrpyugY
         laWJcgG0cgDzgtN8+NEf/Iha4W6cl+INqnjWh0rK/vi5RvWuvaAN0qJwoj7nuwHz9FO8
         PX7IhcrXscvAGA8VE5Nd0vgHVsO/z9IDKSL/xCCwkBoK1bB+u0M0vt2z9yHPeByUETUh
         +FkaBUwb8g+m4sfCg6fphwjcewjH/c/0YrgivC2giSPSBTQYyTpIfbyOo3rG2wmlx6FG
         qX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nn1bGI0lAecZVd/Nr8NjkoGpex3MA1HD9KRsJD9iBaE=;
        b=KlZEFAYoknzlAvhgONPwE2o0NFCa7P0MiiafeArk3sAgp04FY2GY9TQoadXsOY8yPL
         kal1LCWqjLKUgHnXOElpHts1z3pOBVEo6UUiZsGf8BFxermF41Y3rGlhYr5fOMcTBetm
         YW6/MOyQGeaczf/kxc1uoqT/DHHOe8A+QOii/uF0xcXOrhHNdNDh4MZfmVc6duGnHylb
         Pe+0pXJIOcQ/8quR9vbQqie3Ff4thMtS9qme5XkpOhkxpCAsrokZZqdTRR7DRfD+HTNV
         2NqigepGs4yJmCUb9tSLU4Q2RTIQ8XNMMOxKNVelCKxbyJ1Z17T0ggmfNF5fCSh7/trl
         yrNA==
X-Gm-Message-State: AGRZ1gK98GSKB94fGZEuer67o9BR24oEXumPyDflvUEIfIzf6CoFbSCM
        ztwJ4nYL2Ritm1j9K3Cw/bBfiw==
X-Google-Smtp-Source: AFSGD/WQMm489HnpI1eyiDD7CjXlAqXEJysYrdjjAsIWTnQ1RLMBImBnpeCFI1436TFPYvZWdfHBfw==
X-Received: by 2002:a1c:7601:: with SMTP id r1mr7770386wmc.98.1542648426679;
        Mon, 19 Nov 2018 09:27:06 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id l143-v6sm23685190wmb.23.2018.11.19.09.27.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Nov 2018 09:27:05 -0800 (PST)
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
Subject: [PATCH v11 08/24] kasan: initialize shadow to 0xff for tag-based mode
Date:   Mon, 19 Nov 2018 18:26:24 +0100
Message-Id: <1a06035a7777dedcc93680ca739c481fb068073d.1542648335.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.1215.g8438c0b245-goog
In-Reply-To: <cover.1542648335.git.andreyknvl@google.com>
References: <cover.1542648335.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A tag-based KASAN shadow memory cell contains a memory tag, that
corresponds to the tag in the top byte of the pointer, that points to that
memory. The native top byte value of kernel pointers is 0xff, so with
tag-based KASAN we need to initialize shadow memory to 0xff.

Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/mm/kasan_init.c | 15 +++++++++++++--
 include/linux/kasan.h      |  8 ++++++++
 mm/kasan/common.c          |  3 ++-
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index 4ebc19422931..7a4a0904cac8 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -43,6 +43,15 @@ static phys_addr_t __init kasan_alloc_zeroed_page(int node)
 	return __pa(p);
 }
 
+static phys_addr_t __init kasan_alloc_raw_page(int node)
+{
+	void *p = memblock_alloc_try_nid_raw(PAGE_SIZE, PAGE_SIZE,
+						__pa(MAX_DMA_ADDRESS),
+						MEMBLOCK_ALLOC_ACCESSIBLE,
+						node);
+	return __pa(p);
+}
+
 static pte_t *__init kasan_pte_offset(pmd_t *pmdp, unsigned long addr, int node,
 				      bool early)
 {
@@ -92,7 +101,9 @@ static void __init kasan_pte_populate(pmd_t *pmdp, unsigned long addr,
 	do {
 		phys_addr_t page_phys = early ?
 				__pa_symbol(kasan_early_shadow_page)
-					: kasan_alloc_zeroed_page(node);
+					: kasan_alloc_raw_page(node);
+		if (!early)
+			memset(__va(page_phys), KASAN_SHADOW_INIT, PAGE_SIZE);
 		next = addr + PAGE_SIZE;
 		set_pte(ptep, pfn_pte(__phys_to_pfn(page_phys), PAGE_KERNEL));
 	} while (ptep++, addr = next, addr != end && pte_none(READ_ONCE(*ptep)));
@@ -239,7 +250,7 @@ void __init kasan_init(void)
 			pfn_pte(sym_to_pfn(kasan_early_shadow_page),
 				PAGE_KERNEL_RO));
 
-	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
+	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
 	cpu_replace_ttbr1(lm_alias(swapper_pg_dir));
 
 	/* At this point kasan is fully initialized. Enable error messages */
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index ec22d548d0d7..c56af24bd3e7 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -153,6 +153,8 @@ static inline size_t kasan_metadata_size(struct kmem_cache *cache) { return 0; }
 
 #ifdef CONFIG_KASAN_GENERIC
 
+#define KASAN_SHADOW_INIT 0
+
 void kasan_cache_shrink(struct kmem_cache *cache);
 void kasan_cache_shutdown(struct kmem_cache *cache);
 
@@ -163,4 +165,10 @@ static inline void kasan_cache_shutdown(struct kmem_cache *cache) {}
 
 #endif /* CONFIG_KASAN_GENERIC */
 
+#ifdef CONFIG_KASAN_SW_TAGS
+
+#define KASAN_SHADOW_INIT 0xFF
+
+#endif /* CONFIG_KASAN_SW_TAGS */
+
 #endif /* LINUX_KASAN_H */
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 5f68c93734ba..7134e75447ff 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -473,11 +473,12 @@ int kasan_module_alloc(void *addr, size_t size)
 
 	ret = __vmalloc_node_range(shadow_size, 1, shadow_start,
 			shadow_start + shadow_size,
-			GFP_KERNEL | __GFP_ZERO,
+			GFP_KERNEL,
 			PAGE_KERNEL, VM_NO_GUARD, NUMA_NO_NODE,
 			__builtin_return_address(0));
 
 	if (ret) {
+		__memset(ret, KASAN_SHADOW_INIT, shadow_size);
 		find_vm_area(addr)->flags |= VM_KASAN;
 		kmemleak_ignore(ret);
 		return 0;
-- 
2.19.1.1215.g8438c0b245-goog

