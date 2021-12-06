Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28309C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 07:03:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238231AbhLFHHG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 02:07:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbhLFHHG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 02:07:06 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B13C0613F8
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 23:03:38 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso10104611pji.0
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 23:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YWHx1kAwiRs+4LOU2aAk8KpsHC8ist1Kg+rH9y+ElIg=;
        b=Lo07/okIJyW5fmrMZ5/wJ4HTz3swDnerOZ7hisy9ZhPtmL0jHkvxrV+UtQDqoOcWU/
         diJTSfJ6z6AABKMjHqVJfbqgHLadZKuG8TO6D5CFBmM/J5KR+UbwzmZik8ywqnX5nlJe
         d4erHK6zUldXZ9+E/JwzQPc+0Z+4BBdNVeVwzniGFIYnX/b3MYpNV+LtMz6jGi926ej5
         6+8wzL8bmUIMxpMocgi25IBru+D6L3eeBGnZfW4vYbgpgV1bNFv5HLwQdvu2FSzGbk9D
         JgelmVqB2dcNnpVGoyKCfQn/TW3LPQlMD++cKmtwMkQZTHt3szTlcinSt+Z5WpDlM6J1
         Z+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YWHx1kAwiRs+4LOU2aAk8KpsHC8ist1Kg+rH9y+ElIg=;
        b=RhqsrUkGN6Qi/CGpwsN5FBea5ZA4dsy2cfj9cx6n6OlXQrsfDgV02JQ9gw9RXlCPhV
         ey8xHTtdxjgYqSRHGpjvOAExfwx+iwwAZlHfJ89opamT7v/hOG6Cm3ac76xwMDs+sLJ7
         C2+ekjzTUPtRmas0mx8d/Vm2qZnUXnV1l2xBgSmSUFmEzVLVkOk9aK3Tkb8cVBRviw1m
         4yM+iS623cvaFuYE/6ALJcQa2Zb49hQfEIgNGQ1GPFQ6yq6ukygbxUTXXG59JrLpMaMf
         yg6ctvOiqMO1N3V4PIuxQF07CzH5xd0ap3h/r/r7gH/ENLJF36r/dlVBqPJn5sRCHjyR
         X8Rw==
X-Gm-Message-State: AOAM532lyxxz00XOCmtP9RSh78ysMpf8XVw7YHkYco4jDGbzJ9cwwZt0
        capT61qYThY/xBsHrOCO7+8=
X-Google-Smtp-Source: ABdhPJwKUnAKZtjizFbIuAOjtxnonk6v/O7VglgRcs6ghfXr84sBRoaAym6I02dnValGwm2AYPKerQ==
X-Received: by 2002:a17:902:a40f:b0:143:d470:d66d with SMTP id p15-20020a170902a40f00b00143d470d66dmr41752692plq.52.1638774218044;
        Sun, 05 Dec 2021 23:03:38 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id 63sm11066255pfz.119.2021.12.05.23.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 23:03:37 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, tangyizhou@huawei.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v6 1/2] docs/zh_CN: add scheduler index translation
Date:   Mon,  6 Dec 2021 15:01:50 +0800
Message-Id: <e015c61f64fc0d4d3a49f0e85e925f00df433721.1638773872.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638773872.git.siyanteng@loongson.cn>
References: <cover.1638773872.git.siyanteng@loongson.cn>
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
Acked-by: Tang Yizhou <tangyizhou@huawei.com>
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

