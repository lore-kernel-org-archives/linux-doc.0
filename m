Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A30357D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Mar 2019 18:42:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403823AbfC0SWJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Mar 2019 14:22:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:40168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403811AbfC0SWI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 27 Mar 2019 14:22:08 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59C9420449;
        Wed, 27 Mar 2019 18:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1553710928;
        bh=92yBxjLmuh/HkrdmI+xC+OA+RV60COqu1/W5/9LCIzw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ukes0Cm8AWR55Od6CGOcIROqwiSWrV2pz7MLPX0sOzmlf7Pp6jokcO2bbAGc532wt
         1ExOzj5CoUA6flEXXq0xhqUXh/kDBPY1U/bBZUvw/8ABgA2fe6VpcyUgX1tQ04L536
         1jDySd64mLWdhrWT1NI3NsDv19DQfBv3NGmCXEhc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Sasha Levin <sashal@kernel.org>, linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 49/87] ARM: 8833/1: Ensure that NEON code always compiles with Clang
Date:   Wed, 27 Mar 2019 14:20:02 -0400
Message-Id: <20190327182040.17444-49-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190327182040.17444-1-sashal@kernel.org>
References: <20190327182040.17444-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Nathan Chancellor <natechancellor@gmail.com>

[ Upstream commit de9c0d49d85dc563549972edc5589d195cd5e859 ]

While building arm32 allyesconfig, I ran into the following errors:

  arch/arm/lib/xor-neon.c:17:2: error: You should compile this file with
  '-mfloat-abi=softfp -mfpu=neon'

  In file included from lib/raid6/neon1.c:27:
  /home/nathan/cbl/prebuilt/lib/clang/8.0.0/include/arm_neon.h:28:2:
  error: "NEON support not enabled"

Building V=1 showed NEON_FLAGS getting passed along to Clang but
__ARM_NEON__ was not getting defined. Ultimately, it boils down to Clang
only defining __ARM_NEON__ when targeting armv7, rather than armv6k,
which is the '-march' value for allyesconfig.

>From lib/Basic/Targets/ARM.cpp in the Clang source:

  // This only gets set when Neon instructions are actually available, unlike
  // the VFP define, hence the soft float and arch check. This is subtly
  // different from gcc, we follow the intent which was that it should be set
  // when Neon instructions are actually available.
  if ((FPU & NeonFPU) && !SoftFloat && ArchVersion >= 7) {
    Builder.defineMacro("__ARM_NEON", "1");
    Builder.defineMacro("__ARM_NEON__");
    // current AArch32 NEON implementations do not support double-precision
    // floating-point even when it is present in VFP.
    Builder.defineMacro("__ARM_NEON_FP",
                        "0x" + Twine::utohexstr(HW_FP & ~HW_FP_DP));
  }

Ard Biesheuvel recommended explicitly adding '-march=armv7-a' at the
beginning of the NEON_FLAGS definitions so that __ARM_NEON__ always gets
definined by Clang. This doesn't functionally change anything because
that code will only run where NEON is supported, which is implicitly
armv7.

Link: https://github.com/ClangBuiltLinux/linux/issues/287

Suggested-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
Acked-by: Nicolas Pitre <nico@linaro.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/arm/kernel_mode_neon.txt | 4 ++--
 arch/arm/lib/Makefile                  | 2 +-
 arch/arm/lib/xor-neon.c                | 2 +-
 lib/raid6/Makefile                     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/arm/kernel_mode_neon.txt b/Documentation/arm/kernel_mode_neon.txt
index 525452726d31..b9e060c5b61e 100644
--- a/Documentation/arm/kernel_mode_neon.txt
+++ b/Documentation/arm/kernel_mode_neon.txt
@@ -6,7 +6,7 @@ TL;DR summary
 * Use only NEON instructions, or VFP instructions that don't rely on support
   code
 * Isolate your NEON code in a separate compilation unit, and compile it with
-  '-mfpu=neon -mfloat-abi=softfp'
+  '-march=armv7-a -mfpu=neon -mfloat-abi=softfp'
 * Put kernel_neon_begin() and kernel_neon_end() calls around the calls into your
   NEON code
 * Don't sleep in your NEON code, and be aware that it will be executed with
@@ -87,7 +87,7 @@ instructions appearing in unexpected places if no special care is taken.
 Therefore, the recommended and only supported way of using NEON/VFP in the
 kernel is by adhering to the following rules:
 * isolate the NEON code in a separate compilation unit and compile it with
-  '-mfpu=neon -mfloat-abi=softfp';
+  '-march=armv7-a -mfpu=neon -mfloat-abi=softfp';
 * issue the calls to kernel_neon_begin(), kernel_neon_end() as well as the calls
   into the unit containing the NEON code from a compilation unit which is *not*
   built with the GCC flag '-mfpu=neon' set.
diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 27f4d96258a2..b3ecffb76c3f 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -38,7 +38,7 @@ $(obj)/csumpartialcopy.o:	$(obj)/csumpartialcopygeneric.S
 $(obj)/csumpartialcopyuser.o:	$(obj)/csumpartialcopygeneric.S
 
 ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
-  NEON_FLAGS			:= -mfloat-abi=softfp -mfpu=neon
+  NEON_FLAGS			:= -march=armv7-a -mfloat-abi=softfp -mfpu=neon
   CFLAGS_xor-neon.o		+= $(NEON_FLAGS)
   obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
 endif
diff --git a/arch/arm/lib/xor-neon.c b/arch/arm/lib/xor-neon.c
index 2c40aeab3eaa..c691b901092f 100644
--- a/arch/arm/lib/xor-neon.c
+++ b/arch/arm/lib/xor-neon.c
@@ -14,7 +14,7 @@
 MODULE_LICENSE("GPL");
 
 #ifndef __ARM_NEON__
-#error You should compile this file with '-mfloat-abi=softfp -mfpu=neon'
+#error You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
 #endif
 
 /*
diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 3057011f5599..10ca69475611 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -24,7 +24,7 @@ endif
 ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
 NEON_FLAGS := -ffreestanding
 ifeq ($(ARCH),arm)
-NEON_FLAGS += -mfloat-abi=softfp -mfpu=neon
+NEON_FLAGS += -march=armv7-a -mfloat-abi=softfp -mfpu=neon
 endif
 ifeq ($(ARCH),arm64)
 CFLAGS_REMOVE_neon1.o += -mgeneral-regs-only
-- 
2.19.1

