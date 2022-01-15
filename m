Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69613C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 15 Jan 2022 07:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbiAOHR2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 Jan 2022 02:17:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiAOHR2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 Jan 2022 02:17:28 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3776C061574
        for <linux-doc@vger.kernel.org>; Fri, 14 Jan 2022 23:17:27 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id i17so4806950pfk.11
        for <linux-doc@vger.kernel.org>; Fri, 14 Jan 2022 23:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NCkwP2gRKfiSZucJFLWEEbIo6HMIT7s1clw7UsUNX+Y=;
        b=M0cKkXyir4m2XR4BAzHXXIfk63qxZn9cptm04oUDrMs3fCDb3sVucSzbVXCS8QCbLn
         vF++Igr3vtGTnxQ/va+VTJH5KphE++gCKhHB6eUKyQ5i8qnN0S6bomokObPijv5V0S9H
         dr9xtLu84rYUA4z53OQFKRAlWWbWRa5SeLhPEONjKLrmHKmFfuZfQdOc3n4AMkBsKP7i
         knsXQ5KiL4yqZw29eRqRIBzo99aznxeVMSeI87gKZ5mMLwwDGc3Sq6ylpiIykbGX34b7
         8kOSmCeGzCgEadvVbED9cizHlvLtkRwP+9AkuDBIEm0FCrQcn/uKzoEhKVa2uboPe/zA
         tqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NCkwP2gRKfiSZucJFLWEEbIo6HMIT7s1clw7UsUNX+Y=;
        b=APO3b0eboT4jfUOpUlQj/qqR2/xU3qS6XnbkdNCu2SRcWNwpBZab8sI/8QYymQBOs8
         7gslGq1vWj4er6kdkzu41/VP9mqVID93NJmJug/iv4im/kq7MBai5BBV8xwSGbPOPh/Y
         qrVVqDuadcuHcfIV2PFGbv7Wuy283vikXOgtWEXzOFxv6JR5yICjoH5F3AvJG8wujbaP
         PlzShxARJIaEmFuVLzWjv/YDqF99hFwx9YAA/ag6zvH7gJxWKKYLW/+XlX4rB/G2tdJ3
         5aSkrVH0IgxwN5opNmrD7OwLvnWT2kiwXH1FWXBJOXMfmcxO8e+8TD6MvMlAbMWakHb5
         kaXQ==
X-Gm-Message-State: AOAM5339a/P+tg+CU84g1fPs2mIqQX1Aerko66UCjIPFCRxX8xHktx7N
        t2D7oZW6qLkPtE1XV1XrR6Y=
X-Google-Smtp-Source: ABdhPJw6bOeJ4KTZ+rEzR4TtQgqvsITnRlkvs/DTCHHesoAD+D69DuVfjgT9akxx5C7yFZ8gG/wtKA==
X-Received: by 2002:a63:fd53:: with SMTP id m19mr10663989pgj.563.1642231047510;
        Fri, 14 Jan 2022 23:17:27 -0800 (PST)
Received: from localhost.localdomain (cm218-252-25-221.hkcable.com.hk. [218.252.25.221])
        by smtp.gmail.com with ESMTPSA id u8sm7888909pfi.147.2022.01.14.23.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 23:17:27 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 2/4] docs/zh_CN: add damon faq translation
Date:   Sat, 15 Jan 2022 15:15:01 +0800
Message-Id: <30507f807a835360f57bb9498c37f4c3644b33b7.1642230669.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1642230669.git.siyanteng@loongson.cn>
References: <cover.1642230669.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../vm/damon/faq.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
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

