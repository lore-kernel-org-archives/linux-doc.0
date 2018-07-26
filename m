Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 465FE7DF74
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Jul 2018 16:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732161AbeGZRnL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Jul 2018 13:43:11 -0400
Received: from mga03.intel.com ([134.134.136.65]:54853 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732155AbeGZRnK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 26 Jul 2018 13:43:10 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jul 2018 09:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,405,1526367600"; 
   d="scan'208";a="76192069"
Received: from marshy.an.intel.com ([10.122.105.159])
  by orsmga001.jf.intel.com with ESMTP; 26 Jul 2018 09:25:35 -0700
From:   richard.gong@linux.intel.com
To:     gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will.deacon@arm.com, dinguyen@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, atull@kernel.org, mdf@kernel.org,
        arnd@arndb.de, corbet@lwn.net
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, yves.vandervennet@linux.intel.com,
        richard.gong@intel.com, joyce.ooi@intel.com
Subject: [PATCHv8 7/9] defconfig: enable fpga and service layer
Date:   Thu, 26 Jul 2018 11:27:24 -0500
Message-Id: <1532622446-19663-8-git-send-email-richard.gong@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532622446-19663-1-git-send-email-richard.gong@linux.intel.com>
References: <1532622446-19663-1-git-send-email-richard.gong@linux.intel.com>
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
v6: no change
v7: no change
v8: no change
---
 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d95b628..cb77c7c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -184,6 +184,7 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=m
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=m
+CONFIG_STRATIX10_SERVICE=y
 CONFIG_SRAM=y
 CONFIG_EEPROM_AT25=m
 # CONFIG_SCSI_PROC_FS is not set
@@ -621,6 +622,12 @@ CONFIG_PHY_ROCKCHIP_TYPEC=y
 CONFIG_PHY_TEGRA_XUSB=y
 CONFIG_QCOM_L2_PMU=y
 CONFIG_QCOM_L3_PMU=y
+CONFIG_MESON_EFUSE=m
+CONFIG_FPGA=y
+CONFIG_FPGA_MGR_STRATIX10_SOC=y
+CONFIG_FPGA_REGION=y
+CONFIG_FPGA_BRIDGE=y
+CONFIG_OF_FPGA_REGION=y
 CONFIG_QCOM_QFPROM=y
 CONFIG_ROCKCHIP_EFUSE=y
 CONFIG_UNIPHIER_EFUSE=y
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
