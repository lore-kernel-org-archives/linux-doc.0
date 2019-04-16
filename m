Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7A5F67D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 02:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbfDPC0H (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Apr 2019 22:26:07 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:54053 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725308AbfDPC0G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Apr 2019 22:26:06 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04446;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0TPQZvLR_1555381563;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TPQZvLR_1555381563)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 16 Apr 2019 10:26:03 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     kernel-doc@vger.kernel.org
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] docs/zh_CN: redirect CoC docs to Chinese version
Date:   Tue, 16 Apr 2019 10:25:48 +0800
Message-Id: <20190416022549.186820-1-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

That gives more natural reading experience for Chinese.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 .../zh_CN/process/code-of-conduct-interpretation.rst            | 2 +-
 Documentation/translations/zh_CN/process/code-of-conduct.rst    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/code-of-conduct-interpretation.rst b/Documentation/translations/zh_CN/process/code-of-conduct-interpretation.rst
index a1daec0482e2..c323ce76e0cb 100644
--- a/Documentation/translations/zh_CN/process/code-of-conduct-interpretation.rst
+++ b/Documentation/translations/zh_CN/process/code-of-conduct-interpretation.rst
@@ -8,7 +8,7 @@
 Linux内核贡献者契约行为准则解释
 ===============================
 
-:ref:`code_of_conduct` 准则是一个通用文档，旨在为几乎所有开源社区提供一套规则。
+:ref:`cn_code_of_conduct` 准则是一个通用文档，旨在为几乎所有开源社区提供一套规则。
 每个开源社区都是独一无二的，Linux内核也不例外。因此，本文描述了Linux内核社区中
 如何解释它。我们也不希望这种解释随着时间的推移是静态的，并将根据需要进行调整。
 
diff --git a/Documentation/translations/zh_CN/process/code-of-conduct.rst b/Documentation/translations/zh_CN/process/code-of-conduct.rst
index 4054daafedf1..99024df058e9 100644
--- a/Documentation/translations/zh_CN/process/code-of-conduct.rst
+++ b/Documentation/translations/zh_CN/process/code-of-conduct.rst
@@ -69,4 +69,4 @@ https://www.contributor-covenant.org/version/1/4/code-of-conduct.html 获取。
 解释
 ====
 
-有关Linux内核社区如何解释此文档，请参阅 :ref:`code_of_conduct_interpretation`
+有关Linux内核社区如何解释此文档，请参阅 :ref:`cn_code_of_conduct_interpretation`
-- 
2.19.1.856.g8858448bb

