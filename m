Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AD5C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 29 Nov 2021 03:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343860AbhK2DIH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Nov 2021 22:08:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbhK2DGH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Nov 2021 22:06:07 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA1BC061757
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 19:01:09 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id b11so10958223pld.12
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 19:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EDysAnYE8F1w+t1wi6FDqby5P27CvW3DQkkIqEEoZmY=;
        b=YPkP6LskahLlCgx/cP6YWfBYFXEv4aIekmnE4Ti3suXfsyqboNfVFXIdNpb1rZ76ED
         i1sWn5oEQldnuI1gUpZidoyH2mT8UHV+ul+RWBUdk95P6kD5NhczFjYbjthRLH+c8yLR
         +vADjO1gxt5+D0rznCaBzGP+nowlb3zhD3QQtZQt74TVxyqXqqHAc18B9uKYCq+jX5LI
         jYiWcI4/K2ZtD707LZODwgM0gSQ2+S+hrIozrYllrp/wTODbuObb/szx4dMptR9D566D
         LrpyxOzGayBBy4+h+xm+4VAYF4IGRRbK1Hu7TqPZ1OrSSO0fNhzI/ubOYIEOFPgzXtGm
         WjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EDysAnYE8F1w+t1wi6FDqby5P27CvW3DQkkIqEEoZmY=;
        b=S2xiENfGRIAhNH72gXGf4IZQo+2fbVPGGfbhbWVW2ZM1vdzvjSO/R4RB2oxlNjS9uz
         voHnWoa2c/CMasHdsW+DLpn6frSN2e8nRuPqSMbqEIsI4vyP1wnCslgi+LFdGIK1kZKS
         IOfzrotHS1Romd04+Sjexn0WX2AMhObEu5vkuH++3V+vbaF0FkihK6wX8Jl5xMX4mgHY
         oju7iwtJEMAZrcuNA1e4PcTssQWNP32dIwy+ZT1qqSGTcQMmAOul+wp2O9b4HddPtU4O
         0PcsiAD5Fvl8teze3P8d3s20bmmVDRBp5Rs/JErFjos7zjqYZgAvTZSyFvUxLAeoEyqK
         +cTA==
X-Gm-Message-State: AOAM533j3u2ZUN7uHQNgqFW/dZa3PTuy6PTPqHXa4VoUsBp0nA+rtgDx
        VQA8XhMiciDoI8iW6NNKEek=
X-Google-Smtp-Source: ABdhPJyqLlLuxOo8aAevR1OpUc4tV69OMhL+nBvWNeIDtInlybMyloMd/eKBLj8KCwvqyRb9yMbaEQ==
X-Received: by 2002:a17:90a:c58d:: with SMTP id l13mr35203332pjt.189.1638154869310;
        Sun, 28 Nov 2021 19:01:09 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.90])
        by smtp.gmail.com with ESMTPSA id k1sm15513284pfu.31.2021.11.28.19.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 19:01:09 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 1/2] docs/zh_CN: add scheduler index translation
Date:   Mon, 29 Nov 2021 10:59:51 +0800
Message-Id: <8825a5b91f881bbb3223bb82ca6ccda8376b8913.1638154307.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638154307.git.siyanteng@loongson.cn>
References: <cover.1638154307.git.siyanteng@loongson.cn>
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

