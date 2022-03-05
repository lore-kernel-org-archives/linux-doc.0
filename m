Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B567C433EF
	for <linux-doc@archiver.kernel.org>; Sat,  5 Mar 2022 16:25:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbiCEQZx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Mar 2022 11:25:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbiCEQZx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Mar 2022 11:25:53 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEA61DFDF8
        for <linux-doc@vger.kernel.org>; Sat,  5 Mar 2022 08:25:03 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id k92so646142pjh.5
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 08:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eNngpTIK7MaQsDucwbXooC886FkP/HgODkKzEmo6sc4=;
        b=bEUjWrzPgYUmJ09uFkNUQwk4m3tOIIqFMR5/vATLecPeGM4/3ZOzFvYHdrtaDgcBnO
         QSCpasBvbCGvY/311l7lr6Lrg3OTOm3kcHrSlph5Pj3FS/ZX39E4UqXKsay1F+aYSpXQ
         uy0Ff9biJ2jqwpgZzjk75hvq/EiNgGrjel0df6l+NEvswZuwBt26bqml14eWVq5zBKPa
         Kd/z/lkWL+VBg6RlErJ/iAFulk95lH3hxqfq3KQ0nmQ8ZSwuERAFdLfVCi3/1gNP6QE1
         0GvsWF5/By5DEVpJaZr8fJCEobfb5qM3b1TOmZRARa7+GvR1hWWhJt0f84s+t9pQcELi
         L54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eNngpTIK7MaQsDucwbXooC886FkP/HgODkKzEmo6sc4=;
        b=NAT9O+zV76Kthi1Vr1K6aAGhllGZiLhPatKMex0I3OcWWGu90kEuxSCzWCxzrdibcZ
         p3Cn/uTuEsJHB8vG/rIpMHY2vVU7pbwY6GhGf6YPOLS8WvPTuk6EXAvoIHpTDwSEZoqJ
         zb8GoAd2OFQLYR+5fJDO18rs94ZyUsxXBuws2CZm9sOXQqkQ6fRQZjmmCyM3g0ZVivoX
         /O6CW6IoRoWhPFhP4gJNShfirkDAQnmFmCZvHXdxY3e96HSqJqIst1yFBpNMM9BKJhtA
         jZLCCQd8XYqKA7I7+IijVgkTZZzwVIsSxNyiLoSP2JPgpsInDwiwvytQDa7NGPsINgj2
         MYfg==
X-Gm-Message-State: AOAM531xe9VYU2fDytMudrIzaOs98FfRCE+VoSY4WkedS9LGlxjOEBTZ
        CtngZ5WCk0eVSQEVMq55jME=
X-Google-Smtp-Source: ABdhPJy//tFRcFRrZPuXQ8wCWTog/HI2WwTM7i9x6PZXTD2zmg7Jw00XkBMsC1H6cKcPG91/YSbYQA==
X-Received: by 2002:a17:902:e74f:b0:151:c20b:5f39 with SMTP id p15-20020a170902e74f00b00151c20b5f39mr4022750plf.43.1646497502933;
        Sat, 05 Mar 2022 08:25:02 -0800 (PST)
Received: from localhost.localdomain (42-200-190-71.static.imsbiz.com. [42.200.190.71])
        by smtp.gmail.com with ESMTPSA id x7-20020a17090a1f8700b001bf1db72189sm6106269pja.23.2022.03.05.08.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 08:25:02 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 06/12] docs/zh_CN: add vm page_frags translation
Date:   Sun,  6 Mar 2022 00:26:06 +0800
Message-Id: <2c5f52f9bb9489987f8ab6275bdaa6e003194a29.1646496448.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646496448.git.siyanteng@loongson.cn>
References: <cover.1646496448.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/page_frags.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../translations/zh_CN/vm/page_frags.rst      | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/page_frags.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 2a3a93a4c050..6e676b71607e 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -31,6 +31,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    memory-model
    mmu_notifier
    overcommit-accounting
+   page_frags
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -39,7 +40,6 @@ TODOLIST:
 * hugetlbfs_reserv
 * numa
 * page_migration
-* page_frags
 * page_owner
 * page_table_check
 * remap_file_pages
diff --git a/Documentation/translations/zh_CN/vm/page_frags.rst b/Documentation/translations/zh_CN/vm/page_frags.rst
new file mode 100644
index 000000000000..7d974d61f102
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/page_frags.rst
@@ -0,0 +1,38 @@
+:Original: Documentation/vm/page_frag.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+========
+页面片段
+========
+
+一个页面片段是一个任意长度的任意偏移的内存区域，它位于一个0或更高阶的复合页面中。
+该页中的多个碎片在该页的引用计数器中被单独计算。
+
+page_frag函数，page_frag_alloc和page_frag_free，为页面片段提供了一个简单
+的分配框架。这被网络堆栈和网络设备驱动使用，以提供一个内存的支持区域，作为
+sk_buff->head使用，或者用于skb_shared_info的 "frags "部分。
+
+为了使用页面片段API，需要一个支持页面片段的缓冲区。这为碎片分配提供了一个中心点，
+并允许多个调用使用一个缓存的页面。这样做的好处是可以避免对get_page的多次调用，
+这在分配时可能会很昂贵。然而，由于这种缓存的性质，要求任何对缓存的调用都要受到每
+个CPU的限制，或者每个CPU的限制，并在执行碎片分配时强制禁止中断。
+
+网络堆栈在每个CPU使用两个独立的缓存来处理碎片分配。netdev_alloc_cache被使用
+netdev_alloc_frag和__netdev_alloc_skb调用的调用者使用。napi_alloc_cache
+被调用__napi_alloc_frag和__napi_alloc_skb的人使用。这两个调用的主要区别是
+它们可能被调用的环境。“netdev” 前缀的函数可以在任何上下文中使用，因为这些函数
+将禁用中断，而 ”napi“ 前缀的函数只可以在softirq上下文中使用。
+
+许多网络设备驱动程序使用类似的方法来分配页面片段，但页面片段是在环或描述符级别上
+缓存的。为了实现这些情况，有必要提供一种拆解页面缓存的通用方法。出于这个原因，
+__page_frag_cache_drain被实现了。它允许通过一次调用从一个页面释放多个引用。
+这样做的好处是，它允许清理被添加到一个页面的多个引用，以避免每次分配都调用
+get_page。
+
+Alexander Duyck，2016年11月29日。
-- 
2.27.0

