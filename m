Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2899E7D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Oct 2018 08:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbeJIPre (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Oct 2018 11:47:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:43084 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725892AbeJIPrd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 9 Oct 2018 11:47:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 26EA7AF80;
        Tue,  9 Oct 2018 08:31:46 +0000 (UTC)
From:   Nikolay Borisov <nborisov@suse.com>
To:     snitzer@redhat.com
Cc:     linux-doc@vger.kernel.org, dm-devel@redhat.com, corbet@lwn.net,
        Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH] dm flakey: Document "error_writes" feature
Date:   Tue,  9 Oct 2018 11:31:31 +0300
Message-Id: <1539073891-7701-1-git-send-email-nborisov@suse.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit ef548c551e72 ("dm flakey: introduce "error_writes" feature")
added the ability to dm flakey to error out writes in contrast to
silently dropping it with 'drop_writes'. Unfortunately this feature
is not currently documented and one has to be either familiar with the
source code of dm flakey or check out xfstests sources to know of
this parameter. So document it.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 Documentation/device-mapper/dm-flakey.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/device-mapper/dm-flakey.txt b/Documentation/device-mapper/dm-flakey.txt
index c43030718cef..9f0e247d0877 100644
--- a/Documentation/device-mapper/dm-flakey.txt
+++ b/Documentation/device-mapper/dm-flakey.txt
@@ -33,6 +33,10 @@ Table parameters
 	All write I/O is silently ignored.
 	Read I/O is handled correctly.
 
+  error_writes:
+	All write I/O is failed with an error signalled.
+	Read I/O is handled correctly.
+
   corrupt_bio_byte <Nth_byte> <direction> <value> <flags>:
 	During <down interval>, replace <Nth_byte> of the data of
 	each matching bio with <value>.
-- 
2.7.4

