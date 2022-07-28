Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C407C04A68
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 05:07:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbiG1FHZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jul 2022 01:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiG1FHY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jul 2022 01:07:24 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9ADD942AF6
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 22:07:23 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxWeCCGeJiBTo+AA--.41718S2;
        Thu, 28 Jul 2022 13:07:15 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH v2 4/8] Docs/zh_CN: Update the translation of testing-overview to 5.19-rc8
Date:   Thu, 28 Jul 2022 13:07:48 +0800
Message-Id: <b9911916446f858fe95e4d4bfeaecdab14bc0b6a.1658983157.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1658983157.git.siyanteng@loongson.cn>
References: <cover.1658983157.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxWeCCGeJiBTo+AA--.41718S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWry5Xw1rWw47KryxtF47urg_yoW5Ww18pF
        ZFk3s3KF129r17G34IkFyDZryrCF97Zw13KF9rG3WSvr18JF4kKrsrt34vqa9rWryfAFya
        vFWrWrW09w12kFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
        628vn2kIc2xKxwCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
        v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
        1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
        AIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1U
        MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
        VFxhVjvjDU0xZFpf9x0JUGZXrUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit 12379401c000 ("Documentation: dev-tools:
Add a section for static analysis tools")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
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

