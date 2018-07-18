Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 74FA77DE7F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Jul 2018 16:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731728AbeGRQzg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Jul 2018 12:55:36 -0400
Received: from mga06.intel.com ([134.134.136.31]:52005 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730987AbeGRQzf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Jul 2018 12:55:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jul 2018 09:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,370,1526367600"; 
   d="scan'208";a="67947088"
Received: from marshy.an.intel.com ([10.122.105.159])
  by orsmga003.jf.intel.com with ESMTP; 18 Jul 2018 09:16:41 -0700
From:   richard.gong@linux.intel.com
To:     gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will.deacon@arm.com, dinguyen@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, atull@kernel.org, mdf@kernel.org,
        arnd@arndb.de, corbet@lwn.net
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, yves.vandervennet@linux.intel.com,
        richard.gong@intel.com
Subject: [PATCHv7 8/9] Documentation: driver-api: add stratix10 service layer
Date:   Wed, 18 Jul 2018 11:18:43 -0500
Message-Id: <1531930724-22061-9-git-send-email-richard.gong@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531930724-22061-1-git-send-email-richard.gong@linux.intel.com>
References: <1531930724-22061-1-git-send-email-richard.gong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Richard Gong <richard.gong@intel.com>

Add new file stratix10-svc.rst
Add stratix10-svc.rst to driver-api/index.rst

Signed-off-by: Richard Gong <richard.gong@intel.com>
Signed-off-by: Alan Tull <atull@kernel.org>
---
v5: this patch is added in patch set version 5
v6: no change
v7: no change
---
 Documentation/driver-api/index.rst         |  1 +
 Documentation/driver-api/stratix10-svc.rst | 32 ++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 Documentation/driver-api/stratix10-svc.rst

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 6d9f2f9..d4d2671 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -53,6 +53,7 @@ available subsections can be seen below.
    slimbus
    soundwire/index
    fpga/index
+   stratix10-svc
 
 .. only::  subproject and html
 
diff --git a/Documentation/driver-api/stratix10-svc.rst b/Documentation/driver-api/stratix10-svc.rst
new file mode 100644
index 0000000..ed361d8
--- /dev/null
+++ b/Documentation/driver-api/stratix10-svc.rst
@@ -0,0 +1,32 @@
+
+Intel Stratix10 SoC Service Layer
+=================================
+
+Some features of the Intel Stratix10 SoC require a level of privilege
+higher than the kernel is granted. Such secure features include
+FPGA programming. In terms of the ARMv8 architecture, the kernel runs
+at Exception Level 1 (EL1), access to the features requires
+Exception Level 3 (EL3).
+
+The Intel Stratix10 SoC service layer provides an in kernel API for
+drivers to request access to the secure features. The requests are queued
+and processed one by one. ARM’s SMCCC is used to pass the execution
+of the requests on to a secure monitor (EL3).
+
+.. kernel-doc:: include/linux/stratix10-svc-client.h
+   :functions: stratix10_svc_command_code
+
+.. kernel-doc:: include/linux/stratix10-svc-client.h
+   :functions: stratix10_svc_client_msg
+
+.. kernel-doc:: include/linux/stratix10-svc-client.h
+   :functions: stratix10_svc_command_reconfig_payload
+
+.. kernel-doc:: include/linux/stratix10-svc-client.h
+   :functions: stratix10_svc_cb_data
+
+.. kernel-doc:: include/linux/stratix10-svc-client.h
+   :functions: stratix10_svc_client
+
+.. kernel-doc:: drivers/misc/stratix10-svc.c
+   :export:
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
