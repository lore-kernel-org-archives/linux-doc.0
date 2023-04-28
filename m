Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B64C77B60
	for <linux-doc@archiver.kernel.org>; Fri, 28 Apr 2023 19:06:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346620AbjD1TGa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 Apr 2023 15:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346600AbjD1TG2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Apr 2023 15:06:28 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0D91BE9
        for <linux-doc@vger.kernel.org>; Fri, 28 Apr 2023 12:06:27 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1a69f686345so2596295ad.2
        for <linux-doc@vger.kernel.org>; Fri, 28 Apr 2023 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682708786; x=1685300786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFqKaSshbd38sYLtbvsFAsIC70cXgzSexspJ+qNkyV8=;
        b=XnAwbOcj3oIdGm5mgK/A1KMo0zl0NXPLsK6Ex+j8wTHj+YS4AYBq7F0FGQ9EepC3AF
         f4g18o9k3NnlNok/OmbZTwiPhH7Xtpg5hYXbZPE7BppyipgRFvEIyb3ORWx46F3Zl9NX
         YRdibn90f2gEVEtCJijmmlViY71zsqd9e2JsieEzo7eK68Onw032p4Zw7kKqhC4onVrM
         fnwI1OUbLF2SlPyb8Qeo80sjBjkeZGskUE6W1tjBTUUsoTkMf6BDwclOUA2/DAs5IoWh
         jHfKhpJjHTjfMGJSZcgqE6rUGXD34lTbp/VA/OWdkOgPZD/kbiB/uQofgLQvPeZcNGZa
         9R1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682708786; x=1685300786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFqKaSshbd38sYLtbvsFAsIC70cXgzSexspJ+qNkyV8=;
        b=NdfLG+Iu351lACwugrT+6pGegBFEHGQHYS7Vf8gdqeHRdA+hJ9kjfW6eN2ujR9Iq+H
         4VtF7zBFrWa4p8hMbQyqq02MGaA9rmuweAOm+lFVvnt48ktaCpzxXoEUv8rCghVatzMj
         aNC0xUfeQYub4cbWMoZS+vutcOtd3Sq/c5Gz35AENTGHjp705quqiyUIy0aRDp2Flol9
         ZbBalg2VsWL6tSsgBSWjH9W5zw2QrIyVFWuQCL+ts8xY/xpMDU/e6A9Tty3DUej8us03
         AKbbQrY3LwG7FUjAy7eH5u2bJiDB8Kco5e+hmBlJmxzrqiA74gpL8GvCv+lYw4+xCqow
         yCyg==
X-Gm-Message-State: AC+VfDzz6IPeIxeIOCv4aUwFxVtGGSDq9lxhhldpLLumMWJsqvKpLVSM
        hUgaGCqnhMtmafm4svsMkzZpIg==
X-Google-Smtp-Source: ACHHUZ6zsK/rXeuvueCzLKmEwUjIV1KR62eq0QfUEx2BJ11PBtuHXRuJ+WOwWqzn3qupChOIwIMv7Q==
X-Received: by 2002:a17:903:228b:b0:1a1:b174:836c with SMTP id b11-20020a170903228b00b001a1b174836cmr8128192plh.16.1682708786587;
        Fri, 28 Apr 2023 12:06:26 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id w15-20020a170902d70f00b001a6c58e95d7sm13580733ply.269.2023.04.28.12.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 12:06:26 -0700 (PDT)
From:   Evan Green <evan@rivosinc.com>
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     Evan Green <evan@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] RISC-V: hwprobe: Expose Zba and Zbb
Date:   Fri, 28 Apr 2023 12:06:08 -0700
Message-Id: <20230428190609.3239486-4-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428190609.3239486-1-evan@rivosinc.com>
References: <20230428190609.3239486-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add two new bits to the IMA_EXT_0 key for ZBA and ZBB extensions. These
are accurately reported per CPU.

Signed-off-by: Evan Green <evan@rivosinc.com>

---

 Documentation/riscv/hwprobe.rst       |  7 +++++
 arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
 arch/riscv/kernel/sys_riscv.c         | 43 ++++++++++++++++++++++-----
 3 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 9f0dd62dcb5d..21f444a38359 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -64,6 +64,13 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
     by version 2.2 of the RISC-V ISA manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZBA`: The Zba address generation extension is
+       supported, as defined in version 1.0 of the Bit-Manipulation ISA
+       extensions.
+
+  * :c:macro:`RISCV_HWPROBE_IMA_ZBB`: The Zbb extension is supporte, as defined
+       in version 1.0 of the Bit-Manipulation ISA extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 8d745a4ad8a2..ef3b060d4e8d 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -25,6 +25,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
+#define		RISCV_HWPROBE_EXT_ZBA		(1 << 2)
+#define		RISCV_HWPROBE_EXT_ZBB		(1 << 3)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5db29683ebee..adfcb6b64db7 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -121,6 +121,41 @@ static void hwprobe_arch_id(struct riscv_hwprobe *pair,
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
+	}
+
+	/* Now turn off reporting features if any CPU is missing it. */
+	pair->value &= ~missing;
+}
+
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
 	int cpu;
@@ -164,13 +199,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
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

