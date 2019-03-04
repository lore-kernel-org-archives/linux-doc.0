Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 119DD7DBEB
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Mar 2019 04:00:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfCDD7q (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 3 Mar 2019 22:59:46 -0500
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:35188 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726181AbfCDD6Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Mar 2019 22:58:16 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R691e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04397;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0TLtryUh_1551671893;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TLtryUh_1551671893)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 04 Mar 2019 11:58:13 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     linux-kernel@zh-kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, harryxiyou@gmail.com, corbet@lwn.net
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        TripleX Chung <triplex@zh-kernel.org>,
        Li Zefan <lizefan@huawei.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Fengguang Wu <fengguang.wu@intel.com>, Coly Li <colyli@suse.de>
Subject: [PATCH 07/20] docs/zh_CN: rename SubmittingPatches for html links
Date:   Mon,  4 Mar 2019 11:57:30 +0800
Message-Id: <20190304035744.155203-8-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190304035744.155203-1-alex.shi@linux.alibaba.com>
References: <20190304035744.155203-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

renamed:    Documentation/translations/zh_CN/process/SubmittingPatches
 -> Documentation/translations/zh_CN/process/submitting-patches.rst

For htmldoc links. And will change the doc format to rst.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: TripleX Chung <triplex@zh-kernel.org>
Cc: Li Zefan <lizefan@huawei.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Coly Li <colyli@suse.de>
---
 .../zh_CN/process/{SubmittingPatches => submitting-patches.rst}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/translations/zh_CN/process/{SubmittingPatches => submitting-patches.rst} (100%)

diff --git a/Documentation/translations/zh_CN/process/SubmittingPatches b/Documentation/translations/zh_CN/process/submitting-patches.rst
similarity index 100%
rename from Documentation/translations/zh_CN/process/SubmittingPatches
rename to Documentation/translations/zh_CN/process/submitting-patches.rst
-- 
2.19.1.856.g8858448bb

