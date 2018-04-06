Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E65B47DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Apr 2018 12:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752522AbeDFMl1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Apr 2018 08:41:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:5597 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752517AbeDFMl0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Apr 2018 08:41:26 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Apr 2018 05:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,415,1517904000"; 
   d="scan'208";a="44628818"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2018 05:41:23 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Masanari Iida <standby24x7@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2] Documentation: typec.rst: Use literal-block element with ascii art
Date:   Fri,  6 Apr 2018 15:41:22 +0300
Message-Id: <20180406124122.70676-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.16.3
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Using reStructuredText literal-block element with ascii-art.
That prevents the ascii art from being processed as
reStructuredText.

Reported-by: Masanari Iida <standby24x7@gmail.com>
Fixes: bdecb33af34f ("usb: typec: API for controlling USB Type-C Multiplexers")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changed since v1:
- Using literal-block element instead of comment
- Subject in v1 was "Documentation: typec.rst: Mark ascii art as a comment"
---
 Documentation/driver-api/usb/typec.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/usb/typec.rst b/Documentation/driver-api/usb/typec.rst
index feb31946490b..48ff58095f11 100644
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
2.16.3

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
