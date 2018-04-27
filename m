Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 289DD7DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 01:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1757287AbeD0B0N (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Apr 2018 21:26:13 -0400
Received: from mail-ot0-f196.google.com ([74.125.82.196]:45096 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757206AbeD0B0M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Apr 2018 21:26:12 -0400
Received: by mail-ot0-f196.google.com with SMTP id w4-v6so284715ote.12
        for <linux-doc@vger.kernel.org>; Thu, 26 Apr 2018 18:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=r1ZfDO2W434tlRWFZa6Oyi2oUl5DrFghhKf2ScBGnow=;
        b=g4SI1dt91iF/NQku9dQ7dA0PO6OKr93r9Kr2aCFJ886LdBHgroxI22r7og0lEa3JUc
         XOqs+kl0jmtxWr8MT4SoiWBvCqm+l3Pwslz0CJL8oz0Jn1l0LiYD9fzvj+2ApCIKTUH8
         os2jMTGmGS6y9IKZ70zAbxqwh/FE1ThH+GLJpOXXS+9149pKAJ7wp8sPyiTFUFGk/ufY
         7sislBC3FDjIThSEf9G8GAVDcrzWKIzRGEKhCXwe7s041Kk3NMZKIF71ZF8Mz7qB0oOO
         Jm+GudjKHz960ZRFoB+UOe7veed2cPiSNxehF7D34O9rM159EDXI2SIimv/QQkmRwMFh
         jOuw==
X-Gm-Message-State: ALQs6tCuu3ET4grsMsx7v17ah19Ai5RHy5UXSX0lfxpazZGx+EhTu3FO
        gwXL90RgffnLsV3YSqYZXdyjrw==
X-Google-Smtp-Source: AB8JxZoovpNNiiucokQ1ytGNdA5ckWvf8sbPOK+at9JbLc2calTx/7FzOMvB4PtEYvXATw28JEc1Gg==
X-Received: by 2002:a9d:6093:: with SMTP id m19-v6mr191105otj.131.1524792371530;
        Thu, 26 Apr 2018 18:26:11 -0700 (PDT)
Received: from localhost ([130.164.62.82])
        by smtp.gmail.com with ESMTPSA id 60-v6sm146429otc.15.2018.04.26.18.26.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Apr 2018 18:26:10 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-fpga@vger.kernel.org, michal.simek@xilinx.com,
        corbet@lwn.net, atull@kernel.org, Moritz Fischer <mdf@kernel.org>
Subject: [PATCH 0/4] FPGA Manager Patches for 4.18
Date:   Thu, 26 Apr 2018 18:26:01 -0700
Message-Id: <20180427012605.28981-1-mdf@kernel.org>
X-Mailer: git-send-email 2.17.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Greg,

Here's Alan's reworked patchset changing the API
for creating and registering FPGA Managers, Bridges and
Regions following your suggestions on the API.

These go on top of Paolo and Alan's patches that you
queued up the other day.

Thanks,

Moritz

Alan Tull (4):
  fpga: region: don't use drvdata in common fpga code
  fpga: manager: change api, don't use drvdata
  fpga: bridge: change api, don't use drvdata
  fpga: region: change api, add fpga_region_create/free

 Documentation/fpga/fpga-mgr.txt     | 35 ++++++++++---
 Documentation/fpga/fpga-region.txt  |  3 +-
 drivers/fpga/altera-cvp.c           | 19 +++++--
 drivers/fpga/altera-fpga2sdram.c    | 21 ++++++--
 drivers/fpga/altera-freeze-bridge.c | 22 ++++++--
 drivers/fpga/altera-hps2fpga.c      | 24 +++++++--
 drivers/fpga/altera-pr-ip-core.c    | 18 ++++++-
 drivers/fpga/altera-ps-spi.c        | 20 ++++++--
 drivers/fpga/fpga-bridge.c          | 70 +++++++++++++++++---------
 drivers/fpga/fpga-mgr.c             | 78 +++++++++++++++++++----------
 drivers/fpga/fpga-region.c          | 69 +++++++++++++++++++------
 drivers/fpga/ice40-spi.c            | 21 ++++++--
 drivers/fpga/machxo2-spi.c          | 20 ++++++--
 drivers/fpga/of-fpga-region.c       | 14 +++---
 drivers/fpga/socfpga-a10.c          | 14 ++++--
 drivers/fpga/socfpga.c              | 19 +++++--
 drivers/fpga/ts73xx-fpga.c          | 20 ++++++--
 drivers/fpga/xilinx-pr-decoupler.c  | 22 ++++++--
 drivers/fpga/xilinx-spi.c           | 20 ++++++--
 drivers/fpga/zynq-fpga.c            | 14 ++++--
 include/linux/fpga/fpga-bridge.h    |  9 ++--
 include/linux/fpga/fpga-mgr.h       | 10 ++--
 include/linux/fpga/fpga-region.h    | 11 ++--
 23 files changed, 429 insertions(+), 144 deletions(-)

-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
