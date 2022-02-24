Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E6BC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 02:58:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbiBXC7N (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Feb 2022 21:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbiBXC7M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Feb 2022 21:59:12 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67FACD19B2
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 18:58:43 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id z2so516670plg.8
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 18:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a465xb2KbYFoqoIEJGWa82/Xx7nYSzF3Ap4I6nfNorw=;
        b=OjDB+1mmNc7JqE6wd4wK3l5I/B1yDweuoGlZAl5qChazMI9Aiy0EKo0BnvRU16PtDp
         T468eYx5BD1htAO8NPi4NWq4gKTQDbfC+sZWl4q66tUKKhYVkbHQLZdUhysfk2dM/n3b
         GunXo8CJyHaDOK9pAtDdF2U53T80TrSMnnkmXSSxX6Jj5Pgch142mLE9cuKGR40xwxeF
         RWy6hADPizAIwXNrwXOHHmBNFT2k2cOmuZzTGEk7NAdYhFw4mPQkEp2oMSxE7Y9bB6ZA
         Cxjd99+2MQ0JW8FPmffelI3sWGA9g4aDLSQHeFP69z43nyDy18aZTGOI1oaFfdHd8nj0
         qDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a465xb2KbYFoqoIEJGWa82/Xx7nYSzF3Ap4I6nfNorw=;
        b=fiH6l3klGSKW4W9esEln173UfZXC+YeaG0Ocmiz52SnTn14tse4Xz5Pfaw2/1Nm0iW
         GhyLtMETPQ4CGElFHrQXIvnrjcMsCzUIfzFMV9QW8x1VbPdPR+APEOCTcJLtQmpCgmPH
         qbwWlJjjCNMfnq+ybJ+QV/BpZU/wYmDZCUEi+OvvcX34CERnmLla/f8iF2tRlpMg/zJd
         hJQi6huf7HC5kJ7AC/8hUOso0hQP8Jvd2jPpAgYj27JWdelUp5O/tMF/eirhI46I9es7
         6Y6+5gyaq+r6z0b1JNrloKpFq+u2QG0tHNOoC97OGsnMfN+Ax/Dlkwrlb8TM6T7QC3WP
         TI4Q==
X-Gm-Message-State: AOAM5325+LRnY3WIuceouBpOQ4WyEaSEv+cr77AFdCC9JTJlNvHW6pLH
        QPRw1Gr2wGXXLiKYQau6cj+XVsOkoZByHg==
X-Google-Smtp-Source: ABdhPJw7yyFuGbWdHZbgWvHnldJkybA9f6YNr6Dwq3DSA8V0ZVZFVIGMuxU0v77NSMHUz3ISUNWwTQ==
X-Received: by 2002:a17:90a:9b08:b0:1bc:9b4f:8dff with SMTP id f8-20020a17090a9b0800b001bc9b4f8dffmr5555053pjp.159.1645671522938;
        Wed, 23 Feb 2022 18:58:42 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id p16sm775855pgj.79.2022.02.23.18.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 18:58:42 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 1/5] docs/zh_CN: Refactoring the admin-guide directory index
Date:   Thu, 24 Feb 2022 10:55:23 +0800
Message-Id: <b263239138d198cfc59001a21d6510ad5dacea58.1645670438.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645670438.git.siyanteng@loongson.cn>
References: <cover.1645670438.git.siyanteng@loongson.cn>
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

