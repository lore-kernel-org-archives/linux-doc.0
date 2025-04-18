Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872FE268C78
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 05:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954456; cv=none; b=TsLS8KtXiJywrqOXpOCUtJiVzJTHW++IpQN9IowKGrXB1NZvnPWTbuE9L9gyKSD+OdAegMpopxedXk/X2QYzLbL4DdWXXtTzjAvkZI+hTaleiEo/0oVcONzleAfw4xhJFoTSOua/IHhdJCuDUQ1SgZHAZ75VLU096bxxb84HWTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954456; c=relaxed/simple;
	bh=ueoqcFTUk9T03nl0Kprvz1dyHISz23czcyRWdb+NyXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u9tzG0DA79dP75oBRK30Fq7qaytlagSLLPjrhsjJJIVOwAgR+yO82khB+T5CvUi6M3X3i/SnCzjO/OGK3TSU+b4S0JNrf/rhymjSGpgSqPcnpodG6jeHwYiY6Dzop4080ko2JM5ISOXuUhnCuFakz4n0DNThkMs2vvmNHi5xiZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=b2R/a264; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="b2R/a264"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22401f4d35aso19189575ad.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 22:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954454; x=1745559254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gt4C7mRaX1Tb3QqSfSFlu8KMBqofhvFO09DI6sp2P0=;
        b=b2R/a264NVKOcr67BZOlvtjMHt/d6MqAQPlMD01fGJWexC6+nrSFFX+1um15uP0o2w
         HrUxa5I0Qj+9v5vQqKLqFgJ5N2HazsEOK7MQhF8vByRLCiyKTl5pSj+XmpNrYwVDifEh
         J4e02YkL/IXlUKD+zhWCjwFAUZKjsEYRxIZ7Mnl3ULV/KKCblzJ38nPBNKEx6ZbD4qod
         X8NPd701/VKpsi+vGi+dXZ9bTm6ttF4z8BeIiVFC74Z4XEj57wBnt6CwWX9bjvelN8Wz
         7TBh+2RJRLwZGzQjxp1hHeCxA/HU15neBDJiocEUbaiaqviXwj1sNI+Ij0QpG7XsqnCY
         tUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954454; x=1745559254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gt4C7mRaX1Tb3QqSfSFlu8KMBqofhvFO09DI6sp2P0=;
        b=q0lND83jV6d5WD43/LM+PXzMSOCcd/0f5kwfLVpFUS0o8qxNM1DuPmG/nWgcSy9HyC
         3/cvnQ9BqkM6CFfgNlWOSDqNsQITsm8AEQjVbDAN1nhOwvy5bggdasL+Ozl8ns+lnuRQ
         YZDarbae4ex9cAuQoqNfHdohdv/CB/2fTHgnbGFnngwPyMmH7X8DpW7X9r1/QMOhs2jO
         AEsbWEQv0YiV4wXRLFL7e2EMWEOhNdTDHkJKntLnAQg7YeqrpuZ6NFbMeBbcuGVIV0xB
         Cvy1BphIr3f+uVS+DkdmOQjR5nIaUpSnOuygArPDgAIBMhssesE1qO6Qc9dwsgU4APm8
         7OdA==
X-Gm-Message-State: AOJu0Yzu6/R0uZhEsBp6DehWnCuhXOEvbKPf9qsdGhkkak2vcQHkvNxl
	+de17HWbaE7JwQSbcXXL0UEEcDAdwqXgJibmHAmFImukLTbGEPVA0rCNZPnU/6c=
X-Gm-Gg: ASbGncuQrVFAoBlWx1ODUD5jSABHEJ49VSwHJ/ai1fGkGC1eUb96nFnoI99i2U10hGU
	VbkHH6vlBqBcFWZcMzdGGWfubt7n9Di8N4e//11/8eiuo1KTW+NLXrMEklKr8qFz3pK35/+DKEt
	tNULWw4uNvWXzqY9OJAFkLpdUuGNu7GYMP3HY2jEEWk+2j9VmYGUB2DUO/mO3qKPCNkO62H3Bw3
	f6azwZzefwegv5CGcJF/h9vKnnjEERsG7wNwg8g5MYXKNNGX3WNMAfMj7TqScYtWiiqTx5TCWrS
	zb/XOYMzoRYrIe/M/6qapmLcBCoAR66rdPUsvBmlh3lM1uzPMdvgK/7SCLJj0H/oaiMd6ZNx08V
	n
X-Google-Smtp-Source: AGHT+IEgetGNHpjWMYo9c+dEgZ2LTsFOxYIMy38Euwjwvezit15u6T4SPBf7yW9+lanDmIf9AJdK0A==
X-Received: by 2002:a17:903:2441:b0:220:ea90:191e with SMTP id d9443c01a7336-22c535679abmr21208205ad.4.1744954453822;
        Thu, 17 Apr 2025 22:34:13 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:13 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
Date: Fri, 18 Apr 2025 13:32:29 +0800
Message-Id: <20250418053239.4351-3-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SiFive vendor extension support to the kernel with the target of
"xsfvqmaccdod" and "xsfvqmaccqoq".

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/Kconfig.vendor                     | 13 +++++++++++++
 .../include/asm/vendor_extensions/sifive.h    | 14 ++++++++++++++
 arch/riscv/kernel/vendor_extensions.c         | 10 ++++++++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  1 +
 arch/riscv/kernel/vendor_extensions/sifive.c  | 19 +++++++++++++++++++
 5 files changed, 57 insertions(+)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive.c

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index b096548fe0ff..e14f26368963 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -16,6 +16,19 @@ config RISCV_ISA_VENDOR_EXT_ANDES
 	  If you don't know what to do here, say Y.
 endmenu
 
+menu "SiFive"
+config RISCV_ISA_VENDOR_EXT_SIFIVE
+	bool "SiFive vendor extension support"
+	select RISCV_ISA_VENDOR_EXT
+	default y
+	help
+	  Say N here if you want to disable all SiFive vendor extension
+	  support. This will cause any SiFive vendor extensions that are
+	  requested by hardware probing to be ignored.
+
+	  If you don't know what to do here, say Y.
+endmenu
+
 menu "T-Head"
 config RISCV_ISA_VENDOR_EXT_THEAD
 	bool "T-Head vendor extension support"
diff --git a/arch/riscv/include/asm/vendor_extensions/sifive.h b/arch/riscv/include/asm/vendor_extensions/sifive.h
new file mode 100644
index 000000000000..608004250e2e
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/sifive.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_H
+
+#include <asm/vendor_extensions.h>
+
+#include <linux/types.h>
+
+#define RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD		0
+#define RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ		1
+
+extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive;
+
+#endif
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index 9feb7f67a0a3..92d8ff81f42c 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -6,6 +6,7 @@
 #include <asm/vendorid_list.h>
 #include <asm/vendor_extensions.h>
 #include <asm/vendor_extensions/andes.h>
+#include <asm/vendor_extensions/sifive.h>
 #include <asm/vendor_extensions/thead.h>
 
 #include <linux/array_size.h>
@@ -15,6 +16,9 @@ struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
 	&riscv_isa_vendor_ext_list_andes,
 #endif
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
+	&riscv_isa_vendor_ext_list_sifive,
+#endif
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
 	&riscv_isa_vendor_ext_list_thead,
 #endif
@@ -45,6 +49,12 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 		cpu_bmap = riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap;
 		break;
 	#endif
+	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
+	case SIFIVE_VENDOR_ID:
+		bmap = &riscv_isa_vendor_ext_list_sifive.all_harts_isa_bitmap;
+		cpu_bmap = riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap;
+		break;
+	#endif
 	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
 	case THEAD_VENDOR_ID:
 		bmap = &riscv_isa_vendor_ext_list_thead.all_harts_isa_bitmap;
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index 866414c81a9f..d5fdde0e863b 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
new file mode 100644
index 000000000000..990ac83b1f81
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/sifive.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/cpufeature.h>
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/sifive.h>
+
+#include <linux/array_size.h>
+#include <linux/types.h>
+
+/* All SiFive vendor extensions supported in Linux */
+const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
+	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
+	__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
+};
+
+struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_sifive = {
+	.ext_data_count = ARRAY_SIZE(riscv_isa_vendor_ext_sifive),
+	.ext_data = riscv_isa_vendor_ext_sifive,
+};
-- 
2.39.5 (Apple Git-154)

