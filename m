Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D6E707D8BB
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Nov 2018 16:56:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731691AbeK1Dyr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Nov 2018 22:54:47 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46704 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731714AbeK1Dyq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Nov 2018 22:54:46 -0500
Received: by mail-wr1-f66.google.com with SMTP id l9so23424451wrt.13
        for <linux-doc@vger.kernel.org>; Tue, 27 Nov 2018 08:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5TjQJgkFl+PVCxLsWj9vCgbjvK0haYDKUt+yI6asfBc=;
        b=Vq8xJz4L04oXAVPDvOzYuzz+wHl1QGBnQgoEk8zjm/CZt1EqPmCV4MXLs83CCDHriG
         nZQo2iAfvSYq4/G3CcCYjx4+keudcdowz/V+f1xuztB78kVIxdEUZPxUlxAPXdNGfB8r
         xuY642dJ4/Jr9SFclo8bI/fnE/NGVNXmJm4HZJ33i2h7k3awNqoEHgHv2j3ghoHSetBq
         N8DthHjipq15+ycjHXS4dovDb+hu7nsTOkP31YrSMZgr2yUOtGuEakHyfOu0gQJ0gQKp
         +mRR4yL+iYIE+weqA0Qvd988IjrsHCP9yGsIKBnEAOfNH/W7HPJ8EjTjXk2hbR05NzUV
         UPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5TjQJgkFl+PVCxLsWj9vCgbjvK0haYDKUt+yI6asfBc=;
        b=heAEruqU3XS7Fklxy8y96gsUElH8p9IeDuXvw1N4jdqlkBg6DgfzD8XnBsYDiRW0uG
         ZC8wALKCfz09FUnpoDVhdOBIHxmGfQlj2KiREo5+Nm/4nWG2EawjYT0oliVLAcp1iPNR
         lENSfjOWo6ogkBr2t4DD8nEFwnzKLTmuCiVqV9mSontKaOXDwyIZBVUu04mM1LRKFbOx
         gvcHFrfiX4wIXnJQAiDJ5AgsgZ6uguChKLE/bf7eVIJ+MUhTfBSuWYeSi6kJLDe4xDpF
         Lj//LpLnOEEwuFwZuVUjCD2ORN5zUd1/tinWMg28Xnf90ipz+V9CtEJgwIYexHIfsCtX
         +FLg==
X-Gm-Message-State: AA+aEWZN/RlBvnCM4cYgPjVElCzcTkw0JrqlXdhbUIgEEnp6hJNmoFRT
        nRWXgbghOa7vWBoWoK5IzJI4nQ==
X-Google-Smtp-Source: AFSGD/VnXoSEtN3ApgD8MSpZdtG9X13UEEYBU7XpEpIdqGrEHViBzH7UhGky5kkFLvu375ZFYdDdzA==
X-Received: by 2002:adf:c711:: with SMTP id k17mr15658939wrg.197.1543337774345;
        Tue, 27 Nov 2018 08:56:14 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id k73sm6383099wmd.36.2018.11.27.08.56.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Nov 2018 08:56:13 -0800 (PST)
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
Subject: [PATCH v12 14/25] kasan, arm64: enable top byte ignore for the kernel
Date:   Tue, 27 Nov 2018 17:55:32 +0100
Message-Id: <1ed03d53ee679cba52ba7118d2acbef948d21fcc.1543337629.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.0.rc0.387.gc7a69e6b6c-goog
In-Reply-To: <cover.1543337629.git.andreyknvl@google.com>
References: <cover.1543337629.git.andreyknvl@google.com>
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

Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/pgtable-hwdef.h | 1 +
 arch/arm64/mm/proc.S                   | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index 1d7d8da2ef9b..d43b870c39b3 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -291,6 +291,7 @@
 #define TCR_A1			(UL(1) << 22)
 #define TCR_ASID16		(UL(1) << 36)
 #define TCR_TBI0		(UL(1) << 37)
+#define TCR_TBI1		(UL(1) << 38)
 #define TCR_HA			(UL(1) << 39)
 #define TCR_HD			(UL(1) << 40)
 #define TCR_NFD1		(UL(1) << 54)
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 2c75b0b903ae..d861f208eeb1 100644
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
@@ -445,7 +451,7 @@ ENTRY(__cpu_setup)
 	 */
 	ldr	x10, =TCR_TxSZ(VA_BITS) | TCR_CACHE_FLAGS | TCR_SMP_FLAGS | \
 			TCR_TG_FLAGS | TCR_KASLR_FLAGS | TCR_ASID16 | \
-			TCR_TBI0 | TCR_A1
+			TCR_TBI0 | TCR_A1 | TCR_KASAN_FLAGS
 	tcr_set_idmap_t0sz	x10, x9
 
 	/*
-- 
2.20.0.rc0.387.gc7a69e6b6c-goog

