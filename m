Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D93C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 10 Mar 2022 15:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbiCJPUk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Mar 2022 10:20:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233190AbiCJPUj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Mar 2022 10:20:39 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB3694D270
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 07:19:37 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id kx6-20020a17090b228600b001bf859159bfso8520684pjb.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 07:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e8Dbi0f40DbbR2Ay2+RJzlEwx6J7DHlfyepjeZs4og8=;
        b=qLDT10Sz2T4G3qn19qfrp3H1TTbwCCuBa+R8rYCCJsvuI02t91xO3SSbt1f+tkHgwY
         zCJ5HkeNSRoiKwGwNITDZab2AXYZFQt26AZmXxHxXGY4IFtaF7x6/4EUUHETx+YCWqoE
         s/nKoLNPBHhRz9Gd6Q+xg1pjpXLwRQgLoFYi7ynVC7zY1SlnqMfbODYxn2WByHM5XNcf
         wysUXUpxr6E4JKXuZnfcA9MHQ8VZYX9Ebxzxf4uhSRyauj/WwZaxVMZbgvhVCPaNmgrl
         WDloyIq2wavKz/P18zMvzpdK0YIAGHAw85065y2PlCrQbFOermjtu8qVOqfWDYHSAyki
         4EJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e8Dbi0f40DbbR2Ay2+RJzlEwx6J7DHlfyepjeZs4og8=;
        b=awlxQn633IV7qzPPwuPf/0gHD4ffq255ooxfHj7ebJQHW5oeGmuyX4ylfmUTHxBcaC
         hfkTW2isSMSKeDH3UZcjutmSRrJIIIuAyDvCQrxO93ox97+tIQHGMe9Pceput0cJeyOk
         WkNwB1PGTGn94+U56Q0UPGN6vN5prhrm4ln7xLHsHBTzqe/Xfo21SiwIR0h7BzgkarB+
         NpAfjHoCmw19y82oXbsYP3hIzfAGDpKQIHe87gBUkahq5ARqku4ve0G4zQ+9XDrj2saH
         /W7MyOwkaRVW9VhAllX7LsnSAaXRJDv/ToANlHjEt5ESHk/ZowObXHa7LZ8EFvfqZeqo
         3FSA==
X-Gm-Message-State: AOAM533pHjsgdc6EAKSauOiAfv1MlpI6s/NkO6Qrt4wAWrLN5+LSUdhp
        rUDoKp+pL6XiW241xVte3ps=
X-Google-Smtp-Source: ABdhPJzs4u6UQXqs9OcGj4hjjmwq2h6nXJ4E3iD4SoxsQnBUtlM0RJvrEG4TofbfOKaiuWOqWH7wkw==
X-Received: by 2002:a17:90a:77c6:b0:1bd:5ce1:1966 with SMTP id e6-20020a17090a77c600b001bd5ce11966mr5479488pjs.230.1646925577267;
        Thu, 10 Mar 2022 07:19:37 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id q11-20020a056a00084b00b004f73e6c26b8sm7474424pfk.25.2022.03.10.07.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 07:19:37 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v6 2/5] docs/zh_CN: add admin-guide damon index translation
Date:   Thu, 10 Mar 2022 23:20:49 +0800
Message-Id: <0251f09dc926972068329b87b0563dd432849497.1646899089.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646899089.git.siyanteng@loongson.cn>
References: <cover.1646899089.git.siyanteng@loongson.cn>
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

