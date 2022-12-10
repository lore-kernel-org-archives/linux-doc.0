Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B86C4332F
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 03:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiLJD0I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 22:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiLJD0H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 22:26:07 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 41C3725EAF
        for <linux-doc@vger.kernel.org>; Fri,  9 Dec 2022 19:26:06 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8BxE_BN_JNjKZgEAA--.11052S3;
        Sat, 10 Dec 2022 11:26:05 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxr+BM_JNjw_IpAA--.37698S2;
        Sat, 10 Dec 2022 11:26:04 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 07/13] docs/zh_CN: Update the translation of testing-overview to 6.1-rc8
Date:   Sat, 10 Dec 2022 11:26:34 +0800
Message-Id: <f3ae5e63502fed7e904f5a801168d2324c71f014.1670642548.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670642548.git.siyanteng@loongson.cn>
References: <cover.1670642548.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxr+BM_JNjw_IpAA--.37698S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXFyfXrW5ArW3tFy8Jw48tFb_yoW5GFyDpr
        yfW3srJFy2vry3A34FkFyUJryrAFZ7GF4UtFs7Kw1xXFWxAws5trs8KF95trZxZ395JF98
        ZF4Fgryxur12kFDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        baAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
        M2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
        CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2
        z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7IU02ZX5UUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit a32d5c0fc12b ("Documentation: dev-tools:
Enhance static analysis section with discussion")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/dev-tools/testing-overview.rst      | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
index d6f2c65ed511..af65e7e93c02 100644
--- a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
+++ b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
@@ -132,3 +132,30 @@ Documentation/dev-tools/kcov.rst 是能够构建在内核之中，用于在每
 
  不过要注意的是，静态分析工具存在**假阳性**的问题。在试图修复错误和警
  告之前，需要仔细评估它们。
+
+何时使用Sparse和Smatch
+----------------------
+
+Sparse做类型检查，例如验证注释的变量不会导致无符号的错误，检测
+``__user`` 指针使用不当的地方，以及分析符号初始化器的兼容性。
+
+Smatch进行流程分析，如果允许建立函数数据库，它还会进行跨函数分析。
+Smatch试图回答一些问题，比如这个缓冲区是在哪里分配的？它有多大？这
+个索引可以由用户控制吗？这个变量比那个变量大吗？
+
+一般来说，在Smatch中写检查比在Sparse中写检查要容易。尽管如此，
+Sparse和Smatch的检查还是有一些重叠的地方。
+
+Smatch和Coccinelle的强项
+------------------------
+
+Coccinelle可能是最容易写检查的。它在预处理器之前工作，所以用Coccinelle
+检查宏中的错误更容易。Coccinelle还能为你创建补丁，这是其他工具无法做到的。
+
+例如，用Coccinelle你可以从 ``kmalloc_array(x, size, GFP_KERNEL)``
+到 ``kmalloc_array(x, size, GFP_KERNEL)`` 进行大规模转换，这真的很
+有用。如果你只是创建一个Smatch警告，并试图把转换的工作推给维护者，他们会很
+恼火。你将不得不为每个警告争论是否真的可以溢出。
+
+Coccinelle不对变量值进行分析，而这正是Smatch的强项。另一方面，Coccinelle
+允许你用简单的方法做简单的事情。
-- 
2.31.1

