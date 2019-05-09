Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AB28F7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  9 May 2019 03:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfEIDGB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 May 2019 23:06:01 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:43663 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725842AbfEIDGB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 May 2019 23:06:01 -0400
X-IronPort-AV: E=Sophos;i="5.60,448,1549900800"; 
   d="scan'208,217";a="62200514"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 May 2019 11:05:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
        by cn.fujitsu.com (Postfix) with ESMTP id EFD464CDB2FD;
        Thu,  9 May 2019 11:05:55 +0800 (CST)
Received: from iridescent.g08.fujitsu.local (10.167.225.140) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 9 May 2019 11:05:58 +0800
From:   Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
To:     <corbet@lwn.net>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Documentation: xfs: Fix typo
Date:   Thu, 9 May 2019 11:05:49 +0800
Message-ID: <20190509030549.2253-1-ruansy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.167.225.140]
X-yoursite-MailScanner-ID: EFD464CDB2FD.AF98F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: ruansy.fnst@cn.fujitsu.com
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In "Y+P" of this line, there are two non-ASCII characters(0xd9 0x8d)
following behind the 'Y'.  Shown as a small '=' under the '+' in VIM
and a '賺' in webpage[1].

I think it's a mistake and remove these strange characters.

[1]: https://www.kernel.org/doc/Documentation/filesystems/xfs-delayed-logging-design.txt

Signed-off-by: Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
---
 Documentation/filesystems/xfs-delayed-logging-design.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/xfs-delayed-logging-design.txt b/Documentation/filesystems/xfs-delayed-logging-design.txt
index 2ce36439c09f..9a6dd289b17b 100644
--- a/Documentation/filesystems/xfs-delayed-logging-design.txt
+++ b/Documentation/filesystems/xfs-delayed-logging-design.txt
@@ -34,7 +34,7 @@ transaction:
 	   D			A+B+C+D		X+n+m+o
 	    <object written to disk>
 	   E			   E		   Y (> X+n+m+o)
-	   F			  E+F		  Yٍ+p
+	   F			  E+F		  Y+p
 
 In other words, each time an object is relogged, the new transaction contains
 the aggregation of all the previous changes currently held only in the log.
-- 
2.17.0



