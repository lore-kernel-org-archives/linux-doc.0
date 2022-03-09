Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F62C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 09:31:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbiCIJb5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Mar 2022 04:31:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbiCIJb5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 04:31:57 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FE116EAB6
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 01:30:59 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id g1so1757288pfv.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Mar 2022 01:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e8Dbi0f40DbbR2Ay2+RJzlEwx6J7DHlfyepjeZs4og8=;
        b=J8wShrCpqkJrMvdWw0w6hz04S1bcueSky+bkdkLXe1xr4bt1btq0aM6W8SfiAQTW8d
         JqkSXPqunh4eIrppA7mNReheAGUrS+XPNpG/qtC4JTiSVx6O8EeFdRQO4kJvrdEdxTSF
         BypwnBUPnkG+fESwYKI2wclDqs4bAiLOSKMn1dkmJhIjD6t+Mwdx5NAwN/oaJjYblKHH
         fFyarbCD4XucWFkYf15WLFBIJlhqWGKWLZEZ7ydZFHIweGnKU0PT7a32I4D+Gkr3+jBP
         S9ysF1TPyszOtzuVJGjwdReLXRMkj8wCcUPRFHPh79Cpo1XCBvKOYuOwb/CAsU71TKi5
         TPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e8Dbi0f40DbbR2Ay2+RJzlEwx6J7DHlfyepjeZs4og8=;
        b=iDmdze1fX9DTke3tA7/OcJu3bq9eUw6iNfbMUOXnZf+ZuUyChxZ4NJpO6paKdXEyXU
         FS5EapnadPxBxz14XoQ31/OAg1509hi8xDLJI0wAaZLSCtccS05JqgSgqn4MigG6tR+K
         w1OLDtuNupXA3oWViybdVJ+Knbm8zAjpZzVn0N9hsJQhyL6rVc3mvWlYoB4QD8nIXZeH
         kUUO0HQgA/TxqBC0US8Chb0Cn/27AyU2WPpTEGooDdvb3F1FziHm3Xo460wKky3cj8iI
         M0qQcDtm/lp+DIILsDclcn0oiQRNZYqaBIkvZjnn+LuAlABZVgcaHHRSrG1GOtGH3bZG
         0S6w==
X-Gm-Message-State: AOAM5305nF1Vasf6AuUG3CRFormKyLuxpNg/2v2kaoI3G6jyGWX6LKZY
        bsr8sF9fp0AWM9eBn5fsDPhjn1rD92B5FN1M
X-Google-Smtp-Source: ABdhPJyopEsOHreKxiOTOL5e8RoSDq0T4lr3nSVrSkXRRYM2BMTwZxaKiU8Afek99nV0k7a3FoHM7g==
X-Received: by 2002:a63:2022:0:b0:349:beed:bfd8 with SMTP id g34-20020a632022000000b00349beedbfd8mr17745969pgg.175.1646818258504;
        Wed, 09 Mar 2022 01:30:58 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id h21-20020a056a00231500b004e13188af99sm2173369pfh.38.2022.03.09.01.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 01:30:58 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v5 2/5] docs/zh_CN: add admin-guide damon index translation
Date:   Wed,  9 Mar 2022 17:32:07 +0800
Message-Id: <021cb1f065fff3fd8103c44c5f2d53cd97680b73.1646817889.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646817889.git.siyanteng@loongson.cn>
References: <cover.1646817889.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../admin-guide/mm/damon/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../zh_CN/admin-guide/mm/damon/index.rst      | 26 +++++++++++++++++++
 .../zh_CN/admin-guide/mm/index.rst            |  2 +-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
new file mode 100644
index 000000000000..4581e1bc2506
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
@@ -0,0 +1,26 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../../disclaimer-zh_CN.rst
+
+:Original: Documentation/admin-guide/mm/damon/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+============
+监测数据访问
+============
+
+:doc:`DAMON </vm/damon/index>` 允许轻量级的数据访问监测。使用DAMON，
+用户可以分析他们系统的内存访问模式，并优化它们。
+
+.. toctree::
+   :maxdepth: 2
+
+Todolist:
+
+*   start
+*   usage
+*   reclaim
diff --git a/Documentation/translations/zh_CN/admin-guide/mm/index.rst b/Documentation/translations/zh_CN/admin-guide/mm/index.rst
index 44f66a45859d..702271c5b683 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/index.rst
@@ -29,12 +29,12 @@ Linux内存管理有它自己的术语，如果你还不熟悉它，请考虑阅
 .. toctree::
    :maxdepth: 1
 
+   damon/index
    ksm
 
 Todolist:
 * concepts
 * cma_debugfs
-* damon/index
 * hugetlbpage
 * idle_page_tracking
 * memory-hotplug
-- 
2.27.0

