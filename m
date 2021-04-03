Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8100BC433B4
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 01:24:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 583F3611AC
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 01:24:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236385AbhDCBY1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Apr 2021 21:24:27 -0400
Received: from m32-153.88.com ([43.250.32.153]:24792 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236299AbhDCBYY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Apr 2021 21:24:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=fZT26DkncR+INA8TQ+SCHB6+hFnqH7TsCzfcK
        Z2Ngxo=; b=AH6+e6JTTrsFBscUiCGebmDSoeqP8q0hODlcbSk6xnN+WqtwfXetl
        LRANVHzd39SJtL5t1RsgF+SZWzsB6+RIRejdk+ECcBy4N99lxDb3DnYxMF7Xo+Bv
        fYpBnLoaCrmED1mfbtpXFhaAs9uuOyJvUEx3XkVskwqfl7HX03psXY=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgA3wyPAw2dgBoNYAA--.10619S2;
        Sat, 03 Apr 2021 09:24:17 +0800 (CST)
Date:   Sat, 3 Apr 2021 09:24:15 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v2 2/5] docs/zh_CN: Link zh_CN/doc-guide to zh_CN/index.rst
Message-ID: <fdc591a9f5449aa59269f6d9667c8c5d28b77567.1617412012.git.bobwxc@email.cn>
References: <cover.1617412012.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1617412012.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgA3wyPAw2dgBoNYAA--.10619S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5y7k0a2IF6F4UM7kC6x804xWl1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
        JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
        W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4
        vE14v_KwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCa
        FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
        Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
        6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
        0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
        cSsGvfC2KfnxnUUI43ZEXa7xRRt8n7UUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add zh_CN/doc-guide entry in zh_CN/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 Documentation/translations/zh_CN/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index 4fdd57417ffb..4258006f4763 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -18,6 +18,7 @@
 
    admin-guide/index
    process/index
+   doc-guide/index
    kernel-hacking/index
    filesystems/index
    arm64/index
-- 
2.20.1

