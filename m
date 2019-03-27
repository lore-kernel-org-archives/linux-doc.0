Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 32DFD7D981
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Mar 2019 13:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731431AbfC0NDT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Mar 2019 09:03:19 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:39754 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730087AbfC0NDS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Mar 2019 09:03:18 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04446;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0TNmt4Zs_1553691746;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TNmt4Zs_1553691746)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 27 Mar 2019 21:02:26 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     alex.shi@linux.alibaba.com, harryxiyou@gmail.com, corbet@lwn.net,
        leoyang.li@nxp.com, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 23/42] docs/zh_CN: link the license-rules file into process index
Date:   Wed, 27 Mar 2019 21:01:29 +0800
Message-Id: <20190327130148.3258-24-alex.shi@linux.alibaba.com>
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

Make it appear in 'make htmldocs'

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/translations/zh_CN/process/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
index 3942c3bb6548..70c0e9b61a53 100644
--- a/Documentation/translations/zh_CN/process/index.rst
+++ b/Documentation/translations/zh_CN/process/index.rst
@@ -27,6 +27,7 @@
    coding-style
    development-process
    email-clients
+   license-rules
 
 其它大多数开发人员感兴趣的社区指南：
 
-- 
2.19.1.856.g8858448bb

