Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED73C48BE8
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 20:17:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C526661246
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 20:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235542AbhFNUTj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Jun 2021 16:19:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30074 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234935AbhFNUTg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jun 2021 16:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623701853;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=48bjdR1NLAI+LnEF7dKeko2J72GoFENKIfUW9/6F9Ro=;
        b=bUfdAMThepvNsl09F6Crkj1e+dNyhcVGg7P8RfQJF+S+n3sRZyYUi6AqIBnbZMnoeX5/jl
        sPsUpeQkZ6DgbnqgCucxP3QwFPZkn3zXkI8zlkKYe8UEDW/QYmA3cvXIS8IIJZ3UqLtvSB
        eMQKRjayOtu/MVnA+nNi81kCSkKI22g=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-cUcD1-K6MWmdOfE8lpXAMQ-1; Mon, 14 Jun 2021 16:17:32 -0400
X-MC-Unique: cUcD1-K6MWmdOfE8lpXAMQ-1
Received: by mail-ot1-f70.google.com with SMTP id e28-20020a9d491c0000b02903daf90867beso7963060otf.11
        for <linux-doc@vger.kernel.org>; Mon, 14 Jun 2021 13:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=48bjdR1NLAI+LnEF7dKeko2J72GoFENKIfUW9/6F9Ro=;
        b=gLm7tslpo7tbYS0BrzRl0KPHdAN0OlAx6iFuVMcNwInuJNlAio4z9YpHMWJMUqfCO4
         sM/A1jlTgzI76/gSz3QW0xi33UPunbpymuNJ2+DP4WmRVslTkqUyb56J8kNHv8xaui6a
         7LlZwWl8tUuIxtEI7nkCCqTGc7zyPGVkGR6377m1rJ8ZSbEU6gJnt1CzHe/hidyqqvpQ
         JZNytT9AS66I/w9j4Gn/CfDRMTVTxW6DH3wM+jUmT7zR5kTGaQL+5Ktv285Lpy5TP+wB
         p3aBg9P16hTDfk+whxxL7Qihjjswz0HGR4YyZ8ZfnvY3Ba5RTNVB5latTCSmUZBfbrfw
         89Mg==
X-Gm-Message-State: AOAM531P9d9LW+7Y99kGfO1iz7JYqBUACrUQnQoQwtk4viOqvvk2Jx2d
        HjjjmKukIg1DsCKbbVMb0T/ruB8OyugcET6aL2i9l8OAs2xn/tBZJ8l6QOM3dtPgFZGtGMIg66+
        tq2RN9ved7dgbuIkP/e5f
X-Received: by 2002:a05:6830:2476:: with SMTP id x54mr14958026otr.293.1623701849598;
        Mon, 14 Jun 2021 13:17:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0XFjy3LT1wiB4YYU/Lhzpn8Z5S2BIhQmLh52HqgpzLeC6Pr2Erm4I2ORjMhxDIxuNaaqUXQ==
X-Received: by 2002:a05:6830:2476:: with SMTP id x54mr14958004otr.293.1623701849345;
        Mon, 14 Jun 2021 13:17:29 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b198sm408535oii.19.2021.06.14.13.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 13:17:29 -0700 (PDT)
From:   trix@redhat.com
To:     hao.wu@intel.com, mdf@kernel.org, corbet@lwn.net,
        michal.simek@xilinx.com, gregkh@linuxfoundation.org,
        krzysztof.kozlowski@canonical.com, nava.manne@xilinx.com,
        yilun.xu@intel.com, davidgow@google.com, fpacheco@redhat.com,
        richard.gong@intel.com, luca@lucaceresoli.net
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH v4 4/4] fpga: lattice: reorganize to subdir layout
Date:   Mon, 14 Jun 2021 13:16:48 -0700
Message-Id: <20210614201648.3358206-6-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210614201648.3358206-1-trix@redhat.com>
References: <20210614201648.3358206-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

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

This is the lattice/ subdir part.

Create a lattice/ subdir
Move ice40* and machxo2* files to it.
Add a Kconfig and Makefile

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/Kconfig                     | 14 +-----------
 drivers/fpga/Makefile                    | 13 ++++-------
 drivers/fpga/lattice/Kconfig             | 29 ++++++++++++++++++++++++
 drivers/fpga/lattice/Makefile            |  4 ++++
 drivers/fpga/{ => lattice}/ice40-spi.c   |  0
 drivers/fpga/{ => lattice}/machxo2-spi.c |  0
 6 files changed, 39 insertions(+), 21 deletions(-)
 create mode 100644 drivers/fpga/lattice/Kconfig
 create mode 100644 drivers/fpga/lattice/Makefile
 rename drivers/fpga/{ => lattice}/ice40-spi.c (100%)
 rename drivers/fpga/{ => lattice}/machxo2-spi.c (100%)

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index 2c829b1105925..955b155da3575 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -12,19 +12,6 @@ menuconfig FPGA
 
 if FPGA
 
-config FPGA_MGR_ICE40_SPI
-	tristate "Lattice iCE40 SPI"
-	depends on OF && SPI
-	help
-	  FPGA manager driver support for Lattice iCE40 FPGAs over SPI.
-
-config FPGA_MGR_MACHXO2_SPI
-	tristate "Lattice MachXO2 SPI"
-	depends on SPI
-	help
-	  FPGA manager driver support for Lattice MachXO2 configuration
-	  over slave SPI interface.
-
 config FPGA_BRIDGE
 	tristate "FPGA Bridge Framework"
 	help
@@ -48,6 +35,7 @@ config OF_FPGA_REGION
 
 source "drivers/fpga/altera/Kconfig"
 source "drivers/fpga/dfl/Kconfig"
+source "drivers/fpga/lattice/Kconfig"
 source "drivers/fpga/xilinx/Kconfig"
 
 endif # FPGA
diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
index db83aeb997f24..9197698201e3a 100644
--- a/drivers/fpga/Makefile
+++ b/drivers/fpga/Makefile
@@ -4,19 +4,16 @@
 #
 
 # Core FPGA Manager Framework
-obj-$(CONFIG_FPGA)			+= fpga-mgr.o
-
-# FPGA Manager Drivers
-obj-$(CONFIG_FPGA_MGR_ICE40_SPI)	+= ice40-spi.o
-obj-$(CONFIG_FPGA_MGR_MACHXO2_SPI)	+= machxo2-spi.o
+obj-$(CONFIG_FPGA) += fpga-mgr.o
 
 # FPGA Bridge Drivers
-obj-$(CONFIG_FPGA_BRIDGE)		+= fpga-bridge.o
+obj-$(CONFIG_FPGA_BRIDGE) += fpga-bridge.o
 
 # High Level Interfaces
-obj-$(CONFIG_FPGA_REGION)		+= fpga-region.o
-obj-$(CONFIG_OF_FPGA_REGION)		+= of-fpga-region.o
+obj-$(CONFIG_FPGA_REGION) += fpga-region.o
+obj-$(CONFIG_OF_FPGA_REGION) += of-fpga-region.o
 
 obj-$(CONFIG_FPGA_ALTERA) += altera/
 obj-$(CONFIG_FPGA_DFL) += dfl/
+obj-$(CONFIG_FPGA_LATTICE) += lattice/
 obj-$(CONFIG_FPGA_XILINX) += xilinx/
diff --git a/drivers/fpga/lattice/Kconfig b/drivers/fpga/lattice/Kconfig
new file mode 100644
index 0000000000000..6c2f1ae17e4f6
--- /dev/null
+++ b/drivers/fpga/lattice/Kconfig
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config FPGA_LATTICE
+	bool "Lattice FPGAs"
+	default y
+	help
+	  If you have a lattice fpga, say Y.
+
+	  Note that the answer to this question doesn't directly affect the
+	  kernel: saying N will just cause the configurator to skip all
+	  the questions about lattice fpgas. If you say Y, you will be asked
+	  for your specific device in the following questions.
+
+if FPGA_LATTICE
+
+config FPGA_MGR_ICE40_SPI
+	tristate "Lattice iCE40 SPI"
+	depends on OF && SPI
+	help
+	  FPGA manager driver support for Lattice iCE40 FPGAs over SPI.
+
+config FPGA_MGR_MACHXO2_SPI
+	tristate "Lattice MachXO2 SPI"
+	depends on SPI
+	help
+	  FPGA manager driver support for Lattice MachXO2 configuration
+	  over slave SPI interface.
+
+endif #FPGA_LATTICE
diff --git a/drivers/fpga/lattice/Makefile b/drivers/fpga/lattice/Makefile
new file mode 100644
index 0000000000000..f542c96a73d40
--- /dev/null
+++ b/drivers/fpga/lattice/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_FPGA_MGR_ICE40_SPI) += ice40-spi.o
+obj-$(CONFIG_FPGA_MGR_MACHXO2_SPI) += machxo2-spi.o
diff --git a/drivers/fpga/ice40-spi.c b/drivers/fpga/lattice/ice40-spi.c
similarity index 100%
rename from drivers/fpga/ice40-spi.c
rename to drivers/fpga/lattice/ice40-spi.c
diff --git a/drivers/fpga/machxo2-spi.c b/drivers/fpga/lattice/machxo2-spi.c
similarity index 100%
rename from drivers/fpga/machxo2-spi.c
rename to drivers/fpga/lattice/machxo2-spi.c
-- 
2.26.3

