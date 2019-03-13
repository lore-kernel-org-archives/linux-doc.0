Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 545D47D099
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Mar 2019 13:50:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfCMNuv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Mar 2019 09:50:51 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:50812 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726961AbfCMNuq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Mar 2019 09:50:46 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04396;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0TMdXUvW_1552485032;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TMdXUvW_1552485032)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 13 Mar 2019 21:50:33 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     corbet@lwn.net, harryxiyou@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        TripleX Chung <xxx.phy@gmail.com>
Subject: [PATCH v5 24/31] mailmap: update email address for Triplex
Date:   Wed, 13 Mar 2019 21:49:54 +0800
Message-Id: <20190313135001.260905-25-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190313135001.260905-1-alex.shi@linux.alibaba.com>
References: <20190313135001.260905-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

triplex@zh-kernel.org and zhongyu@18mail.cn is absolete email address
for TripleX Chung <xxx.phy@gmail.com>

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: TripleX Chung <xxx.phy@gmail.com>
Signed-off-by: Weiwei Jia <harryxiyou@gmail.com>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 705c4f11f1a3..e5979518c396 100644
--- a/.mailmap
+++ b/.mailmap
@@ -207,6 +207,8 @@ Tejun Heo <htejun@gmail.com>
 Thomas Graf <tgraf@suug.ch>
 Thomas Pedersen <twp@codeaurora.org>
 Tony Luck <tony.luck@intel.com>
+TripleX Chung <xxx.phy@gmail.com> <zhongyu@18mail.cn>
+TripleX Chung <xxx.phy@gmail.com> <triplex@zh-kernel.org>
 Tsuneo Yoshioka <Tsuneo.Yoshioka@f-secure.com>
 Uwe Kleine-König <ukleinek@informatik.uni-freiburg.de>
 Uwe Kleine-König <ukl@pengutronix.de>
-- 
2.19.1.856.g8858448bb

