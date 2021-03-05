Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165C9C433DB
	for <linux-doc@archiver.kernel.org>; Fri,  5 Mar 2021 05:26:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5C0E65015
	for <linux-doc@archiver.kernel.org>; Fri,  5 Mar 2021 05:26:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhCEF0S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Mar 2021 00:26:18 -0500
Received: from [43.250.32.171] ([43.250.32.171]:11783 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229446AbhCEF0R (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 5 Mar 2021 00:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=PD6ev+R2XWzqi07pa0SmiNsdaGKvCPRhipTm0
        iYDvUo=; b=MmIaJ01FhfIF4vyS168yRjI+z6TzC/6W7oYXB/rbUmLoDVW5T+4WR
        nim5aPkL/Fr2ve0sTjTnx9hMNlkkoQIj0HRAZ+NLqO5yx47vYrQsAbAhQk8aC9gK
        M8T6c3EbIgJoft6wtvxzKsQy9nn3AvhsaOH697VagTJ/tfU/V+E9Q8=
Received: from mipc (unknown [120.238.248.239])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgD3atHswEFgqI0QAA--.43969S2;
        Fri, 05 Mar 2021 13:26:06 +0800 (CST)
Date:   Fri, 5 Mar 2021 13:26:02 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     alex.shi@linux.alibaba.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH v3 1/9] docs/zh_CN: Improve zh_CN/process/index.rst
Message-ID: <aace391070859555c0378f93506e46fcdb8dbf93.1614920267.git.bobwxc@email.cn>
References: <cover.1614920267.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1614920267.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgD3atHswEFgqI0QAA--.43969S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFW5AF4DtFy5XryUZryrWFg_yoW8Aw4kpF
        9F934fKa15uF90gry5KF4xKF4UGas2ga9xtFWvq3WFvr1UZ3ySqrsxtr1rX34fWrWxAayj
        qr4ftr43Zry3ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqab7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zR_Oz3UUUUU
        =
X-Originating-IP: [120.238.248.239]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Improve language and grammar of zh_CN/process/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
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

