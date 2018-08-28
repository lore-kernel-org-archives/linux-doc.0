Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 822667D2EE
	for <lwn-linux-doc@archive.lwn.net>; Tue, 28 Aug 2018 13:49:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbeH1Rj6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 Aug 2018 13:39:58 -0400
Received: from mga09.intel.com ([134.134.136.24]:61233 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728250AbeH1Rj6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 28 Aug 2018 13:39:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2018 06:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,299,1531810800"; 
   d="scan'208";a="85609957"
Received: from marshy.an.intel.com ([10.122.105.159])
  by orsmga001.jf.intel.com with ESMTP; 28 Aug 2018 06:48:12 -0700
From:   richard.gong@linux.intel.com
To:     gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will.deacon@arm.com, dinguyen@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, atull@kernel.org, mdf@kernel.org,
        arnd@arndb.de, corbet@lwn.net
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, yves.vandervennet@linux.intel.com,
        richard.gong@intel.com
Subject: [PATCHv8 4/9] dt-bindings: fpga: add Stratix10 SoC FPGA manager binding
Date:   Tue, 28 Aug 2018 08:50:40 -0500
Message-Id: <1535464245-11638-5-git-send-email-richard.gong@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535464245-11638-1-git-send-email-richard.gong@linux.intel.com>
References: <1535464245-11638-1-git-send-email-richard.gong@linux.intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alan Tull <atull@kernel.org>

Add a Device Tree binding for the Intel Stratix10 SoC FPGA manager.

Signed-off-by: Alan Tull <atull@kernel.org>
Signed-off-by: Richard Gong <richard.gong@intel.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2: this patch is added in patch set version 2
v3: change to put fpga_mgr node under firmware/svc node
v4: s/fpga-mgr@0/fpga-mgr/ to remove unit_address
    add Richard's signed-off-by
v5: add Reviewed-by Rob Herring
v6: no change
v7: no change
v8: no change
---
 .../bindings/fpga/intel-stratix10-soc-fpga-mgr.txt      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/intel-stratix10-soc-fpga-mgr.txt

diff --git a/Documentation/devicetree/bindings/fpga/intel-stratix10-soc-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/intel-stratix10-soc-fpga-mgr.txt
new file mode 100644
index 0000000..6e03f79
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/intel-stratix10-soc-fpga-mgr.txt
@@ -0,0 +1,17 @@
+Intel Stratix10 SoC FPGA Manager
+
+Required properties:
+The fpga_mgr node has the following mandatory property, must be located under
+firmware/svc node.
+
+- compatible : should contain "intel,stratix10-soc-fpga-mgr"
+
+Example:
+
+	firmware {
+		svc {
+			fpga_mgr: fpga-mgr {
+				compatible = "intel,stratix10-soc-fpga-mgr";
+			};
+		};
+	};
-- 
2.7.4

