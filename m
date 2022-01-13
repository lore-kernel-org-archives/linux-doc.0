Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DFDC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 13 Jan 2022 03:21:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbiAMDVf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Jan 2022 22:21:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbiAMDVe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jan 2022 22:21:34 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8057EC06173F
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 19:21:34 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id r16-20020a17090a0ad000b001b276aa3aabso16644458pje.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 19:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Icu5OMS16I5XUkGKCCogOq7i0HQI6U6DlQ3Ekigmp2g=;
        b=WcIMK/IxuCNt/OvBb5ovwJKHWeC14J6zhJ1nASQvY2EWaHqie4gIydqS1L34wKmIqP
         XU3N4ivwybBG5VCPnPSc1E1HrarYvzTib3BrzEqypPvCTxLsXCluOaVxibqwVDgiUSDl
         G3xA5vFNnYdypfatL8a6XYzc6O8v0ppuPlUStfJv695TFQQe07npm7HN2uvRpsCCcKR3
         deesWCZmi94xZlwypcGzC2u20TtkV6A+9gYhnAID/xwVMJjoWb+a/J1Weakn2iSFoRFX
         FnZuZXOgzTVDu7ZomjleuGnFnBHvcsiGsutPBxxR8MqT+OKhWLbH7m1pg2nMJ0yclQ6g
         MZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Icu5OMS16I5XUkGKCCogOq7i0HQI6U6DlQ3Ekigmp2g=;
        b=dpzIaWgCICedvGb3VjTDP0rRIoavxDPi5ee1RrE+cJAhwsziVpxqJ1+B6Jssu8r4lR
         wjHns5MKNLbHtxout/wLxLO6Z9cKf3mc3obZaVLrEA4wiHHOLTZDxbvDnInhp8qcwYKy
         xTXNPXxNwPvkHELnh9xNeYA+n1b1QowPMn3OG+n4iGpGn5qzxqYNHwCHRmMwSB1+L8NQ
         OFXKdtV3Abu0A0jeTv0ldRZ9nrCprW+cD9U0EkICd99Y9wwjWnRlQDgEFb2SkJXKWVik
         yZp0Qlo2gRHLpvrOSXCGK4cUfAv4VVQ7lMEoZ26zuo3JfUVE5vQzEIDbmRSMcSiqNz/f
         lIDg==
X-Gm-Message-State: AOAM533AZhGGLYmK/Dcl57mbF03GsG9RlMuWxlXshOm2q/c7LkbaRmKv
        FNEoowM7o1Xk4AnCOzjbg00=
X-Google-Smtp-Source: ABdhPJzaWF4Z9/+FY4//GPjKaoLSjBjNiVzG+HoGdKFFjz6NMvVEd3nsBU9fwdUCaMAyQTgCvPRvRQ==
X-Received: by 2002:a63:6ecf:: with SMTP id j198mr2292458pgc.287.1642044094101;
        Wed, 12 Jan 2022 19:21:34 -0800 (PST)
Received: from localhost.localdomain (pcd454075.netvigator.com. [203.218.244.75])
        by smtp.gmail.com with ESMTPSA id x2sm1757573pjq.40.2022.01.12.19.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 19:21:33 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 4/4] docs/zh_CN: add damon api translation
Date:   Thu, 13 Jan 2022 11:18:04 +0800
Message-Id: <b30a06d42ed8f528f77be343d300c472f49536d1.1642043630.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1642043630.git.siyanteng@loongson.cn>
References: <cover.1642043630.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/damon/api.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

