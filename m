Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 38D2A7D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Sep 2019 16:46:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbfIKQqm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Sep 2019 12:46:42 -0400
Received: from smtp112.ord1c.emailsrvr.com ([108.166.43.112]:47889 "EHLO
        smtp112.ord1c.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729003AbfIKQqm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Sep 2019 12:46:42 -0400
X-Greylist: delayed 408 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Sep 2019 12:46:42 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
        s=20190130-41we5z8j; t=1568219994;
        bh=ShXCPuRTmrlcXQzNVyVjvWiPOGKA9ghbqXSw5ScsjpY=;
        h=From:To:Subject:Date:From;
        b=ighaW8uwiJSs2+yv0J1Fj6FHIvEo+xB+FivBVZujCIPewmG5OsbTMmrWIvohtlegp
         gJEyD0z+VVKM/b6UJXE6BtIAg0kVA1FqgwBhe6fvwL59GytokCuLVczuxzAtRMKMHP
         //bDXfwK6xaZoQqVmsGnPxKCDa7ZDWM6MEg2/wPU=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp15.relay.ord1c.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 9F8E620138;
        Wed, 11 Sep 2019 12:39:53 -0400 (EDT)
X-Sender-Id: abbotti@mev.co.uk
Received: from ian-deb.inside.mev.co.uk (remote.quintadena.com [81.133.34.160])
        (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256)
        by 0.0.0.0:465 (trex/5.7.12);
        Wed, 11 Sep 2019 12:39:54 -0400
From:   Ian Abbott <abbotti@mev.co.uk>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ian Abbott <abbotti@mev.co.uk>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] devices.txt: improve entry for comedi (char major 98)
Date:   Wed, 11 Sep 2019 17:39:41 +0100
Message-Id: <20190911163941.16664-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Describe how the comedi minor device numbers are split across comedi
devices and comedi subdevices.

Replace the current, long dead URL with an official URL for the Comedi
project.

Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 Documentation/admin-guide/devices.txt | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
index e56e00655153..1c5d2281efc9 100644
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -1647,8 +1647,17 @@
 		  0 = /dev/comedi0	First comedi device
 		  1 = /dev/comedi1	Second comedi device
 		    ...
+		 47 = /dev/comedi47	48th comedi device
 
-		See http://stm.lbl.gov/comedi.
+		Minors 48 to 255 are reserved for comedi subdevices with
+		pathnames of the form "/dev/comediX_subdY", where "X" is the
+		minor number of the associated comedi device and "Y" is the
+		subdevice number.  These subdevice minors are assigned
+		dynamically, so there is no fixed mapping from subdevice
+		pathnames to minor numbers.
+
+		See http://www.comedi.org/ for information about the Comedi
+		project.
 
   98 block	User-mode virtual block device
 		  0 = /dev/ubda		First user-mode block device
-- 
2.23.0

