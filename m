Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4F3A77D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Mar 2019 03:28:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfCLDZe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Mar 2019 23:25:34 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:55141 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726950AbfCLDZc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Mar 2019 23:25:32 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07488;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0TMWN2s1_1552361129;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TMWN2s1_1552361129)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 12 Mar 2019 11:25:30 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     corbet@lwn.net, harryxiyou@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Li Yang <leoyang.li@nxp.com>, Li Zefan <lizefan@huawei.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Fengguang Wu <fengguang.wu@intel.com>, Coly Li <colyli@suse.de>
Subject: [PATCH v4 05/31] docs/zh_CN: rename HOWTO into process directory
Date:   Tue, 12 Mar 2019 11:24:34 +0800
Message-Id: <20190312032501.62056-6-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190312032501.62056-1-alex.shi@linux.alibaba.com>
References: <20190312032501.62056-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Make it available in htmldocs

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: Li Zefan <lizefan@huawei.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Coly Li <colyli@suse.de>
Signed-off-by: Weiwei Jia <harryxiyou@gmail.com>
---
 Documentation/translations/zh_CN/process/{HOWTO => howto.rst} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/translations/zh_CN/process/{HOWTO => howto.rst} (100%)

diff --git a/Documentation/translations/zh_CN/process/HOWTO b/Documentation/translations/zh_CN/process/howto.rst
similarity index 100%
rename from Documentation/translations/zh_CN/process/HOWTO
rename to Documentation/translations/zh_CN/process/howto.rst
-- 
2.19.1.856.g8858448bb

