Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBAFC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 09:59:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240108AbiC1KAq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 06:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240080AbiC1KAp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 06:00:45 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537943617E
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:59:05 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w8so14341964pll.10
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t441NFa9tl1sOKlSpdU3A0SsEqOMfRBPMCC9izfsYTw=;
        b=LbQXvjVsuQGlVpAyPOrnCBJfIot3TwfX3IiCZnVnOqDZmy+2i+DzeX1kBwMzG7pNJC
         Gk2u++PEqt4WrDJCO7GBlcggzBm43zOKdi62QX2sSnRDmbz4UzKsl5pSp3Hf5DevAW9D
         twMr49WgA8p4ptlwECYhB35/ghCWWF4GA5Rfzxg1LjlmVn+hr15xtSp9BSETGblaJHtO
         rhi1dMFAMYVAVc0YV4KSqZuUfati2uyYlMuGIQjfsybews7ZJyld5rXO4eSOXnobaKdA
         8X7din9OkEu+ftgJwHcVFxRzzwiEJwSN9DGVwyzFE9cysqtgaugBKusAfUKpG6aHY6vk
         haFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t441NFa9tl1sOKlSpdU3A0SsEqOMfRBPMCC9izfsYTw=;
        b=gDQqh1ctrVrEZHNx3s6kUTCjARn3w1CJAk0H7HcTLHaFvOSS03kI75212VpHkimPJo
         N6up5kUEwy0tbT+4jkAILKyyvUklENTaznlPz+0DD5ZoWZLb6TyzS9yf4D/T7Wpl92Gw
         HBJlRubP0SGyMWXlGIbV7EUDwNWtNrYm1BNSHEBLhir0Ro0p+O8G8Iz2VHOdz6/x2ZOW
         +ENoeM3xGzBT4r3a4I6oOA1M8tbVozeVRZiG4hx2cZFxJLoEOE5fJGDvb1gG4FBPHkrg
         53PjZtjufIAw0DMJ4dIfmCGJzUIJpkisoeYwKWNbKxcROYo9TeJp8Seh2zg3tBpaQcsz
         HI5g==
X-Gm-Message-State: AOAM530U+d+T6BWJ/XtT+9QxtyoeQ2V3iNkpptykX7sEMOx/yJdr0z3O
        6WjZ0xYpFi6gN9tFkRy7gJw=
X-Google-Smtp-Source: ABdhPJx4v3OwJZzodm6JWDG+9ZwF0vLPvEvnwLzbn7AdAPz8rPlrzieHUALpAv6YvOx7682VfhGNKg==
X-Received: by 2002:a17:902:f787:b0:152:157:eb7 with SMTP id q7-20020a170902f78700b0015201570eb7mr24531974pln.109.1648461544740;
        Mon, 28 Mar 2022 02:59:04 -0700 (PDT)
Received: from localhost.localdomain (111-250-2-155.dynamic-ip.hinet.net. [111.250.2.155])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a174800b001c7d8b160f0sm10526637pjm.51.2022.03.28.02.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 02:59:04 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 06/12] docs/zh_CN: add vm page_frags translation
Date:   Mon, 28 Mar 2022 17:59:48 +0800
Message-Id: <76b4ca221d981d93ffdcbb9b3331cf649e2d2878.1648458742.git.siyanteng@loongson.cn>
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

Translate .../vm/page_frags.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../translations/zh_CN/vm/page_frags.rst      | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/page_frags.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 1c6ec847a2f3..f478032cd477 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -32,6 +32,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    memory-model
    mmu_notifier
    overcommit-accounting
+   page_frags
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -40,7 +41,6 @@ TODOLIST:
 * hugetlbfs_reserv
 * numa
 * page_migration
-* page_frags
 * page_owner
 * page_table_check
 * remap_file_pages
diff --git a/Documentation/translations/zh_CN/vm/page_frags.rst b/Documentation/translations/zh_CN/vm/page_frags.rst
new file mode 100644
index 000000000000..ad27fed33634
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
+sk_buff->head使用，或者用于skb_shared_info的 “frags” 部分。
+
+为了使用页面片段API，需要一个支持页面片段的缓冲区。这为碎片分配提供了一个中心点，
+并允许多个调用使用一个缓存的页面。这样做的好处是可以避免对get_page的多次调用，
+这在分配时开销可能会很大。然而，由于这种缓存的性质，要求任何对缓存的调用都要受到每
+个CPU的限制，或者每个CPU的限制，并在执行碎片分配时强制禁止中断。
+
+网络堆栈在每个CPU使用两个独立的缓存来处理碎片分配。netdev_alloc_cache被使用
+netdev_alloc_frag和__netdev_alloc_skb调用的调用者使用。napi_alloc_cache
+被调用__napi_alloc_frag和__napi_alloc_skb的调用者使用。这两个调用的主要区别是
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

