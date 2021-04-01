Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B507C43460
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 07:06:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3575D610E5
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 07:06:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhDAHGM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 03:06:12 -0400
Received: from m32-153.88.com ([43.250.32.153]:29378 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233050AbhDAHFt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 03:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=aon9spnwMH7lma0qTufIT8fGdBbTbuKj79HBi
        Bx8VNM=; b=hHxHfJQdO49DS6cpJiHUr/+lvXnbrkG9q4Ea/G/aBvd8myKK56LAl
        sGnt3NN15rOSpDRgTCY7kSp/MnU0cNKImFPaZO9GgUKpLvbtfL6x2a0SC68qr7/L
        CcAC+uKCXUtq273c3dbycl9B0SimvxPEGTlH69zzF0naRLsNpk2nAg=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBn8iLIcGVgC7lUAA--.1170S2;
        Thu, 01 Apr 2021 15:05:45 +0800 (CST)
Date:   Thu, 1 Apr 2021 15:05:44 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 1/5] docs/zh_CN: Add translation zh_CN/doc-guide/index.rst
Message-ID: <066b972c0ef496004dcd9a2c6adff4a53504b600.1617260163.git.bobwxc@email.cn>
References: <cover.1617260163.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1617260163.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBn8iLIcGVgC7lUAA--.1170S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtrWDCr18ArWrKr13AFWxCrg_yoWkJFc_Aw
        n7XFWvyay5XF97XFW8Zr18AryIkF4fCF4qkFs8t398Z3yUJ398GF1vqF95Za18Wr4a9ry5
        CryDWr1fXr13KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYkYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r4xMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
        0xZFpf9x07U1UDXUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add new translation
  Documentation/translations/zh_CN/doc-guide/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/doc-guide/index.rst    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/doc-guide/index.rst

diff --git a/Documentation/translations/zh_CN/doc-guide/index.rst b/Documentation/translations/zh_CN/doc-guide/index.rst
new file mode 100644
index 000000000000..b835c8d95f0e
--- /dev/null
+++ b/Documentation/translations/zh_CN/doc-guide/index.rst
@@ -0,0 +1,30 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/doc-guide/index.rst
+
+:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+.. _doc_guide_zh:
+
+==================
+如何编写内核文档
+==================
+
+.. toctree::
+   :maxdepth: 1
+
+   sphinx
+   kernel-doc
+
+TodoList:
+
+* parse-headers
+* contributing
+* maintainer-profile
+
+.. only::  子项目与HTML
+
+   目录
+   =======
+
+   * :ref:`genindex`
-- 
2.20.1

