Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386CDC43217
	for <linux-doc@archiver.kernel.org>; Fri,  4 Nov 2022 06:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbiKDGVS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Nov 2022 02:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiKDGVR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Nov 2022 02:21:17 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F462A278
        for <linux-doc@vger.kernel.org>; Thu,  3 Nov 2022 23:21:15 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso4781987wma.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Nov 2022 23:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gm+CCMBzGV2wY5tpR1ywTaFubhsMnT6RUSMviBRIrA=;
        b=2tmx0ZEzKlapeA40O0da60uijCZiQnnvovriTJgT3C3YW39LcGgvxSgN7m0Ms0JXRr
         D92XuuUCup3qht8mttWG9ecOOEurQnH46+r4Oaj2PNwPaCuW57yvPYegBdCMNT8MnSoU
         NOlY3X6PELYB51vtQkE4j/wGUNXLmEKjmPzkuW9/jS+OiQ316dllc8FPxAsGI0rzGUTU
         5q2tEAFlf54tRihF1fQBaPZ+jK4//Gke9zNI4MbzwaxlCrgaYBonTRPX25KVZrENs1J3
         Xow0dCWTcpfW0PdaLQ/uzBW2WBuW1Aegf7XTWh65W1L5iuGy79EZUOzhsxIypYrmCsE+
         u/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gm+CCMBzGV2wY5tpR1ywTaFubhsMnT6RUSMviBRIrA=;
        b=rpLEeqIYhS9v8Uy/w8sFiu6eIu70V8H2+uD7IisMnxFqExMRauHEHF7/JHL/gmZmuS
         n/7hjCan3C9FRXgnyoqxCRiIFfKQ/RHVslsw1MVelsVPWDCBt1FYlyBTu3XjZdmCIgRr
         ahtrDACXza7Tk+RMB63zOnkB7+4/wb/1EXZDb3+oWnhXktpWwiBrtFIno7xyCxAZlhcS
         anDBW0lDR1TK9i7IgL9VjXBPSuU7V9EowxMBm7G2NZyb4XlOe56TrR33+Zrl/bvjIpB7
         ixTg4+XzZG31nqUJQ9E5CKgnYUDN+TKEsYM11PbGb9zPQgrr32N6apO5gUKXvOQczDIb
         hxRA==
X-Gm-Message-State: ACrzQf2qTicqbXdwjyCfDxFv6DexeNfTtHd5ua3paDHeae97PtRiB04h
        o+6+StCKgSZphRwis0sj6WqxSA==
X-Google-Smtp-Source: AMsMyM7cP7o2Mb3eYYy1AVu03sQGOtx3okUtdbwIqzpIe6O5ZDxr+oIbMBpI7JrFVBYNndSa4ueUzw==
X-Received: by 2002:a05:600c:3b87:b0:3cf:59ea:ea26 with SMTP id n7-20020a05600c3b8700b003cf59eaea26mr26647184wms.159.1667542875338;
        Thu, 03 Nov 2022 23:21:15 -0700 (PDT)
Received: from usaari01.cust.communityfibre.co.uk ([2a02:6b6a:b4d7:0:c7c:f931:dd4c:1ea6])
        by smtp.gmail.com with ESMTPSA id w11-20020a5d608b000000b002366f9bd717sm3099924wrt.45.2022.11.03.23.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 23:21:14 -0700 (PDT)
From:   Usama Arif <usama.arif@bytedance.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, linux@armlinux.org.uk,
        yezengruan@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        maz@kernel.org, steven.price@arm.com, mark.rutland@arm.com,
        bagasdotme@gmail.com
Cc:     fam.zheng@bytedance.com, liangma@liangbit.com,
        punit.agrawal@bytedance.com, Usama Arif <usama.arif@bytedance.com>
Subject: [v2 2/6] KVM: arm64: Add SMCCC paravirtualised lock calls
Date:   Fri,  4 Nov 2022 06:21:01 +0000
Message-Id: <20221104062105.4119003-3-usama.arif@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104062105.4119003-1-usama.arif@bytedance.com>
References: <20221104062105.4119003-1-usama.arif@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new SMCCC compatible hypercalls for PV lock features:
  ARM_SMCCC_KVM_FUNC_PV_LOCK:   0xC6000002

Also add the header file which defines the ABI for the paravirtualized
lock features we're about to add.

Signed-off-by: Zengruan Ye <yezengruan@huawei.com>
Signed-off-by: Usama Arif <usama.arif@bytedance.com>
---
 arch/arm64/include/asm/pvlock-abi.h | 17 +++++++++++++++++
 include/linux/arm-smccc.h           |  8 ++++++++
 tools/include/linux/arm-smccc.h     |  8 ++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 arch/arm64/include/asm/pvlock-abi.h

diff --git a/arch/arm64/include/asm/pvlock-abi.h b/arch/arm64/include/asm/pvlock-abi.h
new file mode 100644
index 000000000000..3f4574071679
--- /dev/null
+++ b/arch/arm64/include/asm/pvlock-abi.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(c) 2019 Huawei Technologies Co., Ltd
+ * Author: Zengruan Ye <yezengruan@huawei.com>
+ *         Usama Arif <usama.arif@bytedance.com>
+ */
+
+#ifndef __ASM_PVLOCK_ABI_H
+#define __ASM_PVLOCK_ABI_H
+
+struct pvlock_vcpu_state {
+	__le64 preempted;
+	/* Structure must be 64 byte aligned, pad to that size */
+	u8 padding[56];
+} __packed;
+
+#endif
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 220c8c60e021..104c10035b10 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -112,6 +112,7 @@
 /* KVM "vendor specific" services */
 #define ARM_SMCCC_KVM_FUNC_FEATURES		0
 #define ARM_SMCCC_KVM_FUNC_PTP			1
+#define ARM_SMCCC_KVM_FUNC_PV_LOCK		2
 #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
 #define ARM_SMCCC_KVM_NUM_FUNCS			128
 
@@ -151,6 +152,13 @@
 			   ARM_SMCCC_OWNER_STANDARD_HYP,	\
 			   0x21)
 
+/* Paravirtualised lock calls */
+#define ARM_SMCCC_VENDOR_HYP_KVM_PV_LOCK_FUNC_ID		\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
+			   ARM_SMCCC_SMC_64,			\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,		\
+			   ARM_SMCCC_KVM_FUNC_PV_LOCK)
+
 /* TRNG entropy source calls (defined by ARM DEN0098) */
 #define ARM_SMCCC_TRNG_VERSION					\
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
diff --git a/tools/include/linux/arm-smccc.h b/tools/include/linux/arm-smccc.h
index 63ce9bebccd3..c21e539c0228 100644
--- a/tools/include/linux/arm-smccc.h
+++ b/tools/include/linux/arm-smccc.h
@@ -111,6 +111,7 @@
 /* KVM "vendor specific" services */
 #define ARM_SMCCC_KVM_FUNC_FEATURES		0
 #define ARM_SMCCC_KVM_FUNC_PTP			1
+#define ARM_SMCCC_KVM_FUNC_PV_LOCK		2
 #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
 #define ARM_SMCCC_KVM_NUM_FUNCS			128
 
@@ -150,6 +151,13 @@
 			   ARM_SMCCC_OWNER_STANDARD_HYP,	\
 			   0x21)
 
+/* Paravirtualised lock calls */
+#define ARM_SMCCC_VENDOR_HYP_KVM_PV_LOCK_FUNC_ID		\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
+			   ARM_SMCCC_SMC_64,			\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,		\
+			   ARM_SMCCC_KVM_FUNC_PV_LOCK)
+
 /* TRNG entropy source calls (defined by ARM DEN0098) */
 #define ARM_SMCCC_TRNG_VERSION					\
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
-- 
2.25.1

