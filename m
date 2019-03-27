Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1916E7E31A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Mar 2019 13:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729733AbfC0NCZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Mar 2019 09:02:25 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:49517 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729546AbfC0NCY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Mar 2019 09:02:24 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04391;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0TNmpMWv_1553691740;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TNmpMWv_1553691740)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 27 Mar 2019 21:02:21 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     alex.shi@linux.alibaba.com, harryxiyou@gmail.com, corbet@lwn.net,
        leoyang.li@nxp.com, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 11/42] docs/zh_CN: add disclaimer and translator info in 4.Coding
Date:   Wed, 27 Mar 2019 21:01:17 +0800
Message-Id: <20190327130148.3258-12-alex.shi@linux.alibaba.com>
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

To let people know where to complain.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/translations/zh_CN/process/4.Coding.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/translations/zh_CN/process/4.Coding.rst b/Documentation/translations/zh_CN/process/4.Coding.rst
index 6fcbfec5c040..c675015ffe12 100644
--- a/Documentation/translations/zh_CN/process/4.Coding.rst
+++ b/Documentation/translations/zh_CN/process/4.Coding.rst
@@ -1,3 +1,8 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :ref:`Documentation/process/4.Coding.rst <development_coding>`
+:Translator: Alex Shi <alex.shi@linux.alibaba.com>
+
 .. _cn_development_coding:
 
 使代码正确
-- 
2.19.1.856.g8858448bb

