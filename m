Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6A4D37DE79
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 04:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751889AbeCUElF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 00:41:05 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:6944 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751727AbeCUElD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 00:41:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com
        id <B5ab1e2670000>; Tue, 20 Mar 2018 21:41:11 -0700
Received: from HQMAIL104.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 20 Mar 2018 21:41:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 20 Mar 2018 21:41:02 -0700
Received: from UKMAIL101.nvidia.com (10.26.138.13) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 21 Mar
 2018 04:41:01 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by UKMAIL101.nvidia.com
 (10.26.138.13) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 21 Mar
 2018 04:40:57 +0000
Received: from rrajk-ubuntu.nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1347.2 via Frontend
 Transport; Wed, 21 Mar 2018 04:40:48 +0000
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
Subject: [PATCH V2 2/9] arm64: tegra: Add PWM controller on Tegra186 soc
Date:   Wed, 21 Mar 2018 10:10:37 +0530
Message-ID: <1521607244-29734-3-git-send-email-rrajk@nvidia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The NVIDIA Tegra186 SoC has a PWM controller which is
used in FAN control use case.

Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
---

V2: no changes in this patch

 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index b762227..731cd01 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1031,4 +1031,15 @@
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&gic>;
 	};
+
+	pwm@c340000 {
+		compatible = "nvidia,tegra186-pwm";
+		reg = <0x0 0xc340000 0x0 0x10000>;
+		clocks = <&bpmp TEGRA186_CLK_PWM4>;
+		clock-names = "pwm";
+		#pwm-cells = <2>;
+		resets = <&bpmp TEGRA186_RESET_PWM4>;
+		reset-names = "pwm";
+		status = "disabled";
+	};
 };
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
