Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EE5C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 12:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbiBXMTP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Feb 2022 07:19:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbiBXMTP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Feb 2022 07:19:15 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977F4B91CC
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 04:18:45 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id w2so1682892pfu.11
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 04:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C6l8xXsVOx4Mha2cKoQ3wVDY6K1dVq9veCFvSp1zWGA=;
        b=NdbqUu1exq1Ge4xEeERQOMPcHhZTrbIocjrzw4cvEPSnIwf3cmqeDivVpYBQKaq+Wu
         5EcYvldeJ5fBj0FrI076AbGTeOsn+QGWr2SKU+iJ9LZfidNMSPoQfIuwO0GrHT9baO62
         JW7QV/ppG/SLBGkNMb9jfVSJrZtNCwdkfyD2Bx8UBAFTpuGeOh1yr0yKgQ09o8Ef/iCS
         fPTLf9ZafOsLuHckhPASq9TAKWpjx4y7ekfp4KBkvBOvHrnCQnlkt6YDNn0VUe1b0k59
         t2kdMccT4KL7mq4tb51MShs0LTT/A3a9/yNKhF6zUTL/1FlHIZgiO14s/8w3wp7RFvzH
         hR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C6l8xXsVOx4Mha2cKoQ3wVDY6K1dVq9veCFvSp1zWGA=;
        b=tv65rG6b40xUl+OOmOISiTXIrxyWiwOeTbOjBmb3fIudVEoxrdo7/OeCEwlAIhnG7J
         93LRWOb+TSe01igZfHLxMu7cJEDsmpTcUwTaAvFuTD2zPPiMNFa5IjZ0HrWPgzoZLyaM
         nXZaby3X5vu9AZDTVZVzetp2vxOoh77GdeeEEV8itTs4QwMsQjnXtvgKwJFNgLy6++zO
         YpOY3XOuTXnaDxxpcxNkLmhQ+K0MueyMqFAOZIHRd2zFuLxJS2JpUrLkKPrUPDK4JvqP
         1tXQ07zzd4H+QZVhH78zYDdtyXBoQ/7u1yNdtisWKRWrt3YSDhBGpOKVz47BRactssIw
         TfRw==
X-Gm-Message-State: AOAM530A2AReCU/b22SqjO3dc9dFgx2ySQxfioDiAs2lmiMDBHKVQB2/
        dx6RVHzJZTwowEBBWqgkiCs2Tgu0VTYwkyw9
X-Google-Smtp-Source: ABdhPJz87O09HdptxDsyxYfkEazKIa7gWUt9LkfMFqNtiq9+/CnkfQAwcPLs8kSrpsXj3TXL9KpKfg==
X-Received: by 2002:a65:5548:0:b0:375:9f78:62ae with SMTP id t8-20020a655548000000b003759f7862aemr481891pgr.390.1645705124860;
        Thu, 24 Feb 2022 04:18:44 -0800 (PST)
Received: from localhost.localdomain (pcd454219.netvigator.com. [203.218.244.219])
        by smtp.gmail.com with ESMTPSA id e3sm2577643pgc.41.2022.02.24.04.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 04:18:44 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 3/3] docs/zh_CN: add peci subsystem translation
Date:   Thu, 24 Feb 2022 20:13:52 +0800
Message-Id: <884f4a6c76b61ab11488358d0c31f727d4d1eb26.1645704571.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645704571.git.siyanteng@loongson.cn>
References: <cover.1645704571.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../peci/peci.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

