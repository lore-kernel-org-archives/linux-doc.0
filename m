Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FF0C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 12:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbiBXMTB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Feb 2022 07:19:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbiBXMTA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Feb 2022 07:19:00 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1575B91C1
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 04:18:29 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id ge19-20020a17090b0e1300b001bcca16e2e7so1115218pjb.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 04:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kmh3p28u0Uf0MgS82WI3VT7M87+ciaa7og5+qdk79k4=;
        b=oWgNhiUCEikY2LntI3w9XryCWcpEJjnvZKBP0yedgDah7p8l01Ez9pvZ6uOZBQyjQF
         NXETOvQjweBNnFOOCBDCQCnhFw+yf5cc6eIKZhjiNz2CBwg59xwKGRSH9SGNtkyp3ECr
         F6MLw0alSRXdRQ47ZpzVNP2nLFmdIgaxJCHnz+UaG29LWvVj3UE6xxka0XJBY6hgchkB
         O1N/rBlAUWnEENZ/KZGbXoL9k6gD9cL9uy1Di4CyEw3bxujW7x3aUitA/8oXdOOVqBsG
         s94XWRN5scY59l4Y+53noKl943d79wn9IZ0YKBgKVIstyXNpAcpzlzke+tMbIm/yyJQw
         iIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kmh3p28u0Uf0MgS82WI3VT7M87+ciaa7og5+qdk79k4=;
        b=ADHoxTTEidgrpBcm0nAu2hdyboZYQxq4GFPAB2skdBFy1I42sJbkGP0cXwGyL7NvJD
         PF5lE0AU+sLB6aids/LHr9upRBzUKM+YBI0xt6YSJnutwhcXxYZOGkqXUS4WJ76qQwWM
         diKTQ3S3Qqq7pB3ol/21WHZ5TI1Tjdv0V0UHUmfXnHkDBuJOvbjYlc3rDdf8bzRQOG88
         aPWlwxLDdyM/51pd6U5/0ObNBREmq2a9dBRIeY0lKGtgamq9vST1WQKIL/bc4htHAY7R
         aacHqoiyiEQfcYXDeU9TmSnYxbxKh0ek5PD8uctIYllAaZoMBUwBInn5/9Ls9oS4SEEM
         6OOQ==
X-Gm-Message-State: AOAM532frh90Mxa8W95qU/yztUCA3Ef9BFfwbjVaLgUtprG0QiUz2+Cr
        dD9kqCQu3iqJHp/uexDEEtw=
X-Google-Smtp-Source: ABdhPJxn/4mL4zmBsrw6zvziFmpEVZp9IlqOeqpm8WD614o33TjHnKzYqQ4JrfcKquvk7X9d2OkrSg==
X-Received: by 2002:a17:902:8d8b:b0:14f:795a:977a with SMTP id v11-20020a1709028d8b00b0014f795a977amr2570874plo.104.1645705109427;
        Thu, 24 Feb 2022 04:18:29 -0800 (PST)
Received: from localhost.localdomain (pcd454219.netvigator.com. [203.218.244.219])
        by smtp.gmail.com with ESMTPSA id e3sm2577643pgc.41.2022.02.24.04.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 04:18:29 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 1/3] docs/zh_CN: add riscv vm-layout translation
Date:   Thu, 24 Feb 2022 20:13:50 +0800
Message-Id: <9b9e348d275a3745c070790949630789106172db.1645704571.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645704571.git.siyanteng@loongson.cn>
References: <cover.1645704571.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../riscv/vm-layout.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

