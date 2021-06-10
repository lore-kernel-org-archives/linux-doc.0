Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE04C47094
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 15:53:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46BA5613CB
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 15:53:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbhFJPzY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Jun 2021 11:55:24 -0400
Received: from mail.satchell.net ([99.65.194.97]:47400 "EHLO mail.satchell.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231542AbhFJPzY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Jun 2021 11:55:24 -0400
X-Greylist: delayed 471 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 Jun 2021 11:55:24 EDT
Received: from c7-i5.satchell.net (unknown [10.1.1.36])
        by mail.satchell.net (Postfix) with ESMTP id 9CD21601EF;
        Thu, 10 Jun 2021 08:45:37 -0700 (PDT)
Reply-To: list@satchell.net
To:     linux-doc@vger.kernel.org, netdev@vger.kernel.org
From:   Stephen Satchell <list@satchell.net>
Subject: [PATCH docs-next] sysctl -- rp_format completed description with
 filter criteria
Message-ID: <b143fc72-afda-1570-7ac1-1e90461a9859@satchell.net>
Date:   Thu, 10 Jun 2021 08:45:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

---
  Documentation/networking/ip-sysctl.rst | 7 +++++++
  1 file changed, 7 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.rst 
b/Documentation/networking/ip-sysctl.rst
index c2ecc98..0ab017b 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -1443,6 +1443,13 @@ rp_filter - INTEGER
  	  and if the source address is not reachable via any interface
  	  the packet check will fail.

+	rp_filter will examine the source address of an incoming IP
+	packet by performing an FIB lookup.  In loose mode (value 2),
+	the packet is rejected if the source address is neither
+	UNICAST nor LOCAL(when interface allows) nor IPSEC.  For
+	strict mode (value 1) the interface indicated by the FIB table
+	entry must also match the interface on which the packet arrived.
+
  	Current recommended practice in RFC3704 is to enable strict mode
  	to prevent IP spoofing from DDos attacks. If using asymmetric routing
  	or other complicated routing, then loose mode is recommended.
-- 
1.8.3.1
