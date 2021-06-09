Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7906C48BCF
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 13:17:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EB15613BC
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 13:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhFINTV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 09:19:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20580 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233081AbhFINTU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 09:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623244645;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aDHyqkHT8tP5woeTV+rBNHR8on5450qVlxL0Zzlav/M=;
        b=aiMt3VyL048RB0AmPfR1YaciZOq86mfOwbGfPXy+i+EQ90IfetCBGznlCEkivQAMq1IPBQ
        gQknHH1g9eJSy9sc/QGZPRxjAM0X7lfCnEpl0RLoT5EV8qh5rO1hnZX4vgYtEzDmGCVK/I
        +TRIih2vDNHcWUMcO7ELZPpJLAaQc3g=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-BQxUutz0MqyDf9Mc7QQ99g-1; Wed, 09 Jun 2021 09:17:24 -0400
X-MC-Unique: BQxUutz0MqyDf9Mc7QQ99g-1
Received: by mail-ot1-f70.google.com with SMTP id w1-20020a0568304101b02902fc17224cf5so16340933ott.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 06:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aDHyqkHT8tP5woeTV+rBNHR8on5450qVlxL0Zzlav/M=;
        b=DSwyOd+kmibd6vetPPfHhpHUSDJ0mggXaADC2ANMAqgAjP2Li89b+FmoLDzneHS2JH
         /IZHujeRuRXeSXVVIwvHJ1CO+e+/zvtTU5qzqc2RWbI+yIgORhLODYlOb8yFgbQcq6+p
         xLtRnTsqjRQKurx4htBiX7JA72n6ejd9X0OeZ0pr/wcN1CgpCaSn2J1is7I8ZVnA/7Th
         xgMBuyri4AxvseQ1wD/njnZYwaO+1NY+Pb7c88SAkpwNpAPrP75w7RrMMfNVRWKcirON
         q/K8tD/rBwjcY7cE6olrzM+2M540YJ2CANqG5iqdXdgKcXfGGVTKQ8CHaUJPNDxj+MnH
         gjzQ==
X-Gm-Message-State: AOAM533cf4eFIx/XeaqKUFCMnCmbRQICiyXdETw5mECFEcAsb0cfTfQI
        PvUfrtJoLeGaRqagZlbCkGhHmSqXfk1nPyZ6CG/EnIfrDoXfjYjB06IXOpj2yFP+pCg/wAepAJc
        SGBj0+qlNiXyPcuKDDajg
X-Received: by 2002:a05:6830:22cb:: with SMTP id q11mr14584622otc.273.1623244643156;
        Wed, 09 Jun 2021 06:17:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNYzAn17CP9ZGmnbgi4oHIZwe7YajUgGZ/RpT7HbQItPV3z7nwLL2bH7ZlKV729I/+wxFeHQ==
X-Received: by 2002:a05:6830:22cb:: with SMTP id q11mr14584607otc.273.1623244642991;
        Wed, 09 Jun 2021 06:17:22 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 15sm3434329oij.26.2021.06.09.06.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 06:17:22 -0700 (PDT)
From:   trix@redhat.com
To:     hao.wu@intel.com, mdf@kernel.org, corbet@lwn.net,
        michal.simek@xilinx.com
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH 0/7] fpga: reorganize to subdirs
Date:   Wed,  9 Jun 2021 06:17:05 -0700
Message-Id: <20210609131712.3080827-2-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210609131712.3080827-1-trix@redhat.com>
References: <20210609131712.3080827-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

The incoming xrt patchset has a toplevel subdir xrt/
The current fpga/ uses a single dir with filename prefixes to subdivide owners
For consistency, there should be only one way to organize the fpga/ dir.
Because the subdir model scales better, refactor to use it.
The discussion wrt xrt is here:
https://lore.kernel.org/linux-fpga/68e85a4f-4a10-1ff9-0443-aa565878c855@redhat.com/

Follow drivers/net/ethernet/ which has control configs
NET_VENDOR_BLA that map to drivers/net/ethernet/bla
Since fpgas do not have many vendors, drop the 'VENDOR' and use
FPGA_BLA.

There are several new subdirs
altera/
dfl/
lattice/
xilinx/

Each subdir has a Kconfig that has a new/reused

if FPGA_BLA
  ... existing configs ...
endif FPGA_BLA

Which is sourced into the main fpga/Kconfig

Each subdir has a Makefile whose transversal is controlled in the
fpga/Makefile by

obj-$(CONFIG_FPGA_BLA) += bla/

For many of the moved files, they had a prefix bla-* that matched their
new subdir dir name bla/.  Those filename are overspecified.  So they
were simplified by removing the 'bla-' prefix.  If they were *.h files
their guards were also changed.

Some cleanup to arrange thing alphabetically and make fpga/Makefile's
whitespace look more like net/'s

Tom Rix (7):
  fpga: dfl: reorganize to subdir layout
  fpga: xilinx: reorganize to subdir layout
  fpga: altera: reorganize to subdir layout
  fpga: lattice: reorganize to subdir layout
  fpga: dfl: remove dfl- prefix on files
  fpga: xilinx: remove xilinx- prefix on files
  fpga: altera: remove altera- prefix on files

 Documentation/fpga/dfl.rst                    |   4 +-
 MAINTAINERS                                   |   2 +-
 drivers/fpga/Kconfig                          | 204 +-----------------
 drivers/fpga/Makefile                         |  47 +---
 drivers/fpga/altera/Kconfig                   |  79 +++++++
 drivers/fpga/altera/Makefile                  |  12 ++
 drivers/fpga/{altera-cvp.c => altera/cvp.c}   |   0
 .../fpga2sdram.c}                             |   0
 .../freeze-bridge.c}                          |   0
 .../{altera-hps2fpga.c => altera/hps2fpga.c}  |   0
 .../pr-ip-core-plat.c}                        |   0
 .../pr-ip-core.c}                             |   0
 .../fpga/{altera-ps-spi.c => altera/ps-spi.c} |   0
 drivers/fpga/{ => altera}/socfpga-a10.c       |   0
 drivers/fpga/{ => altera}/socfpga.c           |   0
 drivers/fpga/{ => altera}/stratix10-soc.c     |   0
 drivers/fpga/{ => altera}/ts73xx-fpga.c       |   0
 drivers/fpga/dfl/Kconfig                      |  80 +++++++
 drivers/fpga/dfl/Makefile                     |  17 ++
 .../afu-dma-region.c}                         |   2 +-
 .../fpga/{dfl-afu-error.c => dfl/afu-error.c} |   2 +-
 .../fpga/{dfl-afu-main.c => dfl/afu-main.c}   |   2 +-
 .../{dfl-afu-region.c => dfl/afu-region.c}    |   2 +-
 drivers/fpga/{dfl-afu.h => dfl/afu.h}         |   6 +-
 drivers/fpga/{ => dfl}/dfl.c                  |   0
 drivers/fpga/{ => dfl}/dfl.h                  |   0
 drivers/fpga/{dfl-fme-br.c => dfl/fme-br.c}   |   2 +-
 .../fpga/{dfl-fme-error.c => dfl/fme-error.c} |   2 +-
 .../fpga/{dfl-fme-main.c => dfl/fme-main.c}   |   2 +-
 drivers/fpga/{dfl-fme-mgr.c => dfl/fme-mgr.c} |   2 +-
 .../fpga/{dfl-fme-perf.c => dfl/fme-perf.c}   |   2 +-
 drivers/fpga/{dfl-fme-pr.c => dfl/fme-pr.c}   |   4 +-
 drivers/fpga/{dfl-fme-pr.h => dfl/fme-pr.h}   |   6 +-
 .../{dfl-fme-region.c => dfl/fme-region.c}    |   2 +-
 drivers/fpga/{dfl-fme.h => dfl/fme.h}         |   6 +-
 .../{dfl-n3000-nios.c => dfl/n3000-nios.c}    |   0
 drivers/fpga/{dfl-pci.c => dfl/pci.c}         |   0
 drivers/fpga/lattice/Kconfig                  |  22 ++
 drivers/fpga/lattice/Makefile                 |   4 +
 drivers/fpga/{ => lattice}/ice40-spi.c        |   0
 drivers/fpga/{ => lattice}/machxo2-spi.c      |   0
 drivers/fpga/xilinx/Kconfig                   |  48 +++++
 drivers/fpga/xilinx/Makefile                  |   8 +
 .../pr-decoupler.c}                           |   0
 drivers/fpga/{xilinx-spi.c => xilinx/spi.c}   |   0
 drivers/fpga/{ => xilinx}/zynq-fpga.c         |   0
 drivers/fpga/{ => xilinx}/zynqmp-fpga.c       |   0
 47 files changed, 306 insertions(+), 263 deletions(-)
 create mode 100644 drivers/fpga/altera/Kconfig
 create mode 100644 drivers/fpga/altera/Makefile
 rename drivers/fpga/{altera-cvp.c => altera/cvp.c} (100%)
 rename drivers/fpga/{altera-fpga2sdram.c => altera/fpga2sdram.c} (100%)
 rename drivers/fpga/{altera-freeze-bridge.c => altera/freeze-bridge.c} (100%)
 rename drivers/fpga/{altera-hps2fpga.c => altera/hps2fpga.c} (100%)
 rename drivers/fpga/{altera-pr-ip-core-plat.c => altera/pr-ip-core-plat.c} (100%)
 rename drivers/fpga/{altera-pr-ip-core.c => altera/pr-ip-core.c} (100%)
 rename drivers/fpga/{altera-ps-spi.c => altera/ps-spi.c} (100%)
 rename drivers/fpga/{ => altera}/socfpga-a10.c (100%)
 rename drivers/fpga/{ => altera}/socfpga.c (100%)
 rename drivers/fpga/{ => altera}/stratix10-soc.c (100%)
 rename drivers/fpga/{ => altera}/ts73xx-fpga.c (100%)
 create mode 100644 drivers/fpga/dfl/Kconfig
 create mode 100644 drivers/fpga/dfl/Makefile
 rename drivers/fpga/{dfl-afu-dma-region.c => dfl/afu-dma-region.c} (99%)
 rename drivers/fpga/{dfl-afu-error.c => dfl/afu-error.c} (99%)
 rename drivers/fpga/{dfl-afu-main.c => dfl/afu-main.c} (99%)
 rename drivers/fpga/{dfl-afu-region.c => dfl/afu-region.c} (99%)
 rename drivers/fpga/{dfl-afu.h => dfl/afu.h} (98%)
 rename drivers/fpga/{ => dfl}/dfl.c (100%)
 rename drivers/fpga/{ => dfl}/dfl.h (100%)
 rename drivers/fpga/{dfl-fme-br.c => dfl/fme-br.c} (99%)
 rename drivers/fpga/{dfl-fme-error.c => dfl/fme-error.c} (99%)
 rename drivers/fpga/{dfl-fme-main.c => dfl/fme-main.c} (99%)
 rename drivers/fpga/{dfl-fme-mgr.c => dfl/fme-mgr.c} (99%)
 rename drivers/fpga/{dfl-fme-perf.c => dfl/fme-perf.c} (99%)
 rename drivers/fpga/{dfl-fme-pr.c => dfl/fme-pr.c} (99%)
 rename drivers/fpga/{dfl-fme-pr.h => dfl/fme-pr.h} (96%)
 rename drivers/fpga/{dfl-fme-region.c => dfl/fme-region.c} (98%)
 rename drivers/fpga/{dfl-fme.h => dfl/fme.h} (95%)
 rename drivers/fpga/{dfl-n3000-nios.c => dfl/n3000-nios.c} (100%)
 rename drivers/fpga/{dfl-pci.c => dfl/pci.c} (100%)
 create mode 100644 drivers/fpga/lattice/Kconfig
 create mode 100644 drivers/fpga/lattice/Makefile
 rename drivers/fpga/{ => lattice}/ice40-spi.c (100%)
 rename drivers/fpga/{ => lattice}/machxo2-spi.c (100%)
 create mode 100644 drivers/fpga/xilinx/Kconfig
 create mode 100644 drivers/fpga/xilinx/Makefile
 rename drivers/fpga/{xilinx-pr-decoupler.c => xilinx/pr-decoupler.c} (100%)
 rename drivers/fpga/{xilinx-spi.c => xilinx/spi.c} (100%)
 rename drivers/fpga/{ => xilinx}/zynq-fpga.c (100%)
 rename drivers/fpga/{ => xilinx}/zynqmp-fpga.c (100%)

-- 
2.26.3

