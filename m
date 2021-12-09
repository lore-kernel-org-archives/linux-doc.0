Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A97C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 09:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhLIJTP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 04:19:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbhLIJTO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 04:19:14 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2690C061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 01:15:41 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id y7so3466148plp.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 01:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vyQTJ7ULTmxxoKEY/KN+NzHTXlc/jYcC1flGAZ4iKM8=;
        b=dtKLaYzmhuV+eFGCawPb/oSha+KFTKUqEgq2Z0CdqaKQbB7+8PsKoJ7NTQHnzc4x/t
         yByiu6duNsBbBJSoAqPtZd0ZLnfZrsjhNJi619mz1HpGIwGbr5uYBbpIwSUAnGHEL4n5
         fGZLM3EdypqB4uGcPc4h1oA5eH8TtfkJY74t5YNscryPoEy7dhVvDRbHgJdNrDpdG5rP
         hjcQevyDf6KfQ0Nf4E9IFoDvo8rK5FM72grwKIRRGJZT7zAtaGM9RkS+hFRHpht3NB2p
         2bAzzLD6zcMr2JKP5mj4fQWwPR95nN/kO9xqlG2IJs1+nQJFOAGP5msX8+HePMuZTqV5
         28Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vyQTJ7ULTmxxoKEY/KN+NzHTXlc/jYcC1flGAZ4iKM8=;
        b=w9N7awb3I7jE5K1dYNMyfmnI30/07I0jnJqCW5mYZ4oGC9vGiLGrex1XOUYD7z6gab
         H4zJiqU2xMvuBU78PV9fF8tvgALyMrnU1Mx/FBFZ8NNjQOJesCVcIx/GzAPH21GNe0Cr
         ZEMKPYJHCWhMKR5xyFUOCFq/arGF+2y5zIRy2Um5DXWj/hCeAWEul+GsX0EbRGl6jAq7
         QxfJBI5AhhbdrKRKpfM+k6UwKbwkgaJC5kVK7buJl6Gawq3isg/Rvdxwlu/llMp58L8e
         sMBsth50S3UEeSi5cu1hyUENx03MFez8/alJ3yTl5Hx3LvBVK2mbBdJenr6e36d95UTg
         qMbQ==
X-Gm-Message-State: AOAM533X/npaZU7DmmuMfuUTtk6FjtdDsRaTtBL8t4iYcpr44wEwfyPc
        +4UP7LYEqEHDp6P5xTeKopUV4hkqrRg3BEAsm4U=
X-Google-Smtp-Source: ABdhPJy4jgoj6cK7+RLW5rx99jcM6wq+ks3WPGg+LnRAmDJnBwR46aGMyE32eCAEHBmqER1QTlXyBQ==
X-Received: by 2002:a17:90a:f182:: with SMTP id bv2mr14297356pjb.139.1639041341353;
        Thu, 09 Dec 2021 01:15:41 -0800 (PST)
Received: from localhost.localdomain ([8.31.2.21])
        by smtp.gmail.com with ESMTPSA id 35sm5026716pgx.49.2021.12.09.01.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 01:15:40 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     vkuznets@redhat.com
Cc:     pbonzini@redhat.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/virt: add a blank line and some - to kvm api
Date:   Thu,  9 Dec 2021 17:14:14 +0800
Message-Id: <20211209091414.559574-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since 0e691ee7b5034 ("KVM:Documentation: Fix KVM_CAP_ENFORCE_PV_FEATURE_CPUID name") which
introduced awarning:

/home/siyanteng/mainline/linux/Documentation/virt/kvm/api.rst:6046: WARNING: Literal block ends without a blank line; unexpected unindent.
/home/siyanteng/mainline/linux/Documentation/virt/kvm/api.rst:7296: WARNING: Title underline too short.

8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID
-----------------------------
/home/siyanteng/mainline/linux/Documentation/virt/kvm/api.rst:7296: WARNING: Title underline too short.

8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID
-----------------------------

Add 8 "-" for (8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID)
Add a blank line.

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

