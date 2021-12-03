Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802E1C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Dec 2021 08:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351078AbhLCIHf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Dec 2021 03:07:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbhLCIHf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Dec 2021 03:07:35 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B828C06173E
        for <linux-doc@vger.kernel.org>; Fri,  3 Dec 2021 00:04:11 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id x5so2192707pfr.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Dec 2021 00:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9HqoU+nALmMlfjkKCmqxiKp0jlmMuqCod1V6eEfdX+Q=;
        b=PhMfVo3vHI4BRWGzOogwX5i+WOyrdiEOtvQ9RHQUwURHjo96H75YXrSlor27J40pk6
         chFUuYoq/1e5QDNcpDB4kmpvCstuqGsbUSckgQnD1fg7ipxv0e17k1bj+98hR1CAYi6m
         8wUhxwCDfcrmhcv5gm6YZAGfE5KTTiqwOMqqwZqtmBdmiEY6FCyqbb3owcrIh000P269
         ei8PHsW02KiJGGfPX1tNp92B8HyqmrvXeha+OlfVnXsWh4fMlL2nvIeALlaA07RB5gE1
         oP8J3mpPS+p1l8ZPiIWQ+WyMhfWpydvZhno3NjVMkuaKj9+CZkLAfWa2lMVtNl9NPCfM
         XFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9HqoU+nALmMlfjkKCmqxiKp0jlmMuqCod1V6eEfdX+Q=;
        b=v9WjSHHpTBqkt/ht+05r/QYsOTwB6PtwLe/Ze107NI+8U/3+0PTbGuOnuWWmLLOnrL
         IA8U43fXB0lSfI6X8IkVOFDuUXgC1JvSMCZLM2VuQT3Q8IFNrTRefU7mPAMnmZxrs4fM
         dZuGtsjUWDiR7qSYuNONEMlhAx1A+Bnzr90d5U/eURqKpZ6QJvrjUQSpMgby1Hi/oaO7
         UUjuFxNggLrcpCTkEjAu5Qej/rKy6apYv8kPuh+CU2wmHQbxUlxQO4mDMN/QG653bIQt
         XvmDBi1DeDeuzwZc5OEt5sP33qWiL+sPhzfsCXzTSS9Z0r9SITqlVoaR6/AtzYbVgzq8
         xy7g==
X-Gm-Message-State: AOAM530LSjnmSgjP7n0lLWZh+Z1kZ/Cqj7WzBp4+gBqanE/t6gaM70LS
        +tGEwumoM1YdzmXL1MyI684=
X-Google-Smtp-Source: ABdhPJyRT4ZVSvzvelHjQblUrKg9PI7vi7EKyUoZj1e6I8W3vbnzVsOcMCkSybMqx6TR6T8yPl58dg==
X-Received: by 2002:a62:7541:0:b0:4a3:8a3b:6136 with SMTP id q62-20020a627541000000b004a38a3b6136mr18084531pfc.78.1638518651081;
        Fri, 03 Dec 2021 00:04:11 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id d12sm2062883pfu.91.2021.12.03.00.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 00:04:10 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com, tangyizhou@huawei.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 1/2] docs/zh_CN: add scheduler index translation
Date:   Fri,  3 Dec 2021 16:02:42 +0800
Message-Id: <64cfd587d94f7c108323550a40cac869d8754b15.1638515812.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638515812.git.siyanteng@loongson.cn>
References: <cover.1638515812.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../scheduler/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/scheduler/index.rst    | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)
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
@@ -0,0 +1,42 @@
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

