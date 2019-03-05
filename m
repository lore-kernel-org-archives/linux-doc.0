Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D4B207DBEB
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Mar 2019 07:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbfCEHAi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Mar 2019 02:00:38 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:51114 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726106AbfCEG6q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Mar 2019 01:58:46 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04392;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0TM.WBDs_1551769109;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TM.WBDs_1551769109)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 05 Mar 2019 14:58:30 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        harryxiyou@gmail.com, corbet@lwn.net, leoyang.li@nxp.com
Cc:     colyli@suse.de, fengguang.wu@intel.com, shawn.guo@linaro.org,
        lizefan@huawei.com, Alex Shi <alex.shi@linux.alibaba.com>
Subject: [PATCH v2 02/27] docs/zh_CN: move process related docs into process dir
Date:   Tue,  5 Mar 2019 14:57:49 +0800
Message-Id: <20190305065815.157964-3-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190305065815.157964-1-alex.shi@linux.alibaba.com>
References: <20190305065815.157964-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Much process documents spread here isn't neat. It's good to put them together
in their directory: process

So create 'process' directory and move docs:
	email-clients stable_kernel_rules stable_api_nosense
	submittingpatches submittingdrivers HOWTO
	volatile-considered-harmful
there.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Li Zefan <lizefan@huawei.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Coly Li <colyli@suse.de>
---
 Documentation/translations/zh_CN/{ => process}/HOWTO              | 0
 Documentation/translations/zh_CN/{ => process}/SubmittingDrivers  | 0
 Documentation/translations/zh_CN/{ => process}/SubmittingPatches  | 0
 Documentation/translations/zh_CN/{ => process}/coding-style.rst   | 0
 Documentation/translations/zh_CN/{ => process}/email-clients.txt  | 0
 Documentation/translations/zh_CN/{ => process}/magic-number.txt   | 0
 .../translations/zh_CN/{ => process}/stable_api_nonsense.txt      | 0
 .../translations/zh_CN/{ => process}/stable_kernel_rules.txt      | 0
 .../zh_CN/{ => process}/volatile-considered-harmful.txt           | 0
 9 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/translations/zh_CN/{ => process}/HOWTO (100%)
 rename Documentation/translations/zh_CN/{ => process}/SubmittingDrivers (100%)
 rename Documentation/translations/zh_CN/{ => process}/SubmittingPatches (100%)
 rename Documentation/translations/zh_CN/{ => process}/coding-style.rst (100%)
 rename Documentation/translations/zh_CN/{ => process}/email-clients.txt (100%)
 rename Documentation/translations/zh_CN/{ => process}/magic-number.txt (100%)
 rename Documentation/translations/zh_CN/{ => process}/stable_api_nonsense.txt (100%)
 rename Documentation/translations/zh_CN/{ => process}/stable_kernel_rules.txt (100%)
 rename Documentation/translations/zh_CN/{ => process}/volatile-considered-harmful.txt (100%)

diff --git a/Documentation/translations/zh_CN/HOWTO b/Documentation/translations/zh_CN/process/HOWTO
similarity index 100%
rename from Documentation/translations/zh_CN/HOWTO
rename to Documentation/translations/zh_CN/process/HOWTO
diff --git a/Documentation/translations/zh_CN/SubmittingDrivers b/Documentation/translations/zh_CN/process/SubmittingDrivers
similarity index 100%
rename from Documentation/translations/zh_CN/SubmittingDrivers
rename to Documentation/translations/zh_CN/process/SubmittingDrivers
diff --git a/Documentation/translations/zh_CN/SubmittingPatches b/Documentation/translations/zh_CN/process/SubmittingPatches
similarity index 100%
rename from Documentation/translations/zh_CN/SubmittingPatches
rename to Documentation/translations/zh_CN/process/SubmittingPatches
diff --git a/Documentation/translations/zh_CN/coding-style.rst b/Documentation/translations/zh_CN/process/coding-style.rst
similarity index 100%
rename from Documentation/translations/zh_CN/coding-style.rst
rename to Documentation/translations/zh_CN/process/coding-style.rst
diff --git a/Documentation/translations/zh_CN/email-clients.txt b/Documentation/translations/zh_CN/process/email-clients.txt
similarity index 100%
rename from Documentation/translations/zh_CN/email-clients.txt
rename to Documentation/translations/zh_CN/process/email-clients.txt
diff --git a/Documentation/translations/zh_CN/magic-number.txt b/Documentation/translations/zh_CN/process/magic-number.txt
similarity index 100%
rename from Documentation/translations/zh_CN/magic-number.txt
rename to Documentation/translations/zh_CN/process/magic-number.txt
diff --git a/Documentation/translations/zh_CN/stable_api_nonsense.txt b/Documentation/translations/zh_CN/process/stable_api_nonsense.txt
similarity index 100%
rename from Documentation/translations/zh_CN/stable_api_nonsense.txt
rename to Documentation/translations/zh_CN/process/stable_api_nonsense.txt
diff --git a/Documentation/translations/zh_CN/stable_kernel_rules.txt b/Documentation/translations/zh_CN/process/stable_kernel_rules.txt
similarity index 100%
rename from Documentation/translations/zh_CN/stable_kernel_rules.txt
rename to Documentation/translations/zh_CN/process/stable_kernel_rules.txt
diff --git a/Documentation/translations/zh_CN/volatile-considered-harmful.txt b/Documentation/translations/zh_CN/process/volatile-considered-harmful.txt
similarity index 100%
rename from Documentation/translations/zh_CN/volatile-considered-harmful.txt
rename to Documentation/translations/zh_CN/process/volatile-considered-harmful.txt
-- 
2.19.1.856.g8858448bb

