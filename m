Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SUBJECT_DRUG_GAP_L,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B50BA7E280
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 04:42:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752209AbeCUEmQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 00:42:16 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12258 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752041AbeCUEmN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Mar 2018 00:42:13 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com
        id <B5ab1e29f0000>; Tue, 20 Mar 2018 21:42:07 -0700
Received: from HQMAIL108.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 20 Mar 2018 21:42:12 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 20 Mar 2018 21:42:12 -0700
Received: from UKMAIL102.nvidia.com (10.26.138.15) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 21 Mar
 2018 04:42:11 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by UKMAIL102.nvidia.com
 (10.26.138.15) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 21 Mar
 2018 04:42:07 +0000
Received: from rrajk-ubuntu.nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1347.2 via Frontend
 Transport; Wed, 21 Mar 2018 04:41:58 +0000
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
Subject: [PATCH V2 8/9] arm64: defconfig: enable Nvidia Tegra Tachometer as a module
Date:   Wed, 21 Mar 2018 10:10:43 +0530
Message-ID: <1521607244-29734-9-git-send-email-rrajk@nvidia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tegra Tachometer driver implements PWM capture to measure
period. Enable this driver as a module in the ARM64 defconfig.

Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
---

V2: No changes in this patch

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 634b373..8b2bda7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -550,6 +550,7 @@ CONFIG_PWM_MESON=m
 CONFIG_PWM_ROCKCHIP=y
 CONFIG_PWM_SAMSUNG=y
 CONFIG_PWM_TEGRA=m
+CONFIG_PWM_TEGRA_TACHOMETER=m
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_HI6220_USB=y
 CONFIG_PHY_QCOM_USB_HS=y
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
