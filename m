Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C09C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 11 Jan 2022 02:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346052AbiAKCPg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jan 2022 21:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346228AbiAKCPd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jan 2022 21:15:33 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C88C061748
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 18:15:33 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id c14-20020a17090a674e00b001b31e16749cso2147880pjm.4
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 18:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OAxXMeDkht+CJYMsqyf68JNUbm6y08MDZvQgPbDr6WM=;
        b=FGAQKlFokSBIQ0AfTSoPw0wqmTDTY9Ad3bonA/jxn0Ctp+7UB188biRmfNOPXJISza
         MNq7kAvKcMqTL5s2F6sXF0UX0mr87E/EPwrOh05e548zjs0MQVIvpCerViru6bFm2e+i
         sntXG8qxIrW3juWkWvMr3SuSiw/VaD1aV2KxT6X20OfFMHjsluJysgMiTphHrTIFm28P
         myQRfn5LO+SUXfAq9feFEnLlt6uMfMcw3G8JofPdUaBq2O67ytkR3PosC577lI2ZcB1b
         WW2MEIDh8ri1IyYCxjAZRyawAUl9mVu/Gol6/+2XXOTwbvcQfi7dafT+2u5fWB/ek7h/
         n7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OAxXMeDkht+CJYMsqyf68JNUbm6y08MDZvQgPbDr6WM=;
        b=W8qzy5BBQHJ5J5W6Hy+xRXFQcFaHAxF3VGv0Ob1ovb/yWdG68LvNZOr7SKL1vgFTKb
         YJ9epO5Eawl8kho9bvy2hMoz5jqeQ0mpjmNeXQ7OSe6xDN6SHOKRQHd7HQfuSCTGTf8C
         R+WJ4AJNKVvvHZf95JRb5+4EzIhZ+inSF5TX83V0Zzm/m6j9ay6aB0ncNkekDEeKNRFL
         QQUfHXDMkYAVztLM85c3VoG5MXCChEhLpgFF0JtoiDl0zlObNle5woL3dkieKDQWfZTa
         mOYm4+iMCjn0oPLEOoXWV0P2im+sJm+j8s9hY+zeWmwQN9Jajzc5DMuAAvfrmCedmk/N
         WHQA==
X-Gm-Message-State: AOAM531AAHDdBDWDZlS4Ymyou8m6kgjlte/q4UOI8PYcNWDutK3k8RZf
        RyXKo1dixBw7YKPRqomn53RLBWk/C3EbvCGo
X-Google-Smtp-Source: ABdhPJwzjsvzrr2C5JZkAy1btUcSjVBfo5RUTCfsJ+FAGNFNKxvkVSzqgtC8UOFPYkBHx4qF3Lm7GA==
X-Received: by 2002:a17:902:820f:b0:149:8d21:3e42 with SMTP id x15-20020a170902820f00b001498d213e42mr2237588pln.111.1641867332775;
        Mon, 10 Jan 2022 18:15:32 -0800 (PST)
Received: from wironout4.netvigator.com (pcd454075.netvigator.com. [203.218.244.75])
        by smtp.gmail.com with ESMTPSA id k3sm308914pjt.39.2022.01.10.18.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 18:15:32 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 1/3] docs/zh_CN: add vm/index translation
Date:   Tue, 11 Jan 2022 10:13:14 +0800
Message-Id: <60c579b34792c4c76194c4843a695263a982b37d.1641866889.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1641866889.git.siyanteng@loongson.cn>
References: <cover.1641866889.git.siyanteng@loongson.cn>
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
Reviewed-by: Alex Shi <alexs@kernel.org>
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

