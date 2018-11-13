Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5DE387D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 18:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732366AbeKNEEy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 23:04:54 -0500
Received: from mga07.intel.com ([134.134.136.100]:30019 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726862AbeKNEEy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Nov 2018 23:04:54 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Nov 2018 10:05:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,229,1539673200"; 
   d="scan'208";a="279519309"
Received: from marshy.an.intel.com ([10.122.105.159])
  by fmsmga005.fm.intel.com with ESMTP; 13 Nov 2018 10:05:40 -0800
From:   richard.gong@linux.intel.com
To:     gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will.deacon@arm.com, dinguyen@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, atull@kernel.org, mdf@kernel.org,
        arnd@arndb.de, corbet@lwn.net
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, todd.riffel@intel.com,
        richard.gong@linux.intel.com, richard.gong@intel.com
Subject: [PATCHv11 1/8] dt-bindings, firmware: add Intel Stratix10 service layer binding
Date:   Tue, 13 Nov 2018 12:13:59 -0600
Message-Id: <1542132846-24168-2-git-send-email-richard.gong@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542132846-24168-1-git-send-email-richard.gong@linux.intel.com>
References: <1542132846-24168-1-git-send-email-richard.gong@linux.intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Richard Gong <richard.gong@intel.com>

Add a device tree binding for the Intel Stratix10 service layer driver

Signed-off-by: Richard Gong <richard.gong@intel.com>
Signed-off-by: Alan Tull <atull@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Moritz Fischer <mdf@kernel.org>
---
v2: change to put service layer driver node under the firmware node
    change compatible to "intel, stratix10-svc"
v3: no change
v4: add Rob's Reviewed-by
v5: no change
v6: add Moritz's Acked-by
v7: no change
v8: no change
v9: no chnage
v10: no change
v11: no change
---
 .../bindings/firmware/intel,stratix10-svc.txt      | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt

diff --git a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
new file mode 100644
index 0000000..1fa6606
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
@@ -0,0 +1,57 @@
+Intel Service Layer Driver for Stratix10 SoC
+============================================
+Intel Stratix10 SoC is composed of a 64 bit quad-core ARM Cortex A53 hard
+processor system (HPS) and Secure Device Manager (SDM). When the FPGA is
+configured from HPS, there needs to be a way for HPS to notify SDM the
+location and size of the configuration data. Then SDM will get the
+configuration data from that location and perform the FPGA configuration.
+
+To meet the whole system security needs and support virtual machine requesting
+communication with SDM, only the secure world of software (EL3, Exception
+Layer 3) can interface with SDM. All software entities running on other
+exception layers must channel through the EL3 software whenever it needs
+service from SDM.
+
+Intel Stratix10 service layer driver, running at privileged exception level
+(EL1, Exception Layer 1), interfaces with the service providers and provides
+the services for FPGA configuration, QSPI, Crypto and warm reset. Service layer
+driver also manages secure monitor call (SMC) to communicate with secure monitor
+code running in EL3.
+
+Required properties:
+-------------------
+The svc node has the following mandatory properties, must be located under
+the firmware node.
+
+- compatible: "intel,stratix10-svc"
+- method: smc or hvc
+        smc - Secure Monitor Call
+        hvc - Hypervisor Call
+- memory-region:
+	phandle to the reserved memory node. See
+	Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+	for details
+
+Example:
+-------
+
+	reserved-memory {
+                #address-cells = <2>;
+                #size-cells = <2>;
+                ranges;
+
+                service_reserved: svcbuffer@0 {
+                        compatible = "shared-dma-pool";
+                        reg = <0x0 0x0 0x0 0x1000000>;
+                        alignment = <0x1000>;
+                        no-map;
+                };
+        };
+
+	firmware {
+		svc {
+			compatible = "intel,stratix10-svc";
+			method = "smc";
+			memory-region = <&service_reserved>;
+		};
+	};
-- 
2.7.4

