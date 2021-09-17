Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25609C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 17 Sep 2021 06:34:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A533610A7
	for <linux-doc@archiver.kernel.org>; Fri, 17 Sep 2021 06:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235383AbhIQGf5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Sep 2021 02:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238146AbhIQGfv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Sep 2021 02:35:51 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDEC6C061766
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 23:34:29 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id w19so8191122pfn.12
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 23:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wiq16k5V0V75bKlI78dkxF+ODnyQpGz/MbR9PdksHxI=;
        b=FbwJzYxbN5vx5PFnpbmINEtGtByvFFaajua51wUhW7EGuaxcNgIm/PiLNRIgObiVB+
         wHlC2KHSpKP3+TMhKpUM9OpoEY5+fpINq/kwv3wd6O8FXcxGvQ0KtNQABCokYF3lRs1q
         zgfyhpWscuiFH3JvR+qQcyBRxPowKVP30nmfH5MCWzjTqNhQQcS6BhpkfYNFIyBuvHc1
         GolHPvMbBsfby8Pi36YucHdWYO3hosVc/xZyi8QCUrOKEBf6NCXgeEodnvMXFYmbre05
         71KyoNL9ncMxxYUBUkRLBY4jLPsWjFZUwnuI96fl0nq+uk8D5pxpeiqH+D25oirWJLPh
         j8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wiq16k5V0V75bKlI78dkxF+ODnyQpGz/MbR9PdksHxI=;
        b=Wf6zwWiYdOHZUAsFL4pK7YubhB+CaDBzTEnVsqVq9NDlQ38SJodz+ApAh8R2TRdS0B
         dIfoEqLfHQrEx4OmvE6yhiSHKEP/zQ7Ii2plJeNyfUve52jsWkO4grnzVobJKHjPYRy/
         YV0qg4jTquBAoqfIlSYyeVCrEdqONiol6YlGAKw4B0VxiYtQlspyGOH+dz9GB73mnagj
         jTeZ1XZ3Pu1rIpxnnpH+YyRuwqWIU0gBVgGjCvRcOwqGZzVEmDo1q8B6CjphyD65zU3s
         WTYlcYNEX7ndVmqxj6ZuP8WrqAnf47HztFPtT6gmlyGsIiUt11e5V03QHuFFnAjtLEwl
         yjrQ==
X-Gm-Message-State: AOAM5330vFAmPgCOpTDcqkZPj9p3RbN7LtCDPucn/zxOYuprFUWFChlQ
        rrcqMxXyMVS5gdKB1qkucbfzAmBouMV56+27
X-Google-Smtp-Source: ABdhPJywBQxD8stjui3Umw0ZrmHK+EkR615jknZTQbN6Y9ovp2wggCxGoE0W/q3XLj+oGQ1qQhfg0w==
X-Received: by 2002:aa7:9af7:0:b0:43f:13cb:804a with SMTP id y23-20020aa79af7000000b0043f13cb804amr9195063pfp.7.1631860469250;
        Thu, 16 Sep 2021 23:34:29 -0700 (PDT)
Received: from localhost.localdomain ([8.47.69.169])
        by smtp.gmail.com with ESMTPSA id d4sm4723775pfv.21.2021.09.16.23.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 23:34:28 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v6 6/6] docs/zh_CN: add core-api gfp_mask-from-fs-io translation
Date:   Fri, 17 Sep 2021 14:33:07 +0800
Message-Id: <1d5d5a87d2eceb73b5554c8afb6c79e81b1e0f0e.1631846923.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1631846923.git.siyanteng@loongson.cn>
References: <cover.1631846923.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/gfp_mask-from-fs-io.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../zh_CN/core-api/gfp_mask-from-fs-io.rst    | 66 +++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |  2 +-
 2 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst

diff --git a/Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst b/Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst
new file mode 100644
index 000000000000..75d2997e9bc3
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst
@@ -0,0 +1,66 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/gfp_mask-from-fs-io.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 时奎亮 <alexs@kernel.org>
+
+.. _cn_core-api_gfp_mask-from-fs-io:
+
+============================
+从FS/IO上下文中使用的GFP掩码
+============================
+
+:日期: 2018年5月
+:作者: Michal Hocko <mhocko@kernel.org>
+
+简介
+====
+
+文件系统和IO栈中的代码路径在分配内存时必须小心，以防止因直接调用FS或IO路径的内
+存回收和阻塞已经持有的资源（例如锁--最常见的是用于事务上下文的锁）而造成递归死
+锁。
+
+避免这种死锁问题的传统方法是在调用分配器时，在gfp掩码中清除__GFP_FS和__GFP_IO
+（注意后者意味着也要清除第一个）。GFP_NOFS和GFP_NOIO可以作为快捷方式使用。但事
+实证明，上述方法导致了滥用，当限制性的gfp掩码被用于“万一”时，没有更深入的考虑，
+这导致了问题，因为过度使用GFP_NOFS/GFP_NOIO会导致内存过度回收或其他内存回收的问
+题。
+
+新API
+=====
+
+从4.12开始，我们为NOFS和NOIO上下文提供了一个通用的作用域API，分别是
+``memalloc_nofs_save`` , ``memalloc_nofs_restore`` 和 ``memalloc_noio_save`` ,
+``memalloc_noio_restore`` ，允许从文件系统或I/O的角度将一个作用域标记为一个
+关键部分。从该作用域的任何分配都将从给定的掩码中删除__GFP_FS和__GFP_IO，所以
+没有内存分配可以追溯到FS/IO中。
+
+
+该API在以下内核代码中:
+
+include/linux/sched/mm.h
+
+然后，FS/IO代码在任何与回收有关的关键部分开始之前简单地调用适当的保存函数
+——例如，与回收上下文共享的锁或当事务上下文嵌套可能通过回收进行时。恢复函数
+应该在关键部分结束时被调用。所有这一切最好都伴随着解释什么是回收上下文，以
+方便维护。
+
+请注意，保存/恢复函数的正确配对允许嵌套，所以从现有的NOIO或NOFS范围分别调
+用 ``memalloc_noio_save`` 或 ``memalloc_noio_restore`` 是安全的。
+
+那么__vmalloc(GFP_NOFS)呢？
+===========================
+
+vmalloc不支持GFP_NOFS语义，因为在分配器的深处有硬编码的GFP_KERNEL分配，要修
+复这些分配是相当不容易的。这意味着用GFP_NOFS/GFP_NOIO调用 ``vmalloc`` 几乎
+总是一个错误。好消息是，NOFS/NOIO语义可以通过范围API实现。
+
+在理想的世界中，上层应该已经标记了危险的上下文，因此不需要特别的照顾， ``vmalloc``
+的调用应该没有任何问题。有时，如果上下文不是很清楚，或者有叠加的违规行为，那么
+推荐的方法是用范围API包装vmalloc，并加上注释来解释问题。
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index fe624abf1817..ce064df5ca8d 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -109,6 +109,7 @@ Todolist:
    mm-api
    genalloc
    boot-time-mm
+   gfp_mask-from-fs-io
 
 Todolist:
 
@@ -117,7 +118,6 @@ Todolist:
    dma-attributes
    dma-isa-lpc
    pin_user_pages
-   gfp_mask-from-fs-io
 
 内核调试的接口
 ==============
-- 
2.27.0

