Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A82C11DE
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426943; cv=none; b=HdP8bsGHfxBBvptjL0SSriR9nGKcWuKldNlySVR1AaC+8zV6z10bibY94Orthv73m9q8Tm9PwXZfaqXNfSS5LkxZ3hMk6ufFuzdgKUy/mbDYJjmljGpw9LBUO6u+JaPGLTcCgN9H707UYXkiclkRS3cnPcpABjSFb3MlZO4G4JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426943; c=relaxed/simple;
	bh=0JJ/ovzmfSJ1jb9Vdak2WoRAgXatAloCuZPSZSQiBUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C94YQjIj2pmzz8scnQaEQJqAh4pL3Ojlgbperw89vgVX0HFREopcmKtj4ok5Lj3958+NeRr6lPlCujrJL/ZIa4O2pqcVwDjutyFxbV11jmVlnOLHki7kkLL5nF0gXsqONFYaultnKkpiE/VNv9nMPgtwOnqN/6IbJgn0WU0iWTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com; spf=pass smtp.mailfrom=mucse.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpsz2t1760426854tf50bc53d
X-QQ-Originating-IP: k+8m6SK13Fp1Z2NtIAkKywCOXcDOERgq16PElqptoXg=
Received: from localhost.localdomain ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Oct 2025 15:27:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17000365374502563519
EX-QQ-RecipientCnt: 13
From: Dong Yibo <dong100@mucse.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	andrew+netdev@lunn.ch,
	danishanwar@ti.com,
	vadim.fedorenko@linux.dev
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dong100@mucse.com
Subject: [PATCH net-next v14 2/5] net: rnpgbe: Add n500/n210 chip support with BAR2 mapping
Date: Tue, 14 Oct 2025 15:27:08 +0800
Message-Id: <20251014072711.13448-3-dong100@mucse.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014072711.13448-1-dong100@mucse.com>
References: <20251014072711.13448-1-dong100@mucse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MC+kTSDGUQEXTOXoiOxz/3REAY4//YGxViYNIpC/D6TmOgK5j8A+PtcI
	AXszSGIKwKCtY4vSaLT+Bpc/xwQc8hRHrWeR76M8uYmgAyV8DlE2Drhzaz0paSHmrRGqA0C
	qGgeUPAJ/AHMtDSeZhIM7bDRt6YG46EJ48wKi5hhwugwdX+jV4TZ7sYBOPoixPYcB90cRAh
	OxxOcP5L26sIjxpyiycyJ+zGuER9kaUr+zia8YMk+qocDX0QyWk+gcTT+OWIJEIRD2f8GjZ
	p+0qycIG3UL0mfCNQOoF0vkGTxzrRKQ9G608kPvSinnKRxW9haUKCd+ksUxYzTW4hmf51+U
	/GFj1HoKDnWMsYskbKZVUt/opMvGpb74qkGcnTOs755bcjWUWquL8IagA0bhdnTHCuuhyhY
	tZEHc6vK6p47VJVQ1lUKrGXuKUFwPrOfzsX2bAe+KqtMk44F2uzYZSc1TYJmyE3NNxK5iPK
	jlRm4TFIwOh95QwL5XSTpdstL91MvSdhmcFQjFiLuwRGEw+rFTCTMfIwwLENXPmIGL+IoSB
	j7Wt+6SeMXQEaVBPbOs3oxW/A4872AHKrOvG2vGjdiDXtbvJ6I3kU4HKYwheR/9wCp/6RfB
	wUuF8wd+o7seflqe7A8+NoOM272y5Q8Ox+Ct0qgCjrGGPHEaVqzzQCmhM9c0hvBPyWo/DNw
	gruRFGQdRNwvhIM/1mZI8P685Mzik0qSBxjpsKUNdgs28mUb5WjsclacIXZiSAGiGUAbF2H
	XJH1E9n4euuZ6Ja33RjRV/8zE0bYaThDVLi380M1+hX4kacNbkb4kWwwSZfRisNZdZKdjbx
	oxkDBe5dz106Nd2BtxTXG+Ak0PJEkin7F1JJB3YSnfc5wffUf0hSgoExgsD4yCbkOfuNrRe
	gjk3SG7YAbrbT+GgPPNZlW/NkVshTngg1QbwsMsbTuCs41hxGLsYWiCfX01yN4oN0u1myWG
	nVVkhaL0JxuiPw2UQfSsQtyyUuRyUraBhYBI1NJEwQXsoOoPPXFQbFM2fLGlclFfXQo2T0U
	8Gc/15AnXzGsh2+FWedvQ+sdXvZbYSaoL3AuDUlw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Add hardware initialization foundation for MUCSE 1Gbe controller,
including:
1. Map PCI BAR2 as hardware register base;
2. Bind PCI device to driver private data (struct mucse) and
   initialize hardware context (struct mucse_hw);
3. Reserve board-specific init framework via rnpgbe_init_hw.

Signed-off-by: Dong Yibo <dong100@mucse.com>
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Reviewed-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    | 10 +++
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h |  8 ++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_main.c   | 80 +++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h

diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
index d3439d28c654..a121ce4872a6 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
@@ -9,6 +9,16 @@ enum rnpgbe_boards {
 	board_n210
 };
 
+struct mucse_hw {
+	void __iomem *hw_addr;
+};
+
+struct mucse {
+	struct net_device *netdev;
+	struct pci_dev *pdev;
+	struct mucse_hw hw;
+};
+
 /* Device IDs */
 #define PCI_VENDOR_ID_MUCSE               0x8848
 #define RNPGBE_DEVICE_ID_N500_QUAD_PORT   0x8308
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h
new file mode 100644
index 000000000000..3a779806e8be
--- /dev/null
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_hw.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright(c) 2020 - 2025 Mucse Corporation. */
+
+#ifndef _RNPGBE_HW_H
+#define _RNPGBE_HW_H
+
+#define RNPGBE_MAX_QUEUES 8
+#endif /* _RNPGBE_HW_H */
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
index 019e819fb497..305657d73e25 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
@@ -2,8 +2,11 @@
 /* Copyright(c) 2020 - 2025 Mucse Corporation. */
 
 #include <linux/pci.h>
+#include <net/rtnetlink.h>
+#include <linux/etherdevice.h>
 
 #include "rnpgbe.h"
+#include "rnpgbe_hw.h"
 
 static const char rnpgbe_driver_name[] = "rnpgbe";
 
@@ -21,6 +24,54 @@ static struct pci_device_id rnpgbe_pci_tbl[] = {
 	{0, },
 };
 
+/**
+ * rnpgbe_add_adapter - Add netdev for this pci_dev
+ * @pdev: PCI device information structure
+ * @board_type: board type
+ *
+ * rnpgbe_add_adapter initializes a netdev for this pci_dev
+ * structure. Initializes Bar map, private structure, and a
+ * hardware reset occur.
+ *
+ * Return: 0 on success, negative errno on failure
+ **/
+static int rnpgbe_add_adapter(struct pci_dev *pdev,
+			      int board_type)
+{
+	struct net_device *netdev;
+	void __iomem *hw_addr;
+	struct mucse *mucse;
+	struct mucse_hw *hw;
+	int err;
+
+	netdev = alloc_etherdev_mq(sizeof(struct mucse), RNPGBE_MAX_QUEUES);
+	if (!netdev)
+		return -ENOMEM;
+
+	SET_NETDEV_DEV(netdev, &pdev->dev);
+	mucse = netdev_priv(netdev);
+	mucse->netdev = netdev;
+	mucse->pdev = pdev;
+	pci_set_drvdata(pdev, mucse);
+
+	hw = &mucse->hw;
+	hw_addr = devm_ioremap(&pdev->dev,
+			       pci_resource_start(pdev, 2),
+			       pci_resource_len(pdev, 2));
+	if (!hw_addr) {
+		err = -EIO;
+		goto err_free_net;
+	}
+
+	hw->hw_addr = hw_addr;
+
+	return 0;
+
+err_free_net:
+	free_netdev(netdev);
+	return err;
+}
+
 /**
  * rnpgbe_probe - Device initialization routine
  * @pdev: PCI device information struct
@@ -33,6 +84,7 @@ static struct pci_device_id rnpgbe_pci_tbl[] = {
  **/
 static int rnpgbe_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
+	int board_type = id->driver_data;
 	int err;
 
 	err = pci_enable_device_mem(pdev);
@@ -60,6 +112,10 @@ static int rnpgbe_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto err_free_regions;
 	}
 
+	err = rnpgbe_add_adapter(pdev, board_type);
+	if (err)
+		goto err_free_regions;
+
 	return 0;
 err_free_regions:
 	pci_release_mem_regions(pdev);
@@ -68,6 +124,23 @@ static int rnpgbe_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return err;
 }
 
+/**
+ * rnpgbe_rm_adapter - Remove netdev for this mucse structure
+ * @pdev: PCI device information struct
+ *
+ * rnpgbe_rm_adapter remove a netdev for this mucse structure
+ **/
+static void rnpgbe_rm_adapter(struct pci_dev *pdev)
+{
+	struct mucse *mucse = pci_get_drvdata(pdev);
+	struct net_device *netdev;
+
+	if (!mucse)
+		return;
+	netdev = mucse->netdev;
+	free_netdev(netdev);
+}
+
 /**
  * rnpgbe_remove - Device removal routine
  * @pdev: PCI device information struct
@@ -79,6 +152,7 @@ static int rnpgbe_probe(struct pci_dev *pdev, const struct pci_device_id *id)
  **/
 static void rnpgbe_remove(struct pci_dev *pdev)
 {
+	rnpgbe_rm_adapter(pdev);
 	pci_release_mem_regions(pdev);
 	pci_disable_device(pdev);
 }
@@ -89,6 +163,12 @@ static void rnpgbe_remove(struct pci_dev *pdev)
  **/
 static void rnpgbe_dev_shutdown(struct pci_dev *pdev)
 {
+	struct mucse *mucse = pci_get_drvdata(pdev);
+	struct net_device *netdev = mucse->netdev;
+
+	rtnl_lock();
+	netif_device_detach(netdev);
+	rtnl_unlock();
 	pci_disable_device(pdev);
 }
 
-- 
2.25.1

