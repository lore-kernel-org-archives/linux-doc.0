Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A467F7D048
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 May 2018 16:30:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1033707AbeEXQaT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 May 2018 12:30:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:7315 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1031452AbeEXQ3X (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 May 2018 12:29:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 May 2018 09:29:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,436,1520924400"; 
   d="scan'208";a="51893092"
Received: from marshy.an.intel.com ([10.122.105.159])
  by FMSMGA003.fm.intel.com with ESMTP; 24 May 2018 09:29:21 -0700
From:   richard.gong@linux.intel.com
To:     catalin.marinas@arm.com, will.deacon@arm.com, dinguyen@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, atull@kernel.org,
        mdf@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        corbet@lwn.net
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, yves.vandervennet@linux.intel.com,
        richard.gong@linux.intel.com, richard.gong@intel.com
Subject: [PATCHv5 7/8] defconfig: enable fpga and service layer
Date:   Thu, 24 May 2018 11:33:19 -0500
Message-Id: <1527179600-26441-8-git-send-email-richard.gong@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527179600-26441-1-git-send-email-richard.gong@linux.intel.com>
References: <1527179600-26441-1-git-send-email-richard.gong@linux.intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Richard Gong <richard.gong@intel.com>

Enable fpga framework, Stratix 10 SoC FPGA manager and Stratix10
Service Layer

Signed-off-by: Richard Gong <richard.gong@intel.com>
Signed-off-by: Alan Tull <atull@kernel.org>
---
v2: this patch is added in patch set version 2
v3: no change
v4: s/CONFIG_INTEL_SERVICE/CONFIG_STRATIX10_SERVICE/
    add CONFIG_OF_FPGA_REGION=y
    s/Intel/Stratix10/ in subject line
v5: no change
---
 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ecf6137..5f7a9b7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -180,6 +180,7 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=m
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=m
+CONFIG_STRATIX10_SERVICE=y
 CONFIG_SRAM=y
 CONFIG_EEPROM_AT25=m
 # CONFIG_SCSI_PROC_FS is not set
@@ -595,6 +596,11 @@ CONFIG_PHY_TEGRA_XUSB=y
 CONFIG_QCOM_L2_PMU=y
 CONFIG_QCOM_L3_PMU=y
 CONFIG_MESON_EFUSE=m
+CONFIG_FPGA=y
+CONFIG_FPGA_MGR_STRATIX10_SOC=y
+CONFIG_FPGA_REGION=y
+CONFIG_FPGA_BRIDGE=y
+CONFIG_OF_FPGA_REGION=y
 CONFIG_QCOM_QFPROM=y
 CONFIG_UNIPHIER_EFUSE=y
 CONFIG_TEE=y
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
