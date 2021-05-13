Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFA8C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 19:06:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB609613DF
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 19:06:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbhEMTHq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 15:07:46 -0400
Received: from [43.250.32.171] ([43.250.32.171]:57217 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S231461AbhEMTHp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 May 2021 15:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=OzRLsfukgFweckMuszp0szadAnv0Cs3ctSlJo
        fH3ZIo=; b=Z1wFXzaGRlHUd2bAcWzmMS91JuizgIQJOjaSzpNumB7rC4M/dPoKZ
        QIO9WWmC5x1/eAyzfpqXd78oOGyyEg7JJ1h/8WgmNpGKI4glA7m3mrgg8fWZ5J16
        agh76Yq3EtUi0/KhGEj9eK5a2LVezvsPAFaqD9QbpGUSnmaJMsTgdE=
Received: from bobwxc.top (unknown [112.96.109.117])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB3PkG2eJ1gSmQoAA--.34101S2;
        Fri, 14 May 2021 03:06:32 +0800 (CST)
Date:   Fri, 14 May 2021 03:06:30 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 1/6] docs/zh_CN: Add translation zh_CN/maintainer/index.rst
Message-ID: <224959c4cdcd4c6554035145d5cedcd244887552.1620932189.git.bobwxc@email.cn>
References: <cover.1620932189.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1620932189.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgB3PkG2eJ1gSmQoAA--.34101S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4kGw47urW5Kw1fWF48JFb_yoW8Aw13pF
        9FgrySkF1fXry7CrWfGF17JF15Ga4fCw4UJa1IgwnYqryqqF4vyF1DtryDKF97WrWrZFW5
        XF4fKF4j9r4Fy3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqqb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRRJPEDUU
        UUU==
X-Originating-IP: [112.96.109.117]
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
 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/maintainer/index.rst   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/maintainer/index.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index d56d6b7092e6..95c3f313cea1 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -72,11 +72,11 @@ TODOlist:
    dev-tools/index
    doc-guide/index
    kernel-hacking/index
+   maintainer/index
 
 TODOList:
 
 * trace/index
-* maintainer/index
 * fault-injection/index
 * livepatch/index
 * rust/index
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

