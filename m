Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716AEC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 09:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240080AbiC1KAw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 06:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240111AbiC1KAv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 06:00:51 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159F62E6AB
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:59:11 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id b13so10253878pfv.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=53VMpfmi3QnHUxX+Tyb6681/9UH2pDIbpvCsI0JjszU=;
        b=oJUUA9RF9RfHVyDJReBdDB7UQvgy5Id9iHX7/Fne9aPsRWI7njd+iL2kFgWU53flqp
         WWhTsUl/g0RDbUEqxLszhrTYLrzbAYsa08O7Ygh3unBUYoI0r6YNPrfiJGC1MMiZqACV
         XtSTjYOIu2Vb80X6RT3irwRHY7M1x2PuCNU/jcVMtWrG+xnvLTe3yateCR4yZUBfXkbW
         luzqWYcvHjNE/BxCIuT8OmAko7Qm7Z+/CWe8f5qXgJ2oyxBTMurDKFbLyZdoKUqjakWH
         P0nIJUhTY1D4KmVEN6ZmNnoUhP1nRwmnD3PE11ytIAEihAl0CVieZcTBDyLvRYzrzv2V
         bQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=53VMpfmi3QnHUxX+Tyb6681/9UH2pDIbpvCsI0JjszU=;
        b=VKBbp61flRZHrx76ZPVFOzjbHdPp7p8iThikg0d8Z3hmBQ77rzEQLRLfPUpRY+aQUj
         hPTZxzDreh6nzOuYU/wRMl9KKaINumXkWNBEK9pk4pq0hEFAHMhV83sTX84JIqrs/FN4
         k9NVflld50OkoIB+EzSo/wwDD4UPSHbbHKP0SlgD9Wuympildy9KOySVBcetbEeO0b5l
         Vs7dozriNzI8SW2LA1BtxIfuFEUSTm7KfnUJvM09uaW/0NKiqtutPUdaPxeg2U64JVXH
         /jzV0d0qN06ff6KBuT1ZYNC04A1L6jsgnvMD87W1x34mopFT0F/sBGOfisA5J9basdjd
         /dNQ==
X-Gm-Message-State: AOAM5307epanvNL+g9rX6t90rbHs7H1QKxsD1uDgWweEJEXf211DuQGM
        JhAHsADsXzToUmZy7AU6ZO8=
X-Google-Smtp-Source: ABdhPJwDJj3XjdHv98hqq0DwsZR0nNndBCE8JMZRSISlhzmLu9x663DWF/TCd+P5B5LlvTekTMPhLg==
X-Received: by 2002:aa7:9f9c:0:b0:4fa:7ffa:7cc7 with SMTP id z28-20020aa79f9c000000b004fa7ffa7cc7mr22011140pfr.43.1648461550597;
        Mon, 28 Mar 2022 02:59:10 -0700 (PDT)
Received: from localhost.localdomain (111-250-2-155.dynamic-ip.hinet.net. [111.250.2.155])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a174800b001c7d8b160f0sm10526637pjm.51.2022.03.28.02.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 02:59:10 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 08/12] docs/zh_CN: add vm page_table_check translation
Date:   Mon, 28 Mar 2022 17:59:50 +0800
Message-Id: <b10478b2b40c6945cbff368c6c85152f7278d81b.1648458742.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1648458742.git.siyanteng@loongson.cn>
References: <cover.1648458742.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../vm/page_table_check.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
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

