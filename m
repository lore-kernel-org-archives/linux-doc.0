Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F7FC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 21 Feb 2022 10:49:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355420AbiBUKtv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Feb 2022 05:49:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355383AbiBUKtU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Feb 2022 05:49:20 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D811E6E8E9
        for <linux-doc@vger.kernel.org>; Mon, 21 Feb 2022 02:10:48 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 12so10309629pgd.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Feb 2022 02:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MYx3qSDIYlZujQ0t+ToybF17TsXB5l+9lvusONKeht0=;
        b=dNTqij9dBw8e0mAHddU61Y2CWuzCrMVSVhuAAywqHmny+8599ULZ8aScrckvDiIUFL
         9DVN8K6ne422sKeBzdk7bvWmx8PhHYGfhAaiN5WyaFvpCEzEPwJ2N71oeIuiPTJxDICi
         n2PqZ8wJ2a2DTUtM9rwq2LIDZI8jaJ/eCffVnQ7PaJVCm51wIlG1NTVQ8vxMRGeeoWWL
         lxLQafkSU7l24oy3LqkGF2rD4k2vpVQy1RJh5wMhbmF8BzVqKGQfy4TCpm87uCPzA01g
         R6loi0QwePZjCawFb8CdKAwz62zWDcsBOuAtQQ5yNG9zaye4DX0/Spzsxy8dOzvjscEw
         2iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MYx3qSDIYlZujQ0t+ToybF17TsXB5l+9lvusONKeht0=;
        b=sFacTGIdxn3sEx6mk8pz5kQdoyLY5k5D3UrWDhtE6lvRKPnovj5DZzwGRm5HiBtrAl
         VLqJTaO4KWRUU6g32fyhEqjaNoTaLSS/2JqA1AbRxoG9l1Pqp7ADXjLaJrOc4duFuRiw
         PqOV0tQjwf0Invh+wCO3D5u7MouSQ4M65HaJrK1OPQnx8kEzHnhGGvrWMSvl6Gcf5mNd
         ZUt9qyn2dOzqlgRHjvYT0G9ncbin/8G5uXXmMG/bifzUTMbj96Z7AMk8PtFNrTV97QlI
         zvZmJRUPvJloMDAxEKKxWmN4X/RSi34v0g2b+lUHYnCalXdbRK35IJxIuG9cVU3UzDSP
         4bcw==
X-Gm-Message-State: AOAM532i39TKiW9b4lbYvIi75aXeaqr3MPSbLYgMoE3NabIhs8QYZdHb
        zKWx2njhS2TueDxFN4AZ/Ls=
X-Google-Smtp-Source: ABdhPJxnUDYlz8BpKdoBe6A7zv/Bam/Cpoc0FB0NKLYP/sxanlx4XRgLwgO6gZ9uunBibK3CzaFCcQ==
X-Received: by 2002:a62:5ac6:0:b0:4df:34dc:d6c5 with SMTP id o189-20020a625ac6000000b004df34dcd6c5mr19563512pfb.9.1645438248287;
        Mon, 21 Feb 2022 02:10:48 -0800 (PST)
Received: from localhost.localdomain (pcd454219.netvigator.com. [203.218.244.219])
        by smtp.gmail.com with ESMTPSA id x2sm2472938pje.24.2022.02.21.02.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 02:10:48 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 2/5] docs/zh_CN: add admin-guide damon index translation
Date:   Mon, 21 Feb 2022 18:06:24 +0800
Message-Id: <6ec83d6f9e206483deb922b834869ca026b5ac43.1645437621.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645437621.git.siyanteng@loongson.cn>
References: <cover.1645437621.git.siyanteng@loongson.cn>
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
index b2c114075090..181eb4cd6aae 100644
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

