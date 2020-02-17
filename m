Return-Path: <SRS0=VB12=4F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D97DC34024
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:20:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF0A224658
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581956455;
	bh=kDZPlakYE4tkJOE5yXMZJFhwHWqmyBXvNK9LQWRx8r4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=L5Qe+EDX9ehcCu79rBNMXzBjiPESAmbt3LEHxIulVFpFWJizIz/gCZ7L5aDN8LeRN
	 vkWi/ztyXXRAPdk+vqh5PHWoB8rSWSrxw+rb2FMf6s/XHy3uBp6RY1ScaaH105eRI9
	 BMzx3GgvkThPEc4WA2agH37Ai4L3zwT+qb0x6gZU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgBQQUy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Feb 2020 11:20:54 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:54958 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728339AbgBQQUr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Feb 2020 11:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=GtwkLmmzfM76VxBMXlHIbbgbtZN35Zt+G8w8FKWpUbY=; b=K+dOfktr9QN8/ntiD0TbIiWSRW
        HXG28ZPcrrX3MwhO+s7vuSbkqsADHKoq+hhZSYhLeJiZT7MdNR0DJftf/8scwJ7qguuf0pav4m9x4
        HKMYEL1UfLEUO7sFqW4FtlWWVjJ7GAM1fVXRDwuLKsX9Sm5hnlif/hM2MZH7+WDksuFCfwTvXrl5/
        zXHV4hv5sh3/03cnac0drHgE2qkSjqCVnB2LWsRgijmxiWpPrA/QmkKs6v+E3rCPML0Bk/U332JTr
        ByLPrdxyZIZRuab0/oDNtpNXCZsqNE4X1s9d+aobq/O1N//f9pnKR/29Zksoo+o7RWhlv9mdLjCeJ
        XciZLfQg==;
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3j8X-000427-V5; Mon, 17 Feb 2020 16:20:46 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j3j8W-000fpC-0y; Mon, 17 Feb 2020 17:20:44 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 08/24] docs: misc-devices/pci-endpoint-test.txt: convert to ReST
Date:   Mon, 17 Feb 2020 17:20:26 +0100
Message-Id: <09653768d9004106745ee1d2defaa1a43d2b5ba6.1581956285.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581956285.git.mchehab+huawei@kernel.org>
References: <cover.1581956285.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Use titles markups;
- Adjust identation;
- use literal markup;
- Use the proper notation for footnotes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/misc-devices/index.rst          |  1 +
 .../misc-devices/pci-endpoint-test.rst        | 56 +++++++++++++++++++
 .../misc-devices/pci-endpoint-test.txt        | 41 --------------
 3 files changed, 57 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/misc-devices/pci-endpoint-test.rst
 delete mode 100644 Documentation/misc-devices/pci-endpoint-test.txt

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 005547c1ad5d..04f5dab2384c 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -21,5 +21,6 @@ fit into other categories.
    isl29003
    lis3lv02d
    max6875
+   pci-endpoint-test
    spear-pcie-gadget
    xilinx_sdfec
diff --git a/Documentation/misc-devices/pci-endpoint-test.rst b/Documentation/misc-devices/pci-endpoint-test.rst
new file mode 100644
index 000000000000..26e5d9ba146b
--- /dev/null
+++ b/Documentation/misc-devices/pci-endpoint-test.rst
@@ -0,0 +1,56 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================
+Driver for PCI Endpoint Test Function
+=====================================
+
+This driver should be used as a host side driver if the root complex is
+connected to a configurable PCI endpoint running ``pci_epf_test`` function
+driver configured according to [1]_.
+
+The "pci_endpoint_test" driver can be used to perform the following tests.
+
+The PCI driver for the test device performs the following tests:
+
+	#) verifying addresses programmed in BAR
+	#) raise legacy IRQ
+	#) raise MSI IRQ
+	#) raise MSI-X IRQ
+	#) read data
+	#) write data
+	#) copy data
+
+This misc driver creates /dev/pci-endpoint-test.<num> for every
+``pci_epf_test`` function connected to the root complex and "ioctls"
+should be used to perform the above tests.
+
+ioctl
+-----
+
+ PCITEST_BAR:
+	      Tests the BAR. The number of the BAR to be tested
+	      should be passed as argument.
+ PCITEST_LEGACY_IRQ:
+	      Tests legacy IRQ
+ PCITEST_MSI:
+	      Tests message signalled interrupts. The MSI number
+	      to be tested should be passed as argument.
+ PCITEST_MSIX:
+	      Tests message signalled interrupts. The MSI-X number
+	      to be tested should be passed as argument.
+ PCITEST_SET_IRQTYPE:
+	      Changes driver IRQ type configuration. The IRQ type
+	      should be passed as argument (0: Legacy, 1:MSI, 2:MSI-X).
+ PCITEST_GET_IRQTYPE:
+	      Gets driver IRQ type configuration.
+ PCITEST_WRITE:
+	      Perform write tests. The size of the buffer should be passed
+	      as argument.
+ PCITEST_READ:
+	      Perform read tests. The size of the buffer should be passed
+	      as argument.
+ PCITEST_COPY:
+	      Perform read tests. The size of the buffer should be passed
+	      as argument.
+
+.. [1] Documentation/PCI/endpoint/function/binding/pci-test.txt
diff --git a/Documentation/misc-devices/pci-endpoint-test.txt b/Documentation/misc-devices/pci-endpoint-test.txt
deleted file mode 100644
index 58ccca4416b1..000000000000
--- a/Documentation/misc-devices/pci-endpoint-test.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Driver for PCI Endpoint Test Function
-
-This driver should be used as a host side driver if the root complex is
-connected to a configurable PCI endpoint running *pci_epf_test* function
-driver configured according to [1].
-
-The "pci_endpoint_test" driver can be used to perform the following tests.
-
-The PCI driver for the test device performs the following tests
-	*) verifying addresses programmed in BAR
-	*) raise legacy IRQ
-	*) raise MSI IRQ
-	*) raise MSI-X IRQ
-	*) read data
-	*) write data
-	*) copy data
-
-This misc driver creates /dev/pci-endpoint-test.<num> for every
-*pci_epf_test* function connected to the root complex and "ioctls"
-should be used to perform the above tests.
-
-ioctl
------
- PCITEST_BAR: Tests the BAR. The number of the BAR to be tested
-	      should be passed as argument.
- PCITEST_LEGACY_IRQ: Tests legacy IRQ
- PCITEST_MSI: Tests message signalled interrupts. The MSI number
-	      to be tested should be passed as argument.
- PCITEST_MSIX: Tests message signalled interrupts. The MSI-X number
-	      to be tested should be passed as argument.
- PCITEST_SET_IRQTYPE: Changes driver IRQ type configuration. The IRQ type
-	      should be passed as argument (0: Legacy, 1:MSI, 2:MSI-X).
- PCITEST_GET_IRQTYPE: Gets driver IRQ type configuration.
- PCITEST_WRITE: Perform write tests. The size of the buffer should be passed
-		as argument.
- PCITEST_READ: Perform read tests. The size of the buffer should be passed
-	       as argument.
- PCITEST_COPY: Perform read tests. The size of the buffer should be passed
-	       as argument.
-
-[1] -> Documentation/PCI/endpoint/function/binding/pci-test.txt
-- 
2.24.1

