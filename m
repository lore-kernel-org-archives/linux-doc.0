Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FE1C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 02:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbiBXC7T (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Feb 2022 21:59:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbiBXC7S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Feb 2022 21:59:18 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACA3D19B2
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 18:58:48 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id i21so636390pfd.13
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 18:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e8Dbi0f40DbbR2Ay2+RJzlEwx6J7DHlfyepjeZs4og8=;
        b=T/jn5s6UdCioHED4aVGLPOoq6eqac462F2G85pJ4ky6neDkAQxRWuCWoG/adT70dsz
         FG750tBLPYzFHR9yT6EUf3MhI2HJToCzFJtbHXsAYUoXTUXopaXHToDG90Ogqvn3PGFQ
         9S0nGo/1eCMMUsYX0hMV13XhlzsorDVcrBaalx4i9MTncYzMlgISq8fn9A32AYPNRJNY
         df9a7lyyR3FQt6bVGXXmgo/mqpJwBqEAwzZUMbuwfcnaqdZyKI/2NjDswzfCmPcFCDWg
         egCHI9zIlbB2xjyheWdoWGs4qYQDbwim0+gULBua3jkWAdLi63Yv8YpLZERqlegd/XOL
         uyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e8Dbi0f40DbbR2Ay2+RJzlEwx6J7DHlfyepjeZs4og8=;
        b=aSolap31PKFMq/RstIQ7fyrLF4t8u509ICm+B/GiNqJK8K7UKkRgno0qmzTf/soCOP
         gxXYGh3F6gB2Skh+Js9tkMnH5N46pcQwmvKyHWaroxILO4CVUp3dPKjEKueWSw9Ot5jB
         mFwzB5nQ5qwXfKoUzYydjkUaVsSLaHhV4ldGJ4VK802WyVG50ATtzxPDbPImt+5/Jca3
         T+7kHDhfFUTun2wwjx78PserbPh3kbfVIfjYOay5bUrhrR2euxhT/eV5aAWqHdObxmlF
         nBDO+k0smFY/U61mHVQ9FSPEPueuG8fzoB0ji1OBWGGiCW9ROqWq3PiwesdKPVmnffgn
         Vt0Q==
X-Gm-Message-State: AOAM5320rz0J5+Vfv7mXc0tXoiBZTAANbW+Z7uXTrzofLNErHAyE/QXM
        L4ttWDfW+WmC7de8PLKClCiD6Q891Fhwlg==
X-Google-Smtp-Source: ABdhPJwsoXhJGvr0tGfzUyiI2N07OncwX0v4Wg7/cXK7l/XGnrvUAhVu99erBeLDauEYeAx4ctqdiw==
X-Received: by 2002:a63:ff54:0:b0:373:520f:a01d with SMTP id s20-20020a63ff54000000b00373520fa01dmr680964pgk.394.1645671528412;
        Wed, 23 Feb 2022 18:58:48 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id p16sm775855pgj.79.2022.02.23.18.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 18:58:48 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 2/5] docs/zh_CN: add admin-guide damon index translation
Date:   Thu, 24 Feb 2022 10:55:24 +0800
Message-Id: <9c1af0d6baab2228a49655210f472507cefe630f.1645670438.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645670438.git.siyanteng@loongson.cn>
References: <cover.1645670438.git.siyanteng@loongson.cn>
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

