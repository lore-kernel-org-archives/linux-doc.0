Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C14C43334
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 09:23:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbiGYJX3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 05:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbiGYJX2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 05:23:28 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 36109BE0C
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 02:23:27 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn+MFYd5iDV02AA--.29501S2;
        Mon, 25 Jul 2022 17:23:17 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH 4/8] Docs/zh_CN: Update the translation of testing-overview to 5.19-rc8
Date:   Mon, 25 Jul 2022 17:23:55 +0800
Message-Id: <61d805454b69bebfcba7b6df1b94d3811edefddc.1658740151.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1658740151.git.siyanteng@loongson.cn>
References: <cover.1658740151.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn+MFYd5iDV02AA--.29501S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWry5Xw1rWw47KryxtF47urg_yoW5WF17pF
        ZFk3s3KF129ry7J34IkFyDZryrCF97Xw13KF97G3WSvr18JFWkKwsrt34qqa9rWryfAFya
        vFWrWrW09r12kFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK
        8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbgyCJUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit 12379401c000 ("Documentation: dev-tools:
Add a section for static analysis tools")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/dev-tools/testing-overview.rst      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
index b7a1d13da6c6..d6f2c65ed511 100644
--- a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
+++ b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
@@ -107,3 +107,28 @@ Documentation/dev-tools/kcov.rst 是能够构建在内核之中，用于在每
 之后你就能确保这些错误在测试过程中都不会发生了。
 
 一些工具与KUnit和kselftest集成，并且在检测到问题时会自动打断测试。
+
+静态分析工具
+============
+
+除了测试运行中的内核，我们还可以使用**静态分析**工具直接分析内核的源代
+码（**在编译时**）。内核中常用的工具允许人们检查整个源代码树或其中的特
+定文件。它们使得在开发过程中更容易发现和修复问题。
+
+ Sparse可以通过执行类型检查、锁检查、值范围检查来帮助测试内核，此外还
+ 可以在检查代码时报告各种错误和警告。关于如何使用它的细节，请参阅
+ Documentation/translations/zh_CN/dev-tools/sparse.rst。
+
+ Smatch扩展了Sparse，并提供了对编程逻辑错误的额外检查，如开关语句中
+ 缺少断点，错误检查中未使用的返回值，忘记在错误路径的返回中设置错误代
+ 码等。Smatch也有针对更严重问题的测试，如整数溢出、空指针解除引用和内
+ 存泄漏。见项目页面http://smatch.sourceforge.net/。
+
+ Coccinelle是我们可以使用的另一个静态分析器。Coccinelle经常被用来
+ 帮助源代码的重构和并行演化，但它也可以帮助避免常见代码模式中出现的某
+ 些错误。可用的测试类型包括API测试、内核迭代器的正确使用测试、自由操
+ 作的合理性检查、锁定行为的分析，以及已知的有助于保持内核使用一致性的
+ 进一步测试。详情请见Documentation/dev-tools/coccinelle.rst。
+
+ 不过要注意的是，静态分析工具存在**假阳性**的问题。在试图修复错误和警
+ 告之前，需要仔细评估它们。
-- 
2.31.1

