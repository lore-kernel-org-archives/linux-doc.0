Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D4C247D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 04:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751680AbeCUEpo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 00:45:44 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:44132 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750810AbeCUEpn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Mar 2018 00:45:43 -0400
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Mar 2018 00:45:41 EDT
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com
        id <B5ab1e2460000>; Wed, 21 Mar 2018 12:40:38 +0800
Received: from HKMAIL101.nvidia.com ([10.18.16.10])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Tue, 20 Mar 2018 21:40:37 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Tue, 20 Mar 2018 21:40:37 -0700
Received: from DRBGMAIL103.nvidia.com (10.18.16.22) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 21 Mar
 2018 04:40:36 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by DRBGMAIL103.nvidia.com
 (10.18.16.22) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 21 Mar
 2018 04:40:34 +0000
Received: from rrajk-ubuntu.nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1347.2 via Frontend
 Transport; Wed, 21 Mar 2018 04:40:25 +0000
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
Subject: [PATCH V2 0/9] Implementation of Tegra Tachometer driver
Date:   Wed, 21 Mar 2018 10:10:35 +0530
Message-ID: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The following patches adds support for PWM based Tegra Tachometer driver
which implements PWM capture interface to analyze the PWM signal of a
electronic fan and reports it in periods and duty cycles.

Added fan device attribute fan1_input in pwm-fan driver to monitor the
speed of fan in rotations per minute using PWM interface.
RPM of Fan will be exposed to user interface through HWMON sysfs interface
avialable at location: /sys/class/hwmon/hwmon0/fan1_input

Steps to validate Tachometer on Tegra186 SoC:
A. push modules pwm-tegra.ko, pwm-tegra-tachometer.ko and pwm-fan.ko to
   linux device using scp command.
   scp build/tegra186/drivers/pwm/pwm-tegra.ko ubuntu@10.19.65.176:/tmp/
   scp build/tegra186/drivers/pwm/pwm-tegra-tachometer.ko ubuntu@10.19.65.176:/tmp/
   scp build/tegra186/drivers/hwmon/pwm-fan.ko ubuntu@10.19.65.176:/tmp/
B. On Linux device console, insert these modules using insmod command.
   insmod /tmp/pwm-tegra.ko
   insmod /tmp/pwm-tegra-tachometer.ko
   insmod /tmp/pwm-fan.ko
C. Read RPM value at below sysfs node
   cat /sys/calss/hwmon/hwmon0/fan1_input
D. Change the FAN speed using PWM sysfs interface. Follow below steps for the same:
   a. cd /sys/class/pwm/pwmchip0
   b. ls -la (make sure pwm controller is c340000.pwm)
      Output should be: device -> ../../../c340000.pwm
   c. echo 0 > export
   d. cd pwmchip0:0
   e. echo 8000 > period
   f. echo 1 > enable
   g. echo 8000 > duty_cycle # change duty_cycles from 0 to 8000 for FAN speed variation
   h. cat /sys/calss/hwmon/hwmon0/fan1_input
   i. echo 4000 > duty_cycle
   h. cat /sys/calss/hwmon/hwmon0/fan1_input
   i. echo 2000 > duty_cycle
   h. cat /sys/calss/hwmon/hwmon0/fan1_input
   i. echo 0 > duty_cycle
   h. cat /sys/calss/hwmon/hwmon0/fan1_input

Rajkumar Rampelli (9):
  pwm: core: Add support for PWM HW driver with pwm capture only
  arm64: tegra: Add PWM controller on Tegra186 soc
  dt-bindings: Tegra186 tachometer device tree bindings
  arm64: tegra: Add Tachometer Controller on Tegra186
  pwm: tegra: Add PWM based Tachometer driver
  arm64: tegra: Add pwm based fan support on Tegra186
  hwmon: pwm-fan: add sysfs node to read rpm of fan
  arm64: defconfig: enable Nvidia Tegra Tachometer as a module
  arm64: defconfig: enable pwm-fan as a loadable module

 .../bindings/pwm/pwm-tegra-tachometer.txt          |  31 +++
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |   5 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  28 ++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/hwmon/pwm-fan.c                            |  23 ++
 drivers/pwm/Kconfig                                |  10 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/core.c                                 |  21 +-
 drivers/pwm/pwm-tegra-tachometer.c                 | 303 +++++++++++++++++++++
 9 files changed, 418 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-tegra-tachometer.txt
 create mode 100644 drivers/pwm/pwm-tegra-tachometer.c

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
