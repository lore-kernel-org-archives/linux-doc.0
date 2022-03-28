Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B90C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 09:59:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234394AbiC1KBI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 06:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240131AbiC1KBB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 06:01:01 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014B5546BA
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:59:21 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id b15so12134643pfm.5
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 02:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UW6hcBF7P5VaUqIdzaN5XxzgA+iSqNLL0y6WuRTvcu0=;
        b=fyFYWRelYcTSNCTiMZBmYOFN9biQkb7IH+lEqZuW7BoEDmI2hduuTbgwwRqqm9e4rr
         mT8SyNgmbXYgVXSeVEfY51uMw1hos8VI/IDBFnyo/PCpnSfReJP6p5+6wT/lFB//rQ0h
         vMuA6++T6T7UzyDpJShSXb+N+m/AyZFlHdTNGkr6yZIzLzfQE6lBz3lRCV2cXaINgr9e
         Dc4qAPNsXhptpv/gap4aOUvuXxDYTDBTCMSHb7PymfsveyiWyWCFdsGylaeFr/mh1CD4
         I4dkmmT/iS6G6FLWFdUOIqzHD9E96nVVyrrv9VEcOaYnWO9GjgptXlmYj8J1ywXXcuyc
         gfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UW6hcBF7P5VaUqIdzaN5XxzgA+iSqNLL0y6WuRTvcu0=;
        b=HX8jQwDMOXicGhZBoEyNrPqICigTQF+XNKMTPeyX8SJXGO/2I+i//u7GoDKtJU5eF5
         DEBWqua25Kw/SJIFVEQtSQ7QC4GlzSUxRO2W+t4f4mOMlzG0RUAggVCJQmrprrboX04r
         aYOEYqyA1YnZIVL5gaGr4raYmsKRMuciNIWNnOULFmfAe+w6QRxa3g8MCxW9R207xnVI
         aB4pbOKsEBeUtIznViIpRXkoeKd2XZWdWdGtgmQmA7kKl/hX+19Yf5PlXzZkafA15tpL
         mxcGhRbjk4jtdVsMMtbvQo9xGbnlSe+DQ9GJEZWYiozeZFPGwwf0yGk7IcGI5mrQXj9l
         E1sw==
X-Gm-Message-State: AOAM531AEZ1H0mm7h2yaaeh1A7TVY/R/PQuntjTy64syFimiCTGBpY91
        HDeZY1lw8fOkh28cw6TPQbY=
X-Google-Smtp-Source: ABdhPJw8q9VQAVvPZPaFd5WGkDYwlcykxIJ1mJcL1NCcOaLKvZJPP8WmOncLVwXZ4P3HUPGSFjN5DQ==
X-Received: by 2002:a63:3fc4:0:b0:380:c8be:38d9 with SMTP id m187-20020a633fc4000000b00380c8be38d9mr9782282pga.566.1648461560452;
        Mon, 28 Mar 2022 02:59:20 -0700 (PDT)
Received: from localhost.localdomain (111-250-2-155.dynamic-ip.hinet.net. [111.250.2.155])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a174800b001c7d8b160f0sm10526637pjm.51.2022.03.28.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 02:59:20 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 11/12] docs/zh_CN: add vm z3fold translation
Date:   Mon, 28 Mar 2022 17:59:53 +0800
Message-Id: <b9161a3c6a476d06885b2873c1ede5d5538938a6.1648458742.git.siyanteng@loongson.cn>
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

Translate .../vm/z3fold.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../translations/zh_CN/vm/z3fold.rst          | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/z3fold.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 8c7d0b1e5c3e..e28d0e919bfe 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -37,6 +37,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    page_table_check
    remap_file_pages
    split_page_table_lock
+   z3fold
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -49,5 +50,4 @@ TODOLIST:
 * transhuge
 * unevictable-lru
 * vmalloced-kernel-stacks
-* z3fold
 * zsmalloc
diff --git a/Documentation/translations/zh_CN/vm/z3fold.rst b/Documentation/translations/zh_CN/vm/z3fold.rst
new file mode 100644
index 000000000000..57204aa08caa
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/z3fold.rst
@@ -0,0 +1,31 @@
+:Original: Documentation/vm/z3fold.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+======
+z3fold
+======
+
+z3fold是一个专门用于存储压缩页的分配器。它被设计为每个物理页最多可以存储三个压缩页。
+它是zbud的衍生物，允许更高的压缩率，保持其前辈的简单性和确定性。
+
+z3fold和zbud的主要区别是:
+
+* 与zbud不同的是，z3fold允许最大的PAGE_SIZE分配。
+* z3fold在其页面中最多可以容纳3个压缩页面
+* z3fold本身没有输出任何API，因此打算通过zpool的API来使用
+
+为了保持确定性和简单性，z3fold，就像zbud一样，总是在每页存储一个整数的压缩页，但是
+它最多可以存储3页，不像zbud最多可以存储2页。因此压缩率达到2.7倍左右，而zbud的压缩
+率是1.7倍左右。
+
+不像zbud（但也像zsmalloc），z3fold_alloc()那样不返回一个可重复引用的指针。相反，它
+返回一个无符号长句柄，它编码了被分配对象的实际位置。
+
+保持有效的压缩率接近于zsmalloc，z3fold不依赖于MMU的启用，并提供更可预测的回收行
+为，这使得它更适合于小型和反应迅速的系统。
-- 
2.27.0

