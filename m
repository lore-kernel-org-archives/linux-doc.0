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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BADDC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 17 Sep 2021 06:34:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4151860F4A
	for <linux-doc@archiver.kernel.org>; Fri, 17 Sep 2021 06:34:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236744AbhIQGfk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Sep 2021 02:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235411AbhIQGfj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Sep 2021 02:35:39 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66FCDC061574
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 23:34:18 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id f3-20020a17090a638300b00199097ddf1aso9353102pjj.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 23:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hFQq9ylQhu6xZOHZZzDyr2Xn3hKDOpUzYZP50nGs8xw=;
        b=iYT4kbzQ0x/iIGwll/qg/w+/U5zEnCf31PREfXykieSfWZiAkd5ezVFtUWrRlk2Bhg
         EzKcAvHf8A/mIWvcblZUnB9TVgkOM85+qTAsV8uaOxle4xDQeq67a2HXcwWcKk1+j6vH
         3q2BBOpdDcfdehPIMy8sTcGDltz2kk5O+ZxvIZmUHNOSNfk/+EC1C7ODnf6/AKnv3hhH
         +B1LYazmMBK8iCK9rycG+WJq//FRKnRXpWvtUMjw0mbawnDIbp7DAN0DSnBsD58BfIbx
         TEexgM6q+kRKYiSZ5qa/AuhnfhiYLeZEh7ylTfZ/pFVxR2sE9QZJmqYnqriQQlaA0ZoR
         oOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hFQq9ylQhu6xZOHZZzDyr2Xn3hKDOpUzYZP50nGs8xw=;
        b=RyD49JiFFC/UZtUeIaLdUMPcjtxYFq+AlRGKjMHFLEn1P8Cfh4SxoEd089mIWtWuKh
         BI7R3QH0Ut57TYOfF8HBV44dDR3JZxbmMI7yN5Okp0OS6vBpGkzVuIdYp5mPdEt7F4aE
         e4Exs4d1l9O3Gy9VVLrxEyU3BLNbr+39ygWQPg+WBeldgOfsLJ1Zh44pXVRL8E9b0TvH
         hQ5i33Iil6BcGO3YkGt9btkElrWkwEJC9bAH5PYtACm+pEdwNlEyNFI254NV0SlP8OO3
         hFClJasLRwbApmNzXDrsxT1i6UcrLY23p0UEmyj5igxUuYnJXUqIv5qhDO+REblRnafC
         sv2w==
X-Gm-Message-State: AOAM5335baMLaHTDhhjJh+fJwsLs9wZdbKfBf9IKl+aFt5hgj51DAaHg
        e2Oeyq0dxr54KF1+lP3T/DQ=
X-Google-Smtp-Source: ABdhPJx1K3zMhy2KNnAEhKducIEVOuwJHQV9SPmSXTMfSmygS6coTHemLzZAgTYgEvqCWHtcUzNfYQ==
X-Received: by 2002:a17:90a:198b:: with SMTP id 11mr10501921pji.209.1631860458030;
        Thu, 16 Sep 2021 23:34:18 -0700 (PDT)
Received: from localhost.localdomain ([8.47.69.169])
        by smtp.gmail.com with ESMTPSA id d4sm4723775pfv.21.2021.09.16.23.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 23:34:17 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v6 3/6] docs/zh_CN: add core-api mm-api translation
Date:   Fri, 17 Sep 2021 14:33:04 +0800
Message-Id: <2c3d01adcdaf9ad393a9cfbb18c34d18afae6ed5.1631846923.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1631846923.git.siyanteng@loongson.cn>
References: <cover.1631846923.git.siyanteng@loongson.cn>
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
index efc2fdd608ef..2adf1978f112 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -106,6 +106,7 @@ Todolist:
 
    memory-allocation
    unaligned-memory-access
+   mm-api
 
 Todolist:
 
@@ -113,7 +114,6 @@ Todolist:
    dma-api-howto
    dma-attributes
    dma-isa-lpc
-   mm-api
    genalloc
    pin_user_pages
    boot-time-mm
diff --git a/Documentation/translations/zh_CN/core-api/mm-api.rst b/Documentation/translations/zh_CN/core-api/mm-api.rst
new file mode 100644
index 000000000000..0ea43dc67953
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
+.. _cn_mm-api-gfp-flags:
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

