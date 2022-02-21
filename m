Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61820C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 21 Feb 2022 10:49:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355383AbiBUKtw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Feb 2022 05:49:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355382AbiBUKtU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Feb 2022 05:49:20 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E51756E8E8
        for <linux-doc@vger.kernel.org>; Mon, 21 Feb 2022 02:10:44 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id z16so8384206pfh.3
        for <linux-doc@vger.kernel.org>; Mon, 21 Feb 2022 02:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a465xb2KbYFoqoIEJGWa82/Xx7nYSzF3Ap4I6nfNorw=;
        b=n5l36YACQKFa9SInTEIqRvJvF5REt1HlEgehLYzZOiS3c+oiTiHKBj6sBeVL4s5kVJ
         140szPKfLtu9dpuwu3OaVNM8CVysyw2SmzB9C0vMun4N0YK4eLop7TykW+dtRsaOYP+U
         d0GIpN7PVAF4FJMweLwoGAS0zVh1RM8wx463uHzvBYPQIY+cYQtEy4ipFO8HzbCmCfV0
         rvam0/g6RvQqG0kk8w5LrpbxzUDJwMbZF5vV+2PCx7NmeAwc2Wc/t8YYBkcBZO4D+9P0
         8tR4q+enG/y9624QR9uJ4ju/Ljjx9cQn+ULBVEpgc8sCSV6Y2VZ9mWHa9kLPxLK1cqHj
         3AJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a465xb2KbYFoqoIEJGWa82/Xx7nYSzF3Ap4I6nfNorw=;
        b=o/hkLX/Zv34KNl0yE2AH3OV/9tDm0e6rBOmpCBtR0T76/iG7Qdl+iNe1cKkqNEfG5y
         WgJPBkvDlRbDEhQmW1ia8myXZiUUo7l/WLgXjFCN0uRzN22yUQAnQpAkcmRVtvRBLCH0
         +VAXzkKlx1GM+spwJsjSbXyO2Wl1+DkPPgsbfOLzTu+Z9YrSJlV6lhynEOMBBAyva/Bb
         ZrQUhv0dE/yxT2X3sWScKGjCirJvCy9865ByKzQ8IHKIa+2b+PXpZC/7w/Qnh7g9zU9K
         yzqaEUR1kKA2pZ/aK+rTSYHoHuQOOxbwEkKeECxbfm2MCOYxhecMWBG1MBqQnorxoAXV
         KAtQ==
X-Gm-Message-State: AOAM530otK0kufJJPx84xOvXwamlEZYmuzSWE3F/Vt38fR+Y6RD9SJUR
        2gaomygTZBo2plHVV2jq5c0=
X-Google-Smtp-Source: ABdhPJwSM5wMs5leXLr7qatliCrm29BCFlBVN7cpfofMliu+BFRtHtrUeR6MGxc+qzaaFkf5vIDKuQ==
X-Received: by 2002:a63:1e48:0:b0:373:9ac7:ff1e with SMTP id p8-20020a631e48000000b003739ac7ff1emr15422534pgm.45.1645438244323;
        Mon, 21 Feb 2022 02:10:44 -0800 (PST)
Received: from localhost.localdomain (pcd454219.netvigator.com. [203.218.244.219])
        by smtp.gmail.com with ESMTPSA id x2sm2472938pje.24.2022.02.21.02.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 02:10:44 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 1/5] docs/zh_CN: Refactoring the admin-guide directory index
Date:   Mon, 21 Feb 2022 18:06:23 +0800
Message-Id: <329def17b6a6ac8bbde89e854098f9caf09f83b5.1645437621.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645437621.git.siyanteng@loongson.cn>
References: <cover.1645437621.git.siyanteng@loongson.cn>
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

