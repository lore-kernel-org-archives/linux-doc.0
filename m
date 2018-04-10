Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0DEB97DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 17:15:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752258AbeDJRPf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 13:15:35 -0400
Received: from smtprelay2.synopsys.com ([198.182.60.111]:60210 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751504AbeDJRO4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 13:14:56 -0400
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 8D9D110C0C22;
        Tue, 10 Apr 2018 10:14:55 -0700 (PDT)
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id 0A4413F45;
        Tue, 10 Apr 2018 10:14:55 -0700 (PDT)
Received: from UbuntuMate-64Bits.internal.synopsys.com (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id 9DE173D7DD;
        Tue, 10 Apr 2018 18:14:53 +0100 (WEST)
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
To:     bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, niklas.cassel@axis.com,
        jesper.nilsson@axis.com
Cc:     linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gustavo.pimentel@synopsys.com
Subject: [RFC 10/10] tools: PCI: Add MSI-X support
Date:   Tue, 10 Apr 2018 18:14:49 +0100
Message-Id: <9865822fb89ea84cb55fe93e151295afcd5c96b3.1523379766.git.gustavo.pimentel@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds MSI-X support to the pcitest tool and modified the pcitest.sh script
to accomodate this new type of interruption test.

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
