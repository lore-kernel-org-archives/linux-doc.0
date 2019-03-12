Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 03BEA7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Mar 2019 03:03:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbfCLDC4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Mar 2019 23:02:56 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:47281 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726167AbfCLDCx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Mar 2019 23:02:53 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04397;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0TMWMcma_1552359720;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TMWMcma_1552359720)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 12 Mar 2019 11:02:00 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     corbet@lwn.net, harryxiyou@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        TripleX Chung <xxx.phy@gmail.com>,
        Li Zefan <lizefan@huawei.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Fengguang Wu <fengguang.wu@intel.com>, Coly Li <colyli@suse.de>
Subject: [PATCH v4 08/31] docs/zh_CN: format the submitting-patches doc to rst
Date:   Tue, 12 Mar 2019 11:01:06 +0800
Message-Id: <20190312030129.47511-9-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190312030129.47511-1-alex.shi@linux.alibaba.com>
References: <20190312030129.47511-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

And remove Enghlish explainations in the docs, which it isn't
necessary in Chinese doc.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: TripleX Chung <xxx.phy@gmail.com>
Cc: Li Zefan <lizefan@huawei.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Coly Li <colyli@suse.de>
---
 .../zh_CN/process/submitting-patches.rst      | 36 +++++++------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/submitting-patches.rst b/Documentation/translations/zh_CN/process/submitting-patches.rst
index e9098da8f1a4..2a2989733c8d 100644
--- a/Documentation/translations/zh_CN/process/submitting-patches.rst
+++ b/Documentation/translations/zh_CN/process/submitting-patches.rst
@@ -1,31 +1,21 @@
-Chinese translated version of Documentation/process/submitting-patches.rst
+.. _cn_process_submittingpatches:
 
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
+.. include:: ../disclaimer-zh_CN.rst
 
-Chinese maintainer: TripleX Chung <triplex@zh-kernel.org>
----------------------------------------------------------------------
-Documentation/process/submitting-patches.rst 的中文翻译
+:Original: :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
 
 如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
 交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
-译存在问题，请联系中文版维护者。
+译存在问题，请联系中文版维护者::
 
-中文版维护者： 钟宇 TripleX Chung <triplex@zh-kernel.org>
-中文版翻译者： 钟宇 TripleX Chung <triplex@zh-kernel.org>
-中文版校译者： 李阳 Li Yang <leo@zh-kernel.org>
-               王聪 Wang Cong <xiyou.wangcong@gmail.com>
+        中文版维护者： 钟宇 TripleX Chung <triplex@zh-kernel.org>
+        中文版翻译者： 钟宇 TripleX Chung <triplex@zh-kernel.org>
+        中文版校译者： 李阳 Li Yang <leo@zh-kernel.org>
+                       王聪 Wang Cong <xiyou.wangcong@gmail.com>
 
-以下为正文
----------------------------------------------------------------------
 
-   如何让你的改动进入内核
-     或者
-  获得亲爱的 Linus Torvalds 的关注和处理
-----------------------------------
+如何让你的改动进入内核
+======================
 
 对于想要将改动提交到 Linux 内核的个人或者公司来说，如果不熟悉“规矩”，
 提交的流程会让人畏惧。本文档收集了一系列建议，这些建议可以大大的提高你
@@ -35,12 +25,12 @@ Documentation/process/submitting-patches.rst 的中文翻译
 Documentation/process/submitting-drivers.rst 。
 
 
---------------------------
+---------------------------
 第一节 - 创建并发送你的改动
---------------------------
+---------------------------
 
 1) "diff -up"
------------
+-------------
 
 使用 "diff -up" 或者 "diff -uprN" 来创建补丁。
 
-- 
2.19.1.856.g8858448bb

