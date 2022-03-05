Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1518C433EF
	for <linux-doc@archiver.kernel.org>; Sat,  5 Mar 2022 16:25:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbiCEQ0B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Mar 2022 11:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbiCEQ0A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Mar 2022 11:26:00 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4653C1E2FD5
        for <linux-doc@vger.kernel.org>; Sat,  5 Mar 2022 08:25:10 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id mg21-20020a17090b371500b001bef9e4657cso9668311pjb.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 08:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YJqpuPJBBPZL/xbzfFWelYu0OCJwzOOHthwVOLnYFsc=;
        b=JBkObUvW5UyVqPW6gotQKsHpzuaaT4dMp3yzttkLhPKvQ71IPDJ5apX6MTe1On35Lu
         GijiA242HntmKKYltLQ8rHkb/Z/+AoGHTgZKCGl/TB5n1x1DWaxrMfYZB09BUH7qLfWk
         NCREpg0IATIP8DRuWPFzIZsjmRCmWCQZkazH9SYe1LLc7mU2pYpmGFsVzGrI8fQYNnVq
         6Vg0dPYCyUZJ23frNtfK0v3SaHBB82DGnz6FFJZiAjiLn9QVODOrbQnyQvB0Cjj3pXwY
         63kN1QQ43Z82YdARQ/E8Cq0DQ+GNq31B8Rz2LCxDQ6gKCmPm6MGiglo+Ru/1IP/FODi8
         QSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YJqpuPJBBPZL/xbzfFWelYu0OCJwzOOHthwVOLnYFsc=;
        b=gfS5ppJKdOjKgsZYNDr51wcOCWpdS10hTf4j9C07iodqN/fUYTnwpyxpNH3nHmhIUc
         RLtr/PL6dnq7rBkx8Y16Q4a5mHH+VZtY7uYlb2hOhoijFY3xwW5d9SRvulZMzYmB4NhS
         ZENDocDKH7vplDfpyA8w5est/IFZ3adNUnmkkHoInn5lv0hy/zB4wq14CRv+sVlrW4TD
         oddDZhOACa1+GgByYAo4VgnhuLrIVwSX9BokfKaijAeylsRJV+xuGEL8rkaf6d40BWgI
         cJgUarYSB188zBKtdR1gR9/LxT1Zn96HjUkPzQAzXzvo/cHZYpYzpztOLyCvwh2LV9aA
         h1zw==
X-Gm-Message-State: AOAM532XMuwH5rwdqt1PSq684SRHViiMzFEdafkZln/1dZmRbculoQiM
        +HKWJWKtqao96XwIbJALLYFm2wT0o8+xxJJN
X-Google-Smtp-Source: ABdhPJwfND2ME6jhsOyKRopsFkN5K7/yTS+d3RzO/2kZZh48EUl2VB59mqlBPH7agXGpO7O/TXWonw==
X-Received: by 2002:a17:903:110d:b0:14d:ca32:cae9 with SMTP id n13-20020a170903110d00b0014dca32cae9mr4054791plh.30.1646497509699;
        Sat, 05 Mar 2022 08:25:09 -0800 (PST)
Received: from localhost.localdomain (42-200-190-71.static.imsbiz.com. [42.200.190.71])
        by smtp.gmail.com with ESMTPSA id x7-20020a17090a1f8700b001bf1db72189sm6106269pja.23.2022.03.05.08.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 08:25:09 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 08/12] docs/zh_CN: add vm page_table_check translation
Date:   Sun,  6 Mar 2022 00:26:08 +0800
Message-Id: <3e251eac59455546f2bc7959cbbae9f37d5946fc.1646496448.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646496448.git.siyanteng@loongson.cn>
References: <cover.1646496448.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/page_table_check.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../zh_CN/vm/page_table_check.rst             | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/page_table_check.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index b706c5ceff0c..33a04a623608 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -33,6 +33,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    overcommit-accounting
    page_frags
    page_owner
+   page_table_check
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -41,7 +42,6 @@ TODOLIST:
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

