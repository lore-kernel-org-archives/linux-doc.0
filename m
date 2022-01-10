Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33659C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jan 2022 02:44:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238224AbiAJCoE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 Jan 2022 21:44:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237100AbiAJCoE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Jan 2022 21:44:04 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D017C06173F
        for <linux-doc@vger.kernel.org>; Sun,  9 Jan 2022 18:44:04 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id x27so781376pfu.3
        for <linux-doc@vger.kernel.org>; Sun, 09 Jan 2022 18:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HB0FMJHP0X7rPI/EwyODT0HKZju9Fu08r9CLykgZd7Y=;
        b=O/dHBuZBJn7mCbwucRexvDikWjfmzvl4bwlWp4Wds1WJG429WJEZzFZE8R1N/c4U3N
         FvtBZvoZesuFCSjPWZCGpS1YopHHWIMlT/IWhVCFyfkSr+bHYGwmq0fgEhl2mGDs9AY+
         2CV9/x6rNOuMNAGLFctlKCGtsOUV778nvLa5f0QFbkpIOKWNrSY5IBU3QA3qldgCmqsg
         LxhEX2BxIZCbt3P93BR0sht1lYSwgYbfdyh1atYsCVba9+DGn3Sg2tdwcD8ahvB75GrI
         NrGlIdaHE+790Ns/w08NaJX6KZ8B+nZMgm2taLIQNVaNVJedg8HJ6dukrVrF0aWD8rQf
         t5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HB0FMJHP0X7rPI/EwyODT0HKZju9Fu08r9CLykgZd7Y=;
        b=KIxvIUz1BIpdsAwRabA04pbLOMVRJu6PHAHYbok+MkaF7C17D8BHcnFiYfZMbUOq4q
         Am5sfkg9rCkAcjmjxofrnVfxQ2L7VuFxy+yyk2Y4+lfoLEuPgzYkRPKP2iz+MftZtpKP
         xbTM4FZBhlsvIJfSn3Brv0JAl5OllMbWYS19VXcYKjj6RtTvEukZa44+1u3JfoTbXO9X
         kd4xQoCAOvl7GTgbiByrYic+zDfd15SUn1hoj22AB15rKHLgt7/P2qCDdtJHV2F7E8Cd
         mgEq9jxMXb5Hmq8sQiqacvcfQlQbaMDOViCA1EqmgRs4KdX5h6ivsj8s6XoE+EyiqzOW
         iN5g==
X-Gm-Message-State: AOAM532Gp+YgdRFwL3mq6qeEQl0VtYhUi5VOhjpnxs1h8Jju8507o+HA
        oQVFMqlYR5c+rHd3F+o/0qWYPq3oyN4/4TpY
X-Google-Smtp-Source: ABdhPJx5kUY1Bjcayg5MDoQKM5S0bPZceOMrnj7veuanAznDQfi+UtAbyTV9WzpcMJyFV3tlE+vl+A==
X-Received: by 2002:a63:f551:: with SMTP id e17mr64928826pgk.243.1641782643964;
        Sun, 09 Jan 2022 18:44:03 -0800 (PST)
Received: from localhost.localdomain (pcd454193.netvigator.com. [203.218.244.193])
        by smtp.gmail.com with ESMTPSA id u5sm4711511pfk.67.2022.01.09.18.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 18:44:03 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 1/3] docs/zh_CN: add vm/index translation
Date:   Mon, 10 Jan 2022 10:40:51 +0800
Message-Id: <7c66e1c130d54b8bb26118a2daf62e5b02b1fbc2.1641782124.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1641782124.git.siyanteng@loongson.cn>
References: <cover.1641782124.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate ../vm/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Tang Yizhou <tangyizhou@huawei.com>
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

