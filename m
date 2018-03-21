Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 88F967E27F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 04:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751898AbeCUElS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 00:41:18 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12222 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751794AbeCUElO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 00:41:14 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com
        id <B5ab1e2650000>; Tue, 20 Mar 2018 21:41:09 -0700
Received: from HQMAIL103.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 20 Mar 2018 21:41:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 20 Mar 2018 21:41:10 -0700
Received: from UKMAIL101.nvidia.com (10.26.138.13) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 21 Mar
 2018 04:41:13 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by UKMAIL101.nvidia.com
 (10.26.138.13) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 21 Mar
 2018 04:41:09 +0000
Received: from rrajk-ubuntu.nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1347.2 via Frontend
 Transport; Wed, 21 Mar 2018 04:41:00 +0000
From:   Rajkumar Rampelli <rrajk@nvidia.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <jdelvare@suse.com>, <linux@roeck-us.net>, <corbet@lwn.net>,
        <catalin.marinas@arm.com>, <will.deacon@arm.com>,
        <kstewart@linuxfoundation.org>, <gregkh@linuxfoundation.org>,
        <pombredanne@nexb.com>, <mmaddireddy@nvidia.com>,
        <mperttunen@nvidia.com>, <arnd@arndb.de>, <timur@codeaurora.org>,
        <andy.gross@linaro.org>, <xuwei5@hisilicon.com>,
        <elder@linaro.org>, <heiko@sntech.de>, <krzk@kernel.org>,
        <ard.biesheuvel@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <ldewangan@nvidia.com>,
        <rrajk@nvidia.com>
Subject: [PATCH V2 3/9] dt-bindings: Tegra186 tachometer device tree bindings
Date:   Wed, 21 Mar 2018 10:10:38 +0530
Message-ID: <1521607244-29734-4-git-send-email-rrajk@nvidia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Supply Device tree binding documentation for the NVIDIA
Tegra186 SoC's Tachometer Controller

Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
---

V2: Renamed compatible string to "nvidia,tegra186-pwm-tachometer"
    Renamed dt property values of clock-names and reset-names to "tachometer"
    from "tach"

 .../bindings/pwm/pwm-tegra-tachometer.txt          | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-tegra-tachometer.txt

diff --git a/Documentation/devicetree/bindings/pwm/pwm-tegra-tachometer.txt b/Documentation/devicetree/bindings/pwm/pwm-tegra-tachometer.txt
new file mode 100644
index 0000000..4a7ead4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-tegra-tachometer.txt
@@ -0,0 +1,31 @@
+Bindings for a PWM based Tachometer driver
+
+Required properties:
+- compatible: Must be "nvidia,tegra186-pwm-tachometer"
+- reg: physical base addresses of the controller and length of
+  memory mapped region.
+- #pwm-cells: should be 2. See pwm.txt in this directory for a
+  description of the cells format.
+- clocks: phandle list of tachometer clocks
+- clock-names: should be "tachometer". See clock-bindings.txt in documentations
+- resets: phandle to the reset controller for the Tachometer IP
+- reset-names: should be "tachometer". See reset.txt in documentations
+- nvidia,pulse-per-rev: Integer, pulses per revolution of a Fan. This value
+  obtained from Fan specification document.
+- nvidia,capture-window-len: Integer, window of the Fan Tach monitor, it indicates
+  that how many period of the input fan tach signal will the FAN TACH logic
+  monitor. Valid values are 1, 2, 4 and 8 only.
+
+Example:
+	tegra_tachometer: tachometer@39c0000 {
+		compatible = "nvidia,tegra186-pwm-tachometer";
+		reg = <0x0 0x039c0000 0x0 0x10>;
+		#pwm-cells = <2>;
+		clocks = <&tegra_car TEGRA186_CLK_TACH>;
+		clock-names = "tachometer";
+		resets = <&tegra_car TEGRA186_RESET_TACH>;
+		reset-names = "tachometer";
+		nvidia,pulse-per-rev = <2>;
+		nvidia,capture-window-len = <2>;
+		status = "disabled";
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
