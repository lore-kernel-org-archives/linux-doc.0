Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11707C433ED
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 02:25:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D849561482
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 02:25:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhDYC0U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Apr 2021 22:26:20 -0400
Received: from m32-153.88.com ([43.250.32.153]:29732 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229514AbhDYC0U (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 24 Apr 2021 22:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=pruSMCYOpaK5GrpQdQBbz64jmGwWLdjbq62a3
        iF/J/8=; b=e+KuFa9yXKGqLD2b+ufD7A2A8lwKGRge6t1+X2VVkbqOJXbeZTq09
        trJlbbD6Zeb6UjZ2rScQBAjM5Rtg33iM5WtJcqfkjzkTeMcN8QvE0Pyy2APE2Igj
        0+4c+ZB5TMnGR4nUFYM4pQ+VetsG4IBa6D27YFEmd6DIjijWn6SEZg=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBHl1kd04RgfHoJAA--.27195S2;
        Sun, 25 Apr 2021 10:25:35 +0800 (CST)
Date:   Sun, 25 Apr 2021 10:25:33 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Subject: [PATCH v2 1/6] docs/zh_CN: Add translation zh_CN/maintainer/index.rst
Message-ID: <17f5e1dea82388e64b3c90024d50650b663d0046.1619278582.git.bobwxc@email.cn>
References: <cover.1619278582.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1619278582.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBHl1kd04RgfHoJAA--.27195S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW3KF45uF4kCFWkZw1rtFb_yoW8Ar45pF
        9FgrySk3WfXry7CrWfGF17JF15Ga4Skw4UJF4SgwnYqryDtF40yr1DtryDKFyxWrWfZFW5
        ZF4fKF4j9r4FkwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgFb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8JwCF04k20x
        vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIF
        yTuYvj4RRhFxUUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new translation
  Documentation/translations/zh_CN/maintainer/index.rst
and link it to zh_CN/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
---
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

