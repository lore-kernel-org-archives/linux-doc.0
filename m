Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F242C07E99
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 18:45:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 325F8613B7
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 18:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhGISsH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Jul 2021 14:48:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32721 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229971AbhGISsH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Jul 2021 14:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625856323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=CkQ/xgleYsDFkubWHrN4e919svBSGwuji89qB5UEP34=;
        b=FGE9DrOcwmjzeXOUWZOYJfiIMziK//CmEPX57SEek5cTPGj35Iriu8wXLnZzLSk4TToFvd
        ADTvih4y55I0b7XcloqTMzaFvD+Y25qvk4IWs716e1wDK1HLm58phsX1dMxZIa1+GVNCfx
        4owDHqaxjPfyWJU1qfAxs7od0ZvlU6Y=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-TS2OK3RuPpS-2bH7fIPhYg-1; Fri, 09 Jul 2021 14:45:22 -0400
X-MC-Unique: TS2OK3RuPpS-2bH7fIPhYg-1
Received: by mail-oo1-f70.google.com with SMTP id q14-20020a4adc4e0000b0290249480f62d9so6074445oov.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Jul 2021 11:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CkQ/xgleYsDFkubWHrN4e919svBSGwuji89qB5UEP34=;
        b=potEtnXTBZ0XYWioWkbsECMfB7FoohPnOOucb/Kajimd3oat1chOXtrtIRNtnb5Nae
         NkUT0MqfB9dd5jebUqWw2gTeguJk/OBkSTeZsfC6/kNQbprclqnbc3bsq87XRJHW4etj
         oBu+XvsJ71W6QNldPprT0JIEAQ1bKL+BBrmJur1BCWCx6LSWKFku1FHf+S5mzOzn2W0r
         fH1hOuvb6thLVQjUHCM3aVM9ot/c1jYfk8XzY+lGTN4O/w2BdE0Rs7YImT3OoJDr5l6m
         +9l4lzduOoPsQ2TlpBF50K5NmvJH6/3yNYQRA0W1gTsCKCYlSobaBdroixjpbBRPHc6l
         dDYA==
X-Gm-Message-State: AOAM532Oh1/RJD1cTXvJ1VkeKbTIEPiV+eybrpl8tDJjvLh6KeLEyYlU
        G2000Uk43kgnyY29Uk1MmtIGx6Z9lbeIiz3Sd7kCvHXgYiybT4I4PXUSGJ6AL+6Q0XNe0JFaWGa
        Hj5hPHyze91kpYLm2fGwZ
X-Received: by 2002:a05:6830:1d94:: with SMTP id y20mr14844072oti.113.1625856321563;
        Fri, 09 Jul 2021 11:45:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJZpkbwDOTwYT4b0ycbPElhmYn2D/4YdqvPwZhQgKsQLL7Dr7wEwHkiaW8LfQyHIBifZmLVA==
X-Received: by 2002:a05:6830:1d94:: with SMTP id y20mr14844049oti.113.1625856321296;
        Fri, 09 Jul 2021 11:45:21 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id a44sm1145482ooj.12.2021.07.09.11.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 11:45:20 -0700 (PDT)
From:   trix@redhat.com
To:     mdf@kernel.org, corbet@lwn.net, hao.wu@intel.com,
        michal.simek@xilinx.com
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tom Rix <trix@redhat.com>
Subject: [RFC PATCH v10 0/3] standard release after compat_id change
Date:   Fri,  9 Jul 2021 11:45:07 -0700
Message-Id: <20210709184511.2521508-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

My objection to 'fpga: Use standard class dev_release function' here
https://lore.kernel.org/linux-fpga/20210709004206.244607-1-russell.h.weight@intel.com/
Is that it has 2 register functions for mgr and region.
This is caused by compat_id data being stored at the wrong level.

By first moving the compat_id data to the implementation level.
'fpga: remove compat_id from fpga_manager and fpga_region'
https://lore.kernel.org/linux-fpga/20210709134229.2510349-6-trix@redhat.com/
2 registers are not needed.

This change removes the register_full()'s as well as the info structs.

Tested on dfl/n3000

Russ Weight (3):
  fpga: mgr: Use standard dev_release for class driver
  fpga: bridge: Use standard dev_release for class driver
  fpga: region: Use standard dev_release for class driver

 Documentation/driver-api/fpga/fpga-bridge.rst |  12 +-
 Documentation/driver-api/fpga/fpga-mgr.rst    |  23 ++-
 Documentation/driver-api/fpga/fpga-region.rst |   4 -
 drivers/fpga/altera-cvp.c                     |  12 +-
 drivers/fpga/altera-fpga2sdram.c              |  12 +-
 drivers/fpga/altera-freeze-bridge.c           |  10 +-
 drivers/fpga/altera-hps2fpga.c                |  12 +-
 drivers/fpga/altera-pr-ip-core.c              |   7 +-
 drivers/fpga/altera-ps-spi.c                  |   9 +-
 drivers/fpga/dfl-fme-br.c                     |  10 +-
 drivers/fpga/dfl-fme-mgr.c                    |  10 +-
 drivers/fpga/dfl-fme-region.c                 |   7 +-
 drivers/fpga/dfl.c                            |  12 +-
 drivers/fpga/fpga-bridge.c                    | 122 +++----------
 drivers/fpga/fpga-mgr.c                       | 166 +++++-------------
 drivers/fpga/fpga-region.c                    | 108 +++---------
 drivers/fpga/ice40-spi.c                      |   9 +-
 drivers/fpga/machxo2-spi.c                    |   9 +-
 drivers/fpga/of-fpga-region.c                 |  10 +-
 drivers/fpga/socfpga-a10.c                    |  16 +-
 drivers/fpga/socfpga.c                        |   9 +-
 drivers/fpga/stratix10-soc.c                  |  16 +-
 drivers/fpga/ts73xx-fpga.c                    |   9 +-
 drivers/fpga/xilinx-pr-decoupler.c            |  17 +-
 drivers/fpga/xilinx-spi.c                     |  11 +-
 drivers/fpga/zynq-fpga.c                      |  16 +-
 drivers/fpga/zynqmp-fpga.c                    |   9 +-
 include/linux/fpga/fpga-bridge.h              |  30 +++-
 include/linux/fpga/fpga-mgr.h                 |  16 +-
 include/linux/fpga/fpga-region.h              |  12 +-
 30 files changed, 226 insertions(+), 499 deletions(-)

-- 
2.26.3

