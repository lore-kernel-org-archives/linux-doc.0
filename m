Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B71C76195
	for <linux-doc@archiver.kernel.org>; Mon, 27 Mar 2023 15:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232617AbjC0Plb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Mar 2023 11:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232531AbjC0Pl0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Mar 2023 11:41:26 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB814EF4
        for <linux-doc@vger.kernel.org>; Mon, 27 Mar 2023 08:41:05 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id y14so9263419wrq.4
        for <linux-doc@vger.kernel.org>; Mon, 27 Mar 2023 08:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679931663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QRmSUNy4M2+H8BYOHeh1potZMu69bvvcUQWcmJgEBKQ=;
        b=1f6LjBiihtpzPeWHtP8J5pVDTk0M0YHmcqsbvgBzvLEeiMiYiJImczZJ1dZhov6FVi
         /IS9bUXOTjf1bP/kgKjvUUOFWnextYQpYUFQjwwnr/3DucFaNqRvnIeg2DCoH/B6L4bj
         1SnwzSj4tOfVn5RtxnYXpcbq7UF62RU96jss/Shg34UM5qebtfmO4G2yf4TTYKqK8D+U
         BJzPtRKsAgU/bzHKF+27OVQvm6GSJjZ+x6F1r9He2dXcoBAu9gc0u/fcqGCFOkM+DSFE
         TWtf41FBfWLfOrW00rAdEAvptH/h7GqItHGPrjAeIizTWhBWi3GSiBMzM1v4cIq+GDBq
         RyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679931663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRmSUNy4M2+H8BYOHeh1potZMu69bvvcUQWcmJgEBKQ=;
        b=Ux6PFwW++U/Wv/sQaisxxDa+54+EUy75qIZ7VSIV4mQ+/bKt49flwM204WEsM286iU
         KYCfmokXHWUpcfTTMrj0zEcfM/VK27FUDtjIFRsPBwbWqeMPbTRMc7YLvZkyNYM2lozp
         cb4v5CHVv8+iy0PWVKMn5rD2uAqxl2sqYKC9w4Rw0Bvtx4nSRTWDeiM8Q1OQxjxEgYxs
         4JRmHMbzso7axhTqDgDfafSAbdT42rv/XHZy8pNmAzMTFTITLPfyoKuDosmhYexs6u6W
         axJFNRqg0zSzO3Tg3HLAIoZwWzSOrsQ6dGGZdEQKUkeZVo+DsMe3Tch1Coz336g64pV/
         vNEQ==
X-Gm-Message-State: AAQBX9eGSdPoRcCox7HqpBZipOvuaWcguW709kN8d6Y7ReYo2pMpLGhW
        JMv7dcl1J7xopRczXJDJl+svptD2QqvFHlKtrAlnjQ==
X-Google-Smtp-Source: AKy350awLlg2JE80+u+rHOZHYi5I1Jc+lFerK/i4FldeRTAIsacbGa+9le+TQRPyiMe1MD2LwB5SLA==
X-Received: by 2002:a5d:4603:0:b0:2d0:8ed9:5ab4 with SMTP id t3-20020a5d4603000000b002d08ed95ab4mr10274027wrq.60.1679931663453;
        Mon, 27 Mar 2023 08:41:03 -0700 (PDT)
Received: from baylibre-ThinkPad-T14s-Gen-2i.. (151.31.102.84.rev.sfr.net. [84.102.31.151])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d4d52000000b002d1e49cff35sm25277161wru.40.2023.03.27.08.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 08:41:03 -0700 (PDT)
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
Subject: [PATCH v4 0/4] TI TPS6594 PMIC support (Core, ESM, PFSM)
Date:   Mon, 27 Mar 2023 17:40:57 +0200
Message-Id: <20230327154101.211732-1-jpanis@baylibre.com>
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

Changes since v3:
* [dt-bindings] Remove 'x' from 'ti,lp8764x' compatible.
* [MFD i2c/spi drivers] Remove 'x' from 'ti,lp8764x' compatible.
* [MFD core driver] Drop Lee's Ack on patch 2/4 because additional
testing revealed a major bug in 'tps6594-core.c':
  Based on the assumption that CRC feature is disabled on PMIC at power
  on, the first I2C command sent ('PFSM I2C_2 trigger') to enable CRC
  feature is sent without CRC. Though, there are situations where CRC
  feature can be enabled already on PMIC at I2C/SPI modprobe:
  - when I2C/SPI module is unloaded/reloaded,
  - when a PMIC transition (from RETENTION to ACTIVE state) is triggered
    by an RTC alarm (SoC is powered on).
  In these situations, the first I2C command sent to enable CRC feature
  generates an error (because of missing CRC in that command !). This v4
  fixes the issue: first the 'CRC_EN' bit is tested, and then, if CRC
  feature is not already enabled, the I2C command enabling it is sent.
  Functions slightly modified:
  - tps6594_device_init(),
  - tps6594_set_crc_feature().

Link to v3:
https://lore.kernel.org/all/20230321171020.74736-1-jpanis@baylibre.com/

Others series will be submitted over the next few weeks, providing
drivers for others child devices like GPIOs (pinctrl), RTC, and
regulators. Board support will also be added (device trees).

Julien Panis (4):
  dt-bindings: mfd: Add TI TPS6594 PMIC
  mfd: tps6594: Add driver for TI TPS6594 PMIC
  misc: tps6594-esm: Add driver for TI TPS6594 ESM
  misc: tps6594-pfsm: Add driver for TI TPS6594 PFSM

 .../devicetree/bindings/mfd/ti,tps6594.yaml   |  231 ++++
 .../userspace-api/ioctl/ioctl-number.rst      |    1 +
 drivers/mfd/Kconfig                           |   32 +
 drivers/mfd/Makefile                          |    3 +
 drivers/mfd/tps6594-core.c                    |  462 ++++++++
 drivers/mfd/tps6594-i2c.c                     |  244 ++++
 drivers/mfd/tps6594-spi.c                     |  129 +++
 drivers/misc/Kconfig                          |   23 +
 drivers/misc/Makefile                         |    2 +
 drivers/misc/tps6594-esm.c                    |  132 +++
 drivers/misc/tps6594-pfsm.c                   |  304 +++++
 include/linux/mfd/tps6594.h                   | 1020 +++++++++++++++++
 include/uapi/linux/tps6594_pfsm.h             |   45 +
 13 files changed, 2628 insertions(+)
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

