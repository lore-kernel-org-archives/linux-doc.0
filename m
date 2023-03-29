Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAC8C74A5B
	for <linux-doc@archiver.kernel.org>; Wed, 29 Mar 2023 10:12:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjC2KMW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Mar 2023 06:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjC2KMW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Mar 2023 06:12:22 -0400
X-Greylist: delayed 963 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 29 Mar 2023 03:12:19 PDT
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [IPv6:2a02:9e0:8000::27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA0B10DE
        for <linux-doc@vger.kernel.org>; Wed, 29 Mar 2023 03:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protonic.nl; s=202111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
         from;
        bh=A7yjEgP+A6xQRL7HSj3Fivv9FpYOncdPGUSCTs1pGgQ=;
        b=D2r0rPk9EYmB211NId2iOgRHJPBys7KZ5o0g8MpYtu0Lknmpgjl0sfhbN4N3FJilbepTgd78alZ1F
         uusi34s+XlH5i1cIKEHnrAUqiAicnRU9s6/4weKPu80LLYiYpM28Bz6yNRPyxxcTCG5lH5skQSJjoW
         qawhs/aXLgcjCh/b5QAKpczKa6zLsamzlh3gX7XRW7D3Nhke1s2yVLYMiPrgkYBw4HVDEnYNB3X/8P
         u9Mtwb1FEFRoeWsZLIce0IZCLeXCIqoQnu843CicvIqyv8FXIJTAR5PgLfXNcCoYZNi2AATuBZs3oV
         hVn8Ybt0MrZK1nlT0QHZUegoqkBAY8A==
X-MSG-ID: efe3a89b-ce17-11ed-829c-0050569d2c73
From:   Roan van Dijk <roan@protonic.nl>
To:     corbet@lwn.net
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        linux-doc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Roan van Dijk <roan@protonic.nl>
Subject: [PATCH] ARM: stm32: add initial documentation for STM32MP151
Date:   Wed, 29 Mar 2023 11:56:00 +0200
Message-Id: <20230329095600.1355049-1-roan@protonic.nl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds initial documentation of STM32MP151 microprocessor (MPU)
based on Arm Cortex-A7.

Signed-off-by: Roan van Dijk <roan@protonic.nl>
---
 .../arm/stm32/stm32mp151-overview.rst         | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/arm/stm32/stm32mp151-overview.rst

diff --git a/Documentation/arm/stm32/stm32mp151-overview.rst b/Documentation/arm/stm32/stm32mp151-overview.rst
new file mode 100644
index 000000000000..f42a2ac309c0
--- /dev/null
+++ b/Documentation/arm/stm32/stm32mp151-overview.rst
@@ -0,0 +1,36 @@
+===================
+STM32MP151 Overview
+===================
+
+Introduction
+------------
+
+The STM32MP151 is a Cortex-A MPU aimed at various applications.
+It features:
+
+- Single Cortex-A7 application core
+- Standard memories interface support
+- Standard connectivity, widely inherited from the STM32 MCU family
+- Comprehensive security support
+
+More details:
+
+- Cortex-A7 core running up to @800MHz
+- FMC controller to connect SDRAM, NOR and NAND memories
+- QSPI
+- SD/MMC/SDIO support
+- Ethernet controller
+- ADC/DAC
+- USB EHCI/OHCI controllers
+- USB OTG
+- I2C, SPI busses support
+- Several general purpose timers
+- Serial Audio interface
+- LCD-TFT controller
+- DCMIPP
+- SPDIFRX
+- DFSDM
+
+:Authors:
+
+- Roan van Dijk <roan@protonic.nl>
-- 
2.37.2

