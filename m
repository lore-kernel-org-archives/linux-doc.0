Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDBAC4167B
	for <linux-doc@archiver.kernel.org>; Thu,  3 Nov 2022 13:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbiKCNNA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Nov 2022 09:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbiKCNM6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Nov 2022 09:12:58 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9CD140D3
        for <linux-doc@vger.kernel.org>; Thu,  3 Nov 2022 06:12:56 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id y16so2672169wrt.12
        for <linux-doc@vger.kernel.org>; Thu, 03 Nov 2022 06:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMCevN2t3u4efqzCq1N5+13ZhEiTNq+v0n0oSnn+yyc=;
        b=a+kjRi4JO19KMObVrE9NrlM7N8rOXaA0DSi+sAFEBct1LRvXh2vtZaN4eos5JRwjfc
         GIh69g8n6LAGXk+tUPgoRDFmEXEPYOLuQHgtgkiCjW1m5Pesq8BZKhdOQmG9nJMeq+D+
         /7KpbvasuXFi/kH1C7BHHQt0vZ24VZ7TeZpED+ekjXso09V+OpK6f7F7/M/N3vFaio3r
         oW2xS5NydmXQRUQY+F49uQmDdnZRk1KCb95ZleeMBuMVJRsDGlh56WwpAxETFGcsSgGW
         2xh3n8NYRRrT32HpycNiYfYoe1a/uTukXsDpDDwbTTKMnb5XkTz8yTrAglduh/gX7vtJ
         h9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMCevN2t3u4efqzCq1N5+13ZhEiTNq+v0n0oSnn+yyc=;
        b=3Tn2YWdCW2OUIIEmdP1eN4VW9GslbVT7vGpyNaPauUtUDD+7oX+qIebOUWtyapGP2U
         +SsOgGNfSDTAzQcEsP2IoGT3/Q40YLWYjFIlsTMS6qW9WbgAOKIvABK0s3fdw1KbAEEQ
         iZQADSTAvn1trUdjAMD+JHPuCxyu2NhiLUsUNZPsqa2l3o0x4hTEfKINPiXXBSPXA3up
         YHjqaDqULw+/otg0PcPzVEtBpN53hy8MLA1TGY48N7poyr6IO0/Fi7Ot78mGPY/Fzruq
         5oImQ1azig0uqUPyX8GHlVZFzshF2XJ1JQ/bonRqTfrHPjHCz3mmlcGsgyszrSwxE2YJ
         EOGg==
X-Gm-Message-State: ACrzQf0qNiWM+CJCzj0biQuirSjPKeGIoTktki75ay2dzTr7AsS54AVn
        dIymo6b7w6PBZYpRcD0N8SpJ0g==
X-Google-Smtp-Source: AMsMyM4FLskXFFfmgc8C4mbNPem7m0JVrbmyMOJf4JYBCDCqX67gaH3asI2ftJOlpRErjLr2R76NSQ==
X-Received: by 2002:a05:6000:1ac7:b0:232:8c6c:6c4a with SMTP id i7-20020a0560001ac700b002328c6c6c4amr18775577wry.455.1667481175055;
        Thu, 03 Nov 2022 06:12:55 -0700 (PDT)
Received: from usaari01.cust.communityfibre.co.uk ([2a02:6b6a:b4d7:0:e42f:dffe:32d3:8bf2])
        by smtp.gmail.com with ESMTPSA id z8-20020a056000110800b002383e977920sm765813wrw.110.2022.11.03.06.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:12:54 -0700 (PDT)
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
Subject: [PATCH] kvm/arm: Fix pvtime documentation
Date:   Thu,  3 Nov 2022 13:12:10 +0000
Message-Id: <20221103131210.3603385-1-usama.arif@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This includes table format and using reST labels for
cross-referencing to vcpu.rst.

Suggested-by:  Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Usama Arif <usama.arif@bytedance.com>
---
 Documentation/virt/kvm/arm/pvtime.rst   | 14 ++++++++------
 Documentation/virt/kvm/devices/vcpu.rst |  2 ++
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/virt/kvm/arm/pvtime.rst b/Documentation/virt/kvm/arm/pvtime.rst
index 392521af7c90..e88b34e586be 100644
--- a/Documentation/virt/kvm/arm/pvtime.rst
+++ b/Documentation/virt/kvm/arm/pvtime.rst
@@ -23,21 +23,23 @@ the PV_TIME_FEATURES hypercall should be probed using the SMCCC 1.1
 ARCH_FEATURES mechanism before calling it.
 
 PV_TIME_FEATURES
-    ============= ========    ==========
+
+    ============= ========    =================================================
     Function ID:  (uint32)    0xC5000020
     PV_call_id:   (uint32)    The function to query for support.
                               Currently only PV_TIME_ST is supported.
     Return value: (int64)     NOT_SUPPORTED (-1) or SUCCESS (0) if the relevant
                               PV-time feature is supported by the hypervisor.
-    ============= ========    ==========
+    ============= ========    =================================================
 
 PV_TIME_ST
-    ============= ========    ==========
+
+    ============= ========    ==============================================
     Function ID:  (uint32)    0xC5000021
     Return value: (int64)     IPA of the stolen time data structure for this
                               VCPU. On failure:
                               NOT_SUPPORTED (-1)
-    ============= ========    ==========
+    ============= ========    ==============================================
 
 The IPA returned by PV_TIME_ST should be mapped by the guest as normal memory
 with inner and outer write back caching attributes, in the inner shareable
@@ -76,5 +78,5 @@ It is advisable that one or more 64k pages are set aside for the purpose of
 these structures and not used for other purposes, this enables the guest to map
 the region using 64k pages and avoids conflicting attributes with other memory.
 
-For the user space interface see Documentation/virt/kvm/devices/vcpu.rst
-section "3. GROUP: KVM_ARM_VCPU_PVTIME_CTRL".
+For the user space interface see
+:ref:`Documentation/virt/kvm/devices/vcpu.rst <kvm_arm_vcpu_pvtime_ctrl>`.
\ No newline at end of file
diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index 716aa3edae14..31f14ec4a65b 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -171,6 +171,8 @@ configured values on other VCPUs.  Userspace should configure the interrupt
 numbers on at least one VCPU after creating all VCPUs and before running any
 VCPUs.
 
+.. _kvm_arm_vcpu_pvtime_ctrl:
+
 3. GROUP: KVM_ARM_VCPU_PVTIME_CTRL
 ==================================
 
-- 
2.25.1

