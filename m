Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85A7C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 10 Mar 2022 15:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbiCJPUf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Mar 2022 10:20:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233190AbiCJPUf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Mar 2022 10:20:35 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4237F4C437
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 07:19:34 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id q29so4012916pgn.7
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 07:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a465xb2KbYFoqoIEJGWa82/Xx7nYSzF3Ap4I6nfNorw=;
        b=Wfg/iUEh+R/6dH331hhj5/hjZB6m23Fwg7XxIbbU+bSlp1GB+NF3O63WPyXlEe13ko
         ncEgPArVMAoVCbrJcCtvcWAhrOJpNbuntMAweWU7T7Kk3ZOpNNRp2ehXRjtHSg3x8L/N
         Yz1xdVY6Q6+QqOfLfZL70gafjUC/xtaKRN/lPFFklL7uXxdAY5/wBeqHjGaxad8RV75o
         FmqOWpS2mOD6YmaaMO7EryjSOhTj+Nm7wzuA1KGbtE4aHqBBnxlB99UrrNCmzI27TbOE
         KC/oerVuwy+O2KKteUuVBrtvU6AyMh+iFcP34E3eqxbSQTTZ3uiciz87xjnSVFSR6VJA
         l7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a465xb2KbYFoqoIEJGWa82/Xx7nYSzF3Ap4I6nfNorw=;
        b=YGJ9xPe4cwSCn6Er9h7Q1WpIDrr4w1e86Bd5TirNBlRCrRjHRrQmrKE0orwl866Qc+
         t87oeAURky54j3dMt2rUSLqYrxpwnIvqOFE7BUTfu1HtiOP11tPDDZhzegwjEPY0hJaT
         asjvElNLvYzPdYE9Z0+4Mky/qvIs34uqbgQTGF4DvQ2YmyupwXoW/0Mug/JohPfaE+ai
         YSEB681LRcr0qoI1aF2qqb2xNf8ND4FIDJL/zrCjE6w/+6tIi8baxua23BJJ+A9iH6Bv
         Zhp74kRYNZYYSYbOiNOkSrfMYWLMZ/JlzLZOAjSF3G0/Zfx+4ehOTGD/Irc55CbOU6sn
         kI7A==
X-Gm-Message-State: AOAM533OAh0Ze1Pb3FWqeo4rMLVgB7IpUX3ABNiV6MPLqnRX4PUIevyT
        X7AOY0rFJdSyNaD4cL9WTbg=
X-Google-Smtp-Source: ABdhPJxmDb++owF8HyuZ0NzfXFLBHRSCjs9kaQPbXecc45XFDxBC2BmGlf6iz3IFtej9BTYagPMxlQ==
X-Received: by 2002:a65:4101:0:b0:372:1875:c19c with SMTP id w1-20020a654101000000b003721875c19cmr4392787pgp.435.1646925573655;
        Thu, 10 Mar 2022 07:19:33 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id q11-20020a056a00084b00b004f73e6c26b8sm7474424pfk.25.2022.03.10.07.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 07:19:33 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v6 1/5] docs/zh_CN: Refactoring the admin-guide directory index
Date:   Thu, 10 Mar 2022 23:20:48 +0800
Message-Id: <d410408ec13d6e9cff97da50a13d793a428e05cf.1646899089.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646899089.git.siyanteng@loongson.cn>
References: <cover.1646899089.git.siyanteng@loongson.cn>
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

