Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 927BC7E416
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:38:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbeHHRxh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:53:37 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43581 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbeHHRxh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:53:37 -0400
Received: by mail-wr1-f66.google.com with SMTP id b15-v6so2388030wrv.10
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=J6H6Bsh49npPwrc6jtwTH6YnEkel4XpqDs5bKswsXX4=;
        b=j/gFy5SgXCFPu1abrKrSwAD9pbgHza8/cuMkVhV9WsG4Ps2ojtYApvoZTlp829FBKH
         0/mxTtQbOTwlxCxa0DdjprKs19DkKBFaQuDwjg2uZvst1vl0SDu8kVAeeBpkrdAe78kL
         7mfpzEQPAIXjo6HMr7ZvVhzEFV7anr/cLJUDZ9Qzgv8nTunt1NQ3kvro0y7w59y8Q9g3
         tHfbixqGd6r4+9AL3ssFZBeMl9ZE8V8hgvlqUAGHBsY8NzeOcUOPM/Bj3FBIxkQ1fR5/
         RSmSblMlNyJEflzaqiCpHhy1NZ6TuM8gwhd1TpDsTIkT/jPoEOMesWN1a56LyOso6x7o
         G+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=J6H6Bsh49npPwrc6jtwTH6YnEkel4XpqDs5bKswsXX4=;
        b=KNBHDbkxBn9xOal4NY0Cq7wAos8AX0T/lNOsj0Dv3UqZ1Y2A8in030AVGoVu2CSpTk
         Q+u+JKTovnz90aQy5ywtCVkbb+qnp7Da7kfMx9sBQOAZuXd8saoIeqsuAbGT+ErgZzO/
         ZfM+JD/ydXlw5NbYaH+8S9HmhD/siK67QlXztYwV3evZHYkeCIsjAI4z98hh0aF+p9Hz
         2FfLJXBiVWOWFHygAw50qSD6JHugIr1I0rfHVQ2427v3y5NRm8DbM++u7fhNvF2o+ACY
         As6IQPW+qXk8bdkuoOvuS7MDEsOc/OgSDxjwd/TsZyA+7pfUx3hRIrjWcujWr7GmGPfW
         0fLQ==
X-Gm-Message-State: AOUpUlH0CzFt3FU+4OkTl2Uv4W7RNxVhOSoeL505LOyTMRQMllJr201r
        /I8NHKDWaKvjbowfJ1WzILpFUg==
X-Google-Smtp-Source: AA+uWPxz1JDR6oBEG6encT3bfFpBgaaxLrYrHXg+WJGZFltlfW+dzrPOcU+4V1glcrw5Is9aM7StiQ==
X-Received: by 2002:adf:f28c:: with SMTP id k12-v6mr2073233wro.263.1533742404977;
        Wed, 08 Aug 2018 08:33:24 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.33.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:33:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "David S . Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Naren <naren.kernel@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Sven Van Asbroeck <svendev@arcx.com>,
        Paolo Abeni <pabeni@redhat.com>, Alban Bedel <albeu@free.fr>,
        Rob Herring <robh@kernel.org>,
        David Lechner <david@lechnology.com>,
        Andrew Lunn <andrew@lunn.ch>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 00/28] at24: remove at24_platform_data
Date:   Wed,  8 Aug 2018 17:31:22 +0200
Message-Id: <20180808153150.23444-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is a follow-up to the previously rejected series[1] which partially
removed the at24_platform_data structure. After further development and
taking reviews into account, this series finally removes that struct
completely but not without touching many different parts of the code
base.

Since I took over maintainership of the at24 driver I've been working
towards removing at24_platform_data in favor for device properties.

DaVinci is the only platform that's still using it - all other users
have already been converted.

One of the obstacles in case of DaVinci is removing the setup() callback
from the pdata struct, the only user of which are some davinci boards.

Most boards use the EEPROM to store the MAC address. This series adds
support for cell lookups to the nvmem framework, registers relevant
cells for all users, adds nvmem support to eth_platform_get_mac_address(),
converts davinci_emac driver to using it and replaces at24_platform_data
with device properties.

There's also one board (da850-evm) which uses MTD for reading the MAC
address. I used the patch from Alban Bedel's previous submission[2] to
add support for nvmem to the MTD framework. Since this user doesn't
need device tree, I dropped Alban's patches modifying the DT bindings.
We can add that later once an agreement is reached. For the time being
MTD devices are registered as nvmem devices and we're registering the
mac-address cell using the cell lookup mechanism.

This series adds a blocking notifier chain to the nvmem framework, so
that we can keep the EEPROM reading code in the mityomapl138 board file
with only slight modifications.

I also included some minor fixes to the modified code.

Tested on da850-evm & dm365-evm.

[1] https://lkml.org/lkml/2018/6/29/153
[2] https://lkml.org/lkml/2018/3/24/312

Alban Bedel (1):
  mtd: Add support for reading MTD devices via the nvmem API

Bartosz Golaszewski (27):
  nvmem: add support for cell lookups
  Documentation: nvmem: document lookup entries
  nvmem: add a notifier chain
  nvmem: provide nvmem_device_name()
  nvmem: remove the name field from struct nvmem_device
  ARM: davinci: dm365-evm: use nvmem lookup for mac address
  ARM: davinci: dm644-evm: use nvmem lookup for mac address
  ARM: davinci: dm646x-evm: use nvmem lookup for mac address
  ARM: davinci: da830-evm: use nvmem lookup for mac address
  ARM: davinci: mityomapl138: add nvmem cells lookup entries
  ARM: davinci: da850-evm: use nvmem lookup for mac address
  ARM: davinci: da850-evm: remove unnecessary include
  net: split eth_platform_get_mac_address() into subroutines
  net: add support for nvmem to eth_platform_get_mac_address()
  net: davinci_emac: use eth_platform_get_mac_address()
  ARM: davinci: da850-evm: remove dead MTD code
  ARM: davinci: mityomapl138: don't read the MAC address from machine
    code
  ARM: davinci: dm365-evm: use device properties for at24 eeprom
  ARM: davinci: da830-evm: use device properties for at24 eeprom
  ARM: davinci: dm644x-evm: use device properties for at24 eeprom
  ARM: davinci: dm646x-evm: use device properties for at24 eeprom
  ARM: davinci: sffsdr: fix the at24 eeprom device name
  ARM: davinci: sffsdr: use device properties for at24 eeprom
  ARM: davinci: remove dead code related to MAC address reading
  ARM: davinci: mityomapl138: use nvmem notifiers
  ARM: davinci: mityomapl138: use device properties for at24 eeprom
  eeprom: at24: kill at24_platform_data

 Documentation/nvmem/nvmem.txt              |  28 +++++
 MAINTAINERS                                |   1 -
 arch/arm/mach-davinci/board-da830-evm.c    |  25 ++--
 arch/arm/mach-davinci/board-da850-evm.c    |  45 +++-----
 arch/arm/mach-davinci/board-dm365-evm.c    |  25 ++--
 arch/arm/mach-davinci/board-dm644x-evm.c   |  24 ++--
 arch/arm/mach-davinci/board-dm646x-evm.c   |  25 ++--
 arch/arm/mach-davinci/board-mityomapl138.c |  59 +++++++---
 arch/arm/mach-davinci/board-sffsdr.c       |  13 +--
 arch/arm/mach-davinci/common.c             |  15 ---
 drivers/misc/eeprom/at24.c                 | 127 +++++++++------------
 drivers/mtd/Kconfig                        |   1 +
 drivers/mtd/mtdcore.c                      |  50 ++++++++
 drivers/net/ethernet/ti/davinci_emac.c     |  12 +-
 drivers/nvmem/core.c                       | 106 ++++++++++++++++-
 include/linux/davinci_emac.h               |   2 -
 include/linux/mtd/mtd.h                    |   2 +
 include/linux/nvmem-consumer.h             |  31 +++++
 include/linux/nvmem-provider.h             |  10 ++
 include/linux/platform_data/at24.h         |  60 ----------
 net/ethernet/eth.c                         |  86 ++++++++++++--
 21 files changed, 492 insertions(+), 255 deletions(-)
 delete mode 100644 include/linux/platform_data/at24.h

-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
