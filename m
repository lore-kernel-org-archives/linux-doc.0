Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0F5ED7E892
	for <lwn-linux-doc@archive.lwn.net>; Fri, 30 Mar 2018 17:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752159AbeC3RIg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 30 Mar 2018 13:08:36 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55872 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751256AbeC3RIf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Mar 2018 13:08:35 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DBBCF60D81; Fri, 30 Mar 2018 17:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1522429714;
        bh=iutYM4a1/VM6s7F118hGoLIWXouScIIh2zo+ckvjD1w=;
        h=From:To:Cc:Subject:Date:From;
        b=LTNLQtfs6a5UQ4/fi0Z+0KsLX9DPf0b2yd+2xc+AXgwaN9HuX522pU92qncypwtTk
         cxwah8QQkLe0yzrRquUHUvSeyO9O8T6A2iYDQKSdrtpOrSGgCl17/LivKFiPq32pMu
         hSUH3vIWICuqsz14hi6MQHfEISMxVLsZFw0r82vQ=
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kramasub@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 94617602BA;
        Fri, 30 Mar 2018 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1522429713;
        bh=iutYM4a1/VM6s7F118hGoLIWXouScIIh2zo+ckvjD1w=;
        h=From:To:Cc:Subject:Date:From;
        b=nlXMqZahnanP5fmWfZ+4c2AXU/DxcCmeGCI8rpYy1GeEgJlQZusqT5Uzszl/Bx+vJ
         oN/6tH7NBfGmYt6kNVi1y80/M1xJYFERAdNrwote3sTpvmqLzTL+W3s7Dc6pmEM3IE
         mRPISwyKErmTIEBB+wWpmMI1tYvGEjd95rPycElQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94617602BA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kramasub@codeaurora.org
From:   Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
To:     corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de
Cc:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org,
        dianders@chromium.org, bjorn.andersson@linaro.org
Subject: [PATCH v6 0/5] Introduce GENI SE Controller Driver
Date:   Fri, 30 Mar 2018 11:08:15 -0600
Message-Id: <1522429700-13083-1-git-send-email-kramasub@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Generic Interface (GENI) firmware based Qualcomm Universal Peripheral (QUP)
Wrapper is a next generation programmable module for supporting a wide
range of serial interfaces like UART, SPI, I2C, I3C, etc. A single QUP
module can provide upto 8 Serial Interfaces using its internal Serial
Engines (SE). The protocol supported by each interface is determined by
the firmware loaded to the Serial Engine.

This patch series introduces GENI SE Driver to manage the GENI based QUP
Wrapper and the common aspects of all SEs inside the QUP Wrapper. This
patch series also introduces the UART and I2C Controller drivers to
drive the SEs that are programmed with the respective protocols.

[v6]
 * Move the I2C clock-frequency configuration to the SDM845 board file
 * Remove a redundant comment in the I2C driver

[v5]
 * Remove Linux specific property from the device tree binding
 * Clarify I2C SCL time period documentation
 * Remove redundant checks in I2C controller driver during timeout
 * Use 100kHz as the default clock frequency in the I2C controller driver
 * Disable Wrapper controller by default in the SDM845 device tree and
   enable it explicitly for SDM845 MTP
 * Specify I2C clock frequency in the SDM845 device tree
 * Remove bias configuration for I2C pins under sleep state in device tree
 * Drop the serial driver from the patch series since it is merged
 * Specify the UART port options in the SDM845 device tree

[v4]
 * Add SPI controller information in device tree binding
 * Add support for debug UART & I2C controllers in SDM845 device tree
 * Remove any unnecessary parenthesis & casting
 * Identify break character in UART line and pass it to the framework
 * Transmit data from fault handler reliably in debug UART
 * Map the register block when the UART port is requested
 * Move concise exported functions as macros or inlines in public header
 * Move the clock performance table from the wrapper to serial engines
 * Add a lock to synchronize between IRQ & error handling in I2C controller
 * Remove any compiler optimization hints like likely/unlikely
 * Update documentation to clarify tables and hardware blocks

[v3]
 * Update the driver dependencies
 * Use the SPDX License Expression
 * Squash all the controller device tree bindings together
 * Use kernel doc format for documentation
 * Add additional documentation for packing configuration
 * Use clk_bulk_* API for related clocks
 * Remove driver references to pinctrl and their states
 * Replace magic numbers with appropriate macros
 * Update memory barrier usage and associated comments
 * Reduce interlacing of register reads/writes
 * Fix poll_get_char() operation in console UART driver under polling mode
 * Address other comments from Bjorn Andersson to improve code readability

[v2]
 * Updated device tree bindings to describe the hardware
 * Updated SE DT node as child node of QUP Wrapper DT node
 * Moved common AHB clocks to QUP Wrapper DT node
 * Use the standard "clock-frequency" I2C property
 * Update compatible field in UART Controller to reflect hardware manual
 * Addressed other device tree binding specific comments from Rob Herring

Karthikeyan Ramasubramanian (4):
  dt-bindings: soc: qcom: Add device tree binding for GENI SE
  soc: qcom: Add GENI based QUP Wrapper driver
  i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C
    controller
  arm64: dts: sdm845: Add support for an instance of I2C controller

Rajendra Nayak (1):
  arm64: dts: sdm845: Add serial console support

 .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  | 119 ++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  60 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  67 ++
 drivers/i2c/busses/Kconfig                         |  13 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-qcom-geni.c                 | 649 ++++++++++++++++++
 drivers/soc/qcom/Kconfig                           |   9 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/qcom-geni-se.c                    | 748 +++++++++++++++++++++
 include/linux/qcom-geni-se.h                       | 425 ++++++++++++
 10 files changed, 2092 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
 create mode 100644 drivers/i2c/busses/i2c-qcom-geni.c
 create mode 100644 drivers/soc/qcom/qcom-geni-se.c
 create mode 100644 include/linux/qcom-geni-se.h

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
