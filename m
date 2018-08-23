Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0906C7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Thu, 23 Aug 2018 19:49:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726459AbeHWXUg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 23 Aug 2018 19:20:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37778 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726277AbeHWXUg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 23 Aug 2018 19:20:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 8E64340216E7;
        Thu, 23 Aug 2018 19:49:23 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-120-97.rdu2.redhat.com [10.10.120.97])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EAEF1C672;
        Thu, 23 Aug 2018 19:49:22 +0000 (UTC)
From:   John Pittman <jpittman@redhat.com>
To:     corbet@lwn.net
Cc:     martin.petersen@oracle.com, linux-doc@vger.kernel.org,
        linux-scsi@vger.kernel.org, John Pittman <jpittman@redhat.com>
Subject: [PATCH] scsi: documentation: add scsi_mod.use_blk_mq to scsi-parameters
Date:   Thu, 23 Aug 2018 15:49:18 -0400
Message-Id: <20180823194918.25708-1-jpittman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Thu, 23 Aug 2018 19:49:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Thu, 23 Aug 2018 19:49:23 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'jpittman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kernel line argument scsi_mod.use_blk_mq is missing from file
Documentation/scsi/scsi-parameters.txt.  Add this option,
providing mention of config setting and format.

Signed-off-by: John Pittman <jpittman@redhat.com>
---
 Documentation/scsi/scsi-parameters.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/scsi/scsi-parameters.txt b/Documentation/scsi/scsi-parameters.txt
index 25a4b4cf04a6..8d11aaed33d3 100644
--- a/Documentation/scsi/scsi-parameters.txt
+++ b/Documentation/scsi/scsi-parameters.txt
@@ -97,6 +97,11 @@ parameters may be changed at runtime by the command
 			allowing boot to proceed.  none ignores them, expecting
 			user space to do the scan.
 
+	scsi_mod.use_blk_mq=
+			[SCSI] use blk-mq I/O path by default
+			See drivers/scsi/Kconfig for config setting.
+			Format: <y/n>
+
 	sim710=		[SCSI,HW]
 			See header of drivers/scsi/sim710.c.
 
-- 
2.17.1

