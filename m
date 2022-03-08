Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F7BC4332F
	for <linux-doc@archiver.kernel.org>; Tue,  8 Mar 2022 08:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344886AbiCHIMF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 03:12:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344845AbiCHILo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 03:11:44 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9003EF17
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 00:10:45 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id bc27so15784142pgb.4
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 00:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a465xb2KbYFoqoIEJGWa82/Xx7nYSzF3Ap4I6nfNorw=;
        b=Xrlf5GHEgFPJwCuXFkhT3xwburzSvKsciFWLwiEJc45anIo0jYHyQwQri11TIucIWY
         hoDzJTXk+HFCUc1df8YJCZj+lE70ajcNPZ+oHrhcyiUEijnvKK/LRM1s6azP8j9yHgm+
         YxkitvPYKILKq8XL1xsCoYHyknOkMcim9oRzTSx9gMUuioVJ/5aQ7JPa/VWVPHFXVoTQ
         /u6Ol5qFbNy7CrIyW3tqFzzBeGp6L59B9FebszWpoGec6T1Xwi3MnkACIzWbbBCXqLW3
         NUvfUR9XeQox48BPrm6AvS5U13/oW6n6RBuYLL5X5SpD8PimuHiA8zQG1lZ+ylOg9EpH
         2raQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a465xb2KbYFoqoIEJGWa82/Xx7nYSzF3Ap4I6nfNorw=;
        b=ccfsoiRn3dCaXJAUz7SlYUJitDuSFa0p7PtidTHVzecZnVaQg1cvv78EbRyZ1b+k+8
         8Qv6mCOUAa0YvosFYRVmsZqvyHHaLXTD1a2Sd69rHVkee5GNP6c3O7Bvgw3q/0eRlqh+
         y/53OwaSe5lfsV/IJlOOl/PDhbb4+9kLd1QReLwXK0qncN20imLwwPtjdttMt2bClr8Y
         LmfsavKDh6dZMJxYqOA3ggLrn7gtCOpkbT9EVVFmy+N8mlGPFFcJleUOiYHqEiWhcyil
         e9aMGOIxsSCLhI+VGnWq+fIYNEEGvaZeufaTVNsEylIk+pjVHoXDPp8OWHVVPF66QrYq
         6+hg==
X-Gm-Message-State: AOAM531LU2AtT5iFZPTyQ3ImtOBBGQ6B+r7wMnRkdYQxRBDS4TIrpe7w
        6YNSYZvSK5x9BWRsWEzhC2I=
X-Google-Smtp-Source: ABdhPJzsLfv1iq8wmWUdLPKL0RHvAelXR48bZEIbkY4DKcUWOgrH9aPhWGE0I62TS2x2IgSJA5Uhow==
X-Received: by 2002:a63:dd45:0:b0:373:296e:3cea with SMTP id g5-20020a63dd45000000b00373296e3ceamr13348523pgj.299.1646727044573;
        Tue, 08 Mar 2022 00:10:44 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id d14-20020a056a0024ce00b004f7281cda21sm2165282pfv.167.2022.03.08.00.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:10:44 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 1/5] docs/zh_CN: Refactoring the admin-guide directory index
Date:   Tue,  8 Mar 2022 16:11:59 +0800
Message-Id: <d9829d5280387bddeadb355eaddc5da113494cf5.1646723249.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646723249.git.siyanteng@loongson.cn>
References: <cover.1646723249.git.siyanteng@loongson.cn>
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

