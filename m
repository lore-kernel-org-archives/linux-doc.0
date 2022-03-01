Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66578C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  1 Mar 2022 04:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiCAEWh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Feb 2022 23:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231700AbiCAEWf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Feb 2022 23:22:35 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928B7344DF
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 20:21:55 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id z15so13040873pfe.7
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 20:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=chFpUbLJK4UDL4k3YZyctBx/OcM/ZBu9HSVoZ6DNpzc=;
        b=D3ionMrThHB4qM4KYh9Fz/oIg+QrhbOUcyl8YTHhu6fq27frZ+qRTwTtIFpp6eaqtK
         KURac37q3215LJPURtBRy1w1e2eaA3OlyaCeYO9ZgCoHt11aY1acjLecSCrZuaAbiBgY
         smw7L8Ov/E37SyiVc1zVWDjpGNWeI2Ij3eYbZlynF21RZQhDjghg1XSUKGC7kf6n1SgX
         cfYF2kzbhQ45pPTwQ8UFD9H1i07lMISJnjUSNsXzw59i+rPJo00Ulq3RoLRFOWQxj/gT
         qobvscVql+y7JbZyr8gW4fNfNLQZhMgI9hy9j4ZSM0vRyvJKrbi0rC1ievgRgYhNBlsU
         tCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=chFpUbLJK4UDL4k3YZyctBx/OcM/ZBu9HSVoZ6DNpzc=;
        b=j9ZsQP72YeBNS514ytcOoTwm8Vr+ABj1xqP+ZxCH0K6B46pbpzRPRDQ2ocH8wUZ/ku
         FFaVnsIfDwjgjfkBqwxOdVRIVRJDjYjzgDK/s5+Wm+mTCmkq7dqGhdU8yuhrhaUfMMzQ
         SQhaDYJPpEK8SpQOvXaw4Kr6M1FU+jkoN/Io2m6RBw5UtOP6Fx5dBtfsXKMelSXbQyiw
         e2iGpJiBX982Xm5wV8ZUHlXfvs1JHF0/9mldcn1jG+2yvAwFoMHQT02q8RQeDJB/7wXa
         hUzak/WRObh7cyC+8q86yYUB+GOni/7QW0YyzN/YuExLj0iisVWmzF/+n5trzlU1UUqM
         diCg==
X-Gm-Message-State: AOAM533LR5wFNueJ5RUqqKDJJxWDD7ARNYjyo71AO9sSi7fsAtXWyx1N
        VrqjbOMyNTH7q8WC8Ih04yM=
X-Google-Smtp-Source: ABdhPJwHVC1xVATwuJPnEJcuPZ/gYoqhswLADesILkio3yw3wHH3d1v56b3R7yUOFZim0M3bqHWNqg==
X-Received: by 2002:a05:6a00:7c6:b0:4e1:799:7a2 with SMTP id n6-20020a056a0007c600b004e1079907a2mr25064981pfu.25.1646108515020;
        Mon, 28 Feb 2022 20:21:55 -0800 (PST)
Received: from localhost.localdomain (111-250-8-126.dynamic-ip.hinet.net. [111.250.8.126])
        by smtp.gmail.com with ESMTPSA id t41-20020a056a0013a900b004e167af0c0dsm15937178pfg.89.2022.02.28.20.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:21:54 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 3/3] docs/zh_CN: add peci subsystem translation
Date:   Tue,  1 Mar 2022 12:18:26 +0800
Message-Id: <00577790cb16375e0016513e03d06b671006a3da.1646108017.git.siyanteng@loongson.cn>
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

Translate .../peci/peci.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/peci/index.rst         |  4 +-
 .../translations/zh_CN/peci/peci.rst          | 54 +++++++++++++++++++
 2 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/peci/peci.rst

diff --git a/Documentation/translations/zh_CN/peci/index.rst b/Documentation/translations/zh_CN/peci/index.rst
index c536dbe1e1a8..4f6694c828fa 100644
--- a/Documentation/translations/zh_CN/peci/index.rst
+++ b/Documentation/translations/zh_CN/peci/index.rst
@@ -15,8 +15,8 @@ Linux PECI 子系统
 
 .. toctree::
 
-TODOList
-*   peci
+
+   peci
 
 .. only::  subproject and html
 
diff --git a/Documentation/translations/zh_CN/peci/peci.rst b/Documentation/translations/zh_CN/peci/peci.rst
new file mode 100644
index 000000000000..a3b4f99b994c
--- /dev/null
+++ b/Documentation/translations/zh_CN/peci/peci.rst
@@ -0,0 +1,54 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/peci/peci.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+====
+概述
+====
+
+平台环境控制接口（PECI）是英特尔处理器和管理控制器（如底板管理控制器，BMC）
+之间的一个通信接口。PECI提供的服务允许管理控制器通过访问各种寄存器来配置、监
+控和调试平台。它定义了一个专门的命令协议，管理控制器作为PECI的发起者，处理器
+作为PECI的响应者。PECI可以用于基于单处理器和多处理器的系统中。
+
+注意：英特尔PECI规范没有作为专门的文件发布，而是作为英特尔CPU的外部设计规范
+（EDS）的一部分。外部设计规范通常是不公开的。
+
+PECI 线
+---------
+
+PECI线接口使用单线进行自锁和数据传输。它不需要任何额外的控制线--物理层是一个
+自锁的单线总线信号，每一个比特都从接近零伏的空闲状态开始驱动、上升边缘。驱动高
+电平信号的持续时间可以确定位值是逻辑 “0” 还是逻辑 “1”。PECI线还包括与每个信
+息建立的可变数据速率。
+
+对于PECI线，每个处理器包将在一个定义的范围内利用唯一的、固定的地址，该地址应
+该与处理器插座ID有固定的关系--如果其中一个处理器被移除，它不会影响其余处理器
+的地址。
+
+PECI子系统代码内嵌文档
+------------------------
+
+该API在以下内核代码中:
+
+include/linux/peci.h
+
+drivers/peci/internal.h
+
+drivers/peci/core.c
+
+drivers/peci/request.c
+
+PECI CPU 驱动 API
+-------------------
+
+该API在以下内核代码中:
+
+drivers/peci/cpu.c
-- 
2.27.0

