Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E47EC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 17 Jan 2022 04:35:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234180AbiAQEfx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 Jan 2022 23:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiAQEfx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 Jan 2022 23:35:53 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D0CEC061574
        for <linux-doc@vger.kernel.org>; Sun, 16 Jan 2022 20:35:53 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id j27so9775876pgj.3
        for <linux-doc@vger.kernel.org>; Sun, 16 Jan 2022 20:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F0MbqCaPiKm4q2p6r0Typh4mMMxZw5tTZZEGaZ+tyjw=;
        b=gJIcf5ZE1CGXdNoo118zvaHixNooF8VAFBLyiLBVXClF9sxPl41Actl5qujSFhZKqd
         4yeKjDp2vleDkoB1TxfXDH0DMWiDTqUy8jWwFfCTgR9aM/qBWSbAH05z4PfUp4nzUi2I
         f155a5VOKetdDK44Ob5BqKlkrvQ2axbkViNzmqIONNPC+mOmC6ebUOKiYXSwtfAhWo/P
         f0msLnhRrFuZFtjTbRUrYwBCwnlxn2x/508Jpc7SZolQVcV5PMUUPOBkEdL/Pvsb4fyt
         gE+6k9VXc4sUkNapxlXDDKsF2mqRDjOoMKlqB/3qvltVBuJJiwbttVxhjzp6GKGV73ZB
         NxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F0MbqCaPiKm4q2p6r0Typh4mMMxZw5tTZZEGaZ+tyjw=;
        b=x+sV6UNyiD6AfkNO6KP5nhenQewYcGx1uGp4/pSpscnY5IKDeewF/jKqxQ3W6xAStq
         ElhdJNozrdBLkLDfSJCzbTZyIllB/CaCmbwmkCXjhyUIiDH8FdWd2bWWvtPUvsagglMX
         CEeUk+xR96twvVC47W8/UQ7mZS+B47oJyVfS/oJ0aPWt9OtvWdQ1gMDjfM5i55onhlXS
         5YzRSjdfvpWMqsWvfYrM6MkQdqaiTGXJAwFuHbjmUpGxzF6zwPsKOUdnF6gyErZcRS3/
         PKYsu5RmYCUJFaLnWCcs/0JYN4OcuHBeSV28R21v4L9U1Me81IykUEnQV0N0gCtUkYwR
         6dxg==
X-Gm-Message-State: AOAM530a6fiJHBhSFfq7q1xXGREyG6KIWLEf8Jgn+qEZRHk36JaEDdLj
        YO91eXrELH+gYuBnFz2k+ZAAia392N4=
X-Google-Smtp-Source: ABdhPJyncbGYHICaMT9JCO0VXefHtaLeJt01uYceah6eCdzdH/zTUOq2IY6lVX1EVK6DlbdeCJCpKQ==
X-Received: by 2002:a63:7b46:: with SMTP id k6mr17985402pgn.204.1642394152923;
        Sun, 16 Jan 2022 20:35:52 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id 14sm1689099pgp.86.2022.01.16.20.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 20:35:52 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: xu.xin16@zte.com.cn
To:     sterlingteng@gmail.com, seakeel@gmail.com, corbet@lwn.net
Cc:     siyanteng01@gmail.com, linux-doc@vger.kernel.org,
        xu.xin16@zte.com.cn, cgel.zte@gmail.com,
        Yang Yang <yang.yang29@zte.com.cn>
Subject: [PATCH v2 1/3] zh_CN: Add Chinese translation for vm/ksm.rst
Date:   Mon, 17 Jan 2022 04:35:48 +0000
Message-Id: <20220117043548.861607-1-xu.xin16@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: xu xin <xu.xin16@zte.com.cn>

Translate Documentation/vm/ksm.rst into Chinese.
Update Documentation/translations/zh_CN/vm/index.rst.

Reviewed-by: Yang Yang <yang.yang29@zte.com.cn>
Signed-off-by: xu xin <xu.xin16@zte.com.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  1 +
 Documentation/translations/zh_CN/vm/ksm.rst   | 70 +++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/vm/ksm.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 6b0990c..c874e2e 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -24,6 +24,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    active_mm
    balance
    damon/index
+   ksm
 
 TODOLIST:
 * active_mm
diff --git a/Documentation/translations/zh_CN/vm/ksm.rst b/Documentation/translations/zh_CN/vm/ksm.rst
new file mode 100644
index 0000000..ef66cd4
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/ksm.rst
@@ -0,0 +1,70 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/ksm.rst
+
+:翻译:
+
+   徐鑫 xu xin <xu.xin16@zte.com.cn>
+
+============
+内核同页合并
+============
+
+KSM 是一种节省内存的数据去重功能，由CONFIG_KSM=y启用，并在2.6.32版本时被添加
+到Linux内核。详见 ``mm/ksm.c`` 的实现，以及http://lwn.net/Articles/306704和
+https://lwn.net/Articles/330589
+
+KSM的用户空间的接口在Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
+文档中有描述。
+
+设计
+====
+
+概述
+----
+
+概述内容请见mm/ksm.c文档中的“DOC: Overview”
+
+逆映射
+------
+KSM维护着稳定树中的KSM页的逆映射信息。
+
+当KSM页面的共享数小于 ``max_page_sharing`` 的虚拟内存区域(VMAs)时，则代表了
+KSM页的稳定树其中的节点指向了一个rmap_item结构体类型的列表。同时，这个KSM页
+的 ``page->mapping`` 指向了该稳定树节点。
+
+如果共享数超过了阈值，KSM将给稳定树添加第二个维度。稳定树就变成链接一个或多
+个稳定树"副本"的"链"。每个副本都保留KSM页的逆映射信息，其中 ``page->mapping``
+指向该"副本"。
+
+每个链以及链接到该链中的所有"副本"强制不变的是，它们代表了相同的写保护内存
+内容，尽管任中一个"副本"是由同一片内存区的不同的KSM复制页所指向的。
+
+这样一来，相比与无限的逆映射链表，稳定树的查找计算复杂性不受影响。但在稳定树
+本身中不能有重复的KSM页面内容仍然是强制要求。
+
+由 ``max_page_sharing`` 强制决定的数据去重限制是必要的，以此来避免虚拟内存
+rmap链表变得过大。rmap的遍历具有O(N)的复杂度，其中N是共享页面的rmap_项（即
+虚拟映射）的数量，而这个共享页面的节点数量又被 ``max_page_sharing`` 所限制。
+因此，这有效地将线性O(N)计算复杂度从rmap遍历中分散到不同的KSM页面上。ksmd进
+程在稳定节点"链"上的遍历也是O(N)，但这个N是稳定树"副本"的数量，而不是rmap项
+的数量，因此它对ksmd性能没有显著影响。实际上，最佳稳定树"副本"的候选节点将
+保留在"副本"列表的开头。
+
+``max_page_sharing`` 的值设置得高了会促使更快的内存合并（因为将有更少的稳定
+树副本排队进入稳定节点chain->hlist）和更高的数据去重系数，但代价是在交换、压
+缩、NUMA平衡和页面迁移过程中可能导致KSM页的最大rmap遍历速度较慢。
+
+``stable_node_dups/stable_node_chains`` 的比值还受 ``max_page_sharing`` 调控
+的影响，高比值可能意味着稳定节点dup中存在碎片，这可以通过在ksmd中引入碎片算
+法来解决，该算法将rmap项从一个稳定节点dup重定位到另一个稳定节点dup，以便释放
+那些仅包含极少rmap项的稳定节点"dup"，但这可能会增加ksmd进程的CPU使用率，并可
+能会减慢应用程序在KSM页面上的只读计算。
+
+KSM会定期扫描稳定节点"链"中链接的所有稳定树"副本"，以便删减过时了的稳定节点。
+这种扫描的频率由 ``stable_node_chains_prune_millisecs`` 这个sysfs 接口定义。
+
+参考
+====
+内核代码请见mm/ksm.c。
+涉及的函数(mm_slot  ksm_scan  stable_node  rmap_item)。
-- 
2.15.2
