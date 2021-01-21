Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DFEC4332B
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 03:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55563238A0
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 03:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbhAUDfY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jan 2021 22:35:24 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:49982 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388108AbhAUCmn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jan 2021 21:42:43 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R641e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0UMNRr99_1611196906;
Received: from localhost.localdomain(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UMNRr99_1611196906)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 21 Jan 2021 10:41:46 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH] docs/zh_CN: remove cn_index tag in mips
Date:   Thu, 21 Jan 2021 10:41:13 +0800
Message-Id: <20210121024113.16344-1-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It's a unused tag with a incorrect big name but just for mips arch.
So remove it.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Yanteng Si <siyanteng@loongson.cn>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/translations/zh_CN/mips/index.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/mips/index.rst b/Documentation/translations/zh_CN/mips/index.rst
index 27a2eae8484a..b85033f9d67c 100644
--- a/Documentation/translations/zh_CN/mips/index.rst
+++ b/Documentation/translations/zh_CN/mips/index.rst
@@ -5,9 +5,6 @@
 :Original: :doc:`../../../mips/index`
 :Translator: Yanteng Si <siyanteng@loongson.cn>
 
-.. _cn_index:
-
-
 ===========================
 MIPS特性文档
 ===========================
-- 
2.17.1

