Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA192C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 07:07:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DFFB61057
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 07:07:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhDAHGn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 03:06:43 -0400
Received: from m32-153.88.com ([43.250.32.153]:29454 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229459AbhDAHG3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 03:06:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=YFytqFrddNG9ZZN5jUB/dZSLVPYvxtJXbawDE
        YWvto4=; b=m1DyJ9Da01fHGBqlsZ+/1hagkI93au863TqlSUFCMrq7wFfR+5wm4
        YNi8owuuLZsB9OG+QdldnQYnZ6rXyz/TiHIwzK4Hb08WhgOHGomTJ2ftX0lkUF8H
        wmVor/dIZQRY/G4R45Slzl+GmroZsurMUyY4NkIFLFcv+3k6LX8qZ4=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCnMiPvcGVgM7lUAA--.1309S2;
        Thu, 01 Apr 2021 15:06:25 +0800 (CST)
Date:   Thu, 1 Apr 2021 15:06:23 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 4/5] docs/zh_CN: Add two image example files
Message-ID: <83610071642ddb56681ba29abff190725efc50eb.1617260163.git.bobwxc@email.cn>
References: <cover.1617260163.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1617260163.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgCnMiPvcGVgM7lUAA--.1309S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy7Gw4UKF48trWDJry8Grg_yoW8CFyxp3
        WDKryxKan7Ar15K3yrWrWUCF1rCa4xCa13Gr1IgwnYyFn5t3yvqr4DKryagFZ7Jr18ZFW5
        XF4F9F1q9Fy0vaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgSb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8CwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7IUUHKZJUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add two image exaple files used by zh_CN/doc-guide/sphinx.rst
  Documentation/translations/zh_CN/doc-guide/hello.dot
  Documentation/translations/zh_CN/doc-guide/svg_image.svg

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 Documentation/translations/zh_CN/doc-guide/hello.dot   |  3 +++
 .../translations/zh_CN/doc-guide/svg_image.svg         | 10 ++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/doc-guide/hello.dot
 create mode 100644 Documentation/translations/zh_CN/doc-guide/svg_image.svg

diff --git a/Documentation/translations/zh_CN/doc-guide/hello.dot b/Documentation/translations/zh_CN/doc-guide/hello.dot
new file mode 100644
index 000000000000..2740ad882e6a
--- /dev/null
+++ b/Documentation/translations/zh_CN/doc-guide/hello.dot
@@ -0,0 +1,3 @@
+graph G {
+      你好 -- 世界
+}
diff --git a/Documentation/translations/zh_CN/doc-guide/svg_image.svg b/Documentation/translations/zh_CN/doc-guide/svg_image.svg
new file mode 100644
index 000000000000..5405f85b8137
--- /dev/null
+++ b/Documentation/translations/zh_CN/doc-guide/svg_image.svg
@@ -0,0 +1,10 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<!-- originate: https://commons.wikimedia.org/wiki/File:Variable_Resistor.svg -->
+<svg xmlns="http://www.w3.org/2000/svg"
+	version="1.1" baseProfile="full"
+	width="70px" height="40px" viewBox="0 0 700 400">
+	<line x1="0" y1="200" x2="700" y2="200" stroke="black" stroke-width="20px"/>
+	<rect x="100" y="100" width="500" height="200" fill="white" stroke="black" stroke-width="20px"/>
+	<line x1="180" y1="370" x2="500" y2="50" stroke="black" stroke-width="15px"/>
+	<polygon points="585 0 525 25 585 50" transform="rotate(135 525 25)"/>
+</svg>
-- 
2.20.1

