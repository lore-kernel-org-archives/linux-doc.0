Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD43C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 07:13:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E288613B2
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 07:13:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237382AbhDMHNu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 03:13:50 -0400
Received: from [43.250.32.171] ([43.250.32.171]:57835 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S231223AbhDMHNt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 03:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=rfWQ4lj+3AccDEvhIj3d9+SDD2/i0ywV17q2d
        i635lc=; b=kYIWrDLEXrJw6BU6oxOfrcxTWzJLaJIADSW+0VIDH5F5zZPXsVbZQ
        rxZVOB2Ul9Iy8CZwqNianPwFZ4hMeKJyQHssf7DhqKQ26yboR8l3KaWrFAo1WrHf
        7Fvm8+YFuTXX0LJfuN8UwBg2I9ExlYoK6k5R8J/hYmF23bPsCNzHMk=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDHOdCWRHVgmIZaAA--.8629S2;
        Tue, 13 Apr 2021 15:13:28 +0800 (CST)
Date:   Tue, 13 Apr 2021 15:13:26 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v5 6/7] docs/zh_CN: Add translation zh_CN/doc-guide/index.rst
Message-ID: <4a01400c3d65b2f7eb1c1bebd3a0e102ed29208f.1618295149.git.bobwxc@email.cn>
References: <cover.1618295149.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1618295149.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDHOdCWRHVgmIZaAA--.8629S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtrWDCr18ArWrtw1fWF4fAFb_yoWkXFX_Aw
        n7XFWvkay5XF97WFW8uF18AryxCF4xCF4qkF45t39xX3yUt39xJF1kXF9Yva18Wrsxury5
        Cr1DWrn3XrnxKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYxYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8CwCF04k20x
        vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7IUUrb15UUUUU==
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
index 000000000000..5151953c196f
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
+================
+如何编写内核文档
+================
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
+   ====
+
+   * :ref:`genindex`
-- 
2.20.1

