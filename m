Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 34FD57D90F
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Aug 2019 03:18:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbfHEDSN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 4 Aug 2019 23:18:13 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:48050 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726766AbfHEDSN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Aug 2019 23:18:13 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0TYeNBde_1564975089;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TYeNBde_1564975089)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 05 Aug 2019 11:18:10 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        SeongJae Park <sj38.park@gmail.com>,
        Tom Levy <tomlevy93@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH] docs/zh_CN: update Chinese howto.rst for latexdocs making
Date:   Mon,  5 Aug 2019 11:17:58 +0800
Message-Id: <20190805031758.64156-1-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mauro Carvalho Chehab <mchehab+samsung@kernel.org> foundd a reference
error in Chinese howto.rst. which need update introducations for
latexdocs/epubdocs format doc making.

So I update this part according to latest howto.rst.

Originally-from: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
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
index 5b671178b17b..b244a7190eb6 100644
--- a/Documentation/translations/zh_CN/process/howto.rst
+++ b/Documentation/translations/zh_CN/process/howto.rst
@@ -146,14 +146,18 @@ Linux内核代码中包含有大量的文档。这些文档对于学习如何与
   :ref:`Documentation/process/applying-patches.rst <applying_patches>`
     关于补丁是什么以及如何将它打在不同内核开发分支上的好介绍
 
-内核还拥有大量从代码自动生成的文档。它包含内核内部API的全面介绍以及如何
-妥善处理加锁的规则。生成的文档会放在 Documentation/DocBook/目录下。在内
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

