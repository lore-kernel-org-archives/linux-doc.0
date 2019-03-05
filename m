Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CF4A47DE70
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Mar 2019 07:00:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfCEG76 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Mar 2019 01:59:58 -0500
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:38493 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727143AbfCEG6u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Mar 2019 01:58:50 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04392;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0TM.btfr_1551769119;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TM.btfr_1551769119)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 05 Mar 2019 14:58:39 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        harryxiyou@gmail.com, corbet@lwn.net, leoyang.li@nxp.com
Cc:     colyli@suse.de, fengguang.wu@intel.com, shawn.guo@linaro.org,
        lizefan@huawei.com, Alex Shi <alex.shi@linux.alibaba.com>
Subject: [PATCH v2 16/27] docs/zh_CN: format submitting drivers as rst
Date:   Tue,  5 Mar 2019 14:58:03 +0800
Message-Id: <20190305065815.157964-17-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190305065815.157964-1-alex.shi@linux.alibaba.com>
References: <20190305065815.157964-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

to Make it readble for html etc docs making.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: Li Zefan <lizefan@huawei.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Coly Li <colyli@suse.de>
---
 .../zh_CN/process/submitting-drivers.rst      | 30 +++++++------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/submitting-drivers.rst b/Documentation/translations/zh_CN/process/submitting-drivers.rst
index 15e73562f710..c90ab5ae233d 100644
--- a/Documentation/translations/zh_CN/process/submitting-drivers.rst
+++ b/Documentation/translations/zh_CN/process/submitting-drivers.rst
@@ -1,30 +1,22 @@
-﻿Chinese translated version of Documentation/process/submitting-drivers.rst
+﻿.. _cn_submittingdrivers:
 
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
+.. include:: ../disclaimer-zh_CN.rst
 
-Chinese maintainer: Li Yang <leo@zh-kernel.org>
----------------------------------------------------------------------
-Documentation/process/submitting-drivers.rst 的中文翻译
+:Original: :ref:`Documentation/process/submitting-drivers.rst
+           <submittingdrivers>`
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
-译存在问题，请联系中文版维护者。
+译存在问题，请联系中文版维护者::
 
-中文版维护者： 李阳  Li Yang <leo@zh-kernel.org>
-中文版翻译者： 李阳  Li Yang <leo@zh-kernel.org>
-中文版校译者： 陈琦 Maggie Chen <chenqi@beyondsoft.com>
-               王聪 Wang Cong <xiyou.wangcong@gmail.com>
-               张巍 Zhang Wei <Wei.Zhang@freescale.com>
-
-以下为正文
----------------------------------------------------------------------
+        中文版维护者： 李阳  Li Yang <leo@zh-kernel.org>
+        中文版翻译者： 李阳  Li Yang <leo@zh-kernel.org>
+        中文版校译者： 陈琦 Maggie Chen <chenqi@beyondsoft.com>
+                       王聪 Wang Cong <xiyou.wangcong@gmail.com>
+                       张巍 Zhang Wei <Wei.Zhang@freescale.com>
 
 如何向 Linux 内核提交驱动程序
------------------------------
+=============================
 
 这篇文档将会解释如何向不同的内核源码树提交设备驱动程序。请注意，如果你感
 兴趣的是显卡驱动程序，你也许应该访问 XFree86 项目(http://www.xfree86.org/)
-- 
2.19.1.856.g8858448bb

