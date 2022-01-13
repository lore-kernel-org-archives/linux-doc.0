Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFABC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 13 Jan 2022 03:21:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbiAMDV3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Jan 2022 22:21:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232006AbiAMDV1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jan 2022 22:21:27 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD4DC061751
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 19:21:27 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id 59-20020a17090a09c100b001b34a13745eso16501195pjo.5
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 19:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TnD6DNeKCopJ4exHoKb2KpGoWlYflqxlF4DdDY91skI=;
        b=Vr1EHkbmmmXRA8SldCx2OVeFRSrZC2lWFkwylefIVQkS2D974cu46Go7dZ/8D1kmyD
         oia9TRYe6BgHOGrbQeMxtp+c0EWXHqY8rrnidRBeIIXsUDRnuqzDIn309CL5waSR5NiP
         kFrQThrEnjcv0omtdYBh74H6SB4YC49d9IxQcNAzDNS2NwwN0JlLuREceFQfuXqtp1ew
         RUiyi+UL6xyL3pIbe7BNhNg2f48h4cHpTITKJT7LlMBQQ9ueXYVG4mczLBdu490NjNUS
         3viPYb6aCLETttewCNF6ZM737sNBkhlCXMTqc67Cq5DgOGlkczflLlDOL20MQnn3IYG2
         RmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TnD6DNeKCopJ4exHoKb2KpGoWlYflqxlF4DdDY91skI=;
        b=Fd33a3/PPWYDGTlhB8xm8F5UgQKr68/WFJiJMyxgnm+AS7DsD0XwnLpF3P/O6ijo4a
         2SLrTaRPoxvHAzK95WwQF9I8NSAYfU/9dsr2JbvRfZC6nsXPyhQLK42DzavFAtkvsq5O
         FIb+qCERxRUSDIEREGbFsF02VrgZwwRHgVKOKEGXEnthHvwAsOnvL1hberUTjua+rL6Q
         8GFbeXtzz5Xhp1EbMd6qowDbLvPt/KCr3lbmKmQdbUWMA49hOEjcb7QFJEbd7q0vO6hb
         aiO2u9Nke2rkzY3II9eCGd0pQCwHvcd09tshjBdoioItsH/U97S35jkNRXSlIAj3oOFl
         GzCg==
X-Gm-Message-State: AOAM530ogy2RZw/V8mgDUzQOYXw9bTleJupDhZeyYCrS6gQCKhv4ClmN
        v7uPXPtQzXokCOxSNfd2lck=
X-Google-Smtp-Source: ABdhPJw5mKVmHeGfpHsAQP2l+rM4Nn283globXx3KM8WXqLK6zKtEYqF2ty5oj1RhCjCpTx9YRzp2A==
X-Received: by 2002:a62:1996:0:b0:4bb:db58:9f6d with SMTP id 144-20020a621996000000b004bbdb589f6dmr2399290pfz.31.1642044086788;
        Wed, 12 Jan 2022 19:21:26 -0800 (PST)
Received: from localhost.localdomain (pcd454075.netvigator.com. [203.218.244.75])
        by smtp.gmail.com with ESMTPSA id x2sm1757573pjq.40.2022.01.12.19.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 19:21:26 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 2/4] docs/zh_CN: add damon faq translation
Date:   Thu, 13 Jan 2022 11:18:02 +0800
Message-Id: <431b45fab64d2d90b790e5890d86061b61742810.1642043630.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1642043630.git.siyanteng@loongson.cn>
References: <cover.1642043630.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/damon/faq.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/vm/damon/faq.rst       | 48 +++++++++++++++++++
 .../translations/zh_CN/vm/damon/index.rst     |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/damon/faq.rst

diff --git a/Documentation/translations/zh_CN/vm/damon/faq.rst b/Documentation/translations/zh_CN/vm/damon/faq.rst
new file mode 100644
index 000000000000..07b4ac19407d
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/damon/faq.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:Original: Documentation/vm/damon/faq.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+========
+常见问题
+========
+
+为什么是一个新的子系统，而不是扩展perf或其他用户空间工具？
+==========================================================
+
+首先，因为它需要尽可能的轻量级，以便可以在线使用，所以应该避免任何不必要的开销，如内核-用户
+空间的上下文切换成本。第二，DAMON的目标是被包括内核在内的其他程序所使用。因此，对特定工具
+（如perf）的依赖性是不可取的。这就是DAMON在内核空间实现的两个最大的原因。
+
+
+“闲置页面跟踪” 或 “perf mem” 可以替代DAMON吗？
+==============================================
+
+闲置页跟踪是物理地址空间访问检查的一个低层次的原始方法。“perf mem”也是类似的，尽管它可以
+使用采样来减少开销。另一方面，DAMON是一个更高层次的框架，用于监控各种地址空间。它专注于内
+存管理优化，并提供复杂的精度/开销处理机制。因此，“空闲页面跟踪” 和 “perf mem” 可以提供
+DAMON输出的一个子集，但不能替代DAMON。
+
+
+DAMON是否只支持虚拟内存？
+=========================
+
+不，DAMON的核心是独立于地址空间的。用户可以在DAMON核心上实现和配置特定地址空间的低级原始
+部分，包括监测目标区域的构造和实际的访问检查。通过这种方式，DAMON用户可以用任何访问检查技
+术来监测任何地址空间。
+
+尽管如此，DAMON默认为虚拟内存和物理内存提供了基于vma/rmap跟踪和PTE访问位检查的地址空间
+相关功能的实现，以供参考和方便使用。
+
+
+我可以简单地监测页面的粒度吗？
+==============================
+
+是的，你可以通过设置 ``min_nr_regions`` 属性高于工作集大小除以页面大小的值来实现。
+因为监视目标区域的大小被强制为 ``>=page size`` ，所以区域分割不会产生任何影响。
diff --git a/Documentation/translations/zh_CN/vm/damon/index.rst b/Documentation/translations/zh_CN/vm/damon/index.rst
index 9a7b4ea91cb8..dfa82244cbe8 100644
--- a/Documentation/translations/zh_CN/vm/damon/index.rst
+++ b/Documentation/translations/zh_CN/vm/damon/index.rst
@@ -27,7 +27,9 @@ DAMON是Linux内核的一个数据访问监控框架子系统。DAMON的核心
 .. toctree::
    :maxdepth: 2
 
+   faq
+
 TODOLIST:
-*   faq
+
 *   design
 *   api
-- 
2.27.0

