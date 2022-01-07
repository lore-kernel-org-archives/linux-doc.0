Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444F6C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jan 2022 02:42:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344710AbiAGCmw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Jan 2022 21:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344689AbiAGCmw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jan 2022 21:42:52 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C79C061245
        for <linux-doc@vger.kernel.org>; Thu,  6 Jan 2022 18:42:52 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id y16-20020a17090a6c9000b001b13ffaa625so10588219pjj.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Jan 2022 18:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uWV4tRaxRkawBKHAjKEcRP99YdZy6n/Z/+CX0bAioTc=;
        b=cPvAFS/FbfIaz5QN8uRTuxNRl31kd1xDyAPpygdiHLMVOEAmO/tzZEFv3Ioku/rHpe
         q8OfF+lJSBjiWvqvk4jmnkz+bUd03ZDJJrWSM5bIwGB8kWOtwTbtPxyHClTxRf1hEsVq
         17NUzgPgN6aCxFBZJnqV1mbAmAHUQ+bJ8D2m9KWiEkzpdx4FNZ/LHem+VTPiSqWNKGWY
         r5GOfamvH7o2TYU2lbgoIkssMHyLp2Ewg3/AZdKv+/bqGgd0o/7mHQAfp4dT28PWKpmw
         cQLtsD0+uvid56oLgTp5Con6uDOImngjbltKrhmuww1FYe5Q7dP4WhJlV950s6zaUE97
         TW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uWV4tRaxRkawBKHAjKEcRP99YdZy6n/Z/+CX0bAioTc=;
        b=YudehVeGUMlXBS79hNA2ziE9nTrm1eb2/g0BTAD83ni72ObXcdisUMGtMCh+eCizDj
         TegeIlcjuAnrqmkXJeIBPNA9uaQ/g4V5wW0qUSTp5QC0ekOq2FtLLlx3mid3oNuJTbk3
         4hNXThyJ9bHh3zrKKU0fk86Iy8eLPlfiAUwI5On4guPkvBoZcMy3RuB813MLRgmiHsVz
         0JnrnKMZlcgzrxmdMtlN5W5jHLb+Jo126PIkO2LLbdbAVBIyG76070sVKqiv5WWMq7Hg
         fIvOtlQbqviRouM5eCBL3bDKZUjmPoRTFCb1ArjHqCa7rSU4R/2aAf716Dbg06HCgs9a
         EKsg==
X-Gm-Message-State: AOAM530uNskkYBKiXNZuDOXGlpSgtsRh1ZVjqmVJ9y9UrICJIDui4P2M
        +b1U67e81mcgxMhibk2jV/9fer2gzpGnqOPK
X-Google-Smtp-Source: ABdhPJx7QDI+AJUq3uJYiQBkfMNGbEjdATJLRrsYaJDcC900f/VdjAKU+eUkzdt3w+a+Vhm1NpA+WA==
X-Received: by 2002:a17:902:8c83:b0:149:8ef6:b2ff with SMTP id t3-20020a1709028c8300b001498ef6b2ffmr43503513plo.32.1641523371859;
        Thu, 06 Jan 2022 18:42:51 -0800 (PST)
Received: from localhost.localdomain ([45.11.1.11])
        by smtp.gmail.com with ESMTPSA id g22sm3874833pfc.130.2022.01.06.18.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 18:42:51 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 1/3] docs/zh_CN: add vm/index translation
Date:   Fri,  7 Jan 2022 10:40:31 +0800
Message-Id: <f0ec6c767958c37f266edaca715d675c97a5a127.1641522956.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1641522956.git.siyanteng@loongson.cn>
References: <cover.1641522956.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate ../vm/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/index.rst    |  2 +-
 Documentation/translations/zh_CN/vm/index.rst | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/index.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index 46e14ec9963d..911fb64d4073 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -112,6 +112,7 @@ TODOList:
    infiniband/index
    accounting/index
    scheduler/index
+   vm/index
 
 TODOList:
 
@@ -140,7 +141,6 @@ TODOList:
 * gpu/index
 * security/index
 * crypto/index
-* vm/index
 * bpf/index
 * usb/index
 * PCI/index
diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
new file mode 100644
index 000000000000..0fda40c602ac
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -0,0 +1,52 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+=================
+Linux内存管理文档
+=================
+
+这是一个关于Linux内存管理（mm）子系统内部的文档集，其中有不同层次的细节，包括注释
+和邮件列表的回复，用于阐述数据结构和算法的基本情况。如果你正在寻找关于简单分配内存的建
+议，请参阅(Documentation/translations/zh_CN/core-api/memory-allocation.rst)。
+对于控制和调整指南，请参阅(Documentation/admin-guide/mm/index)。
+TODO:待引用文档集被翻译完毕后请及时修改此处）
+
+.. toctree::
+   :maxdepth: 1
+
+
+TODOLIST:
+* active_mm
+* arch_pgtable_helpers
+* balance
+* damon/index
+* free_page_reporting
+* frontswap
+* highmem
+* hmm
+* hwpoison
+* hugetlbfs_reserv
+* ksm
+* memory-model
+* mmu_notifier
+* numa
+* overcommit-accounting
+* page_migration
+* page_frags
+* page_owner
+* page_table_check
+* remap_file_pages
+* slub
+* split_page_table_lock
+* transhuge
+* unevictable-lru
+* vmalloced-kernel-stacks
+* z3fold
+* zsmalloc
-- 
2.27.0

