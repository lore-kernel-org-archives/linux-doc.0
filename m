Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15D9C4332F
	for <linux-doc@archiver.kernel.org>; Thu,  8 Dec 2022 12:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbiLHM6U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Dec 2022 07:58:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiLHM6T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Dec 2022 07:58:19 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7A23E7F8BD
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 04:58:16 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8Cxl_Fn35FjyBwEAA--.9365S3;
        Thu, 08 Dec 2022 20:58:15 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_eFm35FjLBUoAA--.32634S2;
        Thu, 08 Dec 2022 20:58:15 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v1 07/13] docs/zh_CN: Update the translation of testing-overview to 6.1-rc8
Date:   Thu,  8 Dec 2022 20:58:45 +0800
Message-Id: <8a99b6f6ac2bbc834aad551b464a3d4a27d82630.1670502763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670502763.git.siyanteng@loongson.cn>
References: <cover.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_eFm35FjLBUoAA--.32634S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXFyfXrW5ArW3tFy8Jw48tFb_yoW5GF4Dpr
        yfG3srJFy2v343A34rKFyUJryrAFZ7GF4UtFs7Gw1IqFy7Aws5trWUKas5trZxX395JF98
        ZF4Fgryxur12kFUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
        w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2
        jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s02
        6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
        0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvE
        c7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
        AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
        vjxUVCD7UUUUU
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
index d6f2c65ed511..d53a326de93a 100644
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
+例如，用Coccinelle你可以从kmalloc(x * size, GFP_KERNEL)到
+``kmalloc_array(x, size, GFP_KERNEL)`` 进行大规模转换，这真的很有用。
+如果你只是创建一个Smatch警告，并试图把转换的工作推给维护者，他们会很恼火。
+你将不得不为每个警告争论是否真的可以溢出。
+
+Coccinelle不对变量值进行分析，而这正是Smatch的强项。另一方面，Coccinelle
+允许你用简单的方法做简单的事情。
-- 
2.31.1

