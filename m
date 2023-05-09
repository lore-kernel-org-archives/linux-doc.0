Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EE9C77B75
	for <linux-doc@archiver.kernel.org>; Tue,  9 May 2023 18:25:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbjEISZ2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 May 2023 14:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234912AbjEISZY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 May 2023 14:25:24 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993C740E2
        for <linux-doc@vger.kernel.org>; Tue,  9 May 2023 11:25:22 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6439e6f5a33so3463307b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 09 May 2023 11:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683656722; x=1686248722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26y59v9qUKc2CpO6S7UVQsEMURpLsKbwKkIt33el4rQ=;
        b=DLepPrV+ewXWR/9YrNdLZsky9GdViwY78UMcLP8j0su7F5/fgByJg64fORBjd2IOJn
         baXSJfWCoS84zI5g4AKPEviwFoxWDo28hKgTsxXDlKqNt2cvtpiDtxqGDT24IyaWTlzD
         FnfD51zlWKvj5VLu8Rc/FFtHOH3uNeC62mi/YWw3Rjn9Oot+ZYAqX88ZxMsWK8z8yyiR
         LibeL7cF4bShgGhQs7y6ZW2yiO46kN7/2rQEUNM77IdNMWcUshAIbv93HuNR+cQr6YxQ
         1za0EaBwOeLdGnDvu/tvHk5EDsUQ2yXfuUPderpKOYp9leoKqfAN+i/sDjr5C8H7Upon
         EuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683656722; x=1686248722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26y59v9qUKc2CpO6S7UVQsEMURpLsKbwKkIt33el4rQ=;
        b=YoNVhXKGg1/wfcSOyoivP94xcQ11iQh0Apt1VfjLc14Dxrx40OtS4zC1mAjKcVZX1n
         Sj/JWYnFlYbkoYbi5yPn9bUHePMX737Bv+7c0AujG+ZhE4aaa4NiFTCJVRaxEnCKvMLV
         JWuAIqCqABV0y9tucZGFjSOiB57Ljj/PjbhlzakshIkCc5hHp6N2dx6FW26JKdJidksb
         lSbsVf8H7YsK+nuao6qHfwu6Yaz8yChmBaUb/VvrB6RvPXtMuaOg/Yjad8kUfI32kK60
         xjrbjLM2KiGM9Bv8wiVQkH+CHE5sEXFwljyWz4Rk0RCdw6lD+i6+Lfe5lQVqrFfO4VVa
         71/Q==
X-Gm-Message-State: AC+VfDxB1azGo1c516D+jePhuZJ44sJ8BvAs1FIOmRE+Jk0q6Yld2W51
        8sPLqwe/6DVDEfkTjOwRel143Q==
X-Google-Smtp-Source: ACHHUZ4Rc0x+ekHb+pf/Jq9jIVtRwLVZ76o+axXE34SjBCZ7M6BlLSO316QuMtQlI9a78xap+duh0w==
X-Received: by 2002:a05:6a00:2401:b0:63d:3339:e967 with SMTP id z1-20020a056a00240100b0063d3339e967mr18559445pfh.19.1683656722049;
        Tue, 09 May 2023 11:25:22 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id q12-20020a63cc4c000000b0051eff0a70d7sm1633559pgi.94.2023.05.09.11.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:25:21 -0700 (PDT)
From:   Evan Green <evan@rivosinc.com>
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     Evan Green <evan@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] RISC-V: hwprobe: Expose Zba, Zbb, and Zbs
Date:   Tue,  9 May 2023 11:25:03 -0700
Message-Id: <20230509182504.2997252-4-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509182504.2997252-1-evan@rivosinc.com>
References: <20230509182504.2997252-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add two new bits to the IMA_EXT_0 key for ZBA, ZBB, and ZBS extensions.
These are accurately reported per CPU.

Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

---

Changes in v2:
 - Fixed typo s/supporte/supported/ (Conor)
 - Fixed copypasta s/IMA_ZBB/EXT_ZBB/ (Conor)
 - Added Zbs

 Documentation/riscv/hwprobe.rst       | 10 ++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  3 ++
 arch/riscv/kernel/sys_riscv.c         | 48 +++++++++++++++++++++++----
 3 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 9f0dd62dcb5d..fb25670ef0e5 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -64,6 +64,16 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
     by version 2.2 of the RISC-V ISA manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBA`: The Zba address generation extension is
+       supported, as defined in version 1.0 of the Bit-Manipulation ISA
+       extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBB`: The Zbb extension is supported, as defined
+       in version 1.0 of the Bit-Manipulation ISA extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as defined
+       in version 1.0 of the Bit-Manipulation ISA extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 8d745a4ad8a2..853f8f6d9a42 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -25,6 +25,9 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
+#define		RISCV_HWPROBE_EXT_ZBA		(1 << 2)
+#define		RISCV_HWPROBE_EXT_ZBB		(1 << 3)
+#define		RISCV_HWPROBE_EXT_ZBS		(1 << 4)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5db29683ebee..fe655db19ab4 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -121,6 +121,46 @@ static void hwprobe_arch_id(struct riscv_hwprobe *pair,
 	pair->value = id;
 }
 
+static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
+			     const struct cpumask *cpus)
+{
+	int cpu;
+	u64 missing = 0;
+
+	pair->value = 0;
+	if (has_fpu())
+		pair->value |= RISCV_HWPROBE_IMA_FD;
+
+	if (riscv_isa_extension_available(NULL, c))
+		pair->value |= RISCV_HWPROBE_IMA_C;
+
+	/*
+	 * Loop through and record extensions that 1) anyone has, and 2) anyone
+	 * doesn't have.
+	 */
+	for_each_cpu(cpu, cpus) {
+		struct riscv_isainfo *isainfo = &hart_isa[cpu];
+
+		if (riscv_isa_extension_available(isainfo->isa, ZBA))
+			pair->value |= RISCV_HWPROBE_EXT_ZBA;
+		else
+			missing |= RISCV_HWPROBE_EXT_ZBA;
+
+		if (riscv_isa_extension_available(isainfo->isa, ZBB))
+			pair->value |= RISCV_HWPROBE_EXT_ZBB;
+		else
+			missing |= RISCV_HWPROBE_EXT_ZBB;
+
+		if (riscv_isa_extension_available(isainfo->isa, ZBS))
+			pair->value |= RISCV_HWPROBE_EXT_ZBS;
+		else
+			missing |= RISCV_HWPROBE_EXT_ZBS;
+	}
+
+	/* Now turn off reporting features if any CPU is missing it. */
+	pair->value &= ~missing;
+}
+
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
 	int cpu;
@@ -164,13 +204,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
-		pair->value = 0;
-		if (has_fpu())
-			pair->value |= RISCV_HWPROBE_IMA_FD;
-
-		if (riscv_isa_extension_available(NULL, c))
-			pair->value |= RISCV_HWPROBE_IMA_C;
-
+		hwprobe_isa_ext0(pair, cpus);
 		break;
 
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
-- 
2.25.1

