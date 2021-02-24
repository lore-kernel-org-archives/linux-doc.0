Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F682C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 10:30:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E8D564ECF
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 10:30:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbhBXKau (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Feb 2021 05:30:50 -0500
Received: from [43.250.32.171] ([43.250.32.171]:47791 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S233186AbhBXKau (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 24 Feb 2021 05:30:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=tOimAuCztE/+XHaT5mXJESEmbtJ0EJSdoJdla
        2nYs3Q=; b=HgnUCDB6lBYbyZ37k9X05vP9jh/12W0dVsMsoT7+mm2S5zWaPssOT
        oNQVfKlDSD0yZ/y52ips09AqSQ0Pc7SkUe0FP66wrfqFMHyPijwL+8csKUJTKHLC
        gUnYmh8gKzo1exOD5UwtTjjIkMoF9LvrCbm/AunUCk/9M5yIJ0189s=
Received: from mipc (unknown [120.242.70.144])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAXi9G4KjZg8+YEAA--.13093S2;
        Wed, 24 Feb 2021 18:30:17 +0800 (CST)
Date:   Wed, 24 Feb 2021 18:30:16 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     alex.shi@linux.alibaba.com
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH v1 1/9] docs/zh_CN: Improve zh_CN/process/index.rst
Message-ID: <9a5339fea78efc54271da3d69dd588629a7f2476.1614162064.git.bobwxc@email.cn>
References: <cover.1614162064.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1614162064.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgAXi9G4KjZg8+YEAA--.13093S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFWrKr1ktFW7uF1xtF1xuFg_yoW8AF45pr
        9F9ryfKa15uas8Kry5KF4xKF4UGas7Ka9xJF40q3WFvr1UZ3ySqrW3tr15X34xWrWxAayj
        qr4rtF43ZryavFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgIb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r4DMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
        0xZFpf9x0zR_HUgUUUUU=
X-Originating-IP: [120.242.70.144]
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

