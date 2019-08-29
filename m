Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 217B57D917
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 14:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfH2OjG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 10:39:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33091 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbfH2OiG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 10:38:06 -0400
Received: by mail-wr1-f65.google.com with SMTP id u16so3735900wrr.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 07:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lE7XX75yR5MTUDt0RcCW0PjxA1AwFACxE3fSvtSieZk=;
        b=E4/h8FaqQxHIPE+lyWVoIiYaohjVmxyJxNjhr4mVE7ydU3eFRBaO9bDcFmwHHHMLGe
         UhpMU1eioTe76W/DMfVRPPx+cb/2aWPv9oYfhfbJwczs1UWdoreCBFRDfCNCmip7kvR2
         TN3pvj/DhTphU4WkfTRgTNz11/2jlBnOct2Nx++ItR4D+woDSwGkZkFMwHzJHWW/OLVo
         JFJfQ+3Efv/Hat8DK7BZEeFNtQdxE2h2kpmjqbmpJvI/GqfWOaepSxqBPHU4ekzDZvn1
         u7YIbw+QuGgZksaApBzGRgYxAHtwqeO4hfoIOK/is0s+ZUVkR2f/9n1ShZzWkWOel1Ic
         gfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lE7XX75yR5MTUDt0RcCW0PjxA1AwFACxE3fSvtSieZk=;
        b=UYJZ69rR3Xqj4vp5jROngNp95RYEHDZOfCVi87hQK7oAKEi2OwDhVYwYI5x9seMOIK
         F3w+EvIdFscSnx02yM50Nv4NZVWAnX3XlVejrj9nATlhTAFes/LS+/j903nqYwHIFZTa
         5aRwNVTTGDmQSDpL6COlO18y6JAeT34BhSd0klG6qRnpliCq+zagVNjPuktfSDZ7hnPw
         twGwiuKjU/74qLe7ya1KD3OEg7hWY2BZ+UuoTITu+g+9VqWUkon7zVBa/tVVK/R2P5GL
         bLUftfLrVSQfje2CPlTgyeE5t/y64eaQI6deGQjJ+zGNtP7/Ow+ZtHz0Z55tL5ak6CLZ
         ovBA==
X-Gm-Message-State: APjAAAUSFh4sdDcSGOGUfllR7ybFyNPljOCeMzLufycE2SOM7nx4de4i
        liRUNMMHlUHFAi1BKMkib/qT9Q==
X-Google-Smtp-Source: APXvYqxDQrS8AALyEx0kI8uwCK17C4j0Sj65Wf212UqhAKwMPXuCpKUGz6RWY5RQSygoujaEeX7r/Q==
X-Received: by 2002:a5d:6446:: with SMTP id d6mr11636659wrw.159.1567089483908;
        Thu, 29 Aug 2019 07:38:03 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g15sm3241925wrp.29.2019.08.29.07.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:38:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/9] drivers: add new variants of devm_platform_ioremap_resource()
Date:   Thu, 29 Aug 2019 16:37:33 +0200
Message-Id: <20190829143742.24726-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The new devm_platform_ioremap_resource() helper has now been widely
adopted and used in many drivers. Users of nocache and write-combined
ioremap() variants could profit from the same code shrinkage. This
series provides two new versions of devm_platform_ioremap_resource()
and uses it in a few example drivers with the assumption that - just
like was the case previously - a coccinelle script will be developed
to ease the transition for others.

Bartosz Golaszewski (9):
  Documentation: devres: add missing entry for
    devm_platform_ioremap_resource()
  lib: devres: prepare devm_ioremap_resource() for more variants
  lib: devres: provide new variants for devm_ioremap_resource()
  drivers: provide new variants of devm_platform_ioremap_resource()
  gpio: em: use devm_platform_ioremap_resource_nocache()
  gpio: ath79: use devm_platform_ioremap_resource_nocache()
  gpio: htc-egpio: use devm_platform_ioremap_resource_nocache()
  gpio: xgene: use devm_platform_ioremap_resource_nocache()
  misc: sram: use devm_platform_ioremap_resource_wc()

 .../driver-api/driver-model/devres.rst        |  5 ++
 drivers/base/platform.c                       | 70 +++++++++++++++--
 drivers/gpio/gpio-ath79.c                     | 10 +--
 drivers/gpio/gpio-em.c                        | 22 +++---
 drivers/gpio/gpio-htc-egpio.c                 | 13 ++--
 drivers/gpio/gpio-xgene.c                     | 14 +---
 drivers/misc/sram.c                           | 28 ++-----
 include/linux/device.h                        |  4 +
 include/linux/platform_device.h               |  6 ++
 lib/devres.c                                  | 76 ++++++++++++++-----
 10 files changed, 165 insertions(+), 83 deletions(-)

-- 
2.21.0

