Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 60B6E7D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  9 Aug 2019 12:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406668AbfHIMFe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 9 Aug 2019 08:05:34 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:40640 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406667AbfHIMFd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Aug 2019 08:05:33 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R501e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04391;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0TZ0fQL7_1565352323;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TZ0fQL7_1565352323)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 09 Aug 2019 20:05:23 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        SeongJae Park <sj38.park@gmail.com>,
        Tom Levy <tomlevy93@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v2] docs/zh_CN: update Chinese howto.rst for latexdocs making
Date:   Fri,  9 Aug 2019 20:04:47 +0800
Message-Id: <20190809120447.22921-1-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mauro Carvalho Chehab <mchehab+samsung@kernel.org> found a reference
error in Chinese howto.rst. and further more there more infos of
latexdocs/epubdocs format doc making in English howto.rst.

So I update this part according to latest howto.rst and settled
the correct reference.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: SeongJae Park <sj38.park@gmail.com>
Cc: Tom Levy <tomlevy93@gmail.com>
Cc: linux-doc@vger.kernel.org
---
 Documentation/translations/zh_CN/process/howto.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/howto.rst b/Documentation/translations/zh_CN/process/howto.rst
index c4ff8356b88d..b244a7190eb6 100644
--- a/Documentation/translations/zh_CN/process/howto.rst
+++ b/Documentation/translations/zh_CN/process/howto.rst
@@ -146,14 +146,18 @@ Linux内核代码中包含有大量的文档。这些文档对于学习如何与
   :ref:`Documentation/process/applying-patches.rst <applying_patches>`
     关于补丁是什么以及如何将它打在不同内核开发分支上的好介绍
 
-内核还拥有大量从代码自动生成的文档。它包含内核内部API的全面介绍以及如何
-妥善处理加锁的规则。生成的文档会放在 Documentation/output/目录下。在内
-核源码的主目录中使用以下不同命令将会分别生成PDF、Postscript、HTML和手册
-页等不同格式的文档::
+内核还拥有大量从代码自动生成或者从 ReStructuredText(ReST) 标记生成的文档，
+比如这个文档，它包含内核内部API的全面介绍以及如何妥善处理加锁的规则。所有
+这些文档都可以通过运行以下命令从内核代码中生成为PDF或HTML文档::
 
     make pdfdocs
     make htmldocs
 
+ReST格式的文档会生成在 Documentation/output. 目录中。
+它们也可以用下列命令生成 LaTeX 和 ePub 格式文档::
+
+    make latexdocs
+    make epubdocs
 
 如何成为内核开发者
 ------------------
-- 
2.19.1.856.g8858448bb

