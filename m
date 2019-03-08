Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 65AD57D099
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Mar 2019 03:10:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfCHDK2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Mar 2019 22:10:28 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:42490 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726623AbfCHDKX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Mar 2019 22:10:23 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0TMDnmcM_1552014617;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TMDnmcM_1552014617)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 08 Mar 2019 11:10:18 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        harryxiyou@gmail.com, corbet@lwn.net
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Li Zefan <lizefan@huawei.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Fengguang Wu <fengguang.wu@intel.com>, Coly Li <colyli@suse.de>
Subject: [PATCH v3 17/31] docs/zh_CN: rename magic-numbers as rst doc
Date:   Fri,  8 Mar 2019 11:09:04 +0800
Message-Id: <20190308030918.22337-18-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190308030918.22337-1-alex.shi@linux.alibaba.com>
References: <20190308030918.22337-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

to Make it available in html etc doc making

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Jia Wei Wei <harryxiyou@gmail.com>
Cc: Li Zefan <lizefan@huawei.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Coly Li <colyli@suse.de>
---
 .../zh_CN/process/{magic-number.txt => magic-number.rst}          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/translations/zh_CN/process/{magic-number.txt => magic-number.rst} (100%)

diff --git a/Documentation/translations/zh_CN/process/magic-number.txt b/Documentation/translations/zh_CN/process/magic-number.rst
similarity index 100%
rename from Documentation/translations/zh_CN/process/magic-number.txt
rename to Documentation/translations/zh_CN/process/magic-number.rst
-- 
2.19.1.856.g8858448bb

