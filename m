Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE23BC433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 07:13:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F255613B2
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 07:13:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237383AbhDMHNg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 03:13:36 -0400
Received: from m32-153.88.com ([43.250.32.153]:41362 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231223AbhDMHNg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 03:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=Xy6KXcjDr9l+rQ5E6PRp/XzdGx8xY0fI5a4V2
        bcRtEI=; b=QleRMULMAhAhGs92nzZXW9ffGL9OdQxw+yrhtg2Kda41qp+zoypFc
        cAdB0fsZF2ZhS0VJPFdnCR3MTp5Cs/d2RDH6IyFjeQD3jbBEo1VTmGyySvrxxJha
        1lhgJ8SlI12JnLiXMT8qEsE9GDqHlgDCWKRetOKdL4lfdc94TQQEQ0=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCHEySJRHVg5ydtAA--.59020S2;
        Tue, 13 Apr 2021 15:13:15 +0800 (CST)
Date:   Tue, 13 Apr 2021 15:13:13 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v5 5/7] docs/zh_CN: Add translation
 zh_CN/doc-guide/maintainer-profile.rst
Message-ID: <0ea1acfd30e8a0f2676981100e27513178cde06b.1618295149.git.bobwxc@email.cn>
References: <cover.1618295149.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1618295149.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgCHEySJRHVg5ydtAA--.59020S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWFy7CF4Uur1fuF4rWF47XFb_yoW5AFWrpF
        nIgrWfKF1vy34UCr1rKFW7CF15JayxGr4I9ws2q3sakr1vkr4kJr4DK34rXay3Wry8AFW5
        XF1SyrWrCw47ZrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgIb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_GF4l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
        0xZFpf9x07U1UDXUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add new translation
  Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/doc-guide/maintainer-profile.rst    | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst

diff --git a/Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst b/Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
new file mode 100644
index 000000000000..35c88e5b3d83
--- /dev/null
+++ b/Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
@@ -0,0 +1,43 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/doc-guide/maintainer-profile.rst
+
+:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+文档子系统维护人员条目概述
+==========================
+
+文档“子系统”是内核文档和相关基础设施的中心协调点。它涵盖了 Documentation/ 下
+的文件层级（Documentation/devicetree 除外）、scripts/ 下的各种实用程序，并且
+在某些情况下的也包括 LICENSES/ 。
+
+不过值得注意的是，这个子系统的边界比通常更加模糊。许多其他子系统维护人员需要
+保持对 Documentation/ 某些部分的控制，以便于可以更自由地做更改。除此之外，
+许多内核文档都以kernel-doc注释的形式出现在源代码中；这些注释通常（但不总是）
+由相关的子系统维护人员维护。
+
+文档子系统的邮件列表是<linux-doc@vger.kernel.org>。
+补丁应尽量针对docs-next树。
+
+提交检查单补遗
+--------------
+
+在进行文档更改时，您应当构建文档以测试，并确保没有引入新的错误或警告。生成
+HTML文档并查看结果将有助于避免对文档渲染结果的不必要争执。
+
+开发周期的关键节点
+------------------
+
+补丁可以随时发送，但在合并窗口期间，响应将比通常慢。文档树往往在合并窗口打开
+之前关闭得比较晚，因为文档补丁导致回归的风险很小。
+
+审阅节奏
+--------
+
+我（译注：指Jonathan Corbet <corbet@lwn.net>）是文档子系统的唯一维护者，我在
+自己的时间里完成这项工作，所以对补丁的响应有时会很慢。当补丁被合并时（或当我
+决定拒绝合并补丁时），我都会发送通知。如果您在发送补丁后一周内没有收到回复，
+请不要犹豫，发送提醒就好。
+
-- 
2.20.1

