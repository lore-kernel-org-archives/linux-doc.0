Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007D9C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 19 Nov 2021 02:03:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE0E861AFB
	for <linux-doc@archiver.kernel.org>; Fri, 19 Nov 2021 02:03:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232696AbhKSCG1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Nov 2021 21:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbhKSCG1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 21:06:27 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC8EC061574
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 18:03:26 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so9830501pju.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 18:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/RT91XcsdqdmgxM1fZ7Q6+/AQdwONpvBWr9QnvXx0ts=;
        b=UKjMQRtupkr5isyxMrq9VgIRb+1W3j4aF8rwnbCfKG1ZoRDYNA/V5bPzW7ZqN3UN1O
         Rg5qMZcQ0gptOl5jedR2R7w49bckh1mONLUXV1Cen+N+ZVH33tZXR6xdtVQRd+r4H4Sm
         yIfr74SD/AC7x6+qzzN4FhMFktiNlvuHGJQotBz2OvQK+s818B/eO+g794tRUq5kaNQf
         IMOVsWlhYU64w77RmdK0EcN2pTyk8jmjBUiR7Mi7AVBoWkObdbUvbvqF8PtQ/sdfpQTH
         yQHEVAyX+YP6g+cKQyDFmzyI53A+Wc9GUVtK/H/V2kKjvPm7lycD3NodrcBtKxcS1qJq
         vYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/RT91XcsdqdmgxM1fZ7Q6+/AQdwONpvBWr9QnvXx0ts=;
        b=k72T8xkUaDMWwVSCIFHEGnb5dJQ/P8uqzdN6z7TmSU1Xu0sfk+xIqeQdFofO6Y/o/N
         We1YIZ5zeq4LT147u3l5DeX9LEoPqd6tkON/jyr7N5Nku2sA7AUA0MAJLAbYJWGBcbR6
         +1Lh6vVXYrd19snNydnj4XALZT3bHzVoiGjNCajK9nmBIalcDVaKhcUfO/elC4LUJFud
         LP3BlsYsCjYJMIAplMUFq0ErgTbYzypSB1zJNeRfyXsGmpFNOj20i22BUa13uF1j+hhx
         C0hu3LdIoBFE/6+VW2jDbfOr1UqQ/TI+/uvvS2NhgxGNAlJ9uzXIw/wf+076Go2m9FH0
         /Lmg==
X-Gm-Message-State: AOAM533e1xYRWI+jF9AhzcvjDUDFimLDECmlnMMVO2J5l8/W+SZvTOWv
        7xe2CcDQui1twUnMELsjdVM=
X-Google-Smtp-Source: ABdhPJxLv2QSxnIgDzPsQNdFPyBHbQcOa1IlP0vrdR7Jootw+DO1NcttH/oifh55srVKqVOxjTqmZg==
X-Received: by 2002:a17:902:dad2:b0:141:fbea:178d with SMTP id q18-20020a170902dad200b00141fbea178dmr71685653plx.78.1637287405742;
        Thu, 18 Nov 2021 18:03:25 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id na13sm743965pjb.11.2021.11.18.18.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 18:03:25 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 1/2] docs/zh_CN: add scheduler index translation
Date:   Fri, 19 Nov 2021 10:02:21 +0800
Message-Id: <c478c55cfc90f620c8549872436be643949c5e27.1637287018.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1637287018.git.siyanteng@loongson.cn>
References: <cover.1637287018.git.siyanteng@loongson.cn>
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

