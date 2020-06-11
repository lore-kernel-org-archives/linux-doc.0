Return-Path: <SRS0=MEEV=7Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D810C433E3
	for <linux-doc@archiver.kernel.org>; Thu, 11 Jun 2020 17:31:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E8A120792
	for <linux-doc@archiver.kernel.org>; Thu, 11 Jun 2020 17:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591896705;
	bh=fLzZhF2ubQjuBgB/SmOWGelx85vKBQiUXjldX57+ajo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=tC6+M4N1EuWpku3QOoIUWMZXE+t9tdw/A3mFzLPyAK6Ppm+SSkPqaXfx138MvMFM4
	 WukN/gmLBZBSNT+TzX2tVYiBejUSy9KRYS7LlQKsMveqQgu3DoMuLUuSb8g01JALic
	 ke0jgUyLVaPYfPxQeVjKEYVNRBfNXchGLdABxRLU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgFKRbm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Jun 2020 13:31:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:55244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726846AbgFKRbZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 11 Jun 2020 13:31:25 -0400
Received: from kicinski-fedora-PC1C0HJN.thefacebook.com (unknown [163.114.132.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33F78207ED;
        Thu, 11 Jun 2020 17:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591896684;
        bh=fLzZhF2ubQjuBgB/SmOWGelx85vKBQiUXjldX57+ajo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zSIkxhunMYPSEjkmjKXthQwWvdioNFxaH25KIGras73W+aMzen9QNg/47RE4EeGVB
         EBILBaH17QRR/QJzsR+MzjoIirydVOFhEMLCrb3sAQ2dKh0d32NtL4ad8FfKx201WC
         TUrma056Ch4KiYGpONUjFDyemYfPLpm/JW4Pzsyg=
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: [RFC 6/8] docs: networking: move AppleTalk / LocalTalk drivers to the hw driver section
Date:   Thu, 11 Jun 2020 10:30:08 -0700
Message-Id: <20200611173010.474475-7-kuba@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200611173010.474475-1-kuba@kernel.org>
References: <20200611173010.474475-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move docs for cops and ltpc under device_drivers/appletalk.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 .../{ => device_drivers/appletalk}/cops.rst   |  0
 .../device_drivers/appletalk/index.rst        | 19 +++++++++++++++++++
 .../{ => device_drivers/appletalk}/ltpc.rst   |  0
 .../networking/device_drivers/index.rst       |  1 +
 Documentation/networking/index.rst            |  2 --
 drivers/net/appletalk/Kconfig                 |  3 ++-
 6 files changed, 22 insertions(+), 3 deletions(-)
 rename Documentation/networking/{ => device_drivers/appletalk}/cops.rst (100%)
 create mode 100644 Documentation/networking/device_drivers/appletalk/index.rst
 rename Documentation/networking/{ => device_drivers/appletalk}/ltpc.rst (100%)

diff --git a/Documentation/networking/cops.rst b/Documentation/networking/device_drivers/appletalk/cops.rst
similarity index 100%
rename from Documentation/networking/cops.rst
rename to Documentation/networking/device_drivers/appletalk/cops.rst
diff --git a/Documentation/networking/device_drivers/appletalk/index.rst b/Documentation/networking/device_drivers/appletalk/index.rst
new file mode 100644
index 000000000000..de7507f02037
--- /dev/null
+++ b/Documentation/networking/device_drivers/appletalk/index.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+AppleTalk Device Drivers
+========================
+
+Contents:
+
+.. toctree::
+   :maxdepth: 2
+
+   cops
+   ltpc
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/networking/ltpc.rst b/Documentation/networking/device_drivers/appletalk/ltpc.rst
similarity index 100%
rename from Documentation/networking/ltpc.rst
rename to Documentation/networking/device_drivers/appletalk/ltpc.rst
diff --git a/Documentation/networking/device_drivers/index.rst b/Documentation/networking/device_drivers/index.rst
index 5497e3ae1ca9..3995e2179aa0 100644
--- a/Documentation/networking/device_drivers/index.rst
+++ b/Documentation/networking/device_drivers/index.rst
@@ -8,6 +8,7 @@ Hardware Device Drivers
 .. toctree::
    :maxdepth: 2
 
+   appletalk/index
    cable/index
    cellular/index
    ethernet/index
diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 9bc8ecc79d94..eb616ac48094 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -44,7 +44,6 @@ Linux Networking Documentation
    ax25
    bonding
    cdc_mbim
-   cops
    cxacru
    dccp
    dctcp
@@ -73,7 +72,6 @@ Linux Networking Documentation
    kcm
    l2tp
    lapb-module
-   ltpc
    mac80211-injection
    mpls-sysctl
    multiqueue
diff --git a/drivers/net/appletalk/Kconfig b/drivers/net/appletalk/Kconfig
index 10589a82263b..ef45ac8992b6 100644
--- a/drivers/net/appletalk/Kconfig
+++ b/drivers/net/appletalk/Kconfig
@@ -59,7 +59,8 @@ config COPS
 	  package. This driver is experimental, which means that it may not
 	  work. This driver will only work if you choose "AppleTalk DDP"
 	  networking support, above.
-	  Please read the file <file:Documentation/networking/cops.rst>.
+	  Please read the file
+	  <file:Documentation/networking/device_drivers/appletalk/cops.rst>.
 
 config COPS_DAYNA
 	bool "Dayna firmware support"
-- 
2.26.2

