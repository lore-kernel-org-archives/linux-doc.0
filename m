Return-Path: <SRS0=QMax=AL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B575C433DF
	for <linux-doc@archiver.kernel.org>; Tue, 30 Jun 2020 18:50:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6836720775
	for <linux-doc@archiver.kernel.org>; Tue, 30 Jun 2020 18:50:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DkOSO0+z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgF3SuE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Jun 2020 14:50:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25293 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726093AbgF3SuD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jun 2020 14:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593543001;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=ILNVKniPuWCOaWJSWnYpx92u7nfQ4dnGhDKgu/Th5Fo=;
        b=DkOSO0+zdLoaIzqnP35bIgprRZ0Cbv7T5ACVP3rcmZnL0BEHuLyKLedIXaqM7WkFJ+Pcix
        gLmAqXJ1xZQ0tXJhHwUUt2yKAEMOitdoXwMYNDmcu+2Dx5bkvzBHC0yOAfvI9wlfaQ/hDL
        ojsjbGTXL0zLWuyo3y1RpzQVS248wbk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-YRwN2pPoN3Gq8ZFNek3hgA-1; Tue, 30 Jun 2020 14:50:00 -0400
X-MC-Unique: YRwN2pPoN3Gq8ZFNek3hgA-1
Received: by mail-qk1-f199.google.com with SMTP id w27so15306659qkw.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2020 11:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ILNVKniPuWCOaWJSWnYpx92u7nfQ4dnGhDKgu/Th5Fo=;
        b=QLABP/2r8gtUE5cBPvkUYHPhZGeuktMWwH0f/E1uAawm1KbrCpSdToL0EoYn/BumtX
         IHw4pn0XWge+sKUk30t7zTy9uHeC8GZI7lGDvX0R+R8NYrJSlnfz42eJNyhFuuhs0O5L
         3IIOWaflppZOU5pzc8846zFi5risB4x1Vw4m27ho+2sFriFS7x6IWLIO7oRDdNz0ByUg
         oAgWFidxchwfFuYeSZryNBG/PN2oLJ1SXPW6KSYBfCWoM/f/b3ll1JHA+NNf6Abtz046
         A+srYMDOhEGC0ZTWEut4+osYbo9rJKX3oVoDcYrZ4Z4J0BXgopJvd2Uhbqyc6VepUFQd
         QJ9A==
X-Gm-Message-State: AOAM530ZkObkkbfP2ZyyVCTEExfWZ1MZwteYYbxwR/c/K3WUV77lF2XD
        wqmDqXUc0vt8pk4DjQT9FABqkxWve3jDqpE/WJFK8gN/SXAa6rSPz36HHjUrqbJO3lXB2+46/am
        SvStxBilvEDd7F69Ug9Cp
X-Received: by 2002:ac8:774d:: with SMTP id g13mr21842268qtu.317.1593542999897;
        Tue, 30 Jun 2020 11:49:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOfMipnw5vbBXdCY5Q+BjXTkajzbWmU1TAYr4mNpQfWkuqZDJBk6gfVOWRsXKjiG1BhXvUJQ==
X-Received: by 2002:ac8:774d:: with SMTP id g13mr21842251qtu.317.1593542999620;
        Tue, 30 Jun 2020 11:49:59 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b10sm3410280qkh.124.2020.06.30.11.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 11:49:59 -0700 (PDT)
From:   trix@redhat.com
To:     hao.wu@intel.com, mdf@kernel.org, corbet@lwn.net
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [RFC v2] fpga: dfl: RFC PCI config
Date:   Tue, 30 Jun 2020 11:49:50 -0700
Message-Id: <20200630184950.950-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Create some top level configs the map to dfl pci cards.

Autoselect the parts of fpga that are needed to run these cards
as well as the defining the other subsystem dependencies.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 v1 change subsystem selects to depends

 Documentation/fpga/dfl.rst | 30 ++++++++++++++++++++++++++++++
 drivers/fpga/Kconfig       | 27 +++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/Documentation/fpga/dfl.rst b/Documentation/fpga/dfl.rst
index d7648d7c7eee..c1ae6b539f08 100644
--- a/Documentation/fpga/dfl.rst
+++ b/Documentation/fpga/dfl.rst
@@ -500,6 +500,36 @@ Developer only needs to provide a sub feature driver with matched feature id.
 FME Partial Reconfiguration Sub Feature driver (see drivers/fpga/dfl-fme-pr.c)
 could be a reference.
 
+Kernel configuration
+====================
+
+While it is possible to manually setup a configuration to match your device,
+there are some top level configurations that collect configurations for
+some reference PCI cards.  Below describes these configuration as well as
+what other kernel configs are needed for proper configuration.
+
+FPGA_DFL_PAC10
+Intel Arria 10 GX PCI card, PCI id 0X09C4
+Depends on
+  SPI_ALTERA
+  MFD_INTEL_M10_BMC
+  SENSORS_INTEL_M10_BMC_HWMON
+
+FPGA_DFL_D5005
+Intel Stratix 10, D5005 PCI card, PCI id 0X0B2B
+Depends on
+  SPI_ALTERA
+  MFD_INTEL_M10_BMC
+  SENSORS_INTEL_M10_BMC_HWMON
+  INTEL_S10_PHY
+
+FPGA_DFL_N3000
+Intel Network Accelerator, N3000 PCI card, PCI id 0X0B30
+Depends on
+  SPI_ALTERA
+  MFD_INTEL_M10_BMC
+  SENSORS_INTEL_M10_BMC_HWMON
+  INTEL_LL_10G_MAC
 
 Open discussion
 ===============
diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index 9d53bd9094e2..96603b1f6ff5 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -138,6 +138,33 @@ config OF_FPGA_REGION
 	  Support for loading FPGA images by applying a Device Tree
 	  overlay.
 
+config FPGA_DFL_PAC10
+	tristate "Intel Arria 10 GX PCI card"
+	depends on SPI_ALTERA
+	depends on SENSORS_INTEL_M10_BMC_HWMON
+	depends on MFD_INTEL_M10_BMC
+	select FPGA_DFL
+	select FPGA_DFL_FME
+	select FPGA_DFL_FME_MGR
+	select FPGA_DFL_FME_BRIDGE
+	select FPGA_DFL_FME_REGION
+	select FPGA_DFL_AFU
+	select FPGA_DFL_SPI_ALTERA
+	select FPGA_DFL_PCI
+	select IFPGA_SEC_MGR
+
+config FPGA_DFL_D5005
+	tristate "Intel Stratix 10, D5005 PCI card"
+	depends on INTEL_S10_PHY
+	select FPGA_DFL_PAC10
+	select FPGA_DFl_HSSI
+
+config FPGA_DFL_N3000
+	tristate "Intel Network Accelerator, N3000 PCI card"
+	depends on INTEL_LL_10G_MAC
+	select FPGA_DFL_PAC10
+	select FPGA_DFL_N3000_NIOS
+
 config FPGA_DFL
 	tristate "FPGA Device Feature List (DFL) support"
 	select FPGA_BRIDGE
-- 
2.18.1

