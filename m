Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	URIBL_DBL_ABUSE_MALW autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6F43D7D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue,  4 Dec 2018 01:43:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725915AbeLDBnz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 3 Dec 2018 20:43:55 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40037 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbeLDBny (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Dec 2018 20:43:54 -0500
Received: by mail-qt1-f196.google.com with SMTP id k12so16267023qtf.7
        for <linux-doc@vger.kernel.org>; Mon, 03 Dec 2018 17:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=512eOgceoMTH0hKhLzIZeShBfhFbur47/u4lQniJXQw=;
        b=wNI9PeIVPfML46m001ktv+CbpenhdY6WB6g+20vEJwd0aC+rWRN1X3SuylBO5PNeHd
         Gmx03vZoHkYGI4ovUstRg6j2RpY4zBjw7IkOuAkq7dLbW9jksLT0tvNsBMPoiQxQDsjV
         id5Jku7GI9EwK2Ysksn4A4b2bsnyg7bzRXSMG61Rn7L7YCbRTvUEyDNqvx1hWqv07cY5
         t3idid5xpvNw7kkWwj3Ne2+FCVwxbgRjCs/Nm/61fwbo8IKVEbcAa7BXE7sofpAYL5Ye
         Sf8uPpkZus8L7HV2u1xauyP8cnHkclFrsIGhn6dRQorqufslFsrH4EGTKvWjHK46ryqj
         pXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=512eOgceoMTH0hKhLzIZeShBfhFbur47/u4lQniJXQw=;
        b=uH5hBSHdcLff5SWfKn/LCXkfOamkb6ycFT8+JMGc1itgZiVLe5hYJJtNkmbwfx8nEr
         t33jBT43uNFKRCGGlTqHW/OuL5P1IqRodN8D6QsXsr2hxznSE/bOp8hVfpjVsdQZivLo
         bKbJeoljR1FnP2SONRKrnxnLXGArFGoLgp4g3nBz1uLcCPl91haPomQfwL4EBG65ngEG
         uSJPiFuX7aADcizVGZrXoODFAXoTeaEJGdlABK4a8Lct5FDWl/p0rwfBvMZ0wh/w1GVm
         doiguVrOAcbdoTrwkAMdhX2FjcHd86jHcHmc/XT1deM1oUSCy0I5ocW6XdUkMZLlmzIa
         FXmA==
X-Gm-Message-State: AA+aEWY7jf5iqTdmkbeX05ZCHJEsSS9YO+EK9D4oMjlhCMMKP8tYuuhc
        LfshDxZtlG4Cg2Wl74sZAA8uZA==
X-Google-Smtp-Source: AFSGD/UXXQXL1dPRqXOv3oVjnTtzbfio6nZM2e9di1xJFX/hhNXb69exjqPSyqOCuccXdVwrTPs7gg==
X-Received: by 2002:ac8:26b9:: with SMTP id 54mr17960845qto.301.1543887831736;
        Mon, 03 Dec 2018 17:43:51 -0800 (PST)
Received: from jkicinski-Precision-T1700.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id o190sm7678599qkd.53.2018.12.03.17.43.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Dec 2018 17:43:50 -0800 (PST)
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     davem@davemloft.net, Jonathan Corbet <corbet@lwn.net>
Cc:     oss-drivers@netronome.com, netdev@vger.kernel.org,
        jesse.brandeburg@intel.com, dsahern@gmail.com, jiri@resnulli.us,
        stephen@networkplumber.org, henrik@austad.us,
        linux-doc@vger.kernel.org,
        Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: [RFC] net: documentation: build a directory structure for drivers
Date:   Mon,  3 Dec 2018 17:43:28 -0800
Message-Id: <20181204014328.14424-1-jakub.kicinski@netronome.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation/networking/ is full of cryptically named files with
driver documentation.  This makes finding interesting information
at a glance really hard.  Move all those files into a directory
called device_drivers (since not all drivers are for device) and
fix up references.

RFC v0.1 -> RFC v1:
 - also add .txt suffix to the files which are missing it (Quentin)

Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
Reviewed-by: Quentin Monnet <quentin.monnet@netronome.com>
---
I'm posting as an RFC to see what the general feeling is about
such a patch.  I can split into per-driver changes later if that's
the best way forward.
---
 .../devicetree/bindings/misc/fsl,qoriq-mc.txt |  2 +-
 .../{ => device_drivers/3com}/3c509.txt       |  0
 .../{ => device_drivers/3com}/vortex.txt      |  2 +-
 .../{ => device_drivers/amazon}/ena.txt       |  0
 .../{ => device_drivers/chelsio}/cxgb.txt     |  0
 .../{ => device_drivers/cirrus}/cs89x0.txt    |  0
 .../{ => device_drivers/davicom}/dm9000.txt   |  0
 .../{ => device_drivers/dec}/de4x5.txt        |  0
 .../{ => device_drivers/dec}/dmfe.txt         |  0
 .../{ => device_drivers/dlink}/dl2k.txt       |  0
 .../{ => device_drivers/freescale}/dpaa.txt   |  0
 .../freescale}/dpaa2/dpio-driver.rst          |  4 +-
 .../freescale}/dpaa2/ethernet-driver.rst      |  2 +-
 .../freescale}/dpaa2/index.rst                |  0
 .../freescale}/dpaa2/overview.rst             |  0
 .../freescale}/gianfar.txt                    |  0
 .../{ => device_drivers/intel}/e100.rst       |  0
 .../{ => device_drivers/intel}/e1000.rst      |  0
 .../{ => device_drivers/intel}/e1000e.rst     |  0
 .../{ => device_drivers/intel}/fm10k.rst      |  0
 .../{ => device_drivers/intel}/i40e.rst       |  0
 .../{ => device_drivers/intel}/iavf.rst       |  0
 .../{ => device_drivers/intel}/ice.rst        |  0
 .../{ => device_drivers/intel}/igb.rst        |  0
 .../{ => device_drivers/intel}/igbvf.rst      |  0
 .../intel/ipw2100.txt}                        |  0
 .../intel/ipw2200.txt}                        |  0
 .../{ => device_drivers/intel}/ixgb.rst       |  0
 .../{ => device_drivers/intel}/ixgbe.rst      |  0
 .../{ => device_drivers/intel}/ixgbevf.rst    |  0
 .../{ => device_drivers/microsoft}/netvsc.txt |  0
 .../{ => device_drivers/neterion}/s2io.txt    |  0
 .../{ => device_drivers/neterion}/vxge.txt    |  0
 .../qlogic}/LICENSE.qla3xxx                   |  0
 .../qlogic}/LICENSE.qlcnic                    |  0
 .../{ => device_drivers/qlogic}/LICENSE.qlge  |  0
 .../{ => device_drivers/qualcomm}/rmnet.txt   |  0
 .../sb1000.txt}                               |  0
 .../{ => device_drivers/smsc}/smc9.txt        |  0
 .../{ => device_drivers/stmicro}/stmmac.txt   |  0
 .../ti/cpsw.txt}                              |  0
 .../{ => device_drivers/ti}/tlan.txt          |  0
 .../toshiba}/spider_net.txt                   |  0
 MAINTAINERS                                   | 48 +++++++++----------
 drivers/net/Kconfig                           |  8 ++--
 drivers/net/ethernet/3com/3c59x.c             |  4 +-
 drivers/net/ethernet/3com/Kconfig             |  5 +-
 drivers/net/ethernet/chelsio/Kconfig          |  3 +-
 drivers/net/ethernet/cirrus/Kconfig           |  2 +-
 drivers/net/ethernet/dec/tulip/Kconfig        |  4 +-
 drivers/net/ethernet/dlink/dl2k.c             |  2 +-
 drivers/net/ethernet/intel/Kconfig            | 24 +++++-----
 drivers/net/ethernet/neterion/Kconfig         |  4 +-
 drivers/net/ethernet/smsc/Kconfig             |  4 +-
 drivers/net/ethernet/ti/Kconfig               |  3 +-
 drivers/net/ethernet/ti/tlan.c                |  4 +-
 drivers/net/wireless/intel/ipw2x00/Kconfig    | 10 ++--
 drivers/net/wireless/intel/ipw2x00/ipw2100.c  |  2 +-
 58 files changed, 71 insertions(+), 66 deletions(-)
 rename Documentation/networking/{ => device_drivers/3com}/3c509.txt (100%)
 rename Documentation/networking/{ => device_drivers/3com}/vortex.txt (99%)
 rename Documentation/networking/{ => device_drivers/amazon}/ena.txt (100%)
 rename Documentation/networking/{ => device_drivers/chelsio}/cxgb.txt (100%)
 rename Documentation/networking/{ => device_drivers/cirrus}/cs89x0.txt (100%)
 rename Documentation/networking/{ => device_drivers/davicom}/dm9000.txt (100%)
 rename Documentation/networking/{ => device_drivers/dec}/de4x5.txt (100%)
 rename Documentation/networking/{ => device_drivers/dec}/dmfe.txt (100%)
 rename Documentation/networking/{ => device_drivers/dlink}/dl2k.txt (100%)
 rename Documentation/networking/{ => device_drivers/freescale}/dpaa.txt (100%)
 rename Documentation/networking/{ => device_drivers/freescale}/dpaa2/dpio-driver.rst (97%)
 rename Documentation/networking/{ => device_drivers/freescale}/dpaa2/ethernet-driver.rst (98%)
 rename Documentation/networking/{ => device_drivers/freescale}/dpaa2/index.rst (100%)
 rename Documentation/networking/{ => device_drivers/freescale}/dpaa2/overview.rst (100%)
 rename Documentation/networking/{ => device_drivers/freescale}/gianfar.txt (100%)
 rename Documentation/networking/{ => device_drivers/intel}/e100.rst (100%)
 rename Documentation/networking/{ => device_drivers/intel}/e1000.rst (100%)
 rename Documentation/networking/{ => device_drivers/intel}/e1000e.rst (100%)
 rename Documentation/networking/{ => device_drivers/intel}/fm10k.rst (100%)
 rename Documentation/networking/{ => device_drivers/intel}/i40e.rst (100%)
 rename Documentation/networking/{ => device_drivers/intel}/iavf.rst (100%)
 rename Documentation/networking/{ => device_drivers/intel}/ice.rst (100%)
 rename Documentation/networking/{ => device_drivers/intel}/igb.rst (100%)
 rename Documentation/networking/{ => device_drivers/intel}/igbvf.rst (100%)
 rename Documentation/networking/{README.ipw2100 => device_drivers/intel/ipw2100.txt} (100%)
 rename Documentation/networking/{README.ipw2200 => device_drivers/intel/ipw2200.txt} (100%)
 rename Documentation/networking/{ => device_drivers/intel}/ixgb.rst (100%)
 rename Documentation/networking/{ => device_drivers/intel}/ixgbe.rst (100%)
 rename Documentation/networking/{ => device_drivers/intel}/ixgbevf.rst (100%)
 rename Documentation/networking/{ => device_drivers/microsoft}/netvsc.txt (100%)
 rename Documentation/networking/{ => device_drivers/neterion}/s2io.txt (100%)
 rename Documentation/networking/{ => device_drivers/neterion}/vxge.txt (100%)
 rename Documentation/networking/{ => device_drivers/qlogic}/LICENSE.qla3xxx (100%)
 rename Documentation/networking/{ => device_drivers/qlogic}/LICENSE.qlcnic (100%)
 rename Documentation/networking/{ => device_drivers/qlogic}/LICENSE.qlge (100%)
 rename Documentation/networking/{ => device_drivers/qualcomm}/rmnet.txt (100%)
 rename Documentation/networking/{README.sb1000 => device_drivers/sb1000.txt} (100%)
 rename Documentation/networking/{ => device_drivers/smsc}/smc9.txt (100%)
 rename Documentation/networking/{ => device_drivers/stmicro}/stmmac.txt (100%)
 rename Documentation/networking/{ti-cpsw.txt => device_drivers/ti/cpsw.txt} (100%)
 rename Documentation/networking/{ => device_drivers/ti}/tlan.txt (100%)
 rename Documentation/networking/{ => device_drivers/toshiba}/spider_net.txt (100%)

diff --git a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
index 01fdc33a41d0..bb7e896cb644 100644
--- a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
+++ b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
@@ -10,7 +10,7 @@ such as network interfaces, crypto accelerator instances, L2 switches,
 etc.
 
 For an overview of the DPAA2 architecture and fsl-mc bus see:
-Documentation/networking/dpaa2/overview.rst
+Documentation/networking/device_drivers/freescale/dpaa2/overview.rst
 
 As described in the above overview, all DPAA2 objects in a DPRC share the
 same hardware "isolation context" and a 10-bit value called an ICID
diff --git a/Documentation/networking/3c509.txt b/Documentation/networking/device_drivers/3com/3c509.txt
similarity index 100%
rename from Documentation/networking/3c509.txt
rename to Documentation/networking/device_drivers/3com/3c509.txt
diff --git a/Documentation/networking/vortex.txt b/Documentation/networking/device_drivers/3com/vortex.txt
similarity index 99%
rename from Documentation/networking/vortex.txt
rename to Documentation/networking/device_drivers/3com/vortex.txt
index ad3dead052a4..587f3fcfbcae 100644
--- a/Documentation/networking/vortex.txt
+++ b/Documentation/networking/device_drivers/3com/vortex.txt
@@ -1,4 +1,4 @@
-Documentation/networking/vortex.txt
+Documentation/networking/device_drivers/3com/vortex.txt
 Andrew Morton
 30 April 2000
 
diff --git a/Documentation/networking/ena.txt b/Documentation/networking/device_drivers/amazon/ena.txt
similarity index 100%
rename from Documentation/networking/ena.txt
rename to Documentation/networking/device_drivers/amazon/ena.txt
diff --git a/Documentation/networking/cxgb.txt b/Documentation/networking/device_drivers/chelsio/cxgb.txt
similarity index 100%
rename from Documentation/networking/cxgb.txt
rename to Documentation/networking/device_drivers/chelsio/cxgb.txt
diff --git a/Documentation/networking/cs89x0.txt b/Documentation/networking/device_drivers/cirrus/cs89x0.txt
similarity index 100%
rename from Documentation/networking/cs89x0.txt
rename to Documentation/networking/device_drivers/cirrus/cs89x0.txt
diff --git a/Documentation/networking/dm9000.txt b/Documentation/networking/device_drivers/davicom/dm9000.txt
similarity index 100%
rename from Documentation/networking/dm9000.txt
rename to Documentation/networking/device_drivers/davicom/dm9000.txt
diff --git a/Documentation/networking/de4x5.txt b/Documentation/networking/device_drivers/dec/de4x5.txt
similarity index 100%
rename from Documentation/networking/de4x5.txt
rename to Documentation/networking/device_drivers/dec/de4x5.txt
diff --git a/Documentation/networking/dmfe.txt b/Documentation/networking/device_drivers/dec/dmfe.txt
similarity index 100%
rename from Documentation/networking/dmfe.txt
rename to Documentation/networking/device_drivers/dec/dmfe.txt
diff --git a/Documentation/networking/dl2k.txt b/Documentation/networking/device_drivers/dlink/dl2k.txt
similarity index 100%
rename from Documentation/networking/dl2k.txt
rename to Documentation/networking/device_drivers/dlink/dl2k.txt
diff --git a/Documentation/networking/dpaa.txt b/Documentation/networking/device_drivers/freescale/dpaa.txt
similarity index 100%
rename from Documentation/networking/dpaa.txt
rename to Documentation/networking/device_drivers/freescale/dpaa.txt
diff --git a/Documentation/networking/dpaa2/dpio-driver.rst b/Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst
similarity index 97%
rename from Documentation/networking/dpaa2/dpio-driver.rst
rename to Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst
index 13588104161b..a188466b6698 100644
--- a/Documentation/networking/dpaa2/dpio-driver.rst
+++ b/Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst
@@ -19,8 +19,8 @@ pool management for network interfaces.
 This document provides an overview the Linux DPIO driver, its
 subcomponents, and its APIs.
 
-See Documentation/networking/dpaa2/overview.rst for a general overview of DPAA2
-and the general DPAA2 driver architecture in Linux.
+See Documentation/networking/device_drivers/freescale/dpaa2/overview.rst for
+a general overview of DPAA2 and the general DPAA2 driver architecture in Linux.
 
 Driver Overview
 ---------------
diff --git a/Documentation/networking/dpaa2/ethernet-driver.rst b/Documentation/networking/device_drivers/freescale/dpaa2/ethernet-driver.rst
similarity index 98%
rename from Documentation/networking/dpaa2/ethernet-driver.rst
rename to Documentation/networking/device_drivers/freescale/dpaa2/ethernet-driver.rst
index 90ec940749e8..cb4c9a0c5a17 100644
--- a/Documentation/networking/dpaa2/ethernet-driver.rst
+++ b/Documentation/networking/device_drivers/freescale/dpaa2/ethernet-driver.rst
@@ -33,7 +33,7 @@ hardware resources, like queues, do not have a corresponding MC object and
 are treated as internal resources of other objects.
 
 For a more detailed description of the DPAA2 architecture and its object
-abstractions see *Documentation/networking/dpaa2/overview.rst*.
+abstractions see *Documentation/networking/device_drivers/freescale/dpaa2/overview.rst*.
 
 Each Linux net device is built on top of a Datapath Network Interface (DPNI)
 object and uses Buffer Pools (DPBPs), I/O Portals (DPIOs) and Concentrators
diff --git a/Documentation/networking/dpaa2/index.rst b/Documentation/networking/device_drivers/freescale/dpaa2/index.rst
similarity index 100%
rename from Documentation/networking/dpaa2/index.rst
rename to Documentation/networking/device_drivers/freescale/dpaa2/index.rst
diff --git a/Documentation/networking/dpaa2/overview.rst b/Documentation/networking/device_drivers/freescale/dpaa2/overview.rst
similarity index 100%
rename from Documentation/networking/dpaa2/overview.rst
rename to Documentation/networking/device_drivers/freescale/dpaa2/overview.rst
diff --git a/Documentation/networking/gianfar.txt b/Documentation/networking/device_drivers/freescale/gianfar.txt
similarity index 100%
rename from Documentation/networking/gianfar.txt
rename to Documentation/networking/device_drivers/freescale/gianfar.txt
diff --git a/Documentation/networking/e100.rst b/Documentation/networking/device_drivers/intel/e100.rst
similarity index 100%
rename from Documentation/networking/e100.rst
rename to Documentation/networking/device_drivers/intel/e100.rst
diff --git a/Documentation/networking/e1000.rst b/Documentation/networking/device_drivers/intel/e1000.rst
similarity index 100%
rename from Documentation/networking/e1000.rst
rename to Documentation/networking/device_drivers/intel/e1000.rst
diff --git a/Documentation/networking/e1000e.rst b/Documentation/networking/device_drivers/intel/e1000e.rst
similarity index 100%
rename from Documentation/networking/e1000e.rst
rename to Documentation/networking/device_drivers/intel/e1000e.rst
diff --git a/Documentation/networking/fm10k.rst b/Documentation/networking/device_drivers/intel/fm10k.rst
similarity index 100%
rename from Documentation/networking/fm10k.rst
rename to Documentation/networking/device_drivers/intel/fm10k.rst
diff --git a/Documentation/networking/i40e.rst b/Documentation/networking/device_drivers/intel/i40e.rst
similarity index 100%
rename from Documentation/networking/i40e.rst
rename to Documentation/networking/device_drivers/intel/i40e.rst
diff --git a/Documentation/networking/iavf.rst b/Documentation/networking/device_drivers/intel/iavf.rst
similarity index 100%
rename from Documentation/networking/iavf.rst
rename to Documentation/networking/device_drivers/intel/iavf.rst
diff --git a/Documentation/networking/ice.rst b/Documentation/networking/device_drivers/intel/ice.rst
similarity index 100%
rename from Documentation/networking/ice.rst
rename to Documentation/networking/device_drivers/intel/ice.rst
diff --git a/Documentation/networking/igb.rst b/Documentation/networking/device_drivers/intel/igb.rst
similarity index 100%
rename from Documentation/networking/igb.rst
rename to Documentation/networking/device_drivers/intel/igb.rst
diff --git a/Documentation/networking/igbvf.rst b/Documentation/networking/device_drivers/intel/igbvf.rst
similarity index 100%
rename from Documentation/networking/igbvf.rst
rename to Documentation/networking/device_drivers/intel/igbvf.rst
diff --git a/Documentation/networking/README.ipw2100 b/Documentation/networking/device_drivers/intel/ipw2100.txt
similarity index 100%
rename from Documentation/networking/README.ipw2100
rename to Documentation/networking/device_drivers/intel/ipw2100.txt
diff --git a/Documentation/networking/README.ipw2200 b/Documentation/networking/device_drivers/intel/ipw2200.txt
similarity index 100%
rename from Documentation/networking/README.ipw2200
rename to Documentation/networking/device_drivers/intel/ipw2200.txt
diff --git a/Documentation/networking/ixgb.rst b/Documentation/networking/device_drivers/intel/ixgb.rst
similarity index 100%
rename from Documentation/networking/ixgb.rst
rename to Documentation/networking/device_drivers/intel/ixgb.rst
diff --git a/Documentation/networking/ixgbe.rst b/Documentation/networking/device_drivers/intel/ixgbe.rst
similarity index 100%
rename from Documentation/networking/ixgbe.rst
rename to Documentation/networking/device_drivers/intel/ixgbe.rst
diff --git a/Documentation/networking/ixgbevf.rst b/Documentation/networking/device_drivers/intel/ixgbevf.rst
similarity index 100%
rename from Documentation/networking/ixgbevf.rst
rename to Documentation/networking/device_drivers/intel/ixgbevf.rst
diff --git a/Documentation/networking/netvsc.txt b/Documentation/networking/device_drivers/microsoft/netvsc.txt
similarity index 100%
rename from Documentation/networking/netvsc.txt
rename to Documentation/networking/device_drivers/microsoft/netvsc.txt
diff --git a/Documentation/networking/s2io.txt b/Documentation/networking/device_drivers/neterion/s2io.txt
similarity index 100%
rename from Documentation/networking/s2io.txt
rename to Documentation/networking/device_drivers/neterion/s2io.txt
diff --git a/Documentation/networking/vxge.txt b/Documentation/networking/device_drivers/neterion/vxge.txt
similarity index 100%
rename from Documentation/networking/vxge.txt
rename to Documentation/networking/device_drivers/neterion/vxge.txt
diff --git a/Documentation/networking/LICENSE.qla3xxx b/Documentation/networking/device_drivers/qlogic/LICENSE.qla3xxx
similarity index 100%
rename from Documentation/networking/LICENSE.qla3xxx
rename to Documentation/networking/device_drivers/qlogic/LICENSE.qla3xxx
diff --git a/Documentation/networking/LICENSE.qlcnic b/Documentation/networking/device_drivers/qlogic/LICENSE.qlcnic
similarity index 100%
rename from Documentation/networking/LICENSE.qlcnic
rename to Documentation/networking/device_drivers/qlogic/LICENSE.qlcnic
diff --git a/Documentation/networking/LICENSE.qlge b/Documentation/networking/device_drivers/qlogic/LICENSE.qlge
similarity index 100%
rename from Documentation/networking/LICENSE.qlge
rename to Documentation/networking/device_drivers/qlogic/LICENSE.qlge
diff --git a/Documentation/networking/rmnet.txt b/Documentation/networking/device_drivers/qualcomm/rmnet.txt
similarity index 100%
rename from Documentation/networking/rmnet.txt
rename to Documentation/networking/device_drivers/qualcomm/rmnet.txt
diff --git a/Documentation/networking/README.sb1000 b/Documentation/networking/device_drivers/sb1000.txt
similarity index 100%
rename from Documentation/networking/README.sb1000
rename to Documentation/networking/device_drivers/sb1000.txt
diff --git a/Documentation/networking/smc9.txt b/Documentation/networking/device_drivers/smsc/smc9.txt
similarity index 100%
rename from Documentation/networking/smc9.txt
rename to Documentation/networking/device_drivers/smsc/smc9.txt
diff --git a/Documentation/networking/stmmac.txt b/Documentation/networking/device_drivers/stmicro/stmmac.txt
similarity index 100%
rename from Documentation/networking/stmmac.txt
rename to Documentation/networking/device_drivers/stmicro/stmmac.txt
diff --git a/Documentation/networking/ti-cpsw.txt b/Documentation/networking/device_drivers/ti/cpsw.txt
similarity index 100%
rename from Documentation/networking/ti-cpsw.txt
rename to Documentation/networking/device_drivers/ti/cpsw.txt
diff --git a/Documentation/networking/tlan.txt b/Documentation/networking/device_drivers/ti/tlan.txt
similarity index 100%
rename from Documentation/networking/tlan.txt
rename to Documentation/networking/device_drivers/ti/tlan.txt
diff --git a/Documentation/networking/spider_net.txt b/Documentation/networking/device_drivers/toshiba/spider_net.txt
similarity index 100%
rename from Documentation/networking/spider_net.txt
rename to Documentation/networking/device_drivers/toshiba/spider_net.txt
diff --git a/MAINTAINERS b/MAINTAINERS
index fb88b6863d10..6db870b9d681 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -140,7 +140,7 @@ Maintainers List (try to look for most precise areas first)
 M:	Steffen Klassert <klassert@kernel.org>
 L:	netdev@vger.kernel.org
 S:	Odd Fixes
-F:	Documentation/networking/vortex.txt
+F:	Documentation/networking/device_drivers/3com/vortex.txt
 F:	drivers/net/ethernet/3com/3c59x.c
 
 3CR990 NETWORK DRIVER
@@ -740,7 +740,7 @@ R:	Saeed Bishara <saeedb@amazon.com>
 R:	Zorik Machulsky <zorik@amazon.com>
 L:	netdev@vger.kernel.org
 S:	Supported
-F:	Documentation/networking/ena.txt
+F:	Documentation/networking/device_drivers/amazon/ena.txt
 F:	drivers/net/ethernet/amazon/
 
 AMD CRYPTOGRAPHIC COPROCESSOR (CCP) DRIVER
@@ -4187,7 +4187,7 @@ F:	net/ax25/sysctl_net_ax25.c
 DAVICOM FAST ETHERNET (DMFE) NETWORK DRIVER
 L:	netdev@vger.kernel.org
 S:	Orphan
-F:	Documentation/networking/dmfe.txt
+F:	Documentation/networking/device_drivers/dec/dmfe.txt
 F:	drivers/net/ethernet/dec/tulip/dmfe.c
 
 DC390/AM53C974 SCSI driver
@@ -6899,7 +6899,7 @@ M:	Haiyang Zhang <haiyangz@microsoft.com>
 M:	Stephen Hemminger <sthemmin@microsoft.com>
 L:	devel@linuxdriverproject.org
 S:	Maintained
-F:	Documentation/networking/netvsc.txt
+F:	Documentation/networking/device_drivers/microsoft/netvsc.txt
 F:	arch/x86/include/asm/mshyperv.h
 F:	arch/x86/include/asm/trace/hyperv.h
 F:	arch/x86/include/asm/hyperv-tlfs.h
@@ -7483,18 +7483,18 @@ Q:	http://patchwork.ozlabs.org/project/intel-wired-lan/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue.git
 S:	Supported
-F:	Documentation/networking/e100.rst
-F:	Documentation/networking/e1000.rst
-F:	Documentation/networking/e1000e.rst
-F:	Documentation/networking/fm10k.rst
-F:	Documentation/networking/igb.rst
-F:	Documentation/networking/igbvf.rst
-F:	Documentation/networking/ixgb.rst
-F:	Documentation/networking/ixgbe.rst
-F:	Documentation/networking/ixgbevf.rst
-F:	Documentation/networking/i40e.rst
-F:	Documentation/networking/iavf.rst
-F:	Documentation/networking/ice.rst
+F:	Documentation/networking/device_drivers/intel/e100.rst
+F:	Documentation/networking/device_drivers/intel/e1000.rst
+F:	Documentation/networking/device_drivers/intel/e1000e.rst
+F:	Documentation/networking/device_drivers/intel/fm10k.rst
+F:	Documentation/networking/device_drivers/intel/igb.rst
+F:	Documentation/networking/device_drivers/intel/igbvf.rst
+F:	Documentation/networking/device_drivers/intel/ixgb.rst
+F:	Documentation/networking/device_drivers/intel/ixgbe.rst
+F:	Documentation/networking/device_drivers/intel/ixgbevf.rst
+F:	Documentation/networking/device_drivers/intel/i40e.rst
+F:	Documentation/networking/device_drivers/intel/iavf.rst
+F:	Documentation/networking/device_drivers/intel/ice.rst
 F:	drivers/net/ethernet/intel/
 F:	drivers/net/ethernet/intel/*/
 F:	include/linux/avf/virtchnl.h
@@ -7668,8 +7668,8 @@ INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
 M:	Stanislav Yakovlev <stas.yakovlev@gmail.com>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
-F:	Documentation/networking/README.ipw2100
-F:	Documentation/networking/README.ipw2200
+F:	Documentation/networking/device_drivers/intel/ipw2100.txt
+F:	Documentation/networking/device_drivers/intel/ipw2200.txt
 F:	drivers/net/wireless/intel/ipw2x00/
 
 INTEL PSTATE DRIVER
@@ -10315,8 +10315,8 @@ NETERION 10GbE DRIVERS (s2io/vxge)
 M:	Jon Mason <jdmason@kudzu.us>
 L:	netdev@vger.kernel.org
 S:	Supported
-F:	Documentation/networking/s2io.txt
-F:	Documentation/networking/vxge.txt
+F:	Documentation/networking/device_drivers/neterion/s2io.txt
+F:	Documentation/networking/device_drivers/neterion/vxge.txt
 F:	drivers/net/ethernet/neterion/
 
 NETFILTER
@@ -12325,7 +12325,7 @@ QLOGIC QLA3XXX NETWORK DRIVER
 M:	Dept-GELinuxNICDev@cavium.com
 L:	netdev@vger.kernel.org
 S:	Supported
-F:	Documentation/networking/LICENSE.qla3xxx
+F:	Documentation/networking/device_drivers/qlogic/LICENSE.qla3xxx
 F:	drivers/net/ethernet/qlogic/qla3xxx.*
 
 QLOGIC QLA4XXX iSCSI DRIVER
@@ -12377,7 +12377,7 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/bus/fsl-mc/
 F:	Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
-F:	Documentation/networking/dpaa2/overview.rst
+F:	Documentation/networking/device_drivers/freescale/dpaa2/overview.rst
 
 QT1010 MEDIA DRIVER
 M:	Antti Palosaari <crope@iki.fi>
@@ -14109,7 +14109,7 @@ SPIDERNET NETWORK DRIVER for CELL
 M:	Ishizaki Kou <kou.ishizaki@toshiba.co.jp>
 L:	netdev@vger.kernel.org
 S:	Supported
-F:	Documentation/networking/spider_net.txt
+F:	Documentation/networking/device_drivers/toshiba/spider_net.txt
 F:	drivers/net/ethernet/toshiba/spider_net*
 
 SPMI SUBSYSTEM
@@ -15099,7 +15099,7 @@ M:	Samuel Chessman <chessman@tux.org>
 L:	tlan-devel@lists.sourceforge.net (subscribers-only)
 W:	http://sourceforge.net/projects/tlan/
 S:	Maintained
-F:	Documentation/networking/tlan.txt
+F:	Documentation/networking/device_drivers/ti/tlan.txt
 F:	drivers/net/ethernet/ti/tlan.*
 
 TM6000 VIDEO4LINUX DRIVER
diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index d03775100f7d..6371958dd170 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -397,10 +397,10 @@ config NET_SB1000
 
 	  At present this driver only compiles as a module, so say M here if
 	  you have this card. The module will be called sb1000. Then read
-	  <file:Documentation/networking/README.sb1000> for information on how
-	  to use this module, as it needs special ppp scripts for establishing
-	  a connection. Further documentation and the necessary scripts can be
-	  found at:
+	  <file:Documentation/networking/device_drivers/sb1000.txt> for
+	  information on how to use this module, as it needs special ppp
+	  scripts for establishing a connection. Further documentation
+	  and the necessary scripts can be found at:
 
 	  <http://www.jacksonville.net/~fventuri/>
 	  <http://home.adelphia.net/~siglercm/sb1000.html>
diff --git a/drivers/net/ethernet/3com/3c59x.c b/drivers/net/ethernet/3com/3c59x.c
index 5bc168314ea2..40f421dbdf57 100644
--- a/drivers/net/ethernet/3com/3c59x.c
+++ b/drivers/net/ethernet/3com/3c59x.c
@@ -1151,7 +1151,7 @@ static int vortex_probe1(struct device *gendev, void __iomem *ioaddr, int irq,
 
 	print_info = (vortex_debug > 1);
 	if (print_info)
-		pr_info("See Documentation/networking/vortex.txt\n");
+		pr_info("See Documentation/networking/device_drivers/3com/vortex.txt\n");
 
 	pr_info("%s: 3Com %s %s at %p.\n",
 	       print_name,
@@ -1956,7 +1956,7 @@ vortex_error(struct net_device *dev, int status)
 				   dev->name, tx_status);
 			if (tx_status == 0x82) {
 				pr_err("Probably a duplex mismatch.  See "
-						"Documentation/networking/vortex.txt\n");
+						"Documentation/networking/device_drivers/3com/vortex.txt\n");
 			}
 			dump_tx_ring(dev);
 		}
diff --git a/drivers/net/ethernet/3com/Kconfig b/drivers/net/ethernet/3com/Kconfig
index 5c3ef9fc8207..0ac44ef1f7a9 100644
--- a/drivers/net/ethernet/3com/Kconfig
+++ b/drivers/net/ethernet/3com/Kconfig
@@ -75,8 +75,9 @@ config VORTEX
 	  "Hurricane" (3c555/3cSOHO)                           PCI
 
 	  If you have such a card, say Y here.  More specific information is in
-	  <file:Documentation/networking/vortex.txt> and in the comments at
-	  the beginning of <file:drivers/net/ethernet/3com/3c59x.c>.
+	  <file:Documentation/networking/device_drivers/3com/vortex.txt> and
+	  in the comments at the beginning of
+	  <file:drivers/net/ethernet/3com/3c59x.c>.
 
 	  To compile this support as a module, choose M here.
 
diff --git a/drivers/net/ethernet/chelsio/Kconfig b/drivers/net/ethernet/chelsio/Kconfig
index e2cdfa75673f..e8001e974411 100644
--- a/drivers/net/ethernet/chelsio/Kconfig
+++ b/drivers/net/ethernet/chelsio/Kconfig
@@ -24,7 +24,8 @@ config CHELSIO_T1
 	---help---
 	  This driver supports Chelsio gigabit and 10-gigabit
 	  Ethernet cards. More information about adapter features and
-	  performance tuning is in <file:Documentation/networking/cxgb.txt>.
+	  performance tuning is in
+	  <file:Documentation/networking/device_drivers/chelsio/cxgb.txt>.
 
 	  For general information about Chelsio and our products, visit
 	  our website at <http://www.chelsio.com>.
diff --git a/drivers/net/ethernet/cirrus/Kconfig b/drivers/net/ethernet/cirrus/Kconfig
index ec0b545197e2..e9a0213b08c4 100644
--- a/drivers/net/ethernet/cirrus/Kconfig
+++ b/drivers/net/ethernet/cirrus/Kconfig
@@ -23,7 +23,7 @@ config CS89x0
 	---help---
 	  Support for CS89x0 chipset based Ethernet cards. If you have a
 	  network (Ethernet) card of this type, say Y and read the file
-	  <file:Documentation/networking/cs89x0.txt>.
+	  <file:Documentation/networking/device_drivers/cirrus/cs89x0.txt>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called cs89x0.
diff --git a/drivers/net/ethernet/dec/tulip/Kconfig b/drivers/net/ethernet/dec/tulip/Kconfig
index 1003201b5d80..264e9b413e94 100644
--- a/drivers/net/ethernet/dec/tulip/Kconfig
+++ b/drivers/net/ethernet/dec/tulip/Kconfig
@@ -113,7 +113,7 @@ config DE4X5
 	  These include the DE425, DE434, DE435, DE450 and DE500 models.  If
 	  you have a network card of this type, say Y.  More specific
 	  information is contained in
-	  <file:Documentation/networking/de4x5.txt>.
+	  <file:Documentation/networking/device_drivers/dec/de4x5.txt>.
 
 	  To compile this driver as a module, choose M here. The module will
 	  be called de4x5.
@@ -137,7 +137,7 @@ config DM9102
 	  This driver is for DM9102(A)/DM9132/DM9801 compatible PCI cards from
 	  Davicom (<http://www.davicom.com.tw/>).  If you have such a network
 	  (Ethernet) card, say Y.  Some information is contained in the file
-	  <file:Documentation/networking/dmfe.txt>.
+	  <file:Documentation/networking/device_drivers/dec/dmfe.txt>.
 
 	  To compile this driver as a module, choose M here. The module will
 	  be called dmfe.
diff --git a/drivers/net/ethernet/dlink/dl2k.c b/drivers/net/ethernet/dlink/dl2k.c
index f0536b16b3c3..d8d423f22c4f 100644
--- a/drivers/net/ethernet/dlink/dl2k.c
+++ b/drivers/net/ethernet/dlink/dl2k.c
@@ -1881,7 +1881,7 @@ Compile command:
 
 gcc -D__KERNEL__ -DMODULE -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -c dl2k.c
 
-Read Documentation/networking/dl2k.txt for details.
+Read Documentation/networking/device_drivers/dlink/dl2k.txt for details.
 
 */
 
diff --git a/drivers/net/ethernet/intel/Kconfig b/drivers/net/ethernet/intel/Kconfig
index 59e1bc0f609e..f05c91d4c469 100644
--- a/drivers/net/ethernet/intel/Kconfig
+++ b/drivers/net/ethernet/intel/Kconfig
@@ -33,7 +33,7 @@ config E100
 	  to identify the adapter.
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/e100.rst>.
+	  <file:Documentation/networking/device_drivers/intel/e100.rst>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called e100.
@@ -49,7 +49,7 @@ config E1000
 	  <http://support.intel.com>
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/e1000.rst>.
+	  <file:Documentation/networking/device_drivers/intel/e1000.rst>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called e1000.
@@ -69,7 +69,7 @@ config E1000E
 	  <http://support.intel.com>
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/e1000e.rst>.
+	  <file:Documentation/networking/device_drivers/intel/e1000e.rst>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called e1000e.
@@ -97,7 +97,7 @@ config IGB
 	  <http://support.intel.com>
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/igb.rst>.
+	  <file:Documentation/networking/device_drivers/intel/igb.rst>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called igb.
@@ -133,7 +133,7 @@ config IGBVF
 	  <http://support.intel.com>
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/igbvf.rst>.
+	  <file:Documentation/networking/device_drivers/intel/igbvf.rst>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called igbvf.
@@ -150,7 +150,7 @@ config IXGB
 	  <http://support.intel.com>
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/ixgb.rst>.
+	  <file:Documentation/networking/device_drivers/intel/ixgb.rst>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called ixgb.
@@ -168,7 +168,7 @@ config IXGBE
 	  <http://support.intel.com>
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/ixgbe.rst>.
+	  <file:Documentation/networking/device_drivers/intel/ixgbe.rst>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called ixgbe.
@@ -220,7 +220,7 @@ config IXGBEVF
 	  <http://support.intel.com>
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/ixgbevf.rst>.
+	  <file:Documentation/networking/device_drivers/intel/ixgbevf.rst>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called ixgbevf.  MSI-X interrupt support is required
@@ -247,7 +247,7 @@ config I40E
 	  <http://support.intel.com>
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/i40e.rst>.
+	  <file:Documentation/networking/device_drivers/intel/i40e.rst>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called i40e.
@@ -282,7 +282,7 @@ config I40EVF
 	  This driver was formerly named i40evf.
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/iavf.rst>.
+	  <file:Documentation/networking/device_drivers/intel/iavf.rst>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called iavf.  MSI-X interrupt support is required
@@ -300,7 +300,7 @@ config ICE
 	  <http://support.intel.com>
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/ice.rst>.
+	  <file:Documentation/networking/device_drivers/intel/ice.rst>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called ice.
@@ -318,7 +318,7 @@ config FM10K
 	  <http://support.intel.com>
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/fm10k.rst>.
+	  <file:Documentation/networking/device_drivers/intel/fm10k.rst>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called fm10k.  MSI-X interrupt support is required
diff --git a/drivers/net/ethernet/neterion/Kconfig b/drivers/net/ethernet/neterion/Kconfig
index c26e0f70c494..7df20561e3fa 100644
--- a/drivers/net/ethernet/neterion/Kconfig
+++ b/drivers/net/ethernet/neterion/Kconfig
@@ -26,7 +26,7 @@ config S2IO
 	  on its age.
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/s2io.txt>.
+	  <file:Documentation/networking/device_drivers/neterion/s2io.txt>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called s2io.
@@ -41,7 +41,7 @@ config VXGE
 	  labeled as either one, depending on its age.
 
 	  More specific information on configuring the driver is in
-	  <file:Documentation/networking/vxge.txt>.
+	  <file:Documentation/networking/device_drivers/neterion/vxge.txt>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called vxge.
diff --git a/drivers/net/ethernet/smsc/Kconfig b/drivers/net/ethernet/smsc/Kconfig
index 358820282ef0..79612060d0ba 100644
--- a/drivers/net/ethernet/smsc/Kconfig
+++ b/drivers/net/ethernet/smsc/Kconfig
@@ -27,7 +27,7 @@ config SMC9194
 	  option if you have a DELL laptop with the docking station, or
 	  another SMC9192/9194 based chipset.  Say Y if you want it compiled
 	  into the kernel, and read the file
-	  <file:Documentation/networking/smc9.txt>.
+	  <file:Documentation/networking/device_drivers/smsc/smc9.txt>.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called smc9194.
@@ -43,7 +43,7 @@ config SMC91X
 	  This is a driver for SMC's 91x series of Ethernet chipsets,
 	  including the SMC91C94 and the SMC91C111. Say Y if you want it
 	  compiled into the kernel, and read the file
-	  <file:Documentation/networking/smc9.txt>.
+	  <file:Documentation/networking/device_drivers/smsc/smc9.txt>.
 
 	  This driver is also available as a module ( = code which can be
 	  inserted in and removed from the running kernel whenever you want).
diff --git a/drivers/net/ethernet/ti/Kconfig b/drivers/net/ethernet/ti/Kconfig
index f932923f7d56..bb126be1eb72 100644
--- a/drivers/net/ethernet/ti/Kconfig
+++ b/drivers/net/ethernet/ti/Kconfig
@@ -121,7 +121,8 @@ config TLAN
 
 	  Devices currently supported by this driver are Compaq Netelligent,
 	  Compaq NetFlex and Olicom cards.  Please read the file
-	  <file:Documentation/networking/tlan.txt> for more details.
+	  <file:Documentation/networking/device_drivers/ti/tlan.txt>
+	  for more details.
 
 	  To compile this driver as a module, choose M here. The module
 	  will be called tlan.
diff --git a/drivers/net/ethernet/ti/tlan.c b/drivers/net/ethernet/ti/tlan.c
index 93d142867c2a..b4ab1a5f6cd0 100644
--- a/drivers/net/ethernet/ti/tlan.c
+++ b/drivers/net/ethernet/ti/tlan.c
@@ -69,7 +69,9 @@ MODULE_AUTHOR("Maintainer: Samuel Chessman <chessman@tux.org>");
 MODULE_DESCRIPTION("Driver for TI ThunderLAN based ethernet PCI adapters");
 MODULE_LICENSE("GPL");
 
-/* Turn on debugging. See Documentation/networking/tlan.txt for details */
+/* Turn on debugging.
+ * See Documentation/networking/device_drivers/ti/tlan.txt for details
+ */
 static  int		debug;
 module_param(debug, int, 0);
 MODULE_PARM_DESC(debug, "ThunderLAN debug mask");
diff --git a/drivers/net/wireless/intel/ipw2x00/Kconfig b/drivers/net/wireless/intel/ipw2x00/Kconfig
index d6ec44d7a391..562395517e6c 100644
--- a/drivers/net/wireless/intel/ipw2x00/Kconfig
+++ b/drivers/net/wireless/intel/ipw2x00/Kconfig
@@ -15,9 +15,9 @@ config IPW2100
           A driver for the Intel PRO/Wireless 2100 Network 
 	  Connection 802.11b wireless network adapter.
 
-          See <file:Documentation/networking/README.ipw2100> for information on
-          the capabilities currently enabled in this driver and for tips
-          for debugging issues and problems.
+          See <file:Documentation/networking/device_drivers/intel/ipw2100.txt>
+	  for information on the capabilities currently enabled in this driver
+	  and for tips for debugging issues and problems.
 
 	  In order to use this driver, you will need a firmware image for it.
           You can obtain the firmware from
@@ -77,8 +77,8 @@ config IPW2200
           A driver for the Intel PRO/Wireless 2200BG and 2915ABG Network
 	  Connection adapters. 
 
-          See <file:Documentation/networking/README.ipw2200> for 
-	  information on the capabilities currently enabled in this 
+          See <file:Documentation/networking/device_drivers/intel/ipw2200.txt>
+	  for information on the capabilities currently enabled in this
 	  driver and for tips for debugging issues and problems.
 
 	  In order to use this driver, you will need a firmware image for it.
diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2100.c b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
index 910db46db6a1..6e31687a9c94 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2100.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
@@ -8370,7 +8370,7 @@ static int ipw2100_mod_firmware_load(struct ipw2100_fw *fw)
 	if (IPW2100_FW_MAJOR(h->version) != IPW2100_FW_MAJOR_VERSION) {
 		printk(KERN_WARNING DRV_NAME ": Firmware image not compatible "
 		       "(detected version id of %u). "
-		       "See Documentation/networking/README.ipw2100\n",
+		       "See Documentation/networking/device_drivers/intel/ipw2100.txt\n",
 		       h->version);
 		return 1;
 	}
-- 
2.17.1

