Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74B4C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 26 Nov 2021 02:25:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343959AbhKZC2n (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Nov 2021 21:28:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343590AbhKZC0n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Nov 2021 21:26:43 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D37FDC0613FF
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 18:21:49 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id m24so5691746pls.10
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 18:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/RT91XcsdqdmgxM1fZ7Q6+/AQdwONpvBWr9QnvXx0ts=;
        b=Noc0d/hkuqXQ3bO/97gOM3Nk/WICzpyHD5VJ0FhEstSE4CQeAoWy8z6jj01sz4HxbI
         0DeYZCj67x83Z0p8VnAzBrOC7kDmoqpC2+4MnYVen/RvPHdOOYuJauvGprzzprYE3iVd
         dnEr1JthhshFVLqCFuS+m53FxJwPwFGFoug9MpZsZ8PLc2Ll2Sq8k+cBOopUBWvsBVFe
         jBRqYiX9PXaD/4e38cfPS2Z1s+rDWUk6fJSYBf/Sg4IrHGYXnk+zgBtZde/zR2aBVRJY
         lUb71ZCwTApEyQktlgcD5NKeTrosBcxJuCWJcia+G8gMMgYlq/vZzs0P8ElETIuAMRPi
         ApJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/RT91XcsdqdmgxM1fZ7Q6+/AQdwONpvBWr9QnvXx0ts=;
        b=g5cZbW3qgZU6ha5wNvKu1VcrzK7x7WARntAjU1TPadbVrKV4+Ofb6CsGF3kUH6c2Yw
         JNbECxvfMDv+WxLy4lUct/jjpe3XuqMB8xtuSQS3b5mc8dPddFkGRBjwGd/PxgpOyaRS
         UkWOx6TAFlb6kYtYSu2pPgn/an9t4+1DP38Q7X8wXvdAj/6VNZ2zEF19hsy1l3yhRVd+
         2oq2Bf9hrjIe63ELRmmR/NekoIIDST1Lx4W4Z6sr5PEIQ1iE8mkX7AWdm2KjzFlQ4UcD
         4yjy81C0YwEppVxK3OtJCzuYNh4rYlWb3mmKQcteErVNRgZQlF09LhjWsBD0Ru/6fGH1
         t5ew==
X-Gm-Message-State: AOAM532+5d+/MzNtpx6TISw46fnAnGlUn+rMflJUAisySQfRosxN+8We
        g+VCoPz21Crl/vvXs2TweE0=
X-Google-Smtp-Source: ABdhPJzovp16TrtAYzTQzTMb9Y31FlgqTAPxvluHSMnJed/oGE8Rl/D6vbsyz3OQWLfDHoX0ttFZSg==
X-Received: by 2002:a17:90b:1c07:: with SMTP id oc7mr12107993pjb.127.1637893309419;
        Thu, 25 Nov 2021 18:21:49 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.90])
        by smtp.gmail.com with ESMTPSA id a10sm3422379pgw.25.2021.11.25.18.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 18:21:49 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 1/2] docs/zh_CN: add scheduler index translation
Date:   Fri, 26 Nov 2021 10:20:35 +0800
Message-Id: <ccaaafaac7678e80b446504152312e1f08514681.1637892363.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1637892363.git.siyanteng@loongson.cn>
References: <cover.1637892363.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../scheduler/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/scheduler/index.rst    | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/index.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index a34e58733ac8..aebe336ab538 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -106,6 +106,7 @@ TODOList:
    virt/index
    infiniband/index
    accounting/index
+   scheduler/index
 
 TODOList:
 
@@ -140,7 +141,6 @@ TODOList:
 * PCI/index
 * scsi/index
 * misc-devices/index
-* scheduler/index
 * mhi/index
 
 体系结构无关文档
diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
new file mode 100644
index 000000000000..4fde5c2a9db3
--- /dev/null
+++ b/Documentation/translations/zh_CN/scheduler/index.rst
@@ -0,0 +1,44 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scheduler/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. _cn_scheduler_index.rst:
+
+===============
+Linux调度器
+===============
+
+.. toctree::
+    :maxdepth: 1
+
+
+TODOList:
+
+    completion
+    sched-arch
+    sched-bwc
+    sched-deadline
+    sched-design-CFS
+    sched-domains
+    sched-capacity
+    sched-energy
+    sched-nice-design
+    sched-rt-group
+    sched-stats
+
+    text_files
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.27.0

