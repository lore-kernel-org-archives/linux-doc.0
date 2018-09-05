Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 621C77D581
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 09:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727586AbeIEO3C (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 10:29:02 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34839 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbeIEO1c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 10:27:32 -0400
Received: by mail-wr1-f66.google.com with SMTP id j26-v6so6990671wre.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Sep 2018 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=1esYnT12DAU+a8ymd1+Yc6yh/+Mab4WiQa0qKqtIV+E=;
        b=qnjbugl7MMvhDYPxF/sEelqKaDMuic9dfK2P7ViI+r/OiUsOiXNKwI9rZbg1/tjsxL
         KB7EGR+5673Ci4tIjuWn2Ssr5BuATBmsFAv8pyZsiOGVhMiSoOxC9SmPiqQoH2DaAhic
         RAjeP0REzCufar081Hvo3oCWlOdo01IEVn2vwz/F/lpv/hOsNeTpIT6HXJAKxmZD9xIV
         wTqoqPXirfRxOR8XZ3L+G99ulIWHSuusdgcrqTWZcT06XfvqIdtocYVl/GPXtfL3IqUd
         I+t9dsh45rkSz7laEWBYIHW2vDJVV+oOt1GzZby/376yMRenhSfPp83gbd33myARh/TS
         ycpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1esYnT12DAU+a8ymd1+Yc6yh/+Mab4WiQa0qKqtIV+E=;
        b=VG2ZP46A/A4M5NloBrDhN3WDb8qSfQJWJNkB1TEB6EPRQm1qVEGUmMoB2/eHh8YE8V
         CLVXZ1PQEwjOQ5/NHNTab8BOyEjiPGrEEGAtOq3SY8e4drwdrcY38Q46H2N3WiJ/MjX1
         KSfs4Z6BhyePT2FXqF3oMZry6A2m8RGnCrPlc0m2pHvnMjuSTV+R4Ycss2dmpJVMJJwA
         sV9i83ruZRoU3gu2D/ltMUDr298GcDWwqWKmyatbMw0KW6G+eEzlhgOCckSXrr8j/vxE
         p0jd0oCYsXqVAjvBtW66YaidlbaQzODHATQ86c2te7r2C+5Zo2NxyBrfGndYRiX84ZAw
         LMIQ==
X-Gm-Message-State: APzg51CojYnDNrP+r7soq8FAclCVZopfr9Lm8xmRXkcRRH4m5TJ2Opld
        agkH9gnuDkJ09kF/lkm6+IY+sMdPvz8=
X-Google-Smtp-Source: ANB0VdY7UKco99LyHRW27v7yYGThDDKfHNjeOSYUkhZKH2E38bIODrHKcE2jQ6P1sfR54fAwhS6aGA==
X-Received: by 2002:a5d:434c:: with SMTP id u12-v6mr26052105wrr.189.1536141483834;
        Wed, 05 Sep 2018 02:58:03 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-33-235.w90-86.abo.wanadoo.fr. [90.86.152.235])
        by smtp.gmail.com with ESMTPSA id l12-v6sm2127815wrv.29.2018.09.05.02.58.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Sep 2018 02:58:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joachim Eastwood <manabian@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 00/13] nvmem: rework of the subsystem for non-DT users
Date:   Wed,  5 Sep 2018 11:57:25 +0200
Message-Id: <20180905095738.26406-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series contains nvmem framework changes prerequisite for further
development of my previous series[1] that aims at removal of the
platform data struct from at24 EEPROM driver.

First we remove unused APIs and the global cell list. We then switch
to using kref instead of manual user counting. Next we simplify the
provider unregistration by removing the return value from
nvmem_unregister().

Next three patches improve the framework by adding a notifier chain
for future use and fixing the issue with nvmem device names.

Finally we add support for cell definitions, cell lookups and make
DT systems resolve the nvmem cells during provider's registration.

Last patch just uses the SPDX license identifiers.

Tested both DT and non-DT use cases.

[1] https://lkml.org/lkml/2018/8/10/149

Bartosz Golaszewski (13):
  nvmem: remove unused APIs
  nvmem: remove the global cell list
  nvmem: use kref
  nvmem: lpc18xx_eeprom: use devm_nvmem_register()
  nvmem: change the signature of nvmem_unregister()
  nvmem: provide nvmem_dev_name()
  nvmem: remove the name field from struct nvmem_device
  nvmem: add a notifier chain
  nvmem: add support for cell info
  nvmem: resolve cells from DT at registration time
  nvmem: add support for cell lookups from machine code
  Documentation: nvmem: document cell tables and lookup entries
  nvmem: use SPDX license identifiers

 Documentation/nvmem/nvmem.txt  |  30 ++
 MAINTAINERS                    |   1 +
 drivers/nvmem/core.c           | 650 ++++++++++++++++++---------------
 drivers/nvmem/lpc18xx_eeprom.c |   6 +-
 include/linux/nvmem-consumer.h |  50 ++-
 include/linux/nvmem-machine.h  |  56 +++
 include/linux/nvmem-provider.h |  22 +-
 7 files changed, 465 insertions(+), 350 deletions(-)
 create mode 100644 include/linux/nvmem-machine.h

-- 
2.18.0

