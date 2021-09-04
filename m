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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD1AC433EF
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 10:01:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC78F61054
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 10:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235981AbhIDKDA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 4 Sep 2021 06:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235973AbhIDKC7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Sep 2021 06:02:59 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6B8C061575
        for <linux-doc@vger.kernel.org>; Sat,  4 Sep 2021 03:01:58 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id y17so1470751pfl.13
        for <linux-doc@vger.kernel.org>; Sat, 04 Sep 2021 03:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+6zNBNW+ucmCheYsxd4oiJO+7xd9T1fjBz4t8eoZKf0=;
        b=GMsEQrPvRU+aAseDbSxhXU69k1ZRN8jGEDcQ24qL0zjfpEtNPweU0K6fWGuePqNh74
         1A+ATJEQC8ZZTghIFCZvHuvgV61WoW6CDV9a7Z/yh+gUlAgnPboxl+U28AGMD3nUoDSN
         bNB5FC2U9lboEh/g0t3dPVYVxrhfdrhfCJb56OfBzx6Z7QY9UugztsniDZ8prbvk4PQa
         /ov80WYH2rK9jlLL+/dGrp/ef0RFvuBhlqthyKAC778U7miNN4myyCvJJle+krZZmIf7
         AHAZE3rBVl5G6cwCYFDghB1LCCY5xsGcg7g0XsqUWzjyfhkUozd10zA43+VnPedbhzvO
         6Ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+6zNBNW+ucmCheYsxd4oiJO+7xd9T1fjBz4t8eoZKf0=;
        b=GIwbmjq3mipbijGXEgZfTtfi2hxMFNETwWQZp7XPq+YSMQ7fdwGB7X3/VfL9cjp5dR
         lnUE/XY9XtKr5FWbwGkWyGnFAPJ8lCikobC+Augn6bJHRJW0EIalQ1koBdWHxktwWRRV
         mJqbqeKPhrT984K3HLxmCztjTOZ6Ih4Sqm3O6oNeI9RvlvGcswS0Lo6WXfDNHkYQUW8d
         DH6LGsTNLfsFFpoNflA9MbKY3RFVcTff4v20fBF8byCtzCTcQ/3ACiiFHqqQB3cF8qGZ
         e3JLwwz7W2refYRh5ywQadLpOlkqcYL8z4Auu16nNgGgbP1Vpa+Y0yA8jzDD3mqCwZ5M
         zxbg==
X-Gm-Message-State: AOAM5331CHvvjFYlfo+lsZLFSY6rF2JrVthQl+cZuSh0BnsAtXxXIjP3
        7DWok7+7FhLl5JIin8GAFtQ=
X-Google-Smtp-Source: ABdhPJxXS7sys5oGUmnDuRS2aQCxpj9TmYSnvk5iIhzfU5tGduQZEGzehaEwxsFgpNX6zJvMm8G/BQ==
X-Received: by 2002:a63:7807:: with SMTP id t7mr3011024pgc.474.1630749718073;
        Sat, 04 Sep 2021 03:01:58 -0700 (PDT)
Received: from localhost.localdomain ([107.172.82.230])
        by smtp.gmail.com with ESMTPSA id e16sm1955458pfj.90.2021.09.04.03.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 03:01:57 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v5 3/6] docs/zh_CN: add core-api mm-api translation
Date:   Sat,  4 Sep 2021 18:01:01 +0800
Message-Id: <51ef21c2885036d55a7b272be59262b8f687de63.1630747462.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1630747462.git.siyanteng@loongson.cn>
References: <cover.1630747462.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/mm-api.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 .../translations/zh_CN/core-api/mm-api.rst    | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/mm-api.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 0e74e27773ea..87603d301b7a 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -104,6 +104,7 @@ Todolist:
 
    memory-allocation
    unaligned-memory-access
+   mm-api
 
 Todolist:
 
@@ -111,7 +112,6 @@ Todolist:
    dma-api-howto
    dma-attributes
    dma-isa-lpc
-   mm-api
    genalloc
    pin_user_pages
    boot-time-mm
diff --git a/Documentation/translations/zh_CN/core-api/mm-api.rst b/Documentation/translations/zh_CN/core-api/mm-api.rst
new file mode 100644
index 000000000000..52e23aa3a59b
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/mm-api.rst
@@ -0,0 +1,110 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/mm-api.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 时奎亮<alexs@kernel.org>
+
+.. _cn_core-api_mm-api:
+
+============
+内存管理APIs
+============
+
+API（Application Programming Interface，应用程序接口）
+
+用户空间内存访问
+================
+
+该API在以下内核代码中:
+
+arch/x86/include/asm/uaccess.h
+
+arch/x86/lib/usercopy_32.c
+
+mm/gup.c
+
+.. _mm-api-gfp-flags:
+
+内存分配控制
+============
+
+该API在以下内核代码中:
+
+include/linux/gfp.h
+
+Slab缓存
+========
+
+此缓存非cpu片上缓存，请读者自行查阅资料。
+
+该API在以下内核代码中:
+
+include/linux/slab.h
+
+mm/slab.c
+
+mm/slab_common.c
+
+mm/util.c
+
+虚拟连续（内存页）映射
+======================
+
+该API在以下内核代码中:
+
+mm/vmalloc.c
+
+
+文件映射和页面缓存
+==================
+
+该API在以下内核代码中:
+
+mm/readahead.c
+
+mm/filemap.c
+
+mm/page-writeback.c
+
+mm/truncate.c
+
+include/linux/pagemap.h
+
+内存池
+======
+
+该API在以下内核代码中:
+
+mm/mempool.c
+
+DMA池
+=====
+
+DMA(Direct Memory Access，直接存储器访问)
+
+该API在以下内核代码中:
+
+mm/dmapool.c
+
+更多的内存管理函数
+==================
+
+该API在以下内核代码中:
+
+mm/memory.c
+
+mm/page_alloc.c
+
+mm/mempolicy.c
+
+include/linux/mm_types.h
+
+include/linux/mm.h
+
+include/linux/mmzone.h
-- 
2.27.0

