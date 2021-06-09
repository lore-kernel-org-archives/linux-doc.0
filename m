Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55977C48BD1
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 13:17:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C4D7613BD
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 13:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbhFINTU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 09:19:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46933 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230484AbhFINTT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 09:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623244643;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=aDHyqkHT8tP5woeTV+rBNHR8on5450qVlxL0Zzlav/M=;
        b=gweE9di8Kg3RMbIH5oyuzlST5pQmXXd0tp+T5UQXERihOCw18vP1tICp3IQCJsyfCfTF9C
        ES2+Hpvu1Eo4uKxOEtVRy1vaRVHat75DTUpVScyF9oSp7H7XceZq3NRcq1TXYsXCmOOX9t
        biEHhVg77IO2RUqlVKJFpTwh2ME9DWQ=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-5SIjDlFAMQG8hlvJckirsA-1; Wed, 09 Jun 2021 09:17:22 -0400
X-MC-Unique: 5SIjDlFAMQG8hlvJckirsA-1
Received: by mail-oo1-f72.google.com with SMTP id x24-20020a4a9b980000b0290249d5c08dd6so6129924ooj.15
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 06:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aDHyqkHT8tP5woeTV+rBNHR8on5450qVlxL0Zzlav/M=;
        b=rxemy0Lctx2zXUxzN6errGA5nG/2GF7Tq78Iy8P39SwoaQPy383F3BlgyqW0MNd2bn
         z9QYxflmHSr4PV1+CvRbhCyZMXXuXRKIVY0FnuH5Bq2xxPpCDz7d/Sq3t9jKAe5cPz4G
         uHrO1UDcZ+saLn3JprDiJfFpL74guD+yasBb593qbhPAJBdyQBtePzgToA4t/MD90jXs
         1TBueshlYSltkOBVgr/9MAUuxNE/AEQ8AwRMvHucBgkTxQRgEyUHyIfwMtG40v5S9TzZ
         ttNE3NOBO4Dy4XzSA1lWn3znRJgvv6kqaisAgyYtJzn73fm7jB1hERUQ8lPLu/AkMpkc
         75MQ==
X-Gm-Message-State: AOAM532+UuHV3g1+LaMqxZYpl1pr6sFKmBGMg0fvF1/jcfEQQbUurBjt
        u6DUR9N8kAhGOH3NI1EVezIe98yVOQ5OOpPvKW7p8n6x4bQEjRx+l/XVVJJy7WH0pYZyRWBui63
        HLtL+Qc2sMPjyhDPDaTg7
X-Received: by 2002:a05:6830:25d4:: with SMTP id d20mr23043058otu.83.1623244641708;
        Wed, 09 Jun 2021 06:17:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh1kxSWiTV4vZ7D4+z52JbH/yYjx0rRL/AUXq5pmiT2atm4MqpTBWOjc2RVyD2OLfNHC3kQg==
X-Received: by 2002:a05:6830:25d4:: with SMTP id d20mr23043044otu.83.1623244641505;
        Wed, 09 Jun 2021 06:17:21 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 15sm3434329oij.26.2021.06.09.06.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 06:17:21 -0700 (PDT)
From:   trix@redhat.com
To:     hao.wu@intel.com, mdf@kernel.org, corbet@lwn.net,
        michal.simek@xilinx.com
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH 0/7] fpga: reorganize to subdirs
Date:   Wed,  9 Jun 2021 06:17:04 -0700
Message-Id: <20210609131712.3080827-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
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

