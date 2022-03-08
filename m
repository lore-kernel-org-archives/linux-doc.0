Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26E1C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Mar 2022 08:11:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344860AbiCHIME (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 03:12:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344925AbiCHILp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 03:11:45 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9653D1F6
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 00:10:48 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id t14so15790880pgr.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 00:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e8Dbi0f40DbbR2Ay2+RJzlEwx6J7DHlfyepjeZs4og8=;
        b=VO39edO184xG5lfHwIIvL140CJ2kJhwF7QWxVaw97hSRrjkcP0mIQoNKFPUGQvjVBb
         gVBXH4X+yMFFch2wl8OT0m9CLbrCZa+Gq6tfJSOs1fR98QnggVxIYRDZfeN10Omi+qcj
         uYo58W3h9zEcKcez/WhbrHh6CVscf48S1gFHW/RQqFAV7lKKvHSpXr8mdQtAZ1gOxS05
         VSZaudDYLJ97igJ7h26cW01URPdHlvt4Zhos+9zcYhq53wLwpf19nFhokLvStM+VX4U9
         dljRhSRTdm6ktaVeeRjaDtiKGsRXybNG7zkr6pzfvGWUul1/qRoAvOl7FzkWU/qonU3L
         lfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e8Dbi0f40DbbR2Ay2+RJzlEwx6J7DHlfyepjeZs4og8=;
        b=UUvF6/sa+ObEN8pH+9ucaxQV3dpb10SPfDL2MbSLS8Huev3V38Fq3CXOoKmrmimPW8
         SMvT0EG8WgrzHe9kaOv+29Osg16TN5+n70Y56XuSjdv9DQF10LHPurbj7xOvCT65Oekk
         q38ckOR1WlsV//FFs5xzGSZtJv0rY9Mn/YQXO0hULlbqvUZIUJbbOA4HfjPoZzyvdM1T
         Q7Lw33ipfC8AYAahbHcU9S6HcXb/yp75iPyLgl+QA4EsutRDsjrdOGzu7+ieoF513Rb1
         IP6wXbYpWyKn0PoeEb/4p80nOCZJYZiPVVXCtgGX/xcrx3fElA8fYIHp2lWDTh72cNkK
         Zxmw==
X-Gm-Message-State: AOAM532wZ037Kg2SEkTf7HT8loGD3daAKlhaQpMUWbBpoctSsro04Oz3
        nOxy+YTF1tlsGIaHevWy+fw=
X-Google-Smtp-Source: ABdhPJwK36nChzrx6iRI8BikzikPfcblz5UiRPB4og5WLpWcgkuXPQxLptQfpk0tFpDuDjO7caZkcA==
X-Received: by 2002:a63:3482:0:b0:37d:101e:a93d with SMTP id b124-20020a633482000000b0037d101ea93dmr13138768pga.425.1646727047800;
        Tue, 08 Mar 2022 00:10:47 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id d14-20020a056a0024ce00b004f7281cda21sm2165282pfv.167.2022.03.08.00.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:10:47 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 2/5] docs/zh_CN: add admin-guide damon index translation
Date:   Tue,  8 Mar 2022 16:12:00 +0800
Message-Id: <4ba1d0658d93b1a4b335d3d1267558c2d4ae08d0.1646723249.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646723249.git.siyanteng@loongson.cn>
References: <cover.1646723249.git.siyanteng@loongson.cn>
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

