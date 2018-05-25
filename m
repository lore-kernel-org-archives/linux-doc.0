Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 42ED07DF86
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 19:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S968123AbeEYT00 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 15:26:26 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:48783 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967936AbeEYT0Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 15:26:25 -0400
Received: from localhost.localdomain ([37.4.249.126]) by
 mrelayeu.kundenserver.de (mreue105 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 0M25gB-1gBn870Uot-00u4a7; Fri, 25 May 2018 21:25:28 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, Eric Anholt <eric@anholt.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Phil Elwell <phil@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V3 0/6] hwmon: Add support for Raspberry Pi voltage sensor
Date:   Fri, 25 May 2018 21:24:33 +0200
Message-Id: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9LC1+OYTbtJ2AfeZZLE1dLy62FIZTH7s3il0Civ1XBxqbdchadX
 wq/IkVunZ+FuZBHG3NXQgUqGWcDD0ZWGMDqlxPmONeZXN/Y8pctV8/gqIrZ/HM3J401X4s9
 3fdh21OIxH/rUwpHW4VO+KoddeH1/qCbA0XpASddc+E75IPh2+NRraJV5+FS7c6uQsyLU1M
 YpZcoTtniHcU+gpHQ4j8g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ig3cNkaJK1k=:6yIZ308U6/RAry1FoZP2WR
 X6iMWAgusEmCU36C+AAnuQxVTipbKjSPTdWsIag3KxYnZOJIy6pV7Q6/HSWwftr9K1EuFuY4F
 n2F5DYlbVVdEZ3+eM4JR7R/QpRQOAyd7ZjyAVkWoV1OW//JeC9QqxEwSaezP5b/YuJqecHdUl
 Jpov6DehlaPlyUUyhIIjG92YPBKzpPesob4wiGLS4CAGASL41+nO+LcCetKREVaDqhPcdx/7E
 N7lPwF606F8tnttAP67bbN3gu9D8OAKfTAcer6IInGpV3HdG+xxwrxHwKcuKlJF4v7fTizntq
 5mUKpf4AI0giWDrorAmdnF40ML0KWafJ4MmO3ShPhaoIkyCFRWlByjlhFkjqDNy58VXKNusQu
 3cQc9340zh4pC4g3F6uPOjwR9Y3pWg/QxjBOCmtPd83YN75u+3euMwW3ywnQWWNwDz1Hh0YYh
 6riDfAASv4NR4YciALGK4zxB1xzFml6AsAW4Pb9ZUVWn+krHTqk/3kfjSunQDqeGVtFKXAn1g
 HCdxY5VtPq7pVS0yrEE2LwmDeyMCt+URjE0PXw5f1RfZ9KpFzH+AG9AebkawOuPQR9eyhaid8
 nk3cwmDtDT/hotr4+Sx7Br8GBFEVUaEMj5JHkSW65ROhjoeskOFIJCTB4/M+B4tOTAWxA9GMg
 JmzQNRDqVF38YptpOjxrvliJWj5o4LMXDbgi6BTpL6al7pr1dEWZb0LMNDxgiPAtry+EoJ4jy
 ggDm+hfsxfSVbx+K
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A common issue for the Raspberry Pi is an inadequate power supply. 
Noralf Trønnes started a discussion [1] about writing such undervoltage
conditions into the kernel log.

Changes in V3:
- rebase
- simplify probing

Changes in V2:
- simplified Kconfig dependency suggested by Robin Murphy
- replace dt-binding by probing from firmware driver
- add hwmon documentation
- minor improvements suggested by Guenter Roeck

[1] - https://github.com/raspberrypi/linux/issues/2367

Stefan Wahren (6):
  ARM: bcm2835: Add GET_THROTTLED firmware property
  hwmon: Add support for RPi voltage sensor
  firmware: raspberrypi: Register hwmon driver
  ARM: bcm2835_defconfig: Enable RPi voltage sensor
  ARM: multi_v7_defconfig: Enable RPi voltage sensor
  arm64: defconfig: Enable RPi voltage sensor

 Documentation/hwmon/raspberrypi-hwmon      |  22 ++++
 arch/arm/configs/bcm2835_defconfig         |   2 +-
 arch/arm/configs/multi_v7_defconfig        |   1 +
 arch/arm64/configs/defconfig               |   1 +
 drivers/firmware/raspberrypi.c             |  19 ++++
 drivers/hwmon/Kconfig                      |  10 ++
 drivers/hwmon/Makefile                     |   1 +
 drivers/hwmon/raspberrypi-hwmon.c          | 166 +++++++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h |   1 +
 9 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/hwmon/raspberrypi-hwmon
 create mode 100644 drivers/hwmon/raspberrypi-hwmon.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
