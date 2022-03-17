Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4853BC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 06:51:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbiCQGwj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 02:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiCQGwd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 02:52:33 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02293DA6DF
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:18 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id e3so4084586pjm.5
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TO5N/+pDiVkD1pk/iPZ70DiuXdU3bOID+CrmGizFvWo=;
        b=YVlpM1mFRcncDtSzxhBsdqB9eUrUEblVJGGv80RjKhHMBn0TNayRsfmqVcI28NqYge
         8KhNOTwfk67MS4wGVwxCK13v21Tyi0OFVkjmYlNn6rWhK4f3jQR73PTVWt+BiudML4x5
         NmprfWQuUwl8yV0JmSy2PCam6BRgwu0mepnYRW4RSm0AV1K1lKTeDuycFK42rqqIrSuy
         S5wbRP7EFayMZ/WzsdcUve43A/0ki3NNoMQRES3YKTkNRt2x6skiIDsxiK6OPUPmtrPI
         rsgMzs+NEe7r7+UIgxqfFbdUVscAsaP92Ud64URBQP7HwNDBkqHngTcTp66reJXWwVHE
         z9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TO5N/+pDiVkD1pk/iPZ70DiuXdU3bOID+CrmGizFvWo=;
        b=ly8ZFmTLphOzZXzBkDB9RqlPjaJFuMWWOloY/cSUMkZzK7yfQ0HTquVvD+uEyWklsI
         xgu+f0gah5/bAM0rkSII1V3EmYiVOfLNKe75H/U4smKvcDo/PuDQocpwNR3CQmolkJmW
         pkfv5CQYHO8CHDhFXNOmRJfM2RoiC8uEv/YzOg14P2+gU3srNrZT3VO5jah+Wl/aLM1l
         OaoYniBSZLn9TS/bqIqdzs/8Yh78WXul7TCbaeXYtNOBQSkjpbf6UPR25RfFMurA2SLA
         dph6wa7VU3/1efTU3ULc0086x30qkJF/PdfP/62xASTjTiPhb2qgLLdUlBdmmU7/fZ6F
         DEtw==
X-Gm-Message-State: AOAM533BpnwZPnt9fy4aMWCvrAI1tI+tqlXWlXgsy0yKfNutRbAx5HUy
        57H6+GRPoCFO9sfrEDaOYk4=
X-Google-Smtp-Source: ABdhPJwneJAeSm7PWifLv6v6pEHiacDExNja0ovz+Yx34hCTeQMeSlN1dmFrvCeuibLMY0mMRiQQUQ==
X-Received: by 2002:a17:902:6b8b:b0:14d:66c4:f704 with SMTP id p11-20020a1709026b8b00b0014d66c4f704mr3566865plk.53.1647499877501;
        Wed, 16 Mar 2022 23:51:17 -0700 (PDT)
Received: from localhost.localdomain (pcd454078.netvigator.com. [203.218.244.78])
        by smtp.gmail.com with ESMTPSA id k15-20020a63ab4f000000b00381eef69bfbsm3622152pgp.3.2022.03.16.23.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 23:51:17 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 08/12] docs/zh_CN: add vm page_table_check translation
Date:   Thu, 17 Mar 2022 14:50:49 +0800
Message-Id: <b0d6e2d76b1ac0a5c9239c7b3402dc7855095d7e.1647498763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1647498763.git.siyanteng@loongson.cn>
References: <cover.1647498763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../vm/page_table_check.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../zh_CN/vm/page_table_check.rst             | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/page_table_check.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index aa983d023045..a2dea8b618ad 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -34,6 +34,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    overcommit-accounting
    page_frags
    page_owner
+   page_table_check
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -42,7 +43,6 @@ TODOLIST:
 * hugetlbfs_reserv
 * numa
 * page_migration
-* page_table_check
 * remap_file_pages
 * slub
 * split_page_table_lock
diff --git a/Documentation/translations/zh_CN/vm/page_table_check.rst b/Documentation/translations/zh_CN/vm/page_table_check.rst
new file mode 100644
index 000000000000..a29fc1b360e6
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/page_table_check.rst
@@ -0,0 +1,56 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:Original: Documentation/vm/page_table_check.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+========
+页表检查
+========
+
+概述
+====
+
+页表检查允许通过确保防止某些类型的内存损坏来强化内核。
+
+当新的页面可以从用户空间访问时，页表检查通过将它们的页表项（PTEs PMD等）添加到页表中来执行额外
+的验证。
+
+在检测到损坏的情况下，内核会被崩溃。页表检查有一个小的性能和内存开销。因此，它在默认情况下是禁用
+的，但是在额外的加固超过性能成本的系统上，可以选择启用。另外，由于页表检查是同步的，它可以帮助调
+试双映射内存损坏问题，在错误的映射发生时崩溃内核，而不是在内存损坏错误发生后内核崩溃。
+
+双重映射检测逻辑
+================
+
++-------------------+-------------------+-------------------+------------------+
+| Current Mapping   | New mapping       | Permissions       | Rule             |
++===================+===================+===================+==================+
+| Anonymous         | Anonymous         | Read              | Allow            |
++-------------------+-------------------+-------------------+------------------+
+| Anonymous         | Anonymous         | Read / Write      | Prohibit         |
++-------------------+-------------------+-------------------+------------------+
+| Anonymous         | Named             | Any               | Prohibit         |
++-------------------+-------------------+-------------------+------------------+
+| Named             | Anonymous         | Any               | Prohibit         |
++-------------------+-------------------+-------------------+------------------+
+| Named             | Named             | Any               | Allow            |
++-------------------+-------------------+-------------------+------------------+
+
+启用页表检查
+============
+
+用以下方法构建内核:
+
+- PAGE_TABLE_CHECK=y
+  注意，它只能在ARCH_SUPPORTS_PAGE_TABLE_CHECK可用的平台上启用。
+
+- 使用 "page_table_check=on" 内核参数启动。
+
+可以选择用PAGE_TABLE_CHECK_ENFORCED来构建内核，以便在没有额外的内核参数的情况下获得页表
+支持。
-- 
2.27.0

