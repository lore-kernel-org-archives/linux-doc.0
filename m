Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DD5C433EF
	for <linux-doc@archiver.kernel.org>; Sun,  5 Dec 2021 13:45:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234251AbhLENtG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:49:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbhLENtF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Dec 2021 08:49:05 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A55AC061714
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 05:45:38 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id cq22-20020a17090af99600b001a9550a17a5so8788563pjb.2
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 05:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a6TisyPnAbHEAqhNPjZB47OYL/5TdtuMVcmtZU9kC3Y=;
        b=NEHEveewRS+Rz5maS7o/HECXNtOjF7w/K8eq+6xWxTH4Of28377++25f72VMfZy0xD
         wA3VGV1AvC08n4YMyfhNycQaIZ3Iudg6WxDiEGrvjKnt2ExRo4mMk+QB2HmsGPjKYqHJ
         t/rhE+MNGW9Lyfkpq/Vt67GQC/0W1IZCkZEFWatbCV+rQ+W0EBLq5CVH046yGBEDDWNG
         UO1HXOtXxJNvMQIz1JQen0FtAElU7u2AK+kN6jZDKmRb/4mquSXHbcwRBV+lmMEoLZrO
         mDA+T3Jb861EyRUfwXl8bnijOaGAT7aqRiKXhmbWqZQQmZk2IiOQEpZN63th2lF29kHA
         z6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a6TisyPnAbHEAqhNPjZB47OYL/5TdtuMVcmtZU9kC3Y=;
        b=b+8SlxZvRDl7KlzenbMCB199/UowuiWYl0BjrpGWDEkBT4IjL/GoPIhSEcymwnDsqa
         ZjHOiYnm9RAL76CGAaf1vY1d2DeydouAUowgfSUbXA5jRDiUIGFPX7rAoE4WDPQG5/Zh
         awdC/2Quryxu32Q70ZEMizlWciAdhQSQ1Z9trQ0phW3yS01MTrOlzZwJ/uArlNYHmLa/
         Lgxl6XB/8exnyrs0Yf7kwC9gT3wEgFAt+huNGb1WPftQWPa/4Ud6ns+otRar13z/T31E
         jAFF30wVDPl6HBzmeR2HbLLU/vM68MZaxKIv37/c/EQPT95QOaIGJmwF/r83ftWFYdwC
         xlLQ==
X-Gm-Message-State: AOAM530WcY2T7UVWPk1ZPjJ+yGDsuCF7dzSLBX4hdU5tFX++4z+KHeIt
        0bNIKhvZfcDfwLtXs+3IffQ=
X-Google-Smtp-Source: ABdhPJxq689X8JCDVJj8vtBHjNB18RTwsMuVLEyYzIuocBqGxVeaQJTvhVeNCespQeVtESFdfdeNqg==
X-Received: by 2002:a17:90b:19c8:: with SMTP id nm8mr29999998pjb.163.1638711938059;
        Sun, 05 Dec 2021 05:45:38 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id g19sm4265114pfc.145.2021.12.05.05.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:45:37 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 06/11] docs/virt: add a blank line and some - to kvm api
Date:   Sun,  5 Dec 2021 21:43:55 +0800
Message-Id: <dae8f19dabe218bfded1eec5e7b921e43501f7c7.1638706875.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix warning as:

linux-next/Documentation/virt/kvm/api.rst:6046: WARNING: Literal block ends without a blank line; unexpected unindent.
linux-next/Documentation/virt/kvm/api.rst:7296: WARNING: Title underline too short.

8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID
-----------------------------
linux-next/Documentation/virt/kvm/api.rst:7296: WARNING: Title underline too short.

8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID
-----------------------------

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/virt/kvm/api.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index aeeb071c7688..a77c4533821f 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6043,6 +6043,7 @@ Valid values for 'type' are:
 			unsigned long args[6];
 			unsigned long ret[2];
 		} riscv_sbi;
+
 If exit reason is KVM_EXIT_RISCV_SBI then it indicates that the VCPU has
 done a SBI call which is not handled by KVM RISC-V kernel module. The details
 of the SBI call are available in 'riscv_sbi' member of kvm_run structure. The
@@ -7293,7 +7294,7 @@ trap and emulate MSRs that are outside of the scope of KVM as well as
 limit the attack surface on KVM's MSR emulation code.
 
 8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID
------------------------------
+-------------------------------------
 
 Architectures: x86
 
-- 
2.27.0

