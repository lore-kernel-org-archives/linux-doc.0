Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3661EC433FE
	for <linux-doc@archiver.kernel.org>; Wed, 13 Apr 2022 14:06:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236086AbiDMOJC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Apr 2022 10:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236102AbiDMOJB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Apr 2022 10:09:01 -0400
X-Greylist: delayed 386 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Apr 2022 07:06:39 PDT
Received: from smtpservice.6wind.com (unknown [185.13.181.2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B9E5560A99
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 07:06:39 -0700 (PDT)
Received: from bretzel (bretzel.dev.6wind.com [10.17.1.57])
        by smtpservice.6wind.com (Postfix) with ESMTPS id 4B8B060010;
        Wed, 13 Apr 2022 16:00:12 +0200 (CEST)
Received: from dichtel by bretzel with local (Exim 4.92)
        (envelope-from <dichtel@6wind.com>)
        id 1nedXY-00069d-7O; Wed, 13 Apr 2022 16:00:12 +0200
From:   Nicolas Dichtel <nicolas.dichtel@6wind.com>
To:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Xin Long <lucien.xin@gmail.com>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>
Subject: [PATCH net] doc/ip-sysctl: add bc_forwarding
Date:   Wed, 13 Apr 2022 16:00:00 +0200
Message-Id: <20220413140000.23648-1-nicolas.dichtel@6wind.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Let's describe this sysctl.

Fixes: 5cbf777cfdf6 ("route: add support for directed broadcast forwarding")
Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 Documentation/networking/ip-sysctl.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index b0024aa7b051..66828293d9cb 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -267,6 +267,13 @@ ipfrag_max_dist - INTEGER
 	from different IP datagrams, which could result in data corruption.
 	Default: 64
 
+bc_forwarding - INTEGER
+	bc_forwarding enables the feature described in rfc1812#section-5.3.5.2
+	and rfc2644. It allows the router to forward directed broadcast.
+	To enable this feature, the 'all' entry and the input interface entry
+	should be set to 1.
+	Default: 0
+
 INET peer storage
 =================
 
-- 
2.33.0

