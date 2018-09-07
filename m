Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8EA1E7D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Sep 2018 10:08:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbeIGOsd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Sep 2018 10:48:33 -0400
Received: from mail-wm0-f54.google.com ([74.125.82.54]:33513 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbeIGOsd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Sep 2018 10:48:33 -0400
Received: by mail-wm0-f54.google.com with SMTP id r1-v6so16528033wmh.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Sep 2018 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=NIjhAzMS9ZUuLCp0EBL3tEJKEyuNDcoVnz4Jw1POrk4=;
        b=u9dos1iG4oQODsxjzZPK7pq/jAwux0Eyhw4CUt7lxU7NItdN1eUWupFewUk8/UMJ74
         kkivBSLQjpQk4LELW4QVNT0xdsNC0gEHVwTcxPlkR3e1UTu61XjK49RsjI3Sbr/GerIL
         RZodkaflPI7kGeVGoGRc/ma8tDk7Wz8PghrswOp3FNAb/Zxa3rmKzrywBdnrXt5I5LZ5
         4NT5LZkoclONxOFM1bLaHqkW8DbvBeqOgFJyZXqWloU0APpyi2Esi66B9KavAmkWcA3s
         aHtnQ/v94eNKbOa+KlehHzJm861VRalJIXRunhCGzAK1BEc/zmPvbJsjy+8aAkcnZuyO
         bNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NIjhAzMS9ZUuLCp0EBL3tEJKEyuNDcoVnz4Jw1POrk4=;
        b=A17X0j58W0nESyh24og8by6Ceq9m98Wubmw5I7jrcWB0gAsmDSpVZpkEDwj8oKxREG
         N7LqzeJ2QkdmBjeW8A1OvC3PA+kEbcBeGgn3tOdyj6jooQBe4aI+GSemuZDS09ugBowv
         gs+zOEdD8LnIzRGYgb2ddS3OX8Ayt1S3b4RXkdN13v+KRzyMGTeqReUj5VaZkNC8/VTv
         xRiB41x76o5DdVtCgeSJP9rwCyjsZh2sLwM28YjnENVfWsefhs1LCZCJT9W9T9RwIKRi
         odGb4YaQ1xXAHd0nrda+i4tL8nQV9sz1/hNlqrJHiGyxiPzpoAImnn7yBPlDF4gzO5ef
         SsOg==
X-Gm-Message-State: APzg51AbuggPfiz35cdgKxRXud/vlxDVzKa0K7upZY7dim4pbIuu7h5l
        Ap4EI7hrQ0lIzYSPofdVtmEYGw==
X-Google-Smtp-Source: ANB0VdZNAyQibYCVEJOcc70ZdpeU9lS93TKIOrbx8bdgu7DP0BfvltpvlUJv5n9BH1R000EbQ8P2UA==
X-Received: by 2002:a1c:2ed4:: with SMTP id u203-v6mr4639771wmu.19.1536314898633;
        Fri, 07 Sep 2018 03:08:18 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-83-232.w90-86.abo.wanadoo.fr. [90.86.25.232])
        by smtp.gmail.com with ESMTPSA id 72-v6sm6631619wrb.48.2018.09.07.03.08.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Sep 2018 03:08:17 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 00/16] nvmem: rework of the subsystem for non-DT users
Date:   Fri,  7 Sep 2018 12:07:34 +0200
Message-Id: <20180907100750.14564-1-brgl@bgdev.pl>
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

Last patches just use the SPDX license identifiers and make the
naming convention for some arguments more consistent.

Tested both DT and non-DT use cases.

[1] https://lkml.org/lkml/2018/8/10/149

v1 -> v2:
- extended the lookup structure with a proper con_id independent from the
  cell name defined in the cell definition table
- added a patch that makes the naming convention for the cell name argument
  in the nvmem_cell_get() family of functions consistent
- there were two users of nvmem_unregister() that still checked the return
  value, now switched to devm_nvmem_register()
- fixed build failures reported by kbuild test robot

Bartosz Golaszewski (16):
  nvmem: remove unused APIs
  nvmem: remove the global cell list
  nvmem: use kref
  nvmem: lpc18xx_eeprom: use devm_nvmem_register()
  nvmem: sunxi_sid: use devm_nvmem_register()
  nvmem: mxs-ocotp: use devm_nvmem_register()
  nvmem: change the signature of nvmem_unregister()
  nvmem: provide nvmem_dev_name()
  nvmem: remove the name field from struct nvmem_device
  nvmem: add a notifier chain
  nvmem: add support for cell info
  nvmem: resolve cells from DT at registration time
  nvmem: add support for cell lookups from machine code
  Documentation: nvmem: document cell tables and lookup entries
  nvmem: use SPDX license identifiers
  nvmem: make the naming of arguments in nvmem_cell_get() consistent

 Documentation/nvmem/nvmem.txt  |  31 ++
 MAINTAINERS                    |   1 +
 drivers/nvmem/core.c           | 676 ++++++++++++++++++---------------
 drivers/nvmem/lpc18xx_eeprom.c |   6 +-
 drivers/nvmem/mxs-ocotp.c      |   4 +-
 drivers/nvmem/sunxi_sid.c      |  20 +-
 include/linux/nvmem-consumer.h |  62 ++-
 include/linux/nvmem-machine.h  |  57 +++
 include/linux/nvmem-provider.h |  27 +-
 9 files changed, 493 insertions(+), 391 deletions(-)
 create mode 100644 include/linux/nvmem-machine.h

-- 
2.18.0

