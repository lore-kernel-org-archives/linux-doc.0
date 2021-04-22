Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7C4C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 22 Apr 2021 12:26:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28C5661152
	for <linux-doc@archiver.kernel.org>; Thu, 22 Apr 2021 12:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235791AbhDVM1Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Apr 2021 08:27:16 -0400
Received: from m32-153.88.com ([43.250.32.153]:56540 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230510AbhDVM1P (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Apr 2021 08:27:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=2ee5gFPXnDCCkyRrXA2KheqkrKXje2E9PgIkq
        Ov8u1o=; b=U82sJP9QCsZCxcbySTbH5JLsVm6BFz+FXlTmwaAs8Y1JFBNR+2Bvt
        d8EpOftGSv9UJ9DUHxCoOnO8sXgGycJRH8iphu1/RgEogPOQgX950nwvXf0x+F/G
        bA/v1dBRcZ3iw3TR138obnosSWYgSXLFiTaPR54kOvQle73EOVEfLE=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAHV1l4a4Fg7VYEAA--.12643S2;
        Thu, 22 Apr 2021 20:26:34 +0800 (CST)
Date:   Thu, 22 Apr 2021 20:26:32 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Subject: [PATCH 1/6] docs/zh_CN: Add translation zh_CN/maintainer/index.rst
Message-ID: <17f5e1dea82388e64b3c90024d50650b663d0046.1619093668.git.bobwxc@email.cn>
References: <cover.1619093668.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1619093668.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAHV1l4a4Fg7VYEAA--.12643S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW3KF45uF4kCFWkZw1rtFb_yoW8ArW8pF
        nFgrySk3WfXry7CrWfGF17JF15Ga4Skw4UJF4SgwnYqryqqF40yr1Dtr9rKFyxWrWfZFW5
        ZF4fKFWj9r4F9aUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgIb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Xr1l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
        0xZFpf9x07UY_M-UUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new translation
  Documentation/translations/zh_CN/maintainer/index.rst
and link it to zh_CN/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
Todolist in this file will be changed one-by-one in followed [Patch 5-6/6]

 Documentation/translations/zh_CN/index.rst    |  1 +
 .../translations/zh_CN/maintainer/index.rst   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/maintainer/index.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index ee6b20ca9080..3bfecfe179b8 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -21,6 +21,7 @@
    dev-tools/index
    doc-guide/index
    kernel-hacking/index
+   maintainer/index
    filesystems/index
    arm64/index
    sound/index
diff --git a/Documentation/translations/zh_CN/maintainer/index.rst b/Documentation/translations/zh_CN/maintainer/index.rst
new file mode 100644
index 000000000000..4ce27c12f370
--- /dev/null
+++ b/Documentation/translations/zh_CN/maintainer/index.rst
@@ -0,0 +1,19 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/maintainer/index.rst
+
+==============
+内核维护者手册
+==============
+
+本文档本是内核维护者手册的首页。
+本手册还需要大量完善！请自由提出（和编写）本手册的补充内容。
+*译注：指英文原版*
+
+TODOList:
+
+-   configure-git
+-   rebasing-and-merging
+-   pull-requests
+-   maintainer-entry-profile
+-   modifying-patches
-- 
2.20.1

