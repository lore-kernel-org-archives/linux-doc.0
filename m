Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E12C001DD
	for <linux-doc@archiver.kernel.org>; Thu,  6 Jul 2023 03:32:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjGFDcq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Jul 2023 23:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232186AbjGFDcp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jul 2023 23:32:45 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9780E198E
        for <linux-doc@vger.kernel.org>; Wed,  5 Jul 2023 20:32:44 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-666ecb21f86so292673b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 05 Jul 2023 20:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688614364; x=1691206364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X54Cbu5zOMSO9e4vO2L+KNC0L67rHLP6N1OU6Cg3wA8=;
        b=zKJJNZDxACZFWxRB/zHvfSWKhUbPKItCK9lk7EtkWevhCtdWzJp57LMr7M5SO4p889
         0CEiHoOsfhUxrxRMxAOHQLCywtikLQX2OGGV+bpxtN+jTpHfVSeyyPdIIIC5Wq0/MDpt
         6TV8xKx/89fEhdUG01aTS1EBWXNSz833xGU9iSxfFYTnU6hcpPzki+i8Gka177fS/dfN
         Xf5Ikzkgi7UOGvY+SkskucsCEtYH0OZlRBSr30r3SKHrN83Ru3p3d+JduZjia9Vy2lpw
         WXaYeBvWbvGBmnzlNn3c4ko+ygBEiZNgGcJjq84w5pgjn3GjSCuCTuPEi0DPa1GsQDD9
         M6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688614364; x=1691206364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X54Cbu5zOMSO9e4vO2L+KNC0L67rHLP6N1OU6Cg3wA8=;
        b=h0TATDR3iCKjHmKEm11zwTQJ9LeGuwU98S2vXVJEvivRNL10ccWcR0z0GN+gyxMVZv
         4Nl5UA1Dr72i+N4UEBq7e+YTJjrPCb6FIyF1j89g5dYo9xh8TIE1bA/MKKR6wWnVmiKA
         35kAdz6WVXK70dwQaKxpsbDDSkXBoAC0mTTAgeqneIbbRMNWxpPLkQOPvdFvzXOXJBWG
         3YEinfyDdu93Lrq2UDzAbITHCWMdu94uYrWQjLQJW2//wlQK2ErynrJJMo1mIr6DCgMy
         /5SqObp8dXUEgZ09bnpF5D7XzB7MQKY46HVP0TVHPkGrCtVOOBeUINBIMELFCPgVIT5J
         Re8g==
X-Gm-Message-State: ABy/qLYCJVSjBVwVtl2LiNYRz7KEH8VFTzXY9PR4VUIRuyEsnsSo5AnM
        AI6x3rZMUXt87e1w8oSba9eprQ==
X-Google-Smtp-Source: APBJJlEibChBqnf08BaWR2lS6f718PlTQs2OsmFSQ3SEhFbZq18oY01nl+i2/jd3tsACHZQGlvlb+Q==
X-Received: by 2002:a05:6a00:841:b0:668:9fb6:b311 with SMTP id q1-20020a056a00084100b006689fb6b311mr777400pfk.32.1688614363983;
        Wed, 05 Jul 2023 20:32:43 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id fk13-20020a056a003a8d00b006589cf6d88bsm239785pfb.145.2023.07.05.20.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 20:32:43 -0700 (PDT)
From:   Charlie Jenkins <charlie@rivosinc.com>
Date:   Wed, 05 Jul 2023 20:30:18 -0700
Subject: [PATCH 2/3] RISC-V: Add T-Head 0.7.1 vector extension to hwprobe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230705-thead_vendor_extensions-v1-2-ad6915349c4d@rivosinc.com>
References: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
In-Reply-To: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
To:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jonathan Corbet <corbet@lwn.net>, charlie@rivosinc.com,
        evan@rivosinc.com, heiko@sntech.de, linux-doc@vger.kernel.org
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Using vendor extensions in hwprobe, add the ability to query if the
0.7.1 vector extension is available. It is determined to be available
only if the kernel is compiled with vector support, and the user is
using the c906.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig.vendor                       | 11 +++++++++++
 arch/riscv/include/asm/extensions.h             | 16 ++++++++++++++++
 arch/riscv/kernel/sys_riscv.c                   | 20 ++++++++++++++++++++
 arch/riscv/vendor_extensions/Makefile           |  2 ++
 arch/riscv/vendor_extensions/thead/Makefile     |  8 ++++++++
 arch/riscv/vendor_extensions/thead/extensions.c | 24 ++++++++++++++++++++++++
 6 files changed, 81 insertions(+)

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index 213ac3e6fed5..b8b9d15153eb 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -1,3 +1,14 @@
 menu "Vendor extensions selection"
 
+config VENDOR_EXTENSIONS_THEAD
+	bool "T-HEAD vendor extensions"
+	depends on RISCV_ALTERNATIVE
+	default n
+	help
+	  All T-HEAD vendor extensions Kconfig depend on this Kconfig. Disabling
+	  this Kconfig will disable all T-HEAD vendor extensions. Please say "Y"
+	  here if your platform uses T-HEAD vendor extensions.
+
+	  Otherwise, please say "N" here to avoid unnecessary overhead.
+
 endmenu # "Vendor extensions selection"
diff --git a/arch/riscv/include/asm/extensions.h b/arch/riscv/include/asm/extensions.h
new file mode 100644
index 000000000000..27ce294a3d65
--- /dev/null
+++ b/arch/riscv/include/asm/extensions.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 by Rivos Inc.
+ */
+#ifndef __ASM_EXTENSIONS_H
+#define __ASM_EXTENSIONS_H
+
+#include <asm/hwprobe.h>
+#include <linux/cpumask.h>
+
+#define THEAD_ISA_EXT0 (RISCV_HWPROBE_VENDOR_EXTENSION_SPACE)
+#define THEAD_ISA_EXT0_V0_7_1 (1 << 0)
+
+int hwprobe_thead(__u64 marchid, __u64 mimpid, struct riscv_hwprobe *pair,
+		  const struct cpumask *cpus);
+#endif
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 2351a5f7b8b1..58b12eaeaf46 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -13,6 +13,7 @@
 #include <asm/vector.h>
 #include <asm/switch_to.h>
 #include <asm/uaccess.h>
+#include <asm/extensions.h>
 #include <asm/unistd.h>
 #include <asm-generic/mman-common.h>
 #include <vdso/vsyscall.h>
@@ -192,6 +193,25 @@ static int hwprobe_vendor(__u64 mvendorid, struct riscv_hwprobe *pair,
 			 const struct cpumask *cpus)
 {
 	switch (mvendorid) {
+#ifdef CONFIG_VENDOR_EXTENSIONS_THEAD
+	case THEAD_VENDOR_ID:
+		struct riscv_hwprobe marchid = {
+			.key = RISCV_HWPROBE_KEY_MARCHID,
+			.value = 0
+		};
+		struct riscv_hwprobe mimpid = {
+			.key = RISCV_HWPROBE_KEY_MIMPID,
+			.value = 0
+		};
+
+		hwprobe_arch_id(&marchid, cpus);
+		hwprobe_arch_id(&mimpid, cpus);
+		if (marchid.value != -1ULL && mimpid.value != -1ULL)
+			hwprobe_thead(marchid.value, mimpid.value, pair, cpus);
+		else
+			return -1;
+		break;
+#endif
 	default:
 		return -1;
 	}
diff --git a/arch/riscv/vendor_extensions/Makefile b/arch/riscv/vendor_extensions/Makefile
index e815895e9372..38c3e80469fd 100644
--- a/arch/riscv/vendor_extensions/Makefile
+++ b/arch/riscv/vendor_extensions/Makefile
@@ -1,3 +1,5 @@
 ifdef CONFIG_RELOCATABLE
 KBUILD_CFLAGS += -fno-pie
 endif
+
+obj-$(CONFIG_VENDOR_EXTENSIONS_THEAD) += thead/
diff --git a/arch/riscv/vendor_extensions/thead/Makefile b/arch/riscv/vendor_extensions/thead/Makefile
new file mode 100644
index 000000000000..7cf43c629b66
--- /dev/null
+++ b/arch/riscv/vendor_extensions/thead/Makefile
@@ -0,0 +1,8 @@
+ifdef CONFIG_FTRACE
+CFLAGS_REMOVE_extensions.o = $(CC_FLAGS_FTRACE)
+endif
+ifdef CONFIG_KASAN
+KASAN_SANITIZE_extensions.o := n
+endif
+
+obj-y += extensions.o
diff --git a/arch/riscv/vendor_extensions/thead/extensions.c b/arch/riscv/vendor_extensions/thead/extensions.c
new file mode 100644
index 000000000000..a177501bc99c
--- /dev/null
+++ b/arch/riscv/vendor_extensions/thead/extensions.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 by Rivos Inc.
+ */
+
+#include <asm/extensions.h>
+
+int hwprobe_thead(__u64 marchid, __u64 mimpid, struct riscv_hwprobe *pair,
+		  const struct cpumask *cpus)
+{
+	pair->value = 0;
+	switch (pair->key) {
+	case THEAD_ISA_EXT0:
+#ifdef CONFIG_RISCV_ISA_V
+		if (marchid == 0 && mimpid == 0)
+			pair->value |= THEAD_ISA_EXT0_V0_7_1;
+#endif
+		break;
+	default:
+		return -1;
+	}
+
+	return 0;
+}

-- 
2.41.0

