Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AECEC433EF
	for <linux-doc@archiver.kernel.org>; Sat,  5 Mar 2022 16:25:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbiCEQ0L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Mar 2022 11:26:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbiCEQ0K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Mar 2022 11:26:10 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A747C1E95FD
        for <linux-doc@vger.kernel.org>; Sat,  5 Mar 2022 08:25:20 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id e15so8585220pfv.11
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 08:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nqIX1qnYrUPKVvdpHSTLKDYWwc4dqZbYbNsBwD0Iyfs=;
        b=g2KwTPgjO/BdRgWhqZwtflwswDrfH2QzXp8BRtsmoVar8152B2hYVQJdVg5x3k3+g3
         28+ESH7DYPNMVWx7+/EZA+vqlCpeM3C2bhyg/ZKAa1JAgz0RJXEjJsMuW+L8ltX8qHDL
         1o4hwj6Sw2fJxPaQIxk862MmGlHREIBt1SO0Kx3TOKRVAKdSPdtpgtAZNW/9bhmYO7Kx
         BgjO1nusuzPAB67YU8TYVB3/YdwRswdIKGrRRYXD7Zc83x1C3g06XZEjcF/JqxXkD6UT
         sot1i/oJz5ahykOFGIqSxusUByRPhAibQel66LdThQk1/HAo0Ql2izyDu4KjDoMxhSRo
         Kefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nqIX1qnYrUPKVvdpHSTLKDYWwc4dqZbYbNsBwD0Iyfs=;
        b=39mHi6Oqqg2Crqob6PoKEmfJEtj8600BfRZ48WIjVJvcY3sL6ma0Tlq5ueP7m0hl/u
         RbgzH6tPRgx+lmsIPG4iTgGi6T4F4C+2YICPFJn9sl0jz59UbMuaY3QQEvxD1REuWvCh
         CYjMo5cZ5rToXyKHuuc0NQjVuwW4ThHXkpbj+A5reSH8WNxy3+rbvnLs3zGMtxQzpK4L
         M72SBgDvSnXB47EGYT+BleyD2+pL0/GjMLIU4IfOmCelGI3Y+P9IBd73Jt8z8g4zOVGy
         qCmpeQMIvSJaKR+hT/LkIQSv/RU1zI7NzUnJdbjS1Fw929tJfyKHqMYBjc9wgn9YYQTG
         Wvsg==
X-Gm-Message-State: AOAM530i67U41bIv3gatQtQjNA6vihqhW3ZjErS//gA9QaYLwUL0Y/df
        uYzuQhR6a3jAm9xP2xUeRMs=
X-Google-Smtp-Source: ABdhPJwsOWkSjpYVHfk2kHtGf9al0XDf5ga/UKv6pS45hWey/zOlv6Ilx52ckB+B4HAEkM4cjCY/5Q==
X-Received: by 2002:a63:8749:0:b0:37f:f8e1:1877 with SMTP id i70-20020a638749000000b0037ff8e11877mr2686863pge.529.1646497518723;
        Sat, 05 Mar 2022 08:25:18 -0800 (PST)
Received: from localhost.localdomain (42-200-190-71.static.imsbiz.com. [42.200.190.71])
        by smtp.gmail.com with ESMTPSA id x7-20020a17090a1f8700b001bf1db72189sm6106269pja.23.2022.03.05.08.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 08:25:18 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 11/12] docs/zh_CN: add vm z3fold translation
Date:   Sun,  6 Mar 2022 00:26:11 +0800
Message-Id: <a7d13b939b40512a773de03ea1b615639a0a9817.1646496448.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646496448.git.siyanteng@loongson.cn>
References: <cover.1646496448.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/z3fold.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../translations/zh_CN/vm/z3fold.rst          | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/z3fold.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 343a82b56ec2..fb9a6aaf2b57 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -36,6 +36,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    page_table_check
    remap_file_pages
    split_page_table_lock
+   z3fold
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -48,5 +49,4 @@ TODOLIST:
 * transhuge
 * unevictable-lru
 * vmalloced-kernel-stacks
-* z3fold
 * zsmalloc
diff --git a/Documentation/translations/zh_CN/vm/z3fold.rst b/Documentation/translations/zh_CN/vm/z3fold.rst
new file mode 100644
index 000000000000..5fe0f386c74e
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
+不像zbud（但也像zsmalloc），z3fold_alloc()不返回一个可重复引用的指针。相反，它
+返回一个无符号长句柄，它编码了被分配对象的实际位置。
+
+保持有效的压缩率接近于zsmalloc，z3fold不依赖于MMU的启用，并提供更可预测的回收行
+为，这使得它更适合于小型和响应关键的系统。
-- 
2.27.0

