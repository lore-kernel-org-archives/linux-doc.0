Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087E913FF5
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481719; cv=none; b=Cc5ErFN2bOW37ILygiKn28J9LSmyzg/cWsA7HqJCI8BT1P5dPRWozsYUOZaSdG91JrLRznOUXrXN8uzkbCcVlIv5J7on9AVXSJNXe3Gx8OyvsM7v2IHFFZd1PW8QTzvU+R/rrkvWEZg9FPHa3oq/GfKxJe/3FAxjXcqBM8jE2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481719; c=relaxed/simple;
	bh=vOX4q4opS0dxxbefCiogoQPrr66Eioe8Jv4yLVRexA8=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=mcw04tYamVHbseNqCMQVNDm0mMJdJ79abkXvwDE/KecftRR9eG2GFJ3UckERPdNPy/4NUuoipf/tBfucOGfPgMCNyegvJoX/ICV4SQEBFcjjLc/ZTgUIPoeSdQIOa5m5/2f19LEeg7NwYCLApH2h8FY2Prz//rGU/oK5EUXd3vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Itq0+ZjV; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Itq0+ZjV"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3606f57e08aso49705965ab.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481717; x=1706086517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph79i/nPO6mlBg1/x1XDrWNIn1dETKN2RSX9v+VFgso=;
        b=Itq0+ZjVW+FeXIxKjk/KObdGJo4kDvhKwOZ24hKlVIk1J+tLToqYkvPZakFTpirdNk
         mwmOJMNpEwcr/aDEeqvsXfKitzIb2YeRftucbiKYWMHwn9fexMr519pEtUvsDQwPxd8I
         ZGH3LtwMpKqrU61UOkn64V9i3d/MbUJTama0vDrK+g23iJ9QStqGZrxGLuDQiJV4T50l
         VkicLIYXmHpOWuUPUU0SSdWKHhqF6FP85lkHz/Bm+g804wsS2EBMZN+Hiu8t5eBh9Wrq
         V9A18ABlMJ+/eQtqiCc03iaGVuBBfgOenRoRbum5t7+96Gnb32peeKEX+OJMgViuYJGJ
         A6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481717; x=1706086517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph79i/nPO6mlBg1/x1XDrWNIn1dETKN2RSX9v+VFgso=;
        b=xL/A50PZ3cdAsA/GO1HiLhhVu+5JaPzhU/pw1HMhi7md4/tLXEB5EX8/Q5dPThNKGV
         67bKNlw6Yv8RFx+rKxcyyiIy9RBvi5W4/iTzju+ChN3gWAytYKkKclJLrh5zQ0C9Y1Fo
         TlKC6bkc8hEdxGwNfQfgqqvNOomF9zc90unyLElZS60N6mCP+RF38rXnXNMcN0FRKl/J
         vB2YPH+Yj6OxQx6aphXHHbMn/J7e9cEzqvJhH+pNkKEQyb3DNnPuqRIQoqFv6b3vBxnE
         FOVwYPItgAiPW/WrJzLSkpz3V+3wUe+hoqIcKJZKJjrlCmcZ02RTpccPWZIynGh2jlKX
         twnA==
X-Gm-Message-State: AOJu0YyvSDGCIdqsf6xIzQ7slgbYSve44B4ZL/ydEVn0nPSfPdculSzr
	O1fS//q5Q3Ssr0BgticgmqpItBM5DLTMwOOeSIo4H9iPOg4=
X-Google-Smtp-Source: AGHT+IEVaAb0HH9fPBP/3mcUy5KSO+kxl+4eDJAKlxGmuTE0yf0UTe3ecqUzRFAD7ir4Vl07owg7ag==
X-Received: by 2002:a92:6f0e:0:b0:360:7652:412d with SMTP id k14-20020a926f0e000000b003607652412dmr8501818ilc.4.1705481717168;
        Wed, 17 Jan 2024 00:55:17 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:55:16 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 03/19] arm64: place kernel in its own L0 page table entry
Date: Wed, 17 Jan 2024 16:53:41 +0800
Message-Id: <20240117085357.31693-4-jiahao.os@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240117085357.31693-1-jiahao.os@bytedance.com>
References: <20240117085357.31693-1-jiahao.os@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Kernel text replication needs to maintain separate per-node page
tables for the kernel text. In order to do this without affecting
other kernel memory mappings, placing the kernel such that it does
not share a L0 page table entry with any other mapping is desirable.

Prior to this commit, the layout without KASLR was:

+----------+
|  vmalloc |
+----------+
|  Kernel  |
+----------+ MODULES_END, VMALLOC_START, KIMAGE_VADDR =
|  Modules |                 MODULES_VADDR + MODULES_VSIZE
+----------+ MODULES_VADDR = _PAGE_END(VA_BITS_MIN)
| VA space |
+----------+ 0

This becomes:

+----------+
|  vmalloc |
+----------+ VMALLOC_START = MODULES_END + PGDIR_SIZE
|  Kernel  |
+----------+ MODULES_END, KIMAGE_VADDR = _PAGE_END(VA_BITS_MIN) +
|  Modules |    max(PGDIR_SIZE, MODULES_VSIZE)
+----------+ MODULES_VADDR = MODULES_END - MODULES_VSIZE
| VA space |
+----------+ 0

This assumes MODULES_VSIZE (128M) <= PGDIR_SIZE.

One side effect of this change is that KIMAGE_VADDR's definition now
includes PGDIR_SIZE (to leave room for the modules) but this is not
defined when asm/memory.h is included. This means KIMAGE_VADDR can
not be used in inline functions within this file, so we convert
kaslr_offset() and kaslr_enabled() to be macros instead.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/memory.h  | 28 +++++++++++++++++++++-------
 arch/arm64/include/asm/pgtable.h |  2 +-
 arch/arm64/kernel/kaslr.c        |  1 +
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index d82305ab420f..c73820fb36a3 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -43,9 +43,26 @@
 #define VA_BITS			(CONFIG_ARM64_VA_BITS)
 #define _PAGE_OFFSET(va)	(-(UL(1) << (va)))
 #define PAGE_OFFSET		(_PAGE_OFFSET(VA_BITS))
-#define KIMAGE_VADDR		(MODULES_END)
-#define MODULES_END		(MODULES_VADDR + MODULES_VSIZE)
-#define MODULES_VADDR		(_PAGE_END(VA_BITS_MIN))
+
+/*
+ * Setting KIMAGE_VADDR has got a lot harder, ideally we'd like to use
+ * min(PGDIR_SIZE, MODULES_VSIZE) but this can't work because this is used
+ * both in assembly as C, where it causes problems. min_t() solves the
+ * C problems but can't be used in assembly.
+ * CONFIG_ARM64_4K_PAGES, PGDIR_SIZE is 2M, 1G, 512G
+ * CONFIG_ARM64_16K_PAGES, PGDIR_SIZE is 32M, 64G or 128T
+ * CONFIG_ARM64_64K_PAGES, PGDIR_SIZE is 512M or 4T
+ */
+#if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
+    (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
+    (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
+#define KIMAGE_OFFSET		MODULES_VSIZE
+#else
+#define KIMAGE_OFFSET		PGDIR_SIZE
+#endif
+#define KIMAGE_VADDR		(_PAGE_END(VA_BITS_MIN) + KIMAGE_OFFSET)
+#define MODULES_END		(KIMAGE_VADDR)
+#define MODULES_VADDR		(MODULES_END - MODULES_VSIZE)
 #define MODULES_VSIZE		(SZ_2G)
 #define VMEMMAP_START		(-(UL(1) << (VA_BITS - VMEMMAP_SHIFT)))
 #define VMEMMAP_END		(VMEMMAP_START + VMEMMAP_SIZE)
@@ -223,10 +240,7 @@ extern s64			memstart_addr;
 /* the offset between the kernel virtual and physical mappings */
 extern u64			kimage_voffset;
 
-static inline unsigned long kaslr_offset(void)
-{
-	return (u64)&_text - KIMAGE_VADDR;
-}
+#define kaslr_offset()	((unsigned long)((u64)&_text - KIMAGE_VADDR))
 
 #ifdef CONFIG_RANDOMIZE_BASE
 void kaslr_init(void);
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 79ce70fbb751..97d2127d64eb 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -21,7 +21,7 @@
  * VMALLOC_END: extends to the available space below vmemmap, PCI I/O space
  *	and fixed mappings
  */
-#define VMALLOC_START		(MODULES_END)
+#define VMALLOC_START		(MODULES_END + PGDIR_SIZE)
 #define VMALLOC_END		(VMEMMAP_START - SZ_256M)
 
 #define vmemmap			((struct page *)VMEMMAP_START - (memstart_addr >> PAGE_SHIFT))
diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
index 12c7f3c8ba76..1af065280d86 100644
--- a/arch/arm64/kernel/kaslr.c
+++ b/arch/arm64/kernel/kaslr.c
@@ -9,6 +9,7 @@
 
 #include <asm/cpufeature.h>
 #include <asm/memory.h>
+#include <asm/pgtable.h>
 
 u16 __initdata memstart_offset_seed;
 
-- 
2.20.1

