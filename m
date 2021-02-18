Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3381AC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 11:07:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEEA064DEC
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 11:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbhBRLAK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Feb 2021 06:00:10 -0500
Received: from m32-153.88.com ([43.250.32.153]:9934 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232930AbhBRKd7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Feb 2021 05:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=u3gqjom0Um+Z+glxqhLIB8/8DAKqSGlm2ZgLI
        hYOGTk=; b=axQaKmrljEYWzm7JrZSNxK2mZuHIC1F0Zb6Cn3sBydzHSdNNAVIZb
        tq+CdTY5bxc3qGbq1hFDE3XgDw8PZJJrs7WS7zuQGNTr4o7MndefJt10f+5dt6mQ
        liFCGeqTdkJeMVAJh7/QURNt3dpeLJJkD3j/fS7a6J2urccPY8t4Tw=
Received: from mipc (unknown [120.242.71.139])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAXifN0QC5gue8TAA--.52429S2;
        Thu, 18 Feb 2021 18:24:54 +0800 (CST)
Date:   Thu, 18 Feb 2021 18:24:52 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     alex.shi@linux.alibaba.com
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH 1/5] docs/zh_CN: Improve zh_CN/process/index.rst
Message-ID: <73fdbb57a541bc334ccbd8bad7167cdd6ae130e3.1613643617.git.bobwxc@email.cn>
References: <cover.1613643617.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1613643617.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAXifN0QC5gue8TAA--.52429S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW7ArWDJFWDXF18KrWUXFb_yoW8AF45pr
        9F9ryfKa15uas8Kry5KF4xKF4UGas7Ka9xJF40q3WFvr1UZ3yIqrW3tr15X34fWrWxAayj
        qr4rtFW3ZryavFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUy2b7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I
        3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
        WUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
        wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
        k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j
        6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jn3ktUUUUU=
X-Originating-IP: [120.242.71.139]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Improve language and grammar of zh_CN/process/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 Documentation/translations/zh_CN/process/index.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
index 8051a7b322c5..995e1e508d9c 100644
--- a/Documentation/translations/zh_CN/process/index.rst
+++ b/Documentation/translations/zh_CN/process/index.rst
@@ -13,11 +13,11 @@
 与Linux 内核社区一起工作
 ========================
 
-那么你想成为Linux内核开发人员？ 欢迎！ 不但从技术意义上讲有很多关于内核的知识
-需要学，而且了解我们社区的工作方式也很重要。 阅读这些文章可以让您以更轻松地,
-麻烦最少的方式将更改合并到内核。
+你想成为Linux内核开发人员吗？ 欢迎之至！ 在学习许多关于内核的技术知识的同时，
+了解我们社区的工作方式也很重要。 阅读这些文档可以让您以更轻松的、麻烦更少的
+方式将更改合并到内核。
 
-以下是每位开发人员应阅读的基本指南。
+以下是每位开发人员都应阅读的基本指南：
 
 .. toctree::
    :maxdepth: 1
@@ -47,7 +47,7 @@
    management-style
    embargoed-hardware-issues
 
-这些是一些总体技术指南，由于缺乏更好的地方，现在已经放在这里
+这些是一些总体性技术指南，由于不大好分类而放在这里：
 
 .. toctree::
    :maxdepth: 1
-- 
2.20.1

