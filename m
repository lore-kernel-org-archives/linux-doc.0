Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 611E17D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 Jan 2019 09:34:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbfAVJeU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 Jan 2019 04:34:20 -0500
Received: from tartarus.angband.pl ([54.37.238.230]:42876 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbfAVJeU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Jan 2019 04:34:20 -0500
Received: from [2a02:a31c:853f:a300::6] (helo=umbar.angband.pl)
        by tartarus.angband.pl with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <kilobyte@angband.pl>)
        id 1glsRh-00066C-Th; Tue, 22 Jan 2019 10:34:15 +0100
Received: from kilobyte by umbar.angband.pl with local (Exim 4.92-RC4)
        (envelope-from <kilobyte@umbar.angband.pl>)
        id 1glsRh-0004N3-3O; Tue, 22 Jan 2019 10:34:13 +0100
From:   Adam Borowski <kilobyte@angband.pl>
To:     Jonathan Corbet <corbet@lwn.net>, Greg KH <greg@kroah.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Adam Borowski <kilobyte@angband.pl>
Date:   Tue, 22 Jan 2019 10:34:08 +0100
Message-Id: <20190122093408.16756-1-kilobyte@angband.pl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a02:a31c:853f:a300::6
X-SA-Exim-Mail-From: kilobyte@angband.pl
Subject: [PATCH] doc: process: GPL -> GPL-compatible
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on tartarus.angband.pl)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Drivers under MIT, BSD-17-clause, or uncle-Bob's-newest-take-on-PD are
all fine, not just GPL.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
Not reformatting to fill lines, it'll semi-conflict with another patch
that's been acked but not yet pushed.

 Documentation/process/stable-api-nonsense.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/stable-api-nonsense.rst b/Documentation/process/stable-api-nonsense.rst
index 24f5aeecee91..9b69fb08b65e 100644
--- a/Documentation/process/stable-api-nonsense.rst
+++ b/Documentation/process/stable-api-nonsense.rst
@@ -170,7 +170,8 @@ nightmare, and trying to keep up with an ever changing kernel interface
 is also a rough job.
 
 Simple, get your kernel driver into the main kernel tree (remember we
-are talking about GPL released drivers here, if your code doesn't fall
+are talking about drivers released under a GPL-compatible license here,
+if your code doesn't fall
 under this category, good luck, you are on your own here, you leech
 <insert link to leech comment from Andrew and Linus here>.)  If your
 driver is in the tree, and a kernel interface changes, it will be fixed
-- 
2.20.1

