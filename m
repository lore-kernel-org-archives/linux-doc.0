Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40A9C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 09:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbiCIJby (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Mar 2022 04:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232131AbiCIJbx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 04:31:53 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C401F16EAB0
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 01:30:55 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id z15so1728091pfe.7
        for <linux-doc@vger.kernel.org>; Wed, 09 Mar 2022 01:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a465xb2KbYFoqoIEJGWa82/Xx7nYSzF3Ap4I6nfNorw=;
        b=ZbcPJf0oMVMBQeiyyscXUnDN0GqrNfENKGsqdQYxwCrqGqBrAI8vzbYynCSo9Awddm
         ZaGuYAMVD/tuIpRy0zOOY3nCeQ4/s48fGXtc3OUvhW9ty40dS1OkkCwZ8rvS3KnxSFMc
         ikuPkVNx2z3hhJ193wuPuFnZsAORZo746OfU2DW54jovgIzCNY8KZD1Mvh9uJk8hJx4I
         AHTGxB5+23zWP9noF6yHmqvoRRQK9uYcRDyjJDFwSpSTorEBdynJPFGHM5l+jy2u0bag
         34NOXvaWCVrZFJRTeCVAkNUBMeUfTWkLNh/yNTFQYoqkJkXJ8l9V5DxOKokDUGZ/WGE+
         K5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a465xb2KbYFoqoIEJGWa82/Xx7nYSzF3Ap4I6nfNorw=;
        b=C0MnsANiKJQE+zbctJnpoFuFpujt2oI7N8HFm+ly9IK1Co8umavEy3HDpQdrZCjWiB
         KlnnYrdf9M4p9PUEeMpPFoFDfsPknqUeU+Ee3Tbo7GK7ypXx1++z7aLDWDI+ZExvuX/h
         hGkJpgorjiFGwOnGPBO0CiBXbDyC5dVB3d3eSy9aHQeaXAkFo6aX4JbLM2os+LyT4Vch
         /FfEfEll11wQAjqdBLWZa5jf9Y1NpiYq4SGpdnRdrBzhk4wj80Yvn+bHA8TrqaJ1zjPJ
         JkOITgxB6+wY0PxyI2o89fIAVQL7qDQp1zvDo2snougbuSfYml/nXns2k/v7LMTz83vQ
         596A==
X-Gm-Message-State: AOAM530S7YIy2NqurOks01GeDScvHsbrBP76vBkJEUi6COJzOt3qZd0j
        /VR/xj42uZ08GVJu9R9fJfc=
X-Google-Smtp-Source: ABdhPJxoznBwkqAoa9fcFpYy1JScqjmMWIJbcSPRc2NyPgdIF9P03MWSupTptpJICQEQVDTt/n7RZA==
X-Received: by 2002:a63:e747:0:b0:372:c757:c569 with SMTP id j7-20020a63e747000000b00372c757c569mr17487943pgk.516.1646818255128;
        Wed, 09 Mar 2022 01:30:55 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id h21-20020a056a00231500b004e13188af99sm2173369pfh.38.2022.03.09.01.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 01:30:54 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v5 1/5] docs/zh_CN: Refactoring the admin-guide directory index
Date:   Wed,  9 Mar 2022 17:32:06 +0800
Message-Id: <c726707c8b319ce0f75f9f12341ffb8a88027e91.1646817889.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646817889.git.siyanteng@loongson.cn>
References: <cover.1646817889.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

The Todolist in the html document looks a mess, now give it a nice looking format.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/admin-guide/index.rst  | 122 +++++++++---------
 1 file changed, 61 insertions(+), 61 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index 763055f161dd..be535ffaf4b0 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -20,15 +20,15 @@ Linux 内核用户和管理员指南
 
 Todolist:
 
-   kernel-parameters
-   devices
-   sysctl/index
+*   kernel-parameters
+*   devices
+*   sysctl/index
 
 本节介绍CPU漏洞及其缓解措施。
 
 Todolist:
 
-   hw-vuln/index
+*   hw-vuln/index
 
 下面的一组文档，针对的是试图跟踪问题和bug的用户。
 
@@ -44,18 +44,18 @@ Todolist:
 
 Todolist:
 
-   reporting-bugs
-   ramoops
-   dynamic-debug-howto
-   kdump/index
-   perf/index
+*   reporting-bugs
+*   ramoops
+*   dynamic-debug-howto
+*   kdump/index
+*   perf/index
 
 这是应用程序开发人员感兴趣的章节的开始。可以在这里找到涵盖内核ABI各个
 方面的文档。
 
 Todolist:
 
-   sysfs-rules
+*   sysfs-rules
 
 本手册的其余部分包括各种指南，介绍如何根据您的喜好配置内核的特定行为。
 
@@ -73,57 +73,57 @@ Todolist:
 
 Todolist:
 
-   acpi/index
-   aoe/index
-   auxdisplay/index
-   bcache
-   binderfs
-   binfmt-misc
-   blockdev/index
-   bootconfig
-   braille-console
-   btmrvl
-   cgroup-v1/index
-   cgroup-v2
-   cifs/index
-   dell_rbu
-   device-mapper/index
-   edid
-   efi-stub
-   ext4
-   nfs/index
-   gpio/index
-   highuid
-   hw_random
-   initrd
-   iostats
-   java
-   jfs
-   kernel-per-CPU-kthreads
-   laptops/index
-   lcd-panel-cgram
-   ldm
-   LSM/index
-   md
-   media/index
-   module-signing
-   mono
-   namespaces/index
-   numastat
-   parport
-   perf-security
-   pm/index
-   pnp
-   rapidio
-   ras
-   rtc
-   serial-console
-   svga
-   thunderbolt
-   ufs
-   vga-softcursor
-   video-output
-   xfs
+*   acpi/index
+*   aoe/index
+*   auxdisplay/index
+*   bcache
+*   binderfs
+*   binfmt-misc
+*   blockdev/index
+*   bootconfig
+*   braille-console
+*   btmrvl
+*   cgroup-v1/index
+*   cgroup-v2
+*   cifs/index
+*   dell_rbu
+*   device-mapper/index
+*   edid
+*   efi-stub
+*   ext4
+*   nfs/index
+*   gpio/index
+*   highuid
+*   hw_random
+*   initrd
+*   iostats
+*   java
+*   jfs
+*   kernel-per-CPU-kthreads
+*   laptops/index
+*   lcd-panel-cgram
+*   ldm
+*   LSM/index
+*   md
+*   media/index
+*   module-signing
+*   mono
+*   namespaces/index
+*   numastat
+*   parport
+*   perf-security
+*   pm/index
+*   pnp
+*   rapidio
+*   ras
+*   rtc
+*   serial-console
+*   svga
+*   thunderbolt
+*   ufs
+*   vga-softcursor
+*   video-output
+*   xfs
 
 .. only::  subproject and html
 
-- 
2.27.0

