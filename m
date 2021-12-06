Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A38C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 08:13:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238969AbhLFIQg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 03:16:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238917AbhLFIQg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 03:16:36 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A314EC0613F8
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 00:13:07 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id j5-20020a17090a318500b001a6c749e697so8835756pjb.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 00:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FmqeKaTfeqbTyzJQ9JV/nZjmvAIa1nUWAnm4wYjDwSY=;
        b=SfsLVauWM8+rk+LxY22vhDLnWzGhe2v1DQMuX16ruVdS+e2DOBwWWe/gur1qE2cmYz
         0X7pVi5W+HesUW0vxpDkiDEQjpZQuO362OU8EoyIfKkJoOOTeWR/pbgjrZqWCPfiBZ52
         0WhFgWUaqxtVJWRYbZdccrXZi8T8Z8FF0AwvEnWq9tuEuEMVNy4X3IeRgRfi2gL41+uD
         uNDb7MXTiu5MqfXsoj3ASYI4IfrYwuWNHVi7PFF/7+2MQbwXwix48zAlvSxww4h1qHLz
         JBUTmLxp7h0CbFR9a9Uw4ktMiBMwwFjW+uuq9N9jHbagOr9BidZvChPjoFOGCQlrCZo2
         +I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FmqeKaTfeqbTyzJQ9JV/nZjmvAIa1nUWAnm4wYjDwSY=;
        b=KOoU7bXKPboKPBALBvlalP7+eTntrVdVdRn+ROpgbK5TCVSxdgbElCwwNa9NdGkM4C
         2dv8DBPS2Jueq1KHvBMEb3vU330IvD6NoKiVbZbV1IOsg0YKJVFUSwNQPi3wIu84QXA6
         OlaiGAOOxq7v3JEWYYOent/8OyUuxcSf/rurLhf6cv3vaJrwGdeZ7YBZ0yezSV9FEhVu
         +2SIPUf+Jx9jJBu3A/UiTmzreUxj5ubp7WSu1q2+ERevLk2GwY+NOcQbn8fDtVXGxOlX
         /qf59Rr5Jb3pdZZUSKfBqXqZkXmCBtUPrRmJjWJAigd0whZBeGngFRoa9QV5LxN3Jf4p
         OhBg==
X-Gm-Message-State: AOAM531HxdspiJBwzBaUaVnpB3BpZ35CKxkl5lwAxmYAaXfS6aZ90ZYa
        WmBytSlOdZfVoYmYerW/+/W5I4J0ih/wFLSK
X-Google-Smtp-Source: ABdhPJztXK3ZkO71A9fqO20+EDiDVNbrv5Xl+lxLdEupVqGzV167omxnuXpXzWTmY5aBss8jJbLTMg==
X-Received: by 2002:a17:903:185:b0:141:f5f3:dae with SMTP id z5-20020a170903018500b00141f5f30daemr42416827plg.56.1638778387249;
        Mon, 06 Dec 2021 00:13:07 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id r8sm9151652pgp.30.2021.12.06.00.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 00:13:06 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, tangyizhou@huawei.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v7 1/2] docs/zh_CN: add scheduler index translation
Date:   Mon,  6 Dec 2021 16:10:49 +0800
Message-Id: <e015c61f64fc0d4d3a49f0e85e925f00df433721.1638777809.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638777809.git.siyanteng@loongson.cn>
References: <cover.1638777809.git.siyanteng@loongson.cn>
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
index 000000000000..9b0c8cb11c87
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

