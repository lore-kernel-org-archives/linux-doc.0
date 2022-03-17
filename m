Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43566C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 06:51:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbiCQGw7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 02:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiCQGwp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 02:52:45 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3259513F12
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:28 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id u17so6023393pfk.11
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tn7tJ+mMVpKDDMLAiPTjnP/pkwXC10AqVVyey3tA/mM=;
        b=Sbx1gqmY+pwDBouqbjducxJsR+6wmc10nIC2J6dWX+9zCpeKBNQ9y2Vnsi7PQpqh8b
         EUZ1nQfxIpTmHNKJd2EGGQEWnQjkQ1ad54Fc/Bmf8wM8vfoi9qr3C0bz4JK8CQdLRWuy
         2NJL8xjaHNfDSZFU9r/LdtxS2mr0cyuxc8PLECQIhiFnUXD6s2z/B1AEvxKNlZBDZnt6
         GSCR8e+tHr5HbYRYjKCbiV9dA7+AcwYd4djNZ6aVLmXzwUGq/xnc7WkdIrgNME9XzDGI
         gkSDlJU6f7jA/VaJ1a02fJp8Hrmx92qDsghfzPLJUnKGcStmRI2rlgq3jhcP64m/gUId
         /oAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tn7tJ+mMVpKDDMLAiPTjnP/pkwXC10AqVVyey3tA/mM=;
        b=Ihqqo2A0QKd/T8itnUzIzObfJCplA3EEcnXf3SsMXgAUZ/tLse9GFkrAPmJI2zR3Mu
         loqVdGcWKAfN0rc5twBSNkbgPvVEyK6i5nZjosHL5zwBL+FxHdv5vOjUIujdShoM1PqX
         Xx8UcWre2kQLmao0S153WOXLDjCvVtQJWUu+G8fRSWkZj/RodjbgVZtg/WQaZ9nIbLoI
         sfkrhRu4i/VNT+TwG7mlhEnl7Q8oLEOg/Ab5T0rUB5mQY32wjKHN5Pu05aCSCl+11pE6
         eOLTrTPxcsNr7v/35TBlGj8sWIEmcbmlMzZrlPmI1zsbYOwpyhmEEB57kNQDdJ1lWMrq
         jVTQ==
X-Gm-Message-State: AOAM532yXWQGorWG8d2xhR4kWs1YhGiHLPYY5Mupm5VqyMJvMa5DOBMH
        xoccbRckAxyCwfa2d0pbMb4=
X-Google-Smtp-Source: ABdhPJzyoLf7Hhdxi9CiBdcEuYFImSYhnI8ND2LncC76ulCGuNYC1ZMTpdbmf+TPuSC1aGUfOuk4RQ==
X-Received: by 2002:a05:6a02:193:b0:375:65a5:2fcd with SMTP id bj19-20020a056a02019300b0037565a52fcdmr2554458pgb.288.1647499887678;
        Wed, 16 Mar 2022 23:51:27 -0700 (PDT)
Received: from localhost.localdomain (pcd454078.netvigator.com. [203.218.244.78])
        by smtp.gmail.com with ESMTPSA id k15-20020a63ab4f000000b00381eef69bfbsm3622152pgp.3.2022.03.16.23.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 23:51:27 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 11/12] docs/zh_CN: add vm z3fold translation
Date:   Thu, 17 Mar 2022 14:50:52 +0800
Message-Id: <47e74b76b6b375d01c1e387f386faa2ef337fc20.1647498763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1647498763.git.siyanteng@loongson.cn>
References: <cover.1647498763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../vm/z3fold.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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
index 000000000000..fd0f1ac850d7
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
+为，这使得它更适合于小型和响应关键的系统。
-- 
2.27.0

