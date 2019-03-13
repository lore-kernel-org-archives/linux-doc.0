Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 518F37D917
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Mar 2019 13:53:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfCMNwp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Mar 2019 09:52:45 -0400
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:37217 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726797AbfCMNuY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Mar 2019 09:50:24 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07488;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0TMdPcKR_1552485021;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TMdPcKR_1552485021)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 13 Mar 2019 21:50:22 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     corbet@lwn.net, harryxiyou@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        TripleX Chung <xxx.phy@gmail.com>,
        Li Zefan <lizefan@huawei.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Fengguang Wu <fengguang.wu@intel.com>, Coly Li <colyli@suse.de>
Subject: [PATCH v5 09/31] docs/zh_CN: rename stable_kernel_rules doc
Date:   Wed, 13 Mar 2019 21:49:39 +0800
Message-Id: <20190313135001.260905-10-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190313135001.260905-1-alex.shi@linux.alibaba.com>
References: <20190313135001.260905-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch renamed stable_kernel_rules.txt to stable-kernel-rules.rst
Make it available in htmldocs making.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: TripleX Chung <xxx.phy@gmail.com>
Cc: Li Zefan <lizefan@huawei.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Coly Li <colyli@suse.de>
Signed-off-by: Weiwei Jia <harryxiyou@gmail.com>
---
 .../process/{stable_kernel_rules.txt => stable-kernel-rules.rst}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/translations/zh_CN/process/{stable_kernel_rules.txt => stable-kernel-rules.rst} (100%)

diff --git a/Documentation/translations/zh_CN/process/stable_kernel_rules.txt b/Documentation/translations/zh_CN/process/stable-kernel-rules.rst
similarity index 100%
rename from Documentation/translations/zh_CN/process/stable_kernel_rules.txt
rename to Documentation/translations/zh_CN/process/stable-kernel-rules.rst
-- 
2.19.1.856.g8858448bb

