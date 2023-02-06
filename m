Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D423CC64EC4
	for <linux-doc@archiver.kernel.org>; Mon,  6 Feb 2023 20:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjBFUPk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Feb 2023 15:15:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjBFUPh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Feb 2023 15:15:37 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D0E2A995
        for <linux-doc@vger.kernel.org>; Mon,  6 Feb 2023 12:15:31 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id pj3so12735632pjb.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Feb 2023 12:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCdyPS+smT6LwtNTbkWdnYXrnr2lxZXi1KrwW5rv0l8=;
        b=0GLh6Tswh2lwBK4eGnHkxqiQk3/zCN33r0fpvbYVbwNsBkNBBokego85RwcWGnn4Xh
         qka1T0L4j34pN0ybqoxtKmCEaH9G2tnRhdKzSXuOZGuB1r9vg1+LJWENzePU5bBRzAnp
         nOs75uIRZxj+XkoGKHbGjfmRxgYVvTOWZhuSV+rXzn0tqVC2sK7jEnQksiHaDLJuwmtr
         Ht3st2UrTUf76v5NU7NUJFln2WcZ1iYaM8xMyeOtfiDtm1Mv4iWTwClcnUP5Pq+7F8a2
         yZqpv5Wtp4pxAo942ELL0OyCEwv7RiLeO5INkrNY+2ZyVXemijkNbdQlQXWVZ9fXZpd2
         Tzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCdyPS+smT6LwtNTbkWdnYXrnr2lxZXi1KrwW5rv0l8=;
        b=RQNNI6C4Ve2D1e6AeEM892GK2w0955+boZtTPjkIl14GUrxJzqE2AJgUeYn9fq22yW
         jDFL7e7f+uKy7IpSKJChNGBZU7H5ZgloAzNwDn+Qy3gTPJSsnbfD7myRUNjKJsweBUyj
         i4vevUcEURd2pTManpPU8FcEWnANGU/a1gdoGuOFLtSjuuXOPsm+yX0CHakpdQc86k/d
         0afjAgMEqyxN/tFKqkasj/vc8jhkiKFIeqc2jBFscTYl5W4lLlg7yUckD3C4G81pSI0X
         eN/4WeboXn1iRwaScg9z1JfiZi0h3eQZ/frzwzqi3lZLEu/DS/DT94yR2DcqqwrLvomX
         VY7g==
X-Gm-Message-State: AO0yUKU7Ey10oxS/H5VfpQdRPJs3Q6OCKEVza7Co+Ip3AsGDq/qrNwij
        4/LwYlvckq3MKL3pgDhKXAJjoA==
X-Google-Smtp-Source: AK7set89OKaSr4/YDhhBWoGa5WugP9xjhQ2WRaIN6BchRUc3KvHdtr86clXbC4S8Q6fXuCF04qrlmA==
X-Received: by 2002:a05:6a20:54a0:b0:bd:b061:9527 with SMTP id i32-20020a056a2054a000b000bdb0619527mr624694pzk.4.1675714530623;
        Mon, 06 Feb 2023 12:15:30 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k10-20020a63ab4a000000b004df4fbb9823sm6425079pgp.68.2023.02.06.12.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 12:15:30 -0800 (PST)
From:   Evan Green <evan@rivosinc.com>
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     Conor Dooley <conor@kernel.org>, vineetg@rivosinc.com,
        heiko@sntech.de, slewis@rivosinc.com,
        Evan Green <evan@rivosinc.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Guo Ren <guoren@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        dram <dramforever@live.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/6] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
Date:   Mon,  6 Feb 2023 12:14:52 -0800
Message-Id: <20230206201455.1790329-4-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206201455.1790329-1-evan@rivosinc.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

We have an implicit set of base behaviors that userspace depends on,
which are mostly defined in various ISA specifications.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Evan Green <evan@rivosinc.com>
---

(no changes since v1)

 Documentation/riscv/hwprobe.rst       | 16 ++++++++++++++++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  6 +++++-
 arch/riscv/kernel/sys_riscv.c         | 23 +++++++++++++++++++++++
 4 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 97771090e972..ce186967861f 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -35,3 +35,19 @@ The following keys are defined:
   specifications.
 * :RISCV_HWPROBE_KEY_MIMPLID:: Contains the value of :mimplid:, as per the ISA
   specifications.
+* :RISCV_HWPROBE_KEY_BASE_BEHAVIOR:: A bitmask containing the base user-visible
+  behavior that this kernel supports.  The following base user ABIs are defined:
+    * :RISCV_HWPROBE_BASE_BEHAVIOR_IMA:: Support for rv32ima or rv64ima, as
+      defined by version 2.2 of the user ISA and version 1.10 of the privileged
+      ISA, with the following known exceptions (more exceptions may be added,
+      but only if it can be demonstrated that the user ABI is not broken):
+        * The :fence.i: instruction cannot be directly executed by userspace
+          programs (it may still be executed in userspace via a
+          kernel-controlled mechanism such as the vDSO).
+* :RISCV_HWPROBE_KEY_IMA_EXT_0:: A bitmask containing the extensions that are
+  compatible with the :RISCV_HWPROBE_BASE_BEHAVIOR_IMA: base system behavior.
+    * :RISCV_HWPROBE_IMA_FD:: The F and D extensions are supported, as defined
+      by commit cd20cee ("FMIN/FMAX now implement minimumNumber/maximumNumber,
+      not minNum/maxNum") of the RISC-V ISA manual.
+    * :RISCV_HWPROBE_IMA_C:: The C extension is supported, as defined by
+      version 2.2 of the RISC-V ISA manual.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 08d1c3bdd78a..7e52f1e1fe10 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,6 +8,6 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 2
+#define RISCV_HWPROBE_MAX_KEY 4
 
 #endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 591802047460..ce39d6e74103 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -20,6 +20,10 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MVENDORID	0
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
+#define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define RISCV_HWPROBE_KEY_IMA_EXT_0	4
+#define		RISCV_HWPROBE_IMA_FD		(1 << 0)
+#define		RISCV_HWPROBE_IMA_C		(1 << 1)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
-
 #endif
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 868a12384f5a..74e0d72c877d 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -9,6 +9,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
+#include <asm/switch_to.h>
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm-generic/mman-common.h>
@@ -182,6 +183,28 @@ long do_riscv_hwprobe(struct riscv_hwprobe __user *pairs, long pair_count,
 			ret = hwprobe_mid(pairs, key, &cpus);
 			break;
 
+		/*
+		 * The kernel already assumes that the base single-letter ISA
+		 * extensions are supported on all harts, and only supports the
+		 * IMA base, so just cheat a bit here and tell that to
+		 * userspace.
+		 */
+		case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
+			ret = set_hwprobe(pairs, RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+			break;
+
+		case RISCV_HWPROBE_KEY_IMA_EXT_0:
+			{
+				u64 val = 0;
+
+				if (has_fpu())
+					val |= RISCV_HWPROBE_IMA_FD;
+				if (elf_hwcap & RISCV_ISA_EXT_c)
+					val |= RISCV_HWPROBE_IMA_C;
+				ret = set_hwprobe(pairs, val);
+			}
+			break;
+
 		/*
 		 * For forward compatibility, unknown keys don't fail the whole
 		 * call, but get their element key set to -1 and value set to 0
-- 
2.25.1

