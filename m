Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14FCC433EF
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 10:02:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4BD461056
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 10:02:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350907AbhIDKDQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 4 Sep 2021 06:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350918AbhIDKDP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Sep 2021 06:03:15 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B20DC061575
        for <linux-doc@vger.kernel.org>; Sat,  4 Sep 2021 03:02:14 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id mw10-20020a17090b4d0a00b0017b59213831so1171921pjb.0
        for <linux-doc@vger.kernel.org>; Sat, 04 Sep 2021 03:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cb5T0goC06B92YRvq42DSC1LvNraKM6zUuukPa9ppxE=;
        b=Al02/gS4c/eOaNBKBVAbU7ipSL53XLothS/rSK/WMMl/2UR6x/jAwcOEMjdIR6Luuq
         IorEVgo2Cy48Ox3hYG5EzvKbnOmjNEhHFJs/M+L1I7HUbMecc5DwIkY5uVvDh47Hs5HI
         II2teUosAmKGqzbk+Dmp3nPFwZZfPvHtaGLr5HZbxFvS65or/M/dqqUlDlT+5apSxCcp
         bwuH29Xkb0WJZHYeYzpney5a6bDgR7adyhDyIvLtcIh7CjrCE3JH3E5krpYSiquqkTqH
         Vl8tykaZAzpKAedB8lSv0KcFQgd6b1Cmuzsq0w87qLTAmFNLi4nT7ddQS8CF1yPsDhZJ
         hvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cb5T0goC06B92YRvq42DSC1LvNraKM6zUuukPa9ppxE=;
        b=qwmk4s1c8my1n2aqWZ+ACovSbhCxnwc3eDDCShBd+2/Z91dWGnMXSlf9zv4ZfIhWad
         gs+udrdknCf88N5WaInjO31GIqUiT/Pedjei9UOjESzYRvyxmwdsFSH/G3r+XpGj/JkF
         kSctMEG1K3LBOsNFVoEPxQuHTY4q6SZVkd1jJHyDze4zQhj4IiiPux3ToTpGwwU3XOT3
         MDaT4vdqaM8kXIb9ZcOcGn73R5uHLSU75o339ACkGidEXLNPgi4pjPSIgqRWq8SlxS5V
         h6FWtX7y1enISK4X2dqX3vbmuh4hESw+q99SHcN3B22iBzZU2jW2Fi5JkllB6WKRhr13
         7rsg==
X-Gm-Message-State: AOAM530QVTGr7JXodQhFdh/x6EmbDe4sewgGt/u8JsBMH5HBi+XO3qlk
        lwn7dG/J655uVqUhTkVS+ww=
X-Google-Smtp-Source: ABdhPJxnq5JUHW4hoSQcPFmz1n3TNlzso3/3tCi1Xce7NW9fOBUSB4Ychpjh77RA3ClrzsYUk3GQCQ==
X-Received: by 2002:a17:90b:4c8b:: with SMTP id my11mr3460274pjb.220.1630749733775;
        Sat, 04 Sep 2021 03:02:13 -0700 (PDT)
Received: from localhost.localdomain ([107.172.82.230])
        by smtp.gmail.com with ESMTPSA id e16sm1955458pfj.90.2021.09.04.03.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 03:02:13 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v5 6/6] docs/zh_CN: add core-api gfp_mask-from-fs-io translation
Date:   Sat,  4 Sep 2021 18:01:04 +0800
Message-Id: <01fb8c6a57179a0cc30cad01077e50b162c80e55.1630747462.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1630747462.git.siyanteng@loongson.cn>
References: <cover.1630747462.git.siyanteng@loongson.cn>
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
index 3f8a86716ac1..52bda404f9e4 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -107,6 +107,7 @@ Todolist:
    mm-api
    genalloc
    boot-time-mm
+   gfp_mask-from-fs-io
 
 Todolist:
 
@@ -115,7 +116,6 @@ Todolist:
    dma-attributes
    dma-isa-lpc
    pin_user_pages
-   gfp_mask-from-fs-io
 
 内核调试的接口
 ==============
-- 
2.27.0

