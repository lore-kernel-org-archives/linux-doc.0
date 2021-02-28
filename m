Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF78C433DB
	for <linux-doc@archiver.kernel.org>; Sun, 28 Feb 2021 05:38:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E370D64E55
	for <linux-doc@archiver.kernel.org>; Sun, 28 Feb 2021 05:38:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhB1Fig (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Feb 2021 00:38:36 -0500
Received: from m32-153.88.com ([43.250.32.153]:27372 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230008AbhB1Fia (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 28 Feb 2021 00:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=tOimAuCztE/+XHaT5mXJESEmbtJ0EJSdoJdla
        2nYs3Q=; b=Lu6DHKQrlIAeEM9SzbWqvrNVJBlH1KDCrkcZhRX+gZZzN/pZxV43y
        701hWnn3PXMqfJNl8M61RN4BihlsjMzQLRu9AA1frC2EB3/Ut2eXUsYG39yBZM3A
        lwaYphsDV0GC+rfV9KOlsIVsAa9wdPRdcUurTsjNdQXaxB4k7F9r90=
Received: from mipc (unknown [120.238.248.239])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBn8iIjLDtgsi0OAA--.39780S2;
        Sun, 28 Feb 2021 13:37:41 +0800 (CST)
Date:   Sun, 28 Feb 2021 13:37:39 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     alex.shi@linux.alibaba.com
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH v2 1/9] docs/zh_CN: Improve zh_CN/process/index.rst
Message-ID: <bf7d8e474ea3332a8595f46619b427b1ebbcb791.1614488009.git.bobwxc@email.cn>
References: <cover.1614488009.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1614488009.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBn8iIjLDtgsi0OAA--.39780S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFWrKr1ktFW7uF1xtF1xuFg_yoW8AF45pr
        9F9ryfKa15uas8Kry5KF4xKF4UGas7Ka9xJF40q3WFvr1UZ3ySqrW3tr15X34xWrWxAayj
        qr4rtF43ZryavFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqSb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RRbyZUUUU
        U
X-Originating-IP: [120.238.248.239]
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
index 8051a7b322c5..39e9c88fbaa6 100644
--- a/Documentation/translations/zh_CN/process/index.rst
+++ b/Documentation/translations/zh_CN/process/index.rst
@@ -13,11 +13,11 @@
 与Linux 内核社区一起工作
 ========================
 
-那么你想成为Linux内核开发人员？ 欢迎！ 不但从技术意义上讲有很多关于内核的知识
-需要学，而且了解我们社区的工作方式也很重要。 阅读这些文章可以让您以更轻松地,
-麻烦最少的方式将更改合并到内核。
+你想成为Linux内核开发人员吗？欢迎之至！在学习许多关于内核的技术知识的同时，
+了解我们社区的工作方式也很重要。阅读这些文档可以让您以更轻松的、麻烦更少的
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

