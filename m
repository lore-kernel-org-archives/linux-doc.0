Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 949A57D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 11:24:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751361AbeEVLYK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 07:24:10 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:60191 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751346AbeEVLYI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 07:24:08 -0400
Received: from localhost.localdomain ([37.4.249.136]) by
 mrelayeu.kundenserver.de (mreue003 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 0LoMMX-1g0Rb61dCT-00gE3A; Tue, 22 May 2018 13:22:25 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, Eric Anholt <eric@anholt.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Phil Elwell <phil@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC V2 0/6] hwmon: Add support for Raspberry Pi voltage sensor
Date:   Tue, 22 May 2018 13:21:46 +0200
Message-Id: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KrmkHsDu3ncsQu1sr838ut+zce1FCtAf62tolhqu10WIDT3WnRK
 lCJksvlSu3Ax/mbNW6XqfVzG7COg41Cxl3Uepbjnwlf4WbMt7fC9jyh7VQOQaTianqxv5dy
 sOhQKzwBAyZDKWKnhLbpOzZaU5fEHW+oaKpkf0Wnj/hX87nPNlXDVb8EeOWbUyVHiwjIEaF
 Tfo3TGziPoyKLnrI5LcsQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:WVhBCdj83Nk=:fSetgbt2ffvpdZgidsktbr
 Q7nSZyaQ60N/UD5mfrD/rov7yWh1K+tu2lOCHrvYOi0E/6L90kAFvA6i+IVPH6DlR9lfkpJnl
 eU0Tot4k463NNFTKkIleUcJaW1h30/8/FfVYkMgK6Fu786D2F23KxlSFvrjScw+gOtaizY3+b
 SiWR4fFAEgL61UZUxRlsBjXAkVpcidTbUuV+ldQd+7g2Zk7Z6eZYpjzgA0BbUnEan0xY7duN0
 6SK+QMwPsG60sUl9pFvIRtV5XWA3jnCAq0jMNy1njJH8UkcI4DTsBKLInBnIKBON99EoO9qW5
 lW1uBqcHRNLLjIOGuuUtWwDDz/CkiRM/wrcsctlEv2mG0lv07rrYvrdelSEmA3SOPqWQDCqLA
 DhJMvsw65yht5pDpXxLHGoogY1iC0GIUELEULi+DbydUXgp/Rb6NA02ZHf0EC6PML7UQpRLd0
 CZBTWAhYEGa2OqgZNFS+2cQ9vHf/oR4s9zaPGPFYWCehtlU4Heyk+mY31pT//RImIp/jeTwtN
 BqBShz1z2RWOvmyk0LPMfM12zc4Jd2f1Kzz4gMxOS+wz1BuNzDtUer1Lx0MaOprQZEg7YWMgv
 eNgWFkiWeJQ8Rp6Otu3kW9T5Q1cEselKipOT+RcaJP4OCMsLrUClc3EhRLSjG8p5pD3K0ATjl
 O2XQwlnhb/OtD3hAoNNye6xGCq1xOLoXVTiBbcSEzSwDFQKWh0OFUniePQZoauNZvTOWsh15o
 tBJUgKY+Es7gPGL4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A common issue for the Raspberry Pi is an inadequate power supply. 
Noralf Trønnes started a discussion [1] about writing such undervoltage
conditions into the kernel log.

This series is a draft to upstream the resulting kernel patch and is not
intended for 4.18.

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
 drivers/hwmon/raspberrypi-hwmon.c          | 168 +++++++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h |   1 +
 9 files changed, 224 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/hwmon/raspberrypi-hwmon
 create mode 100644 drivers/hwmon/raspberrypi-hwmon.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
