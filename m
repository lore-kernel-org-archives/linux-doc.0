Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 085EFC6FD1D
	for <linux-doc@archiver.kernel.org>; Wed, 15 Mar 2023 11:10:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbjCOLKU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 07:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbjCOLJq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 07:09:46 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9064085687
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 04:07:46 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id v16so16975096wrn.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 04:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678878459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t7sJa1hEO2NEIzmijWBn+Yo5/tJUW6unCVGlROZloX0=;
        b=BN4OXdbuZ8uFRciuEBkBPXPQ3F/IL12wikKTlkCTYnDQNqhXTBwxTRU1s6ry3ByH0n
         Y6qFNkDG+tePW9PEs8d291eb9KMDZzYXdGbf3Z40Jid9cb9yCvvtFCjbIc8u9VeoXoI8
         D8pe8Vct7020bQHBwJ9eH2mJoo/Xj18LEEm26akPhnNGEhQZ7FsCea9pZwShGGLlimtN
         bgpLVJJx8oBPwFS33I8QGC1vttDYBaujdc3jFBpcGyGDwuM9Xq85nMJuYC+na/zrkDXk
         xAQUUfSHuuLq8u23sjCZsHIQF3/Kk5i0iOp4tlTG0NrTUNUNdCP965R5KyRvvXHJbJZ7
         aIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678878459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7sJa1hEO2NEIzmijWBn+Yo5/tJUW6unCVGlROZloX0=;
        b=koJD+qfue3L8DwA8bfIZ2ZnwB0HeBSkzH1/HUjYC8fcNc9/6Z8MqGM62o02f7ij3HK
         uVH3rRXAaEZ1fI0qdSD3M4S0AelqyklNknKAoTsTOqHctByKWz3E+JN4cZ2pPM/3ie7E
         b2yMRjxTCTiamIWH3cLl5a6esIehKTtEf38JkyE2dWX9zqkRGMAMYhRUowqflVxRYAZA
         MMpUXn/6l12ElxhocwSYw6yl0ooUix7Ea9tfCl3yVNaXJKRcR2KUnhGbANiWKPKMHoqE
         86lrSglIf4fX2nRWEK68IX1CqbelX+21stSLz3uH1RtxCPFyMnPlnNoAw6a7yWtb5uTR
         hOhA==
X-Gm-Message-State: AO0yUKUuGrcTvOesHz1YsI2CrHUquL0jMgJBxswOoS8PnDpNX8PYk9EK
        e5jzJgx9duPymEfwKTuZnAVkuQ==
X-Google-Smtp-Source: AK7set/Kvb3e8IgjbdSUyGxkCEneD+0kIVRTsAtZTtxW+0Oy38BjDAF55G0RSDmkZbrhnzG9L3pvlw==
X-Received: by 2002:a5d:4c91:0:b0:2ce:a9b9:24c4 with SMTP id z17-20020a5d4c91000000b002cea9b924c4mr1566919wrs.41.1678878459389;
        Wed, 15 Mar 2023 04:07:39 -0700 (PDT)
Received: from baylibre-ThinkPad-T14s-Gen-2i.. (151.31.102.84.rev.sfr.net. [84.102.31.151])
        by smtp.gmail.com with ESMTPSA id n5-20020adfe785000000b002c7066a6f77sm4339745wrm.31.2023.03.15.04.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 04:07:39 -0700 (PDT)
From:   Julien Panis <jpanis@baylibre.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net, arnd@arndb.de,
        gregkh@linuxfoundation.org, derek.kiernan@xilinx.com,
        dragan.cvetic@xilinx.com
Cc:     eric.auger@redhat.com, jgg@ziepe.ca, razor@blackwall.org,
        stephen@networkplumber.org, davem@davemloft.net,
        christian.koenig@amd.com, contact@emersion.fr,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, sterzik@ti.com, u-kumar1@ti.com,
        eblanc@baylibre.com, jneanne@baylibre.com
Subject: [PATCH v2 0/4] TI TPS6594 PMIC support (Core, ESM, PFSM)
Date:   Wed, 15 Mar 2023 12:07:32 +0100
Message-Id: <20230315110736.35506-1-jpanis@baylibre.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

TPS6594 is a Power Management IC which provides regulators and others
features like GPIOs, RTC, watchdog, ESMs (Error Signal Monitor), and
PFSM (Pre-configurable Finite State Machine). The SoC and the PMIC can
communicate through the I2C or SPI interfaces.
TPS6594 is the super-set device while TPS6593 and LP8764X are derivatives.

This series adds support to TI TPS6594 PMIC and its derivatives.

The features implemented in this series are:
- Core (MFD I2C and SPI entry points)
- ESM (child device)
- PFSM (child device)

- Core description:
I2C and SPI interface protocols are implemented, with and without
the bit-integrity error detection feature (CRC mode).
In multi-PMIC configuration, all instances share a single GPIO of
the SoC to generate interrupt requests via their respective nINT
output pin.

- ESM description:
This device monitors the SoC error output signal at its nERR_SOC
input pin. In error condition, ESM toggles its nRSTOUT_SOC pin
to reset the SoC.
Basically, ESM driver starts ESM hardware.

- PFSM description:
Strictly speaking, PFSM is not hardware. It is a piece of code.
PMIC integrates a state machine which manages operational modes.
Depending on the current operational mode, some voltage domains
remain energized while others can be off.
PFSM driver can be used to trigger transitions between configured
states.

Link to v1:
https://lore.kernel.org/all/20230216114410.183489-1-jpanis@baylibre.com/

Others series will be submitted over the next few weeks, providing
drivers for others child devices like GPIOs (pinctrl), RTC, and
regulators. Board support will also be added (device trees).

Julien Panis (4):
  dt-bindings: mfd: Add TI TPS6594 PMIC
  mfd: tps6594: Add driver for TI TPS6594 PMIC
  misc: tps6594-esm: Add driver for TI TPS6594 ESM
  misc: tps6594-pfsm: Add driver for TI TPS6594 PFSM

 .../devicetree/bindings/mfd/ti,tps6594.yaml   |  191 +++
 .../userspace-api/ioctl/ioctl-number.rst      |    1 +
 drivers/mfd/Kconfig                           |   32 +
 drivers/mfd/Makefile                          |    3 +
 drivers/mfd/tps6594-core.c                    |  453 ++++++++
 drivers/mfd/tps6594-i2c.c                     |  244 ++++
 drivers/mfd/tps6594-spi.c                     |  129 +++
 drivers/misc/Kconfig                          |   23 +
 drivers/misc/Makefile                         |    2 +
 drivers/misc/tps6594-esm.c                    |  132 +++
 drivers/misc/tps6594-pfsm.c                   |  304 +++++
 include/linux/mfd/tps6594.h                   | 1020 +++++++++++++++++
 include/uapi/linux/tps6594_pfsm.h             |   45 +
 13 files changed, 2579 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
 create mode 100644 drivers/mfd/tps6594-core.c
 create mode 100644 drivers/mfd/tps6594-i2c.c
 create mode 100644 drivers/mfd/tps6594-spi.c
 create mode 100644 drivers/misc/tps6594-esm.c
 create mode 100644 drivers/misc/tps6594-pfsm.c
 create mode 100644 include/linux/mfd/tps6594.h
 create mode 100644 include/uapi/linux/tps6594_pfsm.h


base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.37.3

