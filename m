Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E8BEB7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Feb 2019 19:08:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbfBVTII (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Feb 2019 14:08:08 -0500
Received: from mx2.mailbox.org ([80.241.60.215]:43696 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbfBVTII (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 22 Feb 2019 14:08:08 -0500
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 29F44A0D22;
        Fri, 22 Feb 2019 20:08:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
        t=1550862484; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=N8G8WyEHIkhB6jbIxRcE+QOE69BYXBecKxn1KP/cESE=;
        b=vAyaYOYM5rGPV/sYkts5YOc/Dd9l7f78UqKFUqk/+rc1dPzXDOLQ7/yXFnbLSelIl5JYny
        CW7GY2GOt1O4gFBX9YxFi/SwnmJ179MGc6/zrMpL47kB4PuikR5gJWvmE8iHj3dRI+zI1d
        GgZcxegf8LZCEVgAmpBubVitTCf8+JknU/3AGAJLh6wDd10zcXYLUSJKrTJlCoi+fGPRV6
        uW1JucwJndtSWhf9kNnWpKEGqfUm/7d0d6cwCzp761ELU8deyADftGU3AInrSpsEXB7nW5
        fQt6MgJOU9NzL0UlN8sDEc6Z6tyTBRC0RkHRjBa4EXP20wRjBWQKfZHobjZN5w==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id hApWrE4P5f9W; Fri, 22 Feb 2019 20:07:58 +0100 (CET)
From:   Hauke Mehrtens <hauke@hauke-m.de>
To:     davem@davemloft.net
Cc:     arkadis@mellanox.com, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH] net: dsa: Remove documentation for port_fdb_prepare
Date:   Fri, 22 Feb 2019 20:07:45 +0100
Message-Id: <20190222190745.28020-1-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: default_out;
        spf=neutral (default_out: 80.241.56.125 is neither permitted nor denied by domain of hauke@hauke-m.de) smtp.mailfrom=hauke@hauke-m.de
X-Rspamd-Queue-Id: 60A001699
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This callback was removed some time ago, also remove the documentation.

Fixes: 1b6dd556c304 ("net: dsa: Remove prepare phase for FDB")
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 Documentation/networking/dsa/dsa.txt | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/Documentation/networking/dsa/dsa.txt b/Documentation/networking/dsa/dsa.txt
index 25170ad7d25b..101f2b2c69ad 100644
--- a/Documentation/networking/dsa/dsa.txt
+++ b/Documentation/networking/dsa/dsa.txt
@@ -533,16 +533,12 @@ Bridge VLAN filtering
   function that the driver has to call for each VLAN the given port is a member
   of. A switchdev object is used to carry the VID and bridge flags.
 
-- port_fdb_prepare: bridge layer function invoked when the bridge prepares the
-  installation of a Forwarding Database entry. If the operation is not
-  supported, this function should return -EOPNOTSUPP to inform the bridge code
-  to fallback to a software implementation. No hardware setup must be done in
-  this function. See port_fdb_add for this and details.
-
 - port_fdb_add: bridge layer function invoked when the bridge wants to install a
   Forwarding Database entry, the switch hardware should be programmed with the
   specified address in the specified VLAN Id in the forwarding database
-  associated with this VLAN ID
+  associated with this VLAN ID. If the operation is not supported, this
+  function should return -EOPNOTSUPP to inform the bridge code to fallback to
+  a software implementation.
 
 Note: VLAN ID 0 corresponds to the port private database, which, in the context
 of DSA, would be the its port-based VLAN, used by the associated bridge device.
-- 
2.20.1

