Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 86FFE7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Sep 2019 14:06:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389025AbfISOGj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Sep 2019 10:06:39 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41465 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389517AbfISOGh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Sep 2019 10:06:37 -0400
Received: by mail-lj1-f194.google.com with SMTP id f5so3730539ljg.8
        for <linux-doc@vger.kernel.org>; Thu, 19 Sep 2019 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/yVIRHWuN5NvCtSgoWOt0FQ2pzS304r/JIoa8grAoeg=;
        b=f2Ajvc95IBsXh7QC0KZ/teCtaJOBbCEfy1jTDghOCpoMue299R9/PRIrxJa61AhHv2
         FGuAHPZ/5qwEVRMCyZVGIzWcRRE51U7Y9ufetLTkOildedAbixwpSSWt8s3BpyF78wJk
         BEp3etejaiM41Nb/o2kwQSHvyAgLC7MFtjhs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/yVIRHWuN5NvCtSgoWOt0FQ2pzS304r/JIoa8grAoeg=;
        b=qLXHf3CZtVqwBKwoVamUyP4UVmyGd6zc2Ha7mIJZ9MY+uEzJWKdr+A8EjrepiCITOh
         px2rBG5wmxE291MFWlb+iP8yDBfzH/Bw/a+H+sL0rfxHJPtaTRizAZBfJcOMQRz3XeMj
         73dly8fy+MmZDHdlNWZBBksJ1m23KddQuslACnj8pa/UiDxV2usqcxcOZwKKQEROprIb
         GuBtLrnKyrtftTil/hTAUiVmQ7bDEiMf8nAmQu9vgJLnmyXo0KeFKvCNtuI7Kqs+xgpX
         2OOrW3/yVrx4PVAz8VURfEx1actjiHbZjOdw/bkt3hzGN+tduoBTVJ/2FaeK5YmH63ZD
         mAgg==
X-Gm-Message-State: APjAAAUhPQxqFogQtTvVIJBiPcDukK/GIM3rwDk2wR37liW70lOVaNu8
        UyntALSYvnx5G8xFKlkKdpigwA==
X-Google-Smtp-Source: APXvYqxNV7T4a+Lz/TAxhTojpZAjz21AOC3VAcsbmQjZSn1bKXyNDAPA+CiUO1gVMkRxzZv/TM5X0w==
X-Received: by 2002:a2e:9854:: with SMTP id e20mr5681390ljj.72.1568901994159;
        Thu, 19 Sep 2019 07:06:34 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id h3sm1687886ljf.12.2019.09.19.07.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 07:06:33 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] lib/math: remove int_pow()
Date:   Thu, 19 Sep 2019 16:06:20 +0200
Message-Id: <20190919140620.32407-5-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

No users left.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 Documentation/core-api/kernel-api.rst |  3 ---
 include/linux/kernel.h                |  1 -
 lib/math/Makefile                     |  2 +-
 lib/math/int_pow.c                    | 32 ---------------------------
 4 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 lib/math/int_pow.c

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index 08af5caf036d..5f9cf47581b3 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -144,9 +144,6 @@ Base 2 log and power Functions
 Integer power Functions
 -----------------------
 
-.. kernel-doc:: lib/math/int_pow.c
-   :export:
-
 .. kernel-doc:: lib/math/int_sqrt.c
    :export:
 
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 4fa360a13c1e..afe7c2cc81aa 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -487,7 +487,6 @@ extern int __kernel_text_address(unsigned long addr);
 extern int kernel_text_address(unsigned long addr);
 extern int func_ptr_is_kernel_text(void *ptr);
 
-u64 int_pow(u64 base, unsigned int exp);
 unsigned long int_sqrt(unsigned long);
 
 #if BITS_PER_LONG < 64
diff --git a/lib/math/Makefile b/lib/math/Makefile
index be6909e943bd..3e5db680a404 100644
--- a/lib/math/Makefile
+++ b/lib/math/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y += div64.o gcd.o lcm.o int_pow.o int_sqrt.o reciprocal_div.o
+obj-y += div64.o gcd.o lcm.o int_sqrt.o reciprocal_div.o
 
 obj-$(CONFIG_CORDIC)		+= cordic.o
 obj-$(CONFIG_PRIME_NUMBERS)	+= prime_numbers.o
diff --git a/lib/math/int_pow.c b/lib/math/int_pow.c
deleted file mode 100644
index 622fc1ab3c74..000000000000
--- a/lib/math/int_pow.c
+++ /dev/null
@@ -1,32 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * An integer based power function
- *
- * Derived from drivers/video/backlight/pwm_bl.c
- */
-
-#include <linux/export.h>
-#include <linux/kernel.h>
-#include <linux/types.h>
-
-/**
- * int_pow - computes the exponentiation of the given base and exponent
- * @base: base which will be raised to the given power
- * @exp: power to be raised to
- *
- * Computes: pow(base, exp), i.e. @base raised to the @exp power
- */
-u64 int_pow(u64 base, unsigned int exp)
-{
-	u64 result = 1;
-
-	while (exp) {
-		if (exp & 1)
-			result *= base;
-		exp >>= 1;
-		base *= base;
-	}
-
-	return result;
-}
-EXPORT_SYMBOL_GPL(int_pow);
-- 
2.20.1

