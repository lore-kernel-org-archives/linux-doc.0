Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10369C433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C27E5613A9
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236311AbhDGHwJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 03:52:09 -0400
Received: from [43.250.32.171] ([43.250.32.171]:27543 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S234992AbhDGHwI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 03:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=Xf8xUTu02zhATxfglxL1AHPj0Fw5Br2XU7CKM
        eg5xGw=; b=QV/fDzg1Fl1buLCUFrtAOfP7e9fdHUZAMdb0gNgvFDfSDgfGlGmH6
        UoBmaf7lI16pYKlmHEgxvZ6oM1eqAZuZbK4KyXSEJtFFc2Yq0nwuotnBUGl5m70h
        PuguuJnDHdpi0g6hjwllB9Qtx24frzVijShpcdPg1S2W+ITlWanDqg=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgC3KtGZZG1gJV9QAA--.50037S2;
        Wed, 07 Apr 2021 15:51:55 +0800 (CST)
Date:   Wed, 7 Apr 2021 15:51:53 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v3 7/8] docs/zh_CN: Add translation zh_CN/doc-guide/index.rst
Message-ID: <5d5927d92dc927af32fee2075443331627a776ca.1617699755.git.bobwxc@email.cn>
References: <cover.1617699755.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1617699755.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgC3KtGZZG1gJV9QAA--.50037S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtrWDCr18ArWrtw1fWF4fAFb_yoWkWFb_Aw
        n7XFWkC3yUXF97WFy8uF18AryxCF4xCF4qkF45t398X3yUJ39xJF1kXrn5XF48Grsxury5
        Cr1DWr1fXrnxKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYAYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_GF4l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73
        UjIFyTuYvjxUUJ5rDUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add new translation
  Documentation/translations/zh_CN/doc-guide/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/doc-guide/index.rst    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/doc-guide/index.rst

diff --git a/Documentation/translations/zh_CN/doc-guide/index.rst b/Documentation/translations/zh_CN/doc-guide/index.rst
new file mode 100644
index 000000000000..4dead0dca713
--- /dev/null
+++ b/Documentation/translations/zh_CN/doc-guide/index.rst
@@ -0,0 +1,27 @@
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
+   parse-headers
+   contributing
+   maintainer-profile
+
+.. only::  子项目与HTML
+
+   目录
+   =======
+
+   * :ref:`genindex`
-- 
2.20.1

