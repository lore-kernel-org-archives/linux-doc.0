Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 597A97DE78
	for <lwn-linux-doc@archive.lwn.net>; Sun,  8 Apr 2018 02:57:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752588AbeDHC4z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 7 Apr 2018 22:56:55 -0400
Received: from mga06.intel.com ([134.134.136.31]:31592 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752458AbeDHC4y (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 7 Apr 2018 22:56:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Apr 2018 19:56:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,421,1517904000"; 
   d="scan'208";a="30963110"
Received: from gvt-dell.bj.intel.com (HELO gvt-dell-host.bj.intel.com) ([10.238.154.59])
  by fmsmga008.fm.intel.com with ESMTP; 07 Apr 2018 19:56:51 -0700
From:   changbin.du@intel.com
To:     corbet@lwn.net
Cc:     gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Changbin Du <changbin.du@intel.com>
Subject: [PATCH] Documentation: fix reST markup error in driver-api/usb/typec.rst
Date:   Sun,  8 Apr 2018 10:47:12 +0800
Message-Id: <1523155632-10301-1-git-send-email-changbin.du@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Changbin Du <changbin.du@intel.com>

There is an format error in driver-api/usb/typec.rst that breaks sphinx
docs building.

reST markup error:
/home/changbin/work/linux/Documentation/driver-api/usb/typec.rst:215: (SEVERE/4) Unexpected section title or transition.

------------------------
Documentation/Makefile:68: recipe for target 'htmldocs' failed
make[1]: *** [htmldocs] Error 1
Makefile:1527: recipe for target 'htmldocs' failed
make: *** [htmldocs] Error 2

Signed-off-by: Changbin Du <changbin.du@intel.com>
---
 Documentation/driver-api/usb/typec.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/usb/typec.rst b/Documentation/driver-api/usb/typec.rst
index feb3194..48ff580 100644
--- a/Documentation/driver-api/usb/typec.rst
+++ b/Documentation/driver-api/usb/typec.rst
@@ -210,7 +210,7 @@ If the connector is dual-role capable, there may also be a switch for the data
 role. USB Type-C Connector Class does not supply separate API for them. The
 port drivers can use USB Role Class API with those.
 
-Illustration of the muxes behind a connector that supports an alternate mode:
+Illustration of the muxes behind a connector that supports an alternate mode::
 
                      ------------------------
                      |       Connector      |
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
