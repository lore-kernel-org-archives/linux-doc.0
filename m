Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0248C7D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Aug 2019 17:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729973AbfHERFK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Aug 2019 13:05:10 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37028 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729921AbfHERFJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Aug 2019 13:05:09 -0400
Received: by mail-pf1-f196.google.com with SMTP id 19so39950928pfa.4
        for <linux-doc@vger.kernel.org>; Mon, 05 Aug 2019 10:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1UeFCEkBe8WB1WXsCYwcP/7nKnryRnwhqxRiHu1oF/s=;
        b=aRQhDf6hWMIwFNIsdofuz4dUydkk4193Ae5APGLROO3pABy9OrZWfS49Oc1/HtwlK8
         zBW4GUhb8QcOqCuMoUCb51aRgkOp2HCURDKAYJrVPy5wQgbMci9jK3qx0YEVG/MV2GGY
         McthzaBpFY1H9f9O58G6IjguBX4lH5u33NOZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1UeFCEkBe8WB1WXsCYwcP/7nKnryRnwhqxRiHu1oF/s=;
        b=RKQzlAB6MJd8+hx4F2w2XfzGe7zzBl4hUQ7JVjRF4CgnqMP7stZkMB9b+M//vC7UNG
         buOt8TbQ8zoeffdUumZwCzKyl2QO3zB3Po4YzOouX2uD74d7uBTGr9KiIrVLly0en7+7
         NLuqPG1UeClbo5U0Gx8sN75SUUwTaTt12O1obSP60iFmJNBQ0GzOZm9QS39Ua1gM/NUs
         yT9rxqRhfTKG8QaEIAX0tYzDV6Bmcjy9Fyrd0Alc73LxaJoo1VHphp8pbxnZ33NxHHXn
         1Jx7eO+NR2LA+oOBod0J8ViESe0mpnMVu171WeK24tBO37s0GhUuvjVC38ESjRnWN0yb
         KPOA==
X-Gm-Message-State: APjAAAV/zX9VDhX654FkJt83ExLj4ckTEnEGIPIutrsIgp2CUO9C14+p
        Fj9YPiQtcP14UcmspHr5BtQ=
X-Google-Smtp-Source: APXvYqw1Ogbi2keaae7q+qwAyhHLlLrbTZ8++SpJb3M0ShcnSkOoRtFslH3qoL66EjinazduvqoRuQ==
X-Received: by 2002:a63:ff65:: with SMTP id s37mr94810810pgk.102.1565024708684;
        Mon, 05 Aug 2019 10:05:08 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id p23sm89832934pfn.10.2019.08.05.10.05.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 10:05:07 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Borislav Petkov <bp@alien8.de>,
        Brendan Gregg <bgregg@netflix.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Hansen <chansen3@cisco.com>, dancol@google.com,
        fmayer@google.com, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>, joelaf@google.com,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@linux.ibm.com>, minchan@kernel.org,
        namhyung@google.com, paulmck@linux.ibm.com,
        Robin Murphy <robin.murphy@arm.com>,
        Roman Gushchin <guro@fb.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, surenb@google.com,
        Thomas Gleixner <tglx@linutronix.de>, tkjos@google.com,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>
Subject: [PATCH v4 2/5] [RFC] x86: Add support for idle bit in swap PTE
Date:   Mon,  5 Aug 2019 13:04:48 -0400
Message-Id: <20190805170451.26009-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190805170451.26009-1-joel@joelfernandes.org>
References: <20190805170451.26009-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This bit will be used by idle page tracking code to correctly identify
if a page that was swapped out was idle before it got swapped out.
Without this PTE bit, we lose information about if a page is idle or not
since the page frame gets unmapped and the page gets freed.

Bits 2-6 are unused in the swap PTE (see the comment in
arch/x86/include/asm/pgtable_64.h). Bit 2 corresponds to _PAGE_USER. Use
it for swap PTE purposes.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 arch/x86/Kconfig                     |  1 +
 arch/x86/include/asm/pgtable.h       | 15 +++++++++++++++
 arch/x86/include/asm/pgtable_types.h |  6 ++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 222855cc0158..728f22370f17 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -139,6 +139,7 @@ config X86
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if MMU && COMPAT
 	select HAVE_ARCH_COMPAT_MMAP_BASES	if MMU && COMPAT
 	select HAVE_ARCH_PREL32_RELOCATIONS
+	select HAVE_ARCH_PTE_SWP_PGIDLE
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_STACKLEAK
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 0bc530c4eb13..ef3e662cee4a 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1371,6 +1371,21 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
 #endif
 #endif
 
+static inline pte_t pte_swp_mkpage_idle(pte_t pte)
+{
+	return pte_set_flags(pte, _PAGE_SWP_PGIDLE);
+}
+
+static inline int pte_swp_page_idle(pte_t pte)
+{
+	return pte_flags(pte) & _PAGE_SWP_PGIDLE;
+}
+
+static inline pte_t pte_swp_clear_mkpage_idle(pte_t pte)
+{
+	return pte_clear_flags(pte, _PAGE_SWP_PGIDLE);
+}
+
 #define PKRU_AD_BIT 0x1
 #define PKRU_WD_BIT 0x2
 #define PKRU_BITS_PER_PKEY 2
diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index b5e49e6bac63..6739cba4c900 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -100,6 +100,12 @@
 #define _PAGE_SWP_SOFT_DIRTY	(_AT(pteval_t, 0))
 #endif
 
+#ifdef CONFIG_IDLE_PAGE_TRACKING
+#define _PAGE_SWP_PGIDLE	_PAGE_USER
+#else
+#define _PAGE_SWP_PGIDLE	(_AT(pteval_t, 0))
+#endif
+
 #if defined(CONFIG_X86_64) || defined(CONFIG_X86_PAE)
 #define _PAGE_NX	(_AT(pteval_t, 1) << _PAGE_BIT_NX)
 #define _PAGE_DEVMAP	(_AT(u64, 1) << _PAGE_BIT_DEVMAP)
-- 
2.22.0.770.g0f2c4a37fd-goog

