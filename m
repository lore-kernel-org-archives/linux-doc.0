Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47639EE57FD
	for <linux-doc@archiver.kernel.org>; Fri,  8 Sep 2023 11:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236769AbjIHLof (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Sep 2023 07:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234915AbjIHLof (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Sep 2023 07:44:35 -0400
X-Greylist: delayed 300 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 08 Sep 2023 04:44:28 PDT
Received: from aib29gb122.yyz1.oracleemaildelivery.com (aib29gb122.yyz1.oracleemaildelivery.com [192.29.72.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 946841BE7
        for <linux-doc@vger.kernel.org>; Fri,  8 Sep 2023 04:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-2023;
 d=n8pjl.ca;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=QCXst9TnbvTydHtdRtk/wlOXkWWqj8Vu/QEOd9ujz9A=;
 b=F+nSuANDr1wXoCgEVQ39pYOkQ7+uBWMFd0QtML/JbfBzByjbt0bJgQa4vzc8amC4Ye2NYenL2DNq
   Kw3JbpK/FpvT8aaNvGQACqZEKXV7ICrq3Z90/A2+zvhccfDM9P/P0jCOkZCKYWDMe85XGl3U+lsf
   hvwdfw0KrpqPrB4kKlNld66mD9NNC2QWsJh2z54guVBt6xv3aeXE84bmQ8Xletf5QhFFS2uXOHQw
   rYrvF3LIkzrB0XA1kz27xhJh0YyqmrAnZFeFZccXQPEBNAnylhbeRw+l53BWgd925/uKtLAIsxv6
   Zwu7+kNSwlC1jr0CfUONm4jWnL++OiCyoY0wyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-yyz-20200204;
 d=yyz1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=QCXst9TnbvTydHtdRtk/wlOXkWWqj8Vu/QEOd9ujz9A=;
 b=Ir+1t2M8TtsKyR6VRloBbEX6I76KNlNYgpXZqZYyvue/sCPcO3nvMFboIRurXudSLFxxgQjVC+k0
   GUqjKF/84Ni6VWtlR4yUDkcFX6gI7oa7tHlh/wI/ag0TKAe07OEMTlBvhzGr9cIlrnYT/bIlxIi6
   fjtfABgsbPit/UCGqS3zzDZ64ZDKffwGRk3QMdP2fJdHqNrqI4ikwjO8NFO2ZcuWidIVZ8LSf6O9
   0fyWZrdwR5+UowGSZLQkxXjToE6DembqgI9MMTcO+7H8Xi6IbgsuxmrTdMpjZek7M8dHsGYL1Gsh
   hddoJhjwal34xV/ZH/6rV2xnmxOj2z8mY2MCEQ==
Received: by omta-ad1-fd1-401-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230808 64bit (built Aug  8
 2023))
 with ESMTPS id <0S0O002OK0DRGN10@omta-ad1-fd1-401-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com> for
 linux-doc@vger.kernel.org; Fri, 08 Sep 2023 11:39:27 +0000 (GMT)
From:   Peter Lafreniere <peter@n8pjl.ca>
To:     linux-doc@vger.kernel.org
Cc:     Peter Lafreniere <peter@n8pjl.ca>, corbet@lwn.org,
        linux-hams@vger.kernel.org, ralf@linux-mips.org,
        stable@vger.kernel.org
Subject: [PATCH] Documentation: netdev: fix dead link in ax25.rst
Date:   Fri,  8 Sep 2023 07:39:05 -0400
Message-id: <20230908113907.25053-1-peter@n8pjl.ca>
X-Mailer: git-send-email 2.42.0
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAHcve5kvIsOR4vqKkWsaSBP3N1G/gfAjUvtuKuqNQtp/6VFrgItE6EOgXBaIpAs
 I3f2DqqBpheuzF9+wzMJRSFoYIqGUUrqAt17j6IXlyL6Y3lveUKkoQck4cTrtzVb
 HNNWYMBoXK/Ki/8dxQ7aBmzvpQTr0QDNATm+rzaJnMfYVVXqOQ515jk9dBGPp1mJ
 T9eQKgndS8/Lc4CzeX/fqzCJkdJZuoLErdpvB5XkXg1U0YcWkVwVZp0n9dreCpnl
 49ib9cmKuh0sQwyjpkRYO0AGh/XDjTJjvtrPY4qnClOEYmLd1uxUHBRARQPs1+9E
 68lQMA50MscYxbyeLUiMkU7FSeljjf9YzKFuP54MmdZBQykZ1IzfKL6OYrUpN6xj
 QV/+tCxZXEbMfIwaaPZEZWavL43YdkYtK+WNSvX5SWAeCzug8yZVXu6e9Vm48g==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

http://linux-ax25.org has been down for nearly a year. Its official
replacement is https://linux-ax25.in-berlin.de.

Update the documentation to point there instead. And acknowledge that
while the linux-hams list isn't entirely dead, it isn't what most would
call 'active'. Remove that word.

Link: https://marc.info/?m=166792551600315
Cc: stable@vger.kernel.org
Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
 Documentation/networking/ax25.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/ax25.rst b/Documentation/networking/ax25.rst
index f060cfb1445a..605e72c6c877 100644
--- a/Documentation/networking/ax25.rst
+++ b/Documentation/networking/ax25.rst
@@ -7,9 +7,9 @@ AX.25
 To use the amateur radio protocols within Linux you will need to get a
 suitable copy of the AX.25 Utilities. More detailed information about
 AX.25, NET/ROM and ROSE, associated programs and utilities can be
-found on http://www.linux-ax25.org.
+found on https://linux-ax25.in-berlin.de.
 
-There is an active mailing list for discussing Linux amateur radio matters
+There is a mailing list for discussing Linux amateur radio matters
 called linux-hams@vger.kernel.org. To subscribe to it, send a message to
 majordomo@vger.kernel.org with the words "subscribe linux-hams" in the body
 of the message, the subject field is ignored.  You don't need to be
-- 
2.42.0

