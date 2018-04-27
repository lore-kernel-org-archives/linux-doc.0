Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 58AA67E22E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 16:59:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932851AbeD0Q67 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 12:58:59 -0400
Received: from smtprelay.synopsys.com ([198.182.37.59]:37149 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758922AbeD0Q6A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 12:58:00 -0400
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 80DB01E16A8;
        Fri, 27 Apr 2018 18:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1524848276; bh=RbDqWXc5KfOWLWezKB/fdprsF/9qA/gBwIm9Fp3+h4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=XRT1N6KQMuyLoVPz+8wKFIuW51KUPEl38Gac1xpx+Hfx2rNZUmt6yTO5Csn5zYkkB
         Vfw9NUeU2WJ542YXLKn3QBwrjh1Xnvu6IjD4Wsz/BD8v4LmgKnYfqK+/bLY++LRIxA
         SnJS4Sb6StKv9/1N6DpusafH65AC9HDGmvQpKE9A+FuYbi2aArRLYt1rPt/b5dF9e2
         wlSASHkESCX7an/enrabD7debLhblja95fuKere5CgH47OFCucODadtcCPYb0YYEjV
         hdqExsMRxAbfKvWjBuWF3RU4ZcfDEqUbE0dC9UqqySlYrWL/iIQlCGiXhotmfLAks+
         FRG0aU2hZQdSg==
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 6E49E58FC;
        Fri, 27 Apr 2018 09:57:55 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 1B9723DC22;
        Fri, 27 Apr 2018 17:57:54 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo.pimentel@synopsys.com
Subject: [PATCH 09/10] tools: PCI: Add MSI-X support
Date:   Fri, 27 Apr 2018 17:57:46 +0100
Message-Id: <4de76f9ea0a2e8ccc5656a984a092c240f800a56.1524845816.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
References: <cover.1524845816.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add MSI-X support to pcitest tool.

Modify pcitest.sh script to accomodate MSI-X interrupt tests.

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 include/uapi/linux/pcitest.h |  1 +
 tools/pci/pcitest.c          | 18 +++++++++++++++++-
 tools/pci/pcitest.sh         | 25 +++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/pcitest.h b/include/uapi/linux/pcitest.h
index 953cf03..d746fb1 100644
--- a/include/uapi/linux/pcitest.h
+++ b/include/uapi/linux/pcitest.h
@@ -16,5 +16,6 @@
 #define PCITEST_WRITE		_IOW('P', 0x4, unsigned long)
 #define PCITEST_READ		_IOW('P', 0x5, unsigned long)
 #define PCITEST_COPY		_IOW('P', 0x6, unsigned long)
+#define PCITEST_MSIX		_IOW('P', 0x7, int)
 
 #endif /* __UAPI_LINUX_PCITEST_H */
diff --git a/tools/pci/pcitest.c b/tools/pci/pcitest.c
index 9074b47..9d145a3 100644
--- a/tools/pci/pcitest.c
+++ b/tools/pci/pcitest.c
@@ -37,6 +37,7 @@ struct pci_test {
 	char		barnum;
 	bool		legacyirq;
 	unsigned int	msinum;
+	unsigned int	msixnum;
 	bool		read;
 	bool		write;
 	bool		copy;
@@ -83,6 +84,15 @@ static int run_test(struct pci_test *test)
 			fprintf(stdout, "%s\n", result[ret]);
 	}
 
+	if (test->msixnum > 0 && test->msixnum <= 2048) {
+		ret = ioctl(fd, PCITEST_MSIX, test->msixnum);
+		fprintf(stdout, "MSI-X%d:\t\t", test->msixnum);
+		if (ret < 0)
+			fprintf(stdout, "TEST FAILED\n");
+		else
+			fprintf(stdout, "%s\n", result[ret]);
+	}
+
 	if (test->write) {
 		ret = ioctl(fd, PCITEST_WRITE, test->size);
 		fprintf(stdout, "WRITE (%7ld bytes):\t\t", test->size);
@@ -133,7 +143,7 @@ int main(int argc, char **argv)
 	/* set default endpoint device */
 	test->device = "/dev/pci-endpoint-test.0";
 
-	while ((c = getopt(argc, argv, "D:b:m:lrwcs:")) != EOF)
+	while ((c = getopt(argc, argv, "D:b:m:x:lrwcs:")) != EOF)
 	switch (c) {
 	case 'D':
 		test->device = optarg;
@@ -151,6 +161,11 @@ int main(int argc, char **argv)
 		if (test->msinum < 1 || test->msinum > 32)
 			goto usage;
 		continue;
+	case 'x':
+		test->msixnum = atoi(optarg);
+		if (test->msixnum < 1 || test->msixnum > 2048)
+			goto usage;
+		continue;
 	case 'r':
 		test->read = true;
 		continue;
@@ -173,6 +188,7 @@ int main(int argc, char **argv)
 			"\t-D <dev>		PCI endpoint test device {default: /dev/pci-endpoint-test.0}\n"
 			"\t-b <bar num>		BAR test (bar number between 0..5)\n"
 			"\t-m <msi num>		MSI test (msi number between 1..32)\n"
+			"\t-x <msix num>	MSI-X test (msix number between 1..2048)\n"
 			"\t-l			Legacy IRQ test\n"
 			"\t-r			Read buffer test\n"
 			"\t-w			Write buffer test\n"
diff --git a/tools/pci/pcitest.sh b/tools/pci/pcitest.sh
index 77e8c85..86709a2 100644
--- a/tools/pci/pcitest.sh
+++ b/tools/pci/pcitest.sh
@@ -4,6 +4,8 @@
 echo "BAR tests"
 echo
 
+modprobe pci_endpoint_test
+sleep 2
 bar=0
 
 while [ $bar -lt 6 ]
@@ -16,7 +18,14 @@ echo
 echo "Interrupt tests"
 echo
 
+rmmod pci_endpoint_test
+sleep 2
+modprobe pci_endpoint_test irq_type=0
 pcitest -l
+
+rmmod pci_endpoint_test
+sleep 2
+modprobe pci_endpoint_test irq_type=1
 msi=1
 
 while [ $msi -lt 33 ]
@@ -26,9 +35,25 @@ do
 done
 echo
 
+rmmod pci_endpoint_test
+sleep 2
+modprobe pci_endpoint_test irq_type=2
+msix=1
+
+while [ $msix -lt 2049 ]
+do
+        pcitest -x $msix
+        msix=`expr $msix + 1`
+done
+echo
+
 echo "Read Tests"
 echo
 
+rmmod pci_endpoint_test
+sleep 2
+modprobe pci_endpoint_test irq_type=1
+
 pcitest -r -s 1
 pcitest -r -s 1024
 pcitest -r -s 1025
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
