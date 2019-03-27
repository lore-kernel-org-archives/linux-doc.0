Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 39F337E286
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Mar 2019 13:05:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbfC0NET (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Mar 2019 09:04:19 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:47047 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730126AbfC0NCg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Mar 2019 09:02:36 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04391;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0TNmsL-w_1553691750;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TNmsL-w_1553691750)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 27 Mar 2019 21:02:31 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     alex.shi@linux.alibaba.com, harryxiyou@gmail.com, corbet@lwn.net,
        leoyang.li@nxp.com, linux-doc@vger.kernel.org
Cc:     Federico Vaga <federico.vaga@vaga.pv.it>,
        SeongJae Park <sj38.park@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 35/42] docs/zh_CN: update translator info and comments in howto
Date:   Wed, 27 Mar 2019 21:01:41 +0800
Message-Id: <20190327130148.3258-36-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190327130148.3258-1-alex.shi@linux.alibaba.com>
References: <20190327130148.3258-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since we has disclaimer, don't need duplicate comments.
Add myself into translators.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: SeongJae Park <sj38.park@gmail.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/translations/zh_CN/process/howto.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/howto.rst b/Documentation/translations/zh_CN/process/howto.rst
index cb41336ccb80..8b62f7c4104d 100644
--- a/Documentation/translations/zh_CN/process/howto.rst
+++ b/Documentation/translations/zh_CN/process/howto.rst
@@ -4,13 +4,12 @@
 
 :Original: :ref:`Documentation/process/howto.rst <process_howto>`
 
-如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
-交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
-译存在问题，请联系中文版维护者::
+译者::
 
     英文版维护者： Greg Kroah-Hartman <greg@kroah.com>
     中文版维护者： 李阳  Li Yang <leoyang.li@nxp.com>
     中文版翻译者： 李阳  Li Yang <leoyang.li@nxp.com>
+                   时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
     中文版校译者:
                    钟宇  TripleX Chung <xxx.phy@gmail.com>
                    陈琦  Maggie Chen <chenqi@beyondsoft.com>
-- 
2.19.1.856.g8858448bb

