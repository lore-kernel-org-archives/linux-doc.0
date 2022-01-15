Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8286C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 15 Jan 2022 07:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiAOHRg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 Jan 2022 02:17:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbiAOHRf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 Jan 2022 02:17:35 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5738C061574
        for <linux-doc@vger.kernel.org>; Fri, 14 Jan 2022 23:17:34 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id t18so14985508plg.9
        for <linux-doc@vger.kernel.org>; Fri, 14 Jan 2022 23:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BZCy6rBAowSRUS+NmXvMQeHlKMRKqVL2yZh0dx5oc78=;
        b=iBYLBCx+k+qPoOeL+XsPt36UPZTslxPhj11/r9C5i+GCwk4s26mIjBqNDAe9NG7gSt
         s+RuQOyHBXWQRJODTT/BYKsJnV1NeULzgnN9rMaa5UditxQQ+fJTWvW9kvwHPpe79fm/
         Tf7Qv0F9Fifl/zJgn3INTYW9oLLfXeBerH6z2QEw12c2TsQTA0/443uRWcym75RYRZEE
         +cEFUZAk2zmShpIYTLFn2J4TtCW+CmDyW8+40A+Wt1FKKTMlranykVPAl/HzG64EIVHE
         UEj7oHv5MVtrnkbhZf8bU0T/NrMbXWo+iGNcmK5oGBlQ7IpZawiuO/WjmREELW7NWj/9
         5RfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BZCy6rBAowSRUS+NmXvMQeHlKMRKqVL2yZh0dx5oc78=;
        b=7FKY/nVmB9kKtYshpMr4BOvVnat844Lh+udcLCOBWgimfzMSQPUy9nr02dWvwas4dp
         faucZC0OSgqjjqn0pJbtYMDkC/E1Z8UcnbqVdxymmvbljfeeWP2bjzGTY7C83dZhSirV
         ClYRDuqKm3jSt/tDiYq612toy/m3paC/Nn2JpJcj+SuLj6Evqae/dctZ7moG07qw+a67
         FxYKVPrY+4aEPW2uaMP2dpG0BNGINj8DU1mmh2m6AhAwKvn9hx78IXU3DJ1NX78VT0Vt
         GMSD+0sLkp3xSA5mbGkq9wM/EpeYs2cd4RTtDDq4EahxRpHZj8Y2/UcwQd8NoHo80ppr
         x39Q==
X-Gm-Message-State: AOAM531mdZ+SfF6P1H7b80fAn1KqHMHQo+opMvondBz5v7gd4N4Lnrx6
        7/q+0DEVkYWZTfbIxd5xDFQ=
X-Google-Smtp-Source: ABdhPJySfZzXydOZkLsra/gVsLS5Lus8OtI+/7GB9zKi9tLMKFGcz6N0oc0ttQ1yMciJnFV8jOWAlQ==
X-Received: by 2002:a17:903:183:b0:14a:9b93:e68f with SMTP id z3-20020a170903018300b0014a9b93e68fmr2536578plg.169.1642231054341;
        Fri, 14 Jan 2022 23:17:34 -0800 (PST)
Received: from localhost.localdomain (cm218-252-25-221.hkcable.com.hk. [218.252.25.221])
        by smtp.gmail.com with ESMTPSA id u8sm7888909pfi.147.2022.01.14.23.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 23:17:34 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 4/4] docs/zh_CN: add damon api translation
Date:   Sat, 15 Jan 2022 15:15:03 +0800
Message-Id: <3d81dbc79e0f982edd68fb9dfee6f0ccb47f7710.1642230669.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1642230669.git.siyanteng@loongson.cn>
References: <cover.1642230669.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../vm/damon/api.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/vm/damon/api.rst       | 32 +++++++++++++++++++
 .../translations/zh_CN/vm/damon/index.rst     |  4 +--
 2 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/vm/damon/api.rst

diff --git a/Documentation/translations/zh_CN/vm/damon/api.rst b/Documentation/translations/zh_CN/vm/damon/api.rst
new file mode 100644
index 000000000000..21143eea4ebe
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/damon/api.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:Original: Documentation/vm/damon/api.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+=======
+API参考
+=======
+
+内核空间的程序可以使用下面的API来使用DAMON的每个功能。你所需要做的就是引用 ``damon.h`` ，
+它位于源代码树的include/linux/。
+
+结构体
+======
+
+该API在以下内核代码中:
+
+include/linux/damon.h
+
+
+函数
+====
+
+该API在以下内核代码中:
+
+mm/damon/core.c
diff --git a/Documentation/translations/zh_CN/vm/damon/index.rst b/Documentation/translations/zh_CN/vm/damon/index.rst
index 077db7e4326f..84d36d90c9b0 100644
--- a/Documentation/translations/zh_CN/vm/damon/index.rst
+++ b/Documentation/translations/zh_CN/vm/damon/index.rst
@@ -29,7 +29,5 @@ DAMON是Linux内核的一个数据访问监控框架子系统。DAMON的核心
 
    faq
    design
+   api
 
-TODOLIST:
-
-*   api
-- 
2.27.0

