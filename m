Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DEEC3DA78
	for <linux-doc@archiver.kernel.org>; Tue, 17 Jan 2023 10:31:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236723AbjAQKbr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Jan 2023 05:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236367AbjAQKar (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jan 2023 05:30:47 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F67630E89
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 02:29:39 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id r2so30072686wrv.7
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 02:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vd/VlYlJ0ANHnVmLATf8jl8jimk8T2yJWVQPK58ktjs=;
        b=VaHmbhhsKTT1HPH18b6gpun5ikn8SmXDGbVKA9B+1FSMjhitFawlC9/Qhq96oxBgAN
         GWUcRSBxhKo+It16G/LbgXupJhbC0v1DGxGAFG8/zL+cLNt8vFeBjgqNm+ENqbxSfdaL
         RLEsGGA78smbbsE2IEP8MxR2MHtaMqlRS3M/xFdLmMNJfPbpX6rbvoV50bxmMjdW2mFB
         Ie5K79mo0mgwGtyrPDgQKNFCZxcVdBreOSdCxrW42q7boVfyr1Ju0F9KeUUXi2Nz2QHT
         nXQeIh0be2tDH8+kOOycix8Gerhf7ViYm0ksGk07EvdM1uTq8hshtSTYeoYd45srVdda
         R5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vd/VlYlJ0ANHnVmLATf8jl8jimk8T2yJWVQPK58ktjs=;
        b=zwGEaSq3u+nFV3l7PUuDcdNYMu+lBIxGsrfe33Pu+qGtIvMqvz9sCgpbWQ8owB7Ek9
         kZslsPf7FeBpzzN5S6y/Lw3wSbZQpQLgZ/Zojp/Jq+zpEB0N6JKMgsQ1LzY0h0EvKW4O
         4S39Kdac3pdtMdHLoaY9hciB0RjVR9mGkPO0wrbsgKFcRhSAaQIJDCiuwefvEE6DKZWc
         UgDeMXD6RwWRv3kEfQKZGj+tn6X+DoQi7yCsyxPimmAlyialk8pHykbNT41JKxM2DlM6
         tnG7Z9ywC3ZbGYxPb7wLmDy/BanWdDQhylYQ/7lna7uoKLl0kID/7Naivt3sBuEJrB2T
         XZ7Q==
X-Gm-Message-State: AFqh2krW6jOSLgV9oIc3ZXmM42dei6viQax7skLliwtI+B0B+UldeGsI
        LGCTfWXUixXMv36z7AdAHOdkyg==
X-Google-Smtp-Source: AMrXdXtjgtXSqS+i1r9sVICS1f0nXlHUoU11LsjPaZSDIeJ/cB+J7ONcdpmy9YzxVUlse9ddH12A4Q==
X-Received: by 2002:adf:fc83:0:b0:2bd:dbf7:1db5 with SMTP id g3-20020adffc83000000b002bddbf71db5mr2354972wrr.31.1673951377658;
        Tue, 17 Jan 2023 02:29:37 -0800 (PST)
Received: from usaari01.cust.communityfibre.co.uk ([2a02:6b6a:b566:0:17d8:e5ec:f870:7b46])
        by smtp.gmail.com with ESMTPSA id j15-20020a5d452f000000b0028f9132e9ddsm28389844wra.39.2023.01.17.02.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 02:29:37 -0800 (PST)
From:   Usama Arif <usama.arif@bytedance.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, linux@armlinux.org.uk,
        yezengruan@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        maz@kernel.org, steven.price@arm.com, mark.rutland@arm.com,
        bagasdotme@gmail.com, pbonzini@redhat.com
Cc:     fam.zheng@bytedance.com, liangma@liangbit.com,
        punit.agrawal@bytedance.com, Usama Arif <usama.arif@bytedance.com>
Subject: [v3 2/6] KVM: arm64: Add SMCCC paravirtualised lock calls
Date:   Tue, 17 Jan 2023 10:29:26 +0000
Message-Id: <20230117102930.1053337-3-usama.arif@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230117102930.1053337-1-usama.arif@bytedance.com>
References: <20230117102930.1053337-1-usama.arif@bytedance.com>
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
 arch/arm64/include/asm/pvlock-abi.h | 15 +++++++++++++++
 include/linux/arm-smccc.h           |  8 ++++++++
 tools/include/linux/arm-smccc.h     |  8 ++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/include/asm/pvlock-abi.h

diff --git a/arch/arm64/include/asm/pvlock-abi.h b/arch/arm64/include/asm/pvlock-abi.h
new file mode 100644
index 000000000000..e12c8ec05178
--- /dev/null
+++ b/arch/arm64/include/asm/pvlock-abi.h
@@ -0,0 +1,15 @@
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
+} __aligned(64);
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

