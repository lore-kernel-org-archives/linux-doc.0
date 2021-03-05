Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23953C433DB
	for <linux-doc@archiver.kernel.org>; Fri,  5 Mar 2021 05:29:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E795C64F60
	for <linux-doc@archiver.kernel.org>; Fri,  5 Mar 2021 05:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhCEF3D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Mar 2021 00:29:03 -0500
Received: from [43.250.32.171] ([43.250.32.171]:12043 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229446AbhCEF3C (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 5 Mar 2021 00:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=7m5NeRmSsjCQW3xCqaTgjviYLmyVi5vmZ3W6V
        LUZt8w=; b=NrXZgk/MIjFrSdIASloDq6lBH6qRy2AFQuIob+gmQhJG/d0H62tIw
        BzXXP7XtRJD1wsYpUZ+ASKpTipMVd/cXV4CO4JwZG7K8bs2M6ZWBGFrmXoYdfWGt
        DL4d4Knk39W9cS26zSXSsBGPv2MmMgLb0azJ5FJMuX3g2I7Aej1trc=
Received: from mipc (unknown [120.238.248.239])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAXi9GQwUFgTI4QAA--.43992S2;
        Fri, 05 Mar 2021 13:28:50 +0800 (CST)
Date:   Fri, 5 Mar 2021 13:28:48 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     alex.shi@linux.alibaba.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH v3 9/9] docs/zh_CN: Improve zh_CN/process/8.Conclusion.rst
Message-ID: <8311d04c5528442ecae241062fbb1a7eded0b4f6.1614920267.git.bobwxc@email.cn>
References: <cover.1614920267.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1614920267.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgAXi9GQwUFgTI4QAA--.43992S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr1rGw4DJFW7XFyrJry7ZFb_yoWxZrWkpF
        4xtwn3K3W0kas0k397GrykAayxJa4Ika13GayUGa45uw1Fyay2y3yIyFyUX34aqa4xKas8
        XFWrZryUur1fArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqSb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RRbyZUUUU
        U
X-Originating-IP: [120.238.248.239]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Improve language and grammar of zh_CN/process/8.Conclusion.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
---
 .../zh_CN/process/8.Conclusion.rst            | 60 ++++++++++---------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/8.Conclusion.rst b/Documentation/translations/zh_CN/process/8.Conclusion.rst
index 90cec3de6106..71c3e30efc6f 100644
--- a/Documentation/translations/zh_CN/process/8.Conclusion.rst
+++ b/Documentation/translations/zh_CN/process/8.Conclusion.rst
@@ -1,7 +1,13 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: :ref:`Documentation/process/8.Conclusion.rst <development_conclusion>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
+:Translator:
+
+ 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
+
+:校译:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
 
 .. _cn_development_conclusion:
 
@@ -9,56 +15,56 @@
 ========
 
 关于Linux内核开发和相关主题的信息来源很多。首先是在内核源代码分发中找到的
-文档目录。顶级 :ref:`Documentation/translations/zh_CN/process/howto.rst <cn_process_howto>`
-文件是一个重要的起点
+文档目录。顶级
+:ref:`Documentation/translations/zh_CN/process/howto.rst <cn_process_howto>`
+文件是一个重要的起点；
 :ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <cn_submittingpatches>`
-和 :ref:`process/submitting-drivers.rst <submittingdrivers>`
+和 :ref:`Documentation/transaltions/zh_CN/process/submitting-drivers.rst <cn_submittingdrivers>`
 也是所有内核开发人员都应该阅读的内容。许多内部内核API都是使用kerneldoc机制
-记录的；“make htmldocs”或“make pdfdocs”可用于以HTML或PDF格式生成这些文档（
-尽管某些发行版提供的tex版本会遇到内部限制，无法正确处理文档）。
+记录的；“make htmldocs”或“make pdfdocs”可用于以HTML或PDF格式生成这些文档
+（尽管某些发行版提供的tex版本会遇到内部限制，无法正确处理文档）。
 
-不同的网站在各个细节层次上讨论内核开发。您的作者想谦虚地建议用 https://lwn.net/
-作为来源；有关许多特定内核主题的信息可以通过以下网址的lwn内核索引找到：
+不同的网站在各个细节层次上讨论内核开发。本文作者想谦虚地建议用 https://lwn.net/
+作为来源；有关许多特定内核主题的信息可以通过以下网址的 LWN 内核索引找到：
 
-        http://lwn.net/kernel/index/
+  http://lwn.net/kernel/index/
 
 除此之外，内核开发人员的一个宝贵资源是：
 
-        https://kernelnewbies.org/
+  https://kernelnewbies.org/
 
-当然，我们不应该忘记 https://kernel.org/ 这是内核发布信息的最终位置。
+当然，也不应该忘记 https://kernel.org/ ，这是内核发布信息的最终位置。
 
 关于内核开发有很多书：
 
-        Linux设备驱动程序，第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah Hartman）。
-        在线：http://lwn.net/kernel/ldd3/
+  《Linux设备驱动程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah Hartman）
+  线上版本在 http://lwn.net/kernel/ldd3/
 
-        Linux内核开发（Robert Love）。
+  《Linux内核设计与实现》（Robert Love）
 
-        了解Linux内核（Daniel Bovet和Marco Cesati）。
+  《深入理解Linux内核》(Daniel Bovet和Marco Cesati）
 
-然而，所有这些书都有一个共同的缺点：当它们上架时，它们往往有些过时，而且它们
-已经上架一段时间了。不过，在那里还可以找到相当多的好信息。
+然而，所有这些书都有一个共同的缺点：它们上架时就往往有些过时，而且已经上架
+一段时间了。不过，在那里还是可以找到相当多的好信息。
 
 有关git的文档，请访问：
 
-        https://www.kernel.org/pub/software/scm/git/docs/
+  https://www.kernel.org/pub/software/scm/git/docs/
 
-        https://www.kernel.org/pub/software/scm/git/docs/user-manual.html
+  https://www.kernel.org/pub/software/scm/git/docs/user-manual.html
 
 结论
 ====
 
-祝贺所有通过这篇冗长的文件的人。希望它能够帮助您理解Linux内核是如何开发的，
+祝贺所有通过这篇冗长的文档的人。希望它能够帮助您理解Linux内核是如何开发的，
 以及您如何参与这个过程。
 
-最后，重要的是参与。任何开源软件项目都不超过其贡献者投入其中的总和。Linux内核
-的发展速度和以前一样快，因为它得到了大量开发人员的帮助，他们都在努力使它变得
-更好。内核是一个主要的例子，说明当成千上万的人为了一个共同的目标一起工作时，
-可以做些什么。
+最后，重要的是参与。任何开源软件项目都不会超过其贡献者投入其中的总和。Linux
+内核的发展速度和以前一样快，因为它得到了大量开发人员的帮助，他们都在努力使它
+变得更好。内核是一个最成功的例子，说明了当成千上万的人为了一个共同的目标一起
+工作时，可以做出什么。
 
-不过，内核总是可以从更大的开发人员基础中获益。总有更多的工作要做。但是，同样
+不过，内核总是可以从更大的开发人员基础中获益。总有更多的工作要做。但是同样
 重要的是，Linux生态系统中的大多数其他参与者可以通过为内核做出贡献而受益。使
 代码进入主线是提高代码质量、降低维护和分发成本、提高对内核开发方向的影响程度
-等的关键。这是一种人人都赢的局面。踢开你的编辑，来加入我们吧，你会非常受
-欢迎的。
+等的关键。这是一种共赢的局面。启动你的编辑器，来加入我们吧；你会非常受欢迎的。
-- 
2.20.1

