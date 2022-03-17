Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C42C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 06:51:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiCQGxB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 02:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbiCQGwr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 02:52:47 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4272BA27F6
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:31 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id a5so6102525pfv.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 23:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4kEM4artVm/mvQ3KfLCRer4segRMrAzktNpUPZ0u0QU=;
        b=Ky3EqqLz6k9esv01O/bOCgZVyoO2Xp/Kbd4PzLNfMiFuLFakB1Jgv4D8PhpiBOTJ7z
         Ac7xXt9SuTiD9YPpkF3Bn9v/VpJVxCGrtJ5QXz1RCxAqBf1ccKeRONLbilvKzJktdTtx
         b/om7N/kR7quvTN3ODt4qd1pvmGsLVXr9tuUBoZXfxIOug7iVmlXOjjLH4qpkEiD/X4f
         nIcpLUDoIkYEYgbLixkeqyIkvXm8FyDYKXUDes0dZK473GeRQ86wVZO9dhbixDf7hxDp
         hwEaO+bpBitfklckd65+H4H/UtTP5AEaTpyjrff846v9mVZ34p+22XLt2GByGQ7ksVSP
         VZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4kEM4artVm/mvQ3KfLCRer4segRMrAzktNpUPZ0u0QU=;
        b=dqrM1nGMdeuJfgLCqF54U6XQiuSefDa9vuxXwafcywFTswaqfWDtbiNT0ZS4unscam
         zAgSHw9X3RZfb5rr+2ZeDr8wkzidmc8oaq/75Sw76GcwMFL9tM7azOEQhg8v7jbjE46r
         pb/n4KW6eUmN6NfyAGQtmzmg6qhFmSP0r5pDLp/VA7Q4HxO/iudgFlR+vhypk+xkliLI
         Kj5ia8yPSeToPd5JpfGvN5I9ToB+OOFE9JctKuuD1b8hv0AbJ+Ek3FFftPc+RC3GQDqo
         A4Q85cAzY77MSDGMznXO8gCgyuzjRstFHRZpDH8JnUbSVlqmkqiFWiBKNaW+KDwM2juS
         ri5Q==
X-Gm-Message-State: AOAM532h2hjkrYfY+rxT7jCRiQzIqbJEaIVdgRlG0wteZlhzUwM0hoU3
        eMdYudytRtlXRFIIE0xF1+c=
X-Google-Smtp-Source: ABdhPJwciU0CFWewM7RpZK80CeojXVZ3jmU0moYHgjpipy5sO+WaLASziiTExPjbP3usjkRsX0cv1A==
X-Received: by 2002:a63:4d5e:0:b0:381:4050:9111 with SMTP id n30-20020a634d5e000000b0038140509111mr2535892pgl.9.1647499890715;
        Wed, 16 Mar 2022 23:51:30 -0700 (PDT)
Received: from localhost.localdomain (pcd454078.netvigator.com. [203.218.244.78])
        by smtp.gmail.com with ESMTPSA id k15-20020a63ab4f000000b00381eef69bfbsm3622152pgp.3.2022.03.16.23.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 23:51:30 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 12/12] docs/zh_CN: add vm zsmalloc translation
Date:   Thu, 17 Mar 2022 14:50:53 +0800
Message-Id: <7673f5199b8f28cb847fbaa9c44bf120fb6aebd7.1647498763.git.siyanteng@loongson.cn>
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

Translate .../vm/zsmalloc.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../translations/zh_CN/vm/zsmalloc.rst        | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/zsmalloc.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index e28d0e919bfe..c7148125e659 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -38,6 +38,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    remap_file_pages
    split_page_table_lock
    z3fold
+   zsmalloc
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -50,4 +51,3 @@ TODOLIST:
 * transhuge
 * unevictable-lru
 * vmalloced-kernel-stacks
-* zsmalloc
diff --git a/Documentation/translations/zh_CN/vm/zsmalloc.rst b/Documentation/translations/zh_CN/vm/zsmalloc.rst
new file mode 100644
index 000000000000..29e9c70a8eb6
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/zsmalloc.rst
@@ -0,0 +1,78 @@
+:Original: Documentation/vm/zs_malloc.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+========
+zsmalloc
+========
+
+这个分配器是为与zram一起使用而设计的。因此，该分配器应该在低内存条件下工作良好。特别是，
+它从未尝试过higher order页面的分配，这在内存压力下很可能会失败。另一方面，如果我们只
+是使用单（0-order）页，它将遭受非常高的碎片化 - 任何大小为PAGE_SIZE/2或更大的对象将
+占据整个页面。这是其前身（xvmalloc）的主要问题之一。
+
+为了克服这些问题，zsmalloc分配了一堆0-order页面，并使用各种"struct page"字段将它
+们链接起来。这些链接的页面作为一个单一的higher order页面，即一个对象可以跨越0-order
+页面的边界。代码将这些链接的页面作为一个实体，称为zspage。
+
+为了简单起见，zsmalloc只能分配大小不超过PAGE_SIZE的对象，因为这满足了所有当前用户的
+要求（在最坏的情况下，页面是不可压缩的，因此以"原样"即未压缩的形式存储）。对于大于这
+个大小的分配请求，会返回失败（见zs_malloc）。
+
+此外，zs_malloc()并不返回一个可重复引用的指针。相反，它返回一个不透明的句柄（无符号
+长），它编码了被分配对象的实际位置。这种间接性的原因是zsmalloc并不保持zspages的永久
+映射，因为这在32位系统上会导致问题，因为内核空间映射的VA区域非常小。因此，在使用分配
+的内存之前，对象必须使用zs_map_object()进行映射以获得一个可用的指针，随后使用
+zs_unmap_object()解除映射。
+
+stat
+====
+
+通过CONFIG_ZSMALLOC_STAT，我们可以通过 ``/sys/kernel/debug/zsmalloc/<user name>``
+看到zsmalloc内部信息。下面是一个统计输出的例子。::
+
+ # cat /sys/kernel/debug/zsmalloc/zram0/classes
+
+ class  size almost_full almost_empty obj_allocated   obj_used pages_used pages_per_zspage
+    ...
+    ...
+     9   176           0            1           186        129          8                4
+    10   192           1            0          2880       2872        135                3
+    11   208           0            1           819        795         42                2
+    12   224           0            1           219        159         12                4
+    ...
+    ...
+
+
+class
+	索引
+size
+	zspage存储对象大小
+almost_empty
+	ZS_ALMOST_EMPTY zspage的数量（见下文）。
+almost_full
+	ZS_ALMOST_FULL zspage的数量(见下图)
+obj_allocated
+	已分配对象的数量
+obj_used
+	分配给用户的对象的数量
+pages_used
+	为该类分配的页数
+pages_per_zspage
+	组成一个zspage的0-order页面的数量
+
+当n <= N / f时，我们将一个zspage分配给ZS_ALMOST_EMPTYfullness组，其中
+
+* n = 已分配对象的数量
+* N = zspage可以存储的对象总数
+* f = fullness_threshold_frac(即，目前是4个)
+
+同样地，我们将zspage分配给:
+
+* ZS_ALMOST_FULL  when n > N / f
+* ZS_EMPTY        when n == 0
+* ZS_FULL         when n == N
-- 
2.27.0

