Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9D70E7E280
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 04:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751998AbeCUElb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 00:41:31 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7465 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751963AbeCUEl1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 00:41:27 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com
        id <B5ab1e22a0000>; Tue, 20 Mar 2018 21:40:11 -0700
Received: from HQMAIL106.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 20 Mar 2018 21:41:26 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 20 Mar 2018 21:41:26 -0700
Received: from BGMAIL101.nvidia.com (10.25.59.10) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 21 Mar
 2018 04:41:25 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by bgmail101.nvidia.com
 (10.25.59.10) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 21 Mar
 2018 04:41:21 +0000
Received: from rrajk-ubuntu.nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1347.2 via Frontend
 Transport; Wed, 21 Mar 2018 04:41:12 +0000
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
Subject: [PATCH V2 4/9] arm64: tegra: Add Tachometer Controller on Tegra186
Date:   Wed, 21 Mar 2018 10:10:39 +0530
Message-ID: <1521607244-29734-5-git-send-email-rrajk@nvidia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The NVIDIA Tegra186 SoC has a Tachometer Controller that analyzes the
PWM signal of a Fan and reports the period value through pwm interface.

Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
---

V2: Renamed clock-names/reset-names dt properties values to "tachometer"
    Renamed compatible property value to "nvidia-tegra186-pwm-tachometer"

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  5 +++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index bd5305a..13c3e59 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -172,4 +172,9 @@
 			vin-supply = <&vdd_5v0_sys>;
 		};
 	};
+
+	tachometer@39c0000 {
+		nvidia,pulse-per-rev = <2>;
+		nvidia,capture-window-len = <2>;
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 731cd01..19e1afc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1042,4 +1042,15 @@
 		reset-names = "pwm";
 		status = "disabled";
 	};
+
+	tegra_tachometer: tachometer@39c0000 {
+		compatible = "nvidia,tegra186-pwm-tachometer";
+		reg = <0x0 0x039c0000 0x0 0x10>;
+		#pwm-cells = <2>;
+		clocks = <&bpmp TEGRA186_CLK_TACH>;
+		clock-names = "tachometer";
+		resets = <&bpmp TEGRA186_RESET_TACH>;
+		reset-names = "tachometer";
+		status = "disabled";
+	};
 };
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
