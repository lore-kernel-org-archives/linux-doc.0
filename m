Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4BAB17D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Mar 2019 03:58:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfCDD6q (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 3 Mar 2019 22:58:46 -0500
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:36934 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726286AbfCDD6Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Mar 2019 22:58:25 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04427;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0TLtsKcu_1551671901;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TLtsKcu_1551671901)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 04 Mar 2019 11:58:22 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     linux-kernel@zh-kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, harryxiyou@gmail.com, corbet@lwn.net
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        TripleX Chung <zhongyu@18mail.cn>,
        Li Zefan <lizefan@huawei.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Fengguang Wu <fengguang.wu@intel.com>, Coly Li <colyli@suse.de>
Subject: [PATCH 19/20] docs/zh_CN: rename stable_api_nonsense.txt as stable-api-nonsense.rst
Date:   Mon,  4 Mar 2019 11:57:42 +0800
Message-Id: <20190304035744.155203-20-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190304035744.155203-1-alex.shi@linux.alibaba.com>
References: <20190304035744.155203-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

make it available in html etc doc making

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: TripleX Chung <zhongyu@18mail.cn>
Cc: Li Zefan <lizefan@huawei.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Coly Li <colyli@suse.de>
---
 .../process/{stable_api_nonsense.txt => stable-api-nonsense.rst}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/translations/zh_CN/process/{stable_api_nonsense.txt => stable-api-nonsense.rst} (100%)

diff --git a/Documentation/translations/zh_CN/process/stable_api_nonsense.txt b/Documentation/translations/zh_CN/process/stable-api-nonsense.rst
similarity index 100%
rename from Documentation/translations/zh_CN/process/stable_api_nonsense.txt
rename to Documentation/translations/zh_CN/process/stable-api-nonsense.rst
-- 
2.19.1.856.g8858448bb

