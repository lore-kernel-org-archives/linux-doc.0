Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 563887DE5B
	for <lwn-linux-doc@archive.lwn.net>; Thu,  9 Aug 2018 19:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbeHIVrr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 9 Aug 2018 17:47:47 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33749 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727602AbeHIVrr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Aug 2018 17:47:47 -0400
Received: by mail-wr1-f66.google.com with SMTP id g6-v6so6113694wrp.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Aug 2018 12:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oD+7K3NJxiAR9JTdyTtA3ICMxYFdVVudUaNngrniyVw=;
        b=bZPgstXbwZxXDVi2nvh6WzmRfMpGDSA/Fne0ZVeSm8mxfScPujTYtuwX15ylbHkvoc
         c/CUjAYYRDyjPKkQu0phNVRCGIclqn91uWdAj/0u2yNyNdXYKfI/TpYgcpDV/qnl3qMp
         Fnq56xNwUj9aAPfL9FR8I49xffr+6JEYJopN+OUgqrUgB6boViYqjt5RxXcC3HRTkn3Y
         4ag8Fc1odQbVpT4/brI/VO2Umgdm/QW1JLQIt+ds4fXeZncAAUtjLUXIILemlq80hu8z
         mtSHWNbAsCGa3lV0+WRa/ADf2/FGivoGULA+O36urx/7C7AN3u3MJsVGmhddajSYooka
         FZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oD+7K3NJxiAR9JTdyTtA3ICMxYFdVVudUaNngrniyVw=;
        b=In0Ko7TinSp2y6iPYAwMrCC1bHBOGegZr0GXDtv4iPLHpGX3yjXqhH3NWkexE2qWpE
         swWkGr6gKPXIXd5/mjUGvKloJtBdhgtERw2h2nNRyvb7BdTGVUjgA/ZbVCRg1e9r/Ib3
         Xr8mju0QGRUjC3CigYUg3xQKqzzcfFJ/cQcHkltawuVgN9Sah/5SYrQBpIZP7nYy2+PV
         94jUh32rItk4u94D2al2Cd+nHEsESBr/GNxHyEz2ebIWAW3BoLyJeVPz0DPbV50h1EC4
         HyaM0WdsgbZj6G4QvNCo2tiav+3Z6mKTprkJikK+o4jqxUY5BgqRk71moFtwTkJwa1Fy
         89Nw==
X-Gm-Message-State: AOUpUlES13W48pW1Cm6vW9Y8whctIlMA+KG5mrSSMV9EJPBMP/9Ji9IT
        IYDsojz2G01v2z10U8NvZ+8I6Q==
X-Google-Smtp-Source: AA+uWPyIKsGrs3/6MSHl7R25hDOnzR5k5iYFLEI9aiR4odNOMfVMIRu3E50s0D493xzNbwmsjkTjJw==
X-Received: by 2002:adf:fac1:: with SMTP id a1-v6mr2167983wrs.74.1533842491567;
        Thu, 09 Aug 2018 12:21:31 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id o14-v6sm14738797wmd.35.2018.08.09.12.21.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Aug 2018 12:21:30 -0700 (PDT)
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
Subject: [PATCH v5 10/18] khwasan, arm64: enable top byte ignore for the kernel
Date:   Thu,  9 Aug 2018 21:21:02 +0200
Message-Id: <5f0609d502b690ef28a142fd4b96fae6ff4ee722.1533842385.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.597.ga71716f1ad-goog
In-Reply-To: <cover.1533842385.git.andreyknvl@google.com>
References: <cover.1533842385.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 03646e6a2ef4..c5175e098d02 100644
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
@@ -440,7 +446,7 @@ ENTRY(__cpu_setup)
 	 */
 	ldr	x10, =TCR_TxSZ(VA_BITS) | TCR_CACHE_FLAGS | TCR_SMP_FLAGS | \
 			TCR_TG_FLAGS | TCR_KASLR_FLAGS | TCR_ASID16 | \
-			TCR_TBI0 | TCR_A1
+			TCR_TBI0 | TCR_A1 | TCR_KASAN_FLAGS
 	tcr_set_idmap_t0sz	x10, x9
 
 	/*
-- 
2.18.0.597.ga71716f1ad-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
