Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC6DC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 16 Feb 2022 09:38:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbiBPJiP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Feb 2022 04:38:15 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:59354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiBPJiO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Feb 2022 04:38:14 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203C46565
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 01:38:03 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 139so1676642pge.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 01:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tss9kEnJh1WYXHcF9AWY5KIcaEfJBExXYbDufiv/zg8=;
        b=ZFh4gN5YRgZE/UCj1VPtrh8sgYn4HfJHSjdFQRy1hAtCr2FhHzcrdpCVpmhwNl4AW5
         AiKDIiHz/Q6HeljNHmD7yodIC9m1mZM2EfRbwtzy20z9jIZ4JI0BtOdED08ukuj5wLLM
         Xk/IlVWnhanDzE1Mlu6takt7Ahwjh9Y5fRLe//7ihS+NYf5WlrZJbCKbFn4ANs0hetMw
         7cSXq78NlU9IDCelz1/v33eYCRpPKeJFmMW12l3PmqHfDgkpRWOb6MjwhuRVRmo9fKAi
         A8zILaNBtlCXR/r2p0v2JkYUtO2KA8fyKFEfRAExwFiNZaZ7tOMJuHJXQUoRtVR9quUp
         hpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tss9kEnJh1WYXHcF9AWY5KIcaEfJBExXYbDufiv/zg8=;
        b=v/Y7DihmT86BjNoLyyOGosCkca1M/UTI96X2OG1MbcGkxvIQBIxlKG+o0yKlLVKlrH
         LbRXSCT2GaGov60PLCGDykpRn0i/cjZkSF66Aim+cfHVGtmc6qugqSL10uYK96DbsedN
         q+avEM8XW6zTEW9fh7pqlDf/bR8JjfD39H0FQN2LdUYxTD1/Tjiuaz1LGCFZwHz3jTI/
         CmTGTGyefSJGQHuIj+mq0ByuUUexJNaLAxY00x4XbSe7fLchTtnzf1OXPbrx1JrpAADZ
         9/NMZwfx/4188edDo0ysKk+fkSRJORoN5SXMO6EULorMHPHoVsEXoCXhcqbgCpViXaTn
         s2Rg==
X-Gm-Message-State: AOAM533yZcfIm7r5lYvpcrGHBcAxhSF/srIy1Zu+WXeyjfZRcw8RKHyG
        7ke2Tk0v2mfVEcYxjL4qiOs=
X-Google-Smtp-Source: ABdhPJz1ifrS6yk95esgfdmArMZDg5cIJ3Jg4/xTQTv+qJiXorEzspJc7C5VTF5Wpj+L1orT/YCLRg==
X-Received: by 2002:a63:f912:0:b0:372:bac6:b92d with SMTP id h18-20020a63f912000000b00372bac6b92dmr1523424pgi.265.1645004282609;
        Wed, 16 Feb 2022 01:38:02 -0800 (PST)
Received: from localhost.localdomain ([211.109.233.153])
        by smtp.gmail.com with ESMTPSA id 11sm19251289pja.36.2022.02.16.01.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 01:38:02 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 1/5] docs/zh_CN: Refactoring the admin-guide directory index
Date:   Wed, 16 Feb 2022 17:34:42 +0800
Message-Id: <f8b5b077721b22eef6437255010d2020a40bde65.1645003763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645003763.git.siyanteng@loongson.cn>
References: <cover.1645003763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Todolist in the html document looks a mess, now give it a nice looking format.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

