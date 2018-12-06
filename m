Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 10F4C7D8BB
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 12:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729504AbeLFM1E (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Dec 2018 07:27:04 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41112 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729635AbeLFMZF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Dec 2018 07:25:05 -0500
Received: by mail-wr1-f67.google.com with SMTP id x10so281533wrs.8
        for <linux-doc@vger.kernel.org>; Thu, 06 Dec 2018 04:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F/Rs74E1jKAK3ACh/wE42WMWNbPFeAMFJIPcMbt9WD4=;
        b=VAlGzqot4KggH/2lBiRkMM4lITHs5IpRZ4p+F4SbO+qt098Hg0g4wlLA22lQa2+sgu
         1ZO/pc5wB2nDiSRi5FFQsNwlSmKERZzC6+C1bm7VRPFwLoKQrSId434VtYvpzCsk7c3i
         /vH7cIfPKbr+V1Dilr9fKTxodHnjd41ZTfyz597HV372In0cpd9mvAmlNFP+HJxA+AQ+
         mzStQ2w6DGPYRDzykQjqYtFlASCb4Bva887fDY6JzKFwMetT4nD71IbFlWztZ4E/AIat
         lVr7320saaRT4uROOn2botn655EPyWEYbn4KMSnBzLpXEAJMIWiYQJli7yQdCgLhi50x
         ffvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F/Rs74E1jKAK3ACh/wE42WMWNbPFeAMFJIPcMbt9WD4=;
        b=Eyn4d1ZHBs/wUqmK7YsALmUsn3XCi15P7zWWqxAVS2YY6rloXXUvDm5b2P3REc31XF
         6GcTXYXv+XLvDGcIS1nBBWPZJvmnUAUhRecbCvwXisc8qClVq97BPvE02NzE0yjqB1m7
         lUSRPOl98rBt3/rmQxqneylHknw7kbuU8lZ+lZBwWWm03209TIBU4GXhhscbsfEy2e6x
         UDpaNDurEcdk7uXZ7obsFhjL8bTAsUXWHVFpwd8mYdi9bpjwL9bfCdO/2XpAPW3w2qbZ
         sO71QC8mwbhPDUOfpbhrwu9zht4YJ0gOxe3cfetVOchcLIg3DzI3H3uaEu2F0yRvcqVq
         /5Mw==
X-Gm-Message-State: AA+aEWaSsHGpodDKYkWkKNUUa4ewy3/P0hIkFbCUqqI+7fWe4NaODNuY
        XbgwBYfYqdRzXzW3S+DA28gfuw==
X-Google-Smtp-Source: AFSGD/XTYTqzsshlDGi9NHkEBAbQ2NsOtZrsn1Z0Y2zjYz0lfHZbxea+X0lOoDWgzEFhq8Dhw9ARjA==
X-Received: by 2002:adf:b783:: with SMTP id s3mr26257157wre.274.1544099102810;
        Thu, 06 Dec 2018 04:25:02 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id j8sm339988wrt.40.2018.12.06.04.25.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Dec 2018 04:25:01 -0800 (PST)
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
Subject: [PATCH v13 09/25] arm64: move untagged_addr macro from uaccess.h to memory.h
Date:   Thu,  6 Dec 2018 13:24:27 +0100
Message-Id: <2e9ef8d2ed594106eca514b268365b5419113f6a.1544099024.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.0.rc1.387.gf8505762e3-goog
In-Reply-To: <cover.1544099024.git.andreyknvl@google.com>
References: <cover.1544099024.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move the untagged_addr() macro from arch/arm64/include/asm/uaccess.h
to arch/arm64/include/asm/memory.h to be later reused by KASAN.

Also make the untagged_addr() macro accept all kinds of address types
(void *, unsigned long, etc.). This allows not to specify type casts in
each place where the macro is used. This is done by using __typeof__.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/memory.h  | 8 ++++++++
 arch/arm64/include/asm/uaccess.h | 7 -------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index 05fbc7ffcd31..e2c9857157f2 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -211,6 +211,14 @@ static inline unsigned long kaslr_offset(void)
  */
 #define PHYS_PFN_OFFSET	(PHYS_OFFSET >> PAGE_SHIFT)
 
+/*
+ * When dealing with data aborts, watchpoints, or instruction traps we may end
+ * up with a tagged userland pointer. Clear the tag to get a sane pointer to
+ * pass on to access_ok(), for instance.
+ */
+#define untagged_addr(addr)	\
+	((__typeof__(addr))sign_extend64((u64)(addr), 55))
+
 /*
  * Physical vs virtual RAM address space conversion.  These are
  * private definitions which should NOT be used outside memory.h
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 07c34087bd5e..281a1e47263d 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -96,13 +96,6 @@ static inline unsigned long __range_ok(const void __user *addr, unsigned long si
 	return ret;
 }
 
-/*
- * When dealing with data aborts, watchpoints, or instruction traps we may end
- * up with a tagged userland pointer. Clear the tag to get a sane pointer to
- * pass on to access_ok(), for instance.
- */
-#define untagged_addr(addr)		sign_extend64(addr, 55)
-
 #define access_ok(type, addr, size)	__range_ok(addr, size)
 #define user_addr_max			get_fs
 
-- 
2.20.0.rc1.387.gf8505762e3-goog

