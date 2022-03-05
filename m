Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BF5C433F5
	for <linux-doc@archiver.kernel.org>; Sat,  5 Mar 2022 16:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiCEQ0M (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Mar 2022 11:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbiCEQ0M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Mar 2022 11:26:12 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7035C1EBA98
        for <linux-doc@vger.kernel.org>; Sat,  5 Mar 2022 08:25:22 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 6so5489972pgg.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8SRbN7nx2fMQAWrEvGNzCXR7mDWX6WsD2vPxTMBC5pg=;
        b=aP8QW9tPYBn5K+DFfBIqHdGb4g0mx80lea4Wg+Fh3ZvraNwGrYzgrrUtHX3nX6+T0Z
         E9MnPAahewsoWIi2EFKDK74uLtX8zgGOOnty5PdXlnlhAmWGduRT6Pl7+tsmKOhR+Kqu
         sXYIARbP9Mufn+/OBwXlrGQiVQNY97my/DIp1ddY0bdVA9mxaKLd3jCCCOLeiHEXl5Mc
         Po37qx3FKQWzRG2/FqeuKfUrD8jRZSO3smr5aPN4m6NX3qDPES4dikB2rSSAvAJRbuwb
         BX2GVHygqVoQbV3hotTZO27S/H9cESjqwOUuhXQsOwdwi2sGBb9dIqt7nOktNed+23qi
         wCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8SRbN7nx2fMQAWrEvGNzCXR7mDWX6WsD2vPxTMBC5pg=;
        b=beSpoj0u6FniIUdn9/UHOKdtbICdkO16VqY0oMaiJo0hAn1gDK5LM76zxIGwRt+eee
         QfG1GMJllw/oFNvbhz6xF+CWxT6nRm2kpY9U/rvo6FnTW9l5omWTXjmcOBURD/s6VJB5
         jEbnK+9jn7xS1binUCO8htN3uPWFgKwEyaxkUO/IArYjyDOq5buz9iuMI9tB3xI/SIJE
         fydVq47Rc9Fm1jjnePlL7teWpT9GWvr1/0elmZsWBjVcRxodYU8Nr5J95OBIdgQIq8cJ
         RmDnEvm4WcVAyj1UYoqhDLFz7y05TShAH8bLDOAayccDEwC1ZTniywV3PhK7AVw5ayVf
         Wx0Q==
X-Gm-Message-State: AOAM532UnN7rvDiMlv8hMbhltT+TSIwVgRd81/mnjX9WIFc0ciCq8JtP
        PSTMrSOXumDo5QsQPX+r7vo=
X-Google-Smtp-Source: ABdhPJzsn+GuEDiihaxWPSFqQM1vpkX16OyOEhvK3PqD5a2pMeoOwAeQnpQD+LJT4doXPiQoneM1bA==
X-Received: by 2002:a63:1d45:0:b0:37e:d39e:b78a with SMTP id d5-20020a631d45000000b0037ed39eb78amr3233863pgm.410.1646497521892;
        Sat, 05 Mar 2022 08:25:21 -0800 (PST)
Received: from localhost.localdomain (42-200-190-71.static.imsbiz.com. [42.200.190.71])
        by smtp.gmail.com with ESMTPSA id x7-20020a17090a1f8700b001bf1db72189sm6106269pja.23.2022.03.05.08.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 08:25:21 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 12/12] docs/zh_CN: add vm zsmalloc translation
Date:   Sun,  6 Mar 2022 00:26:12 +0800
Message-Id: <ae2a085bda9c86f08789b0657f5fe3afe716ba65.1646496448.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646496448.git.siyanteng@loongson.cn>
References: <cover.1646496448.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/zsmalloc.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |  2 +-
 .../translations/zh_CN/vm/zsmalloc.rst        | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/zsmalloc.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index fb9a6aaf2b57..efd298865c3f 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -37,6 +37,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    remap_file_pages
    split_page_table_lock
    z3fold
+   zsmalloc
 
 TODOLIST:
 * arch_pgtable_helpers
@@ -49,4 +50,3 @@ TODOLIST:
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

