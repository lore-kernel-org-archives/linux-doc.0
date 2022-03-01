Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BEDC433F5
	for <linux-doc@archiver.kernel.org>; Tue,  1 Mar 2022 04:21:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbiCAEW3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Feb 2022 23:22:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbiCAEW2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Feb 2022 23:22:28 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E93536B42
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 20:21:48 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id l9so12035281pls.6
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 20:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EzwAOgNIyd2P8QmtLIhQXK12/0yUth/Ff3+e7YgLoL0=;
        b=EmcBf7SWaR+C9tMZBhl61OeW5ze0d7+OIZKlxy1IzExQXv8o6KCu+9pCyTQBb9VP3V
         QYzMdbM58SqP0Qrm6fC5r/iZ1qq57kM9YZVCS8bOKYI9SGe2bITrCN8CQTt2mMI5ZipY
         VxCABwCLTr85JqsJIlEPgr8kNLEdk41mrx/UeJBUFHJa7xT1uLH5hZ2yJO/sKQH3qVYP
         M/24oTFbNXUTGwzLSpesQFcuJ2i/ICLDib1A8uSbsqd1B8DTkD6IQbtgV1n1yijoF6kV
         UnHv7UnQTEoHPcr6ei9+oHdfe3LiDAoNj/ZOoT2uL6540PJpi23kszI7b5ARf3gX0g2k
         yUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EzwAOgNIyd2P8QmtLIhQXK12/0yUth/Ff3+e7YgLoL0=;
        b=Y+TFe+4/rjYdSlvxuJJ/5d7+dLz/1jdmsE7pJXVQ7/G+MxQKKGS9odd0Mh6AdlJkrn
         ZL4Ju14Xf/3ITT24jrfAjnw/RvhjrHazI2QQlRT+mnCSHscnKj+OE4V0sZqvaxNxpr24
         PiwGA97VahnyRwkUywgyXNdBXjAewW1FpFYe0jJkCgHdxX+DnaGqpEYXZIW+PjMZW3m5
         WjemJCplLhPJZaoovxhuh0KT7JOsBpZ+lVcklJt4sltJlGQHpggHEGuG5YLbKCb2ob42
         +ykF9PHYTokTI9wdz9WRxpA02CNCGMHkIyRdto2O4moCz9k5Pf24QgM+ULRnz//lHZgn
         1AhQ==
X-Gm-Message-State: AOAM533ZmhEDPG8n8rsGSib9XN8FMkPJlF7yRl/qkdru5pPhypyLyqO2
        e/SiQQyBldK7fivknncYFU4=
X-Google-Smtp-Source: ABdhPJx2pVsLDmLOBG7z1z+yWxHQr6ajrkV3LxxmAZ/aq/dVhaEGYZPriNpoTMR/XNEdYPOxGYDQpQ==
X-Received: by 2002:a17:902:e984:b0:14f:e131:3476 with SMTP id f4-20020a170902e98400b0014fe1313476mr23966868plb.146.1646108508057;
        Mon, 28 Feb 2022 20:21:48 -0800 (PST)
Received: from localhost.localdomain (111-250-8-126.dynamic-ip.hinet.net. [111.250.8.126])
        by smtp.gmail.com with ESMTPSA id t41-20020a056a0013a900b004e167af0c0dsm15937178pfg.89.2022.02.28.20.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:21:47 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 1/3] docs/zh_CN: add riscv vm-layout translation
Date:   Tue,  1 Mar 2022 12:18:24 +0800
Message-Id: <b59965f7f88ea22ec824dc2e92561b018fd370d1.1646108017.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646108017.git.siyanteng@loongson.cn>
References: <cover.1646108017.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../riscv/vm-layout.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/riscv/index.rst        |  1 +
 .../translations/zh_CN/riscv/vm-layout.rst    | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/riscv/vm-layout.rst

diff --git a/Documentation/translations/zh_CN/riscv/index.rst b/Documentation/translations/zh_CN/riscv/index.rst
index bbf5d7b3777a..614cde0c0997 100644
--- a/Documentation/translations/zh_CN/riscv/index.rst
+++ b/Documentation/translations/zh_CN/riscv/index.rst
@@ -18,6 +18,7 @@ RISC-V 体系结构
     :maxdepth: 1
 
     boot-image-header
+    vm-layout
     pmu
     patch-acceptance
 
diff --git a/Documentation/translations/zh_CN/riscv/vm-layout.rst b/Documentation/translations/zh_CN/riscv/vm-layout.rst
new file mode 100644
index 000000000000..585cb89317a3
--- /dev/null
+++ b/Documentation/translations/zh_CN/riscv/vm-layout.rst
@@ -0,0 +1,67 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/riscv/vm-layout.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+============================
+RISC-V Linux上的虚拟内存布局
+============================
+
+:作者: Alexandre Ghiti <alex@ghiti.fr>
+:日期: 12 February 2021
+
+这份文件描述了RISC-V Linux内核使用的虚拟内存布局。
+
+32位 RISC-V Linux 内核
+======================
+
+RISC-V Linux Kernel SV32
+------------------------
+
+TODO
+
+64位 RISC-V Linux 内核
+======================
+
+RISC-V特权架构文档指出，64位地址 "必须使第63-48位值都等于第47位，否则将发生缺页异常。"：这将虚
+拟地址空间分成两半，中间有一个非常大的洞，下半部分是用户空间所在的地方，上半部分是RISC-V Linux
+内核所在的地方。
+
+RISC-V Linux Kernel SV39
+------------------------
+
+::
+
+  ========================================================================================================================
+      开始地址       |   偏移      |     结束地址      |  大小    | 虚拟内存区域描述
+  ========================================================================================================================
+                    |            |                  |         |
+   0000000000000000 |    0       | 0000003fffffffff |  256 GB | 用户空间虚拟内存，每个内存管理器不同
+  __________________|____________|__________________|_________|___________________________________________________________
+                    |            |                  |         |
+   0000004000000000 | +256    GB | ffffffbfffffffff | ~16M TB | ... 巨大的、几乎64位宽的直到内核映射的-256GB地方
+                    |            |                  |         |     开始偏移的非经典虚拟内存地址空洞。
+                    |            |                  |         |
+  __________________|____________|__________________|_________|___________________________________________________________
+                                                              |
+                                                              | 内核空间的虚拟内存，在所有进程之间共享:
+  ____________________________________________________________|___________________________________________________________
+                    |            |                  |         |
+   ffffffc6fee00000 | -228    GB | ffffffc6feffffff |    2 MB | fixmap
+   ffffffc6ff000000 | -228    GB | ffffffc6ffffffff |   16 MB | PCI io
+   ffffffc700000000 | -228    GB | ffffffc7ffffffff |    4 GB | vmemmap
+   ffffffc800000000 | -224    GB | ffffffd7ffffffff |   64 GB | vmalloc/ioremap space
+   ffffffd800000000 | -160    GB | fffffff6ffffffff |  124 GB | 直接映射所有物理内存
+   fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
+  __________________|____________|__________________|_________|____________________________________________________________
+                                                              |
+                                                              |
+  ____________________________________________________________|____________________________________________________________
+                    |            |                  |         |
+   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
+   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
+  __________________|____________|__________________|_________|____________________________________________________________
-- 
2.27.0

