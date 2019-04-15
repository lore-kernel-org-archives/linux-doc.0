Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 78C807D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Apr 2019 09:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfDOJlD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Apr 2019 05:41:03 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:40429 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725794AbfDOJlC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Apr 2019 05:41:02 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R261e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0TPLgtRc_1555321260;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TPLgtRc_1555321260)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 15 Apr 2019 17:41:01 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] docs/zh_CN: fix typos in 1.Intro.rst file
Date:   Mon, 15 Apr 2019 17:40:46 +0800
Message-Id: <20190415094046.242940-2-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190415094046.242940-1-alex.shi@linux.alibaba.com>
References: <20190415094046.242940-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fixed a uncapital issue and a typo.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com> 
Cc: Jonathan Corbet <corbet@lwn.net> 
Cc: linux-doc@vger.kernel.org 
Cc: linux-kernel@vger.kernel.org 
---
 Documentation/translations/zh_CN/process/1.Intro.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/1.Intro.rst b/Documentation/translations/zh_CN/process/1.Intro.rst
index 03bbafc00bd2..2bff9e49822c 100644
--- a/Documentation/translations/zh_CN/process/1.Intro.rst
+++ b/Documentation/translations/zh_CN/process/1.Intro.rst
@@ -79,12 +79,12 @@ Linux最引人注目的特性之一是这些开发人员可以访问它；任何
 致谢
 ----
 
-本文件由jonathan corbet撰写，corbet@lwn.net。以下人员的建议使之更为完善：
+本文件由Jonathan corbet撰写，corbet@lwn.net。以下人员的建议使之更为完善：
 Johannes Berg, James Berry, Alex Chiang, Roland Dreier, Randy Dunlap,
 Jake Edge, Jiri Kosina, Matt Mackall, Arthur Marsh, Amanda McPherson,
 Andrew Morton, Andrew Price, Tsugikazu Shibata, 和 Jochen Voß.
 
-这项工作得到了Linux基金会的支持，特别感谢Amanda McPherson，他看到了这香工作
+这项工作得到了Linux基金会的支持，特别感谢Amanda McPherson，他看到了这项工作
 的价值并使之发生。
 
 代码进入主线的重要性
-- 
2.19.1.856.g8858448bb

