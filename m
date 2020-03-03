Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE353C3F2C6
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D62521775
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583243969;
	bh=bdcJ+Ia5nU6Q4Dhm2/DbJN4T+d17Lx3aljbJPKHh9AY=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=duEr7b9yVMsFlpdKcdJvFd8McXrd46FeGLRYCDwem0ZO2aR+Z/F1qUd6Y81hQegiu
	 e57J/hat+eOVV8KdgdQt6Rv83X4Fv2zJ00HRy3NMY5BOO/sgCEJcAk7vKstz7LSFJk
	 gBReHaT37N+Ua9nazSdiw97L0AVMz0c91lv87ISE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728594AbgCCN73 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 08:59:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:45320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728037AbgCCN73 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 08:59:29 -0500
Received: from mail.kernel.org (ip-109-40-2-133.web.vodafone.de [109.40.2.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62DFC20857;
        Tue,  3 Mar 2020 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583243968;
        bh=bdcJ+Ia5nU6Q4Dhm2/DbJN4T+d17Lx3aljbJPKHh9AY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ul5CuBLzmBz1vL7zmwBDk+0lNoOLvcPV9i4ooYJtNkOLxFZSgEE9oZ43CH729s+I3
         pF6zR4CFvjOD8zQPWJjhBTACeIFmXhlTH2zY8CLZ1ouVq9SQ6TYhCg1U7D1SVaMevg
         sgFOowJt1bnjmyCqLvz7PpexhGg2xdKlVnl9cK60=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j9850-001YdI-9O; Tue, 03 Mar 2020 14:59:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 06/18] docs: misc-devices/spear-pcie-gadget.txt: convert to ReST
Date:   Tue,  3 Mar 2020 14:59:13 +0100
Message-Id: <7dac36aff4e306f1fc016bb0fdf86e5e4255b83a.1583243826.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583243826.git.mchehab+huawei@kernel.org>
References: <cover.1583243826.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Use title/chapter markups;
- Use table markups;
- Mark literal blocks as such;
- Adjust indentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/misc-devices/index.rst          |   1 +
 .../misc-devices/spear-pcie-gadget.rst        | 170 ++++++++++++++++++
 .../misc-devices/spear-pcie-gadget.txt        | 130 --------------
 3 files changed, 171 insertions(+), 130 deletions(-)
 create mode 100644 Documentation/misc-devices/spear-pcie-gadget.rst
 delete mode 100644 Documentation/misc-devices/spear-pcie-gadget.txt

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index f11c5daeada5..2d454b413aef 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -20,4 +20,5 @@ fit into other categories.
    isl29003
    lis3lv02d
    max6875
+   spear-pcie-gadget
    xilinx_sdfec
diff --git a/Documentation/misc-devices/spear-pcie-gadget.rst b/Documentation/misc-devices/spear-pcie-gadget.rst
new file mode 100644
index 000000000000..09b9d6c7ac15
--- /dev/null
+++ b/Documentation/misc-devices/spear-pcie-gadget.rst
@@ -0,0 +1,170 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+Spear PCIe Gadget Driver
+========================
+
+Author
+======
+Pratyush Anand (pratyush.anand@gmail.com)
+
+Location
+========
+driver/misc/spear13xx_pcie_gadget.c
+
+Supported Chip:
+===============
+SPEAr1300
+SPEAr1310
+
+Menuconfig option:
+==================
+Device Drivers
+	Misc devices
+		PCIe gadget support for SPEAr13XX platform
+
+purpose
+=======
+This driver has several nodes which can be read/written by configfs interface.
+Its main purpose is to configure selected dual mode PCIe controller as device
+and then program its various registers to configure it as a particular device
+type. This driver can be used to show spear's PCIe device capability.
+
+Description of different nodes:
+===============================
+
+read behavior of nodes:
+-----------------------
+
+=============== ==============================================================
+link 		gives ltssm status.
+int_type 	type of supported interrupt
+no_of_msi 	zero if MSI is not enabled by host. A positive value is the
+		number of MSI vector granted.
+vendor_id	returns programmed vendor id (hex)
+device_id	returns programmed device id(hex)
+bar0_size:	returns size of bar0 in hex.
+bar0_address	returns address of bar0 mapped area in hex.
+bar0_rw_offset	returns offset of bar0 for which bar0_data will return value.
+bar0_data	returns data at bar0_rw_offset.
+=============== ==============================================================
+
+write behavior of nodes:
+------------------------
+
+=============== ================================================================
+link 		write UP to enable ltsmm DOWN to disable
+int_type	write interrupt type to be configured and (int_type could be
+		INTA, MSI or NO_INT). Select MSI only when you have programmed
+		no_of_msi node.
+no_of_msi	number of MSI vector needed.
+inta		write 1 to assert INTA and 0 to de-assert.
+send_msi	write MSI vector to be sent.
+vendor_id	write vendor id(hex) to be programmed.
+device_id	write device id(hex) to be programmed.
+bar0_size	write size of bar0 in hex. default bar0 size is 1000 (hex)
+		bytes.
+bar0_address	write	address of bar0 mapped area in hex. (default mapping of
+		bar0 is SYSRAM1(E0800000). Always program bar size before bar
+		address. Kernel might modify bar size and address for alignment,
+		so read back bar size and address after writing to cross check.
+bar0_rw_offset	write offset of bar0 for which	bar0_data will write value.
+bar0_data	write data to be written at bar0_rw_offset.
+=============== ================================================================
+
+Node programming example
+========================
+
+Program all PCIe registers in such a way that when this device is connected
+to the PCIe host, then host sees this device as 1MB RAM.
+
+::
+
+    #mount -t configfs none /Config
+
+For nth PCIe Device Controller::
+
+    # cd /config/pcie_gadget.n/
+
+Now you have all the nodes in this directory.
+program vendor id as 0x104a::
+
+    # echo 104A >> vendor_id
+
+program device id as 0xCD80::
+
+    # echo CD80 >> device_id
+
+program BAR0 size as 1MB::
+
+    # echo 100000 >> bar0_size
+
+check for programmed bar0 size::
+
+    # cat bar0_size
+
+Program BAR0 Address as DDR (0x2100000). This is the physical address of
+memory, which is to be made visible to PCIe host. Similarly any other peripheral
+can also be made visible to PCIe host. E.g., if you program base address of UART
+as BAR0 address then when this device will be connected to a host, it will be
+visible as UART.
+
+::
+
+    # echo 2100000 >> bar0_address
+
+program interrupt type : INTA::
+
+    # echo INTA >> int_type
+
+go for link up now::
+
+    # echo UP >> link
+
+It will have to be insured that, once link up is done on gadget, then only host
+is initialized and start to search PCIe devices on its port.
+
+::
+
+    /*wait till link is up*/
+    # cat link
+
+Wait till it returns UP.
+
+To assert INTA::
+
+    # echo 1 >> inta
+
+To de-assert INTA::
+
+    # echo 0 >> inta
+
+if MSI is to be used as interrupt, program no of msi vector needed (say4)::
+
+    # echo 4 >> no_of_msi
+
+select MSI as interrupt type::
+
+    # echo MSI >> int_type
+
+go for link up now::
+
+    # echo UP >> link
+
+wait till link is up::
+
+    # cat link
+
+An application can repetitively read this node till link is found UP. It can
+sleep between two read.
+
+wait till msi is enabled::
+
+    # cat no_of_msi
+
+Should return 4 (number of requested MSI vector)
+
+to send msi vector 2::
+
+    # echo 2 >> send_msi
+    # cd -
diff --git a/Documentation/misc-devices/spear-pcie-gadget.txt b/Documentation/misc-devices/spear-pcie-gadget.txt
deleted file mode 100644
index 89b88dee4143..000000000000
--- a/Documentation/misc-devices/spear-pcie-gadget.txt
+++ /dev/null
@@ -1,130 +0,0 @@
-Spear PCIe Gadget Driver:
-
-Author
-=============
-Pratyush Anand (pratyush.anand@gmail.com)
-
-Location
-============
-driver/misc/spear13xx_pcie_gadget.c
-
-Supported Chip:
-===================
-SPEAr1300
-SPEAr1310
-
-Menuconfig option:
-==========================
-Device Drivers
-	Misc devices
-		PCIe gadget support for SPEAr13XX platform
-purpose
-===========
-This driver has several nodes which can be read/written by configfs interface.
-Its main purpose is to configure selected dual mode PCIe controller as device
-and then program its various registers to configure it as a particular device
-type. This driver can be used to show spear's PCIe device capability.
-
-Description of different nodes:
-=================================
-
-read behavior of nodes:
-------------------------------
-link 		:gives ltssm status.
-int_type 	:type of supported interrupt
-no_of_msi 	:zero if MSI is not enabled by host. A positive value is the
-		number of MSI vector granted.
-vendor_id	:returns programmed vendor id (hex)
-device_id	:returns programmed device id(hex)
-bar0_size:	:returns size of bar0 in hex.
-bar0_address	:returns address of bar0 mapped area in hex.
-bar0_rw_offset	:returns offset of bar0 for which bar0_data will return value.
-bar0_data	:returns data at bar0_rw_offset.
-
-write behavior of nodes:
-------------------------------
-link 		:write UP to enable ltsmm DOWN to disable
-int_type	:write interrupt type to be configured and (int_type could be
-		INTA, MSI or NO_INT). Select MSI only when you have programmed
-		no_of_msi node.
-no_of_msi	:number of MSI vector needed.
-inta		:write 1 to assert INTA and 0 to de-assert.
-send_msi	:write MSI vector to be sent.
-vendor_id	:write vendor id(hex) to be programmed.
-device_id	:write device id(hex) to be programmed.
-bar0_size	:write size of bar0 in hex. default bar0 size is 1000 (hex)
-		bytes.
-bar0_address	:write	address of bar0 mapped area in hex. (default mapping of
-		bar0 is SYSRAM1(E0800000). Always program bar size before bar
-		address. Kernel might modify bar size and address for alignment, so
-		read back bar size and address after writing to cross check.
-bar0_rw_offset	:write offset of bar0 for which	bar0_data will write value.
-bar0_data	:write data to be written at bar0_rw_offset.
-
-Node programming example
-===========================
-Program all PCIe registers in such a way that when this device is connected
-to the PCIe host, then host sees this device as 1MB RAM.
-#mount -t configfs none /Config
-For nth PCIe Device Controller
-# cd /config/pcie_gadget.n/
-Now you have all the nodes in this directory.
-program vendor id as 0x104a
-# echo 104A >> vendor_id
-
-program device id as 0xCD80
-# echo CD80 >> device_id
-
-program BAR0 size as 1MB
-# echo 100000 >> bar0_size
-
-check for programmed bar0 size
-# cat bar0_size
-
-Program BAR0 Address as DDR (0x2100000). This is the physical address of
-memory, which is to be made visible to PCIe host. Similarly any other peripheral
-can also be made visible to PCIe host. E.g., if you program base address of UART
-as BAR0 address then when this device will be connected to a host, it will be
-visible as UART.
-# echo 2100000 >> bar0_address
-
-program interrupt type : INTA
-# echo INTA >> int_type
-
-go for link up now.
-# echo UP >> link
-
-It will have to be insured that, once link up is done on gadget, then only host
-is initialized and start to search PCIe devices on its port.
-
-/*wait till link is up*/
-# cat link
-wait till it returns UP.
-
-To assert INTA
-# echo 1 >> inta
-
-To de-assert INTA
-# echo 0 >> inta
-
-if MSI is to be used as interrupt, program no of msi vector needed (say4)
-# echo 4 >> no_of_msi
-
-select MSI as interrupt type
-# echo MSI >> int_type
-
-go for link up now
-# echo UP >> link
-
-wait till link is up
-# cat link
-An application can repetitively read this node till link is found UP. It can
-sleep between two read.
-
-wait till msi is enabled
-# cat no_of_msi
-Should return 4 (number of requested MSI vector)
-
-to send msi vector 2
-# echo 2 >> send_msi
-#cd -
-- 
2.24.1

