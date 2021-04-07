Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA15C433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:50:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1B58613A7
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244602AbhDGHu5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 03:50:57 -0400
Received: from [43.250.32.171] ([43.250.32.171]:27447 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S234159AbhDGHu4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 03:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=L1WnLOuioXPuIJ3nQYonS9hv/uB9Y0Q6q8ZLB
        nW0xGo=; b=TfTWdyNuIRr8ME/C927rMZfxHL9NoCngrAWFYRWVwxkrAZXJTzrk+
        mcEmsGJsOVoclhX6/z+cPSUrcsfgBTVcTln4QsYY73eHhL9xryN7fIllenRT7YVV
        9K89Z37EzSF+uVVVeDx7k0O7B4bvj8zvCzZ1tLCwaYeFZnYyWvJ1bU=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDnWdBPZG1g3F5QAA--.48888S2;
        Wed, 07 Apr 2021 15:50:41 +0800 (CST)
Date:   Wed, 7 Apr 2021 15:50:39 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v3 2/8] docs/zh_CN: Add two image example files
Message-ID: <26826d7401a12a82ced72936c74c698b2875fe93.1617699755.git.bobwxc@email.cn>
References: <cover.1617699755.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1617699755.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDnWdBPZG1g3F5QAA--.48888S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy7Gw4UKF48trWDJry8Grg_yoW8Zr1kp3
        WDKryxKan7Ar15K3yrWrWUCF1rCFyxCa13Gr12gwn5trn5tw4vqr4DKry2gFZ7Jr10vFW5
        XF4FkF1q9Fy0vaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgSb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r4xMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kfnx
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
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
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

