Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F40C3F2DC
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AA4C20863
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583243971;
	bh=kDZPlakYE4tkJOE5yXMZJFhwHWqmyBXvNK9LQWRx8r4=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=Lb8V6XsIZwbLoACUfZpLHS70DU0dN+trbjegtGUSNaNusGKEhKkappWwCTu4+M+ul
	 klQi+T12Bbw+OKP3cLcUyUmeAnB277cs9a6ghZDy7y/nQ/11yyaeyez0QA5LYNL8lV
	 wx0EYJu1b6EFDNXH9gKyDtSxKiKFJKnXU7RiqOus=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgCCN7a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 08:59:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:45306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727753AbgCCN73 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 08:59:29 -0500
Received: from mail.kernel.org (tmo-101-56.customers.d1-online.com [80.187.101.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B6E520848;
        Tue,  3 Mar 2020 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583243968;
        bh=kDZPlakYE4tkJOE5yXMZJFhwHWqmyBXvNK9LQWRx8r4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sLwiFeq1optSbL1eXSokifsirtCEU90BXgIJrf3qP3q3MPeNhRWY/nywlwvmntq96
         mM8cQ+ErhLlF1GY7mSaQmukdEedEUVmXnlUKlldVyb33a+fcoRv9a1VhrP+zuf73kY
         z5jLmFhCFJELvHyGEHvVyKFFbiHLIE4mTn7C+Rq0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j9850-001YdQ-Bi; Tue, 03 Mar 2020 14:59:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 08/18] docs: misc-devices/pci-endpoint-test.txt: convert to ReST
Date:   Tue,  3 Mar 2020 14:59:15 +0100
Message-Id: <15f21bb57b5f9bf41d36d9b1a998d06ec6d24290.1583243826.git.mchehab+huawei@kernel.org>
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

