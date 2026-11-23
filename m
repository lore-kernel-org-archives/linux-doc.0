Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418671;
	b=4+b5g35m/2b8Vdw5xzP8L9WBFIft+VbW5ZKnyJ85x1+y9U0yI5lPky9rOqCLRkTJlLyW
	 OLX6zm/segT7sXv6f4fZqtM/ixmEIZkamvNn3qiZQbf+4/3FvaIbjIKNtW2HKL8VZVgo0
	 jCnttpOXAp9B+mo8jpspuRSPVEgjR42aK65qk+YsB6kEftD77LVxgghlatlv3FpYC0Qii
	 i+cAAKT2pL7f2slZ1WnLsbln99embF9HThc7L1WIzFrKhsF7hAJJ3zYZO9VaFN1NavnTD
	 ctXNQR3cwU5uY4CDz5N6e85lTPhzE4Or0qW4mzRCbIU3P286C2DMKL9rk1bqoBLJjuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418671;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=wdJerj5/iXJzc3SrdreZD7ec9FRXzCuMIHq+IUjHwCU=;
	b=XM3c3gLGJt/iYPwYMTZXjSZepnyIOXLecOd7qVCfc1ycLbSAB4U8Nz401C7XdXakkBfV
	 kM1823ml8zdkVKBppmY+26SvLn2zCRGHarRekrQLqCSIfxF4qkSlQULNyUjCbrn3L5Ped
	 nl6exdImuSjNz9/CWUyPoLWcMikYagc+Eb+fVXtlA0as9E6ubEShKiKoqyNEgj/u+vCf1
	 M7FFJ9IC1f2GxTdWmUre9AFO10pk+jq2LNs7gS15P3oq5azWRg/Sivpwl7r3Yz00J3zF4
	 +JDeXxh9WovYwAsP/mLqHY8O3WjpyUiPLp2ickVe8ifbNqnMJfSJ+oTaFmgcr4skDBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=35hnWrcv;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F90606A335;
	Mon, 23 Nov 2026 07:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F90606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=35hnWrcv
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wdJerj5/iXJzc3SrdreZD7ec9FRXzCuMIHq+IUjHwCU=;
	b=35hnWrcvUW0DqpcaD6PYsKsy5I2cMwQHaslLQcfcKA/Y1NrNDrMCjQno6jgvE6M1na1QfeKsa
	wUx/HH2Jh8Id9adEoX02Opbsye82OU86uTodi7z7tClJigDiaPW6c56W58RIMBSNNSyRTU0LAZw
	NC9PH4yuVETz60FhvlK+r0w=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jXy9Z1fxWz1cyV7;
	Mon, 23 Nov 2026 15:24:02 +0800 (CST)
Received: from dggpemr200017.china.huawei.com (unknown [7.185.36.233])
	by mail.maildlp.com (Postfix) with ESMTPS id 2004240563;
	Mon, 23 Nov 2026 15:24:25 +0800 (CST)
Received: from whupemq100015.china.huawei.com (7.152.185.230) by
 dggpemr200017.china.huawei.com (7.185.36.233) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 23 Nov 2026 15:24:24 +0800
Received: from DESKTOP-62GVMTR.china.huawei.com (10.174.220.94) by
 whupemq100015.china.huawei.com (7.152.185.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 15:24:22 +0800
From: Fan Gong <gongfan1@huawei.com>
To: Fan Gong <gongfan1@huawei.com>, Wu Di <wudi234@huawei.com>, Teng Peisen
	<tengpeisen@huawei.com>, <netdev@vger.kernel.org>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Ioana Ciornei
	<ioana.ciornei@nxp.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>, Dimitri Daskalakis
	<dimitri.daskalakis1@gmail.com>, Harshitha Ramamurthy
	<hramamurthy@google.com>, Larysa Zaremba <larysa.zaremba@intel.com>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Zhou Shuai
	<zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>
Subject: [PATCH net-next v06 1/1] hinic3: Fix the RX stalls in hinic3_rx_poll()
Date: Mon, 23 Nov 2026 15:24:12 +0800
Message-ID: <88faeac70521e7a76d9b196392f7a3175b33f28d.1795417161.git.gongfan1@huawei.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <cover.1795417161.git.gongfan1@huawei.com>
References: <cover.1795417161.git.gongfan1@huawei.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemq100015.china.huawei.com (7.152.185.230)

hinic3_rx_poll() leaves the loop early in three cases, and hinic3_poll()
then completes NAPI and re-enables the edge triggered MSI-X interrupt:

  - a large LRO packet consumed enough WQEs to cross lro_replenish_thld;
  - napi_alloc_skb() failed in recv_one_pkt();
  - hinic3_rx_fill_buffers() posted fewer WQEs than rxq->delta - 1 because
    page_pool_dev_alloc_frag() failed.

In the first case a completed CQE still sits at the head of the ring, so
nothing re-arms the queue when no further packet arrives.  A failed
napi_alloc_skb() leaves a completed CQE at the head as well, with no WQE
consumed and no state advanced, so the next poll would retry the same
CQE.  A short refill is different: the ring ends up without posted WQEs,
and once the device has consumed the rest it writes no CQE and raises no
interrupt either, so the queue stays dead until the interface is reset.

Return budget for the LRO case so that hinic3_poll() skips
napi_complete_done() and NAPI runs again immediately; every pass consumes
CQEs, so the polling terminates.

Doing the same for the two allocation failures would keep NAPI retrying
the same CQE, or an empty ring, until the allocator recovers, which spins
a CPU under prolonged memory pressure.  Keep NAPI out of that loop
instead: record the affected queue in a per-queue bitmap and re-arm NAPI
from a delayed work 250ms later, independent of the hardware interrupts.
The work calls napi_schedule() for every queue that failed.  When the
interface is not up yet it keeps the bits and tries again, since
hinic3_open() sets HINIC3_INTF_UP only after the vport is enabled, and
the teardown path disables the work so that it cannot outlive the
channel.

The bitmap is allocated together with the Tx/Rx queues and freed once the
work is disabled.  hinic3_qps_irq_uninit() cancels the work before the
NAPI instances are torn down and disables it after they are gone, and
hinic3_qps_irq_init() disables it again on its rollback path, so no poll
can queue it once the channel is torn down and it never dereferences a
freed irq_cfg.  The bitmap is cleared when the queues are brought up, so
a queue that is brought up again does not inherit a stale bit.

Fixes: 17fcb3dc12bb ("hinic3: module initialization and tx/rx logic")
Co-developed-by: Wu Di <wudi234@huawei.com>
Signed-off-by: Wu Di <wudi234@huawei.com>
Co-developed-by: Teng Peisen <tengpeisen@huawei.com>
Signed-off-by: Teng Peisen <tengpeisen@huawei.com>
Signed-off-by: Fan Gong <gongfan1@huawei.com>
---
 .../net/ethernet/huawei/hinic3/hinic3_irq.c   | 10 ++++
 .../net/ethernet/huawei/hinic3/hinic3_main.c  | 59 ++++++++++++++++++-
 .../ethernet/huawei/hinic3/hinic3_nic_dev.h   |  3 +
 .../net/ethernet/huawei/hinic3/hinic3_rx.c    | 26 ++++++--
 4 files changed, 92 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c b/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c
index e7d6c2033b45..4ff5c97639e8 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 
+#include <linux/bitmap.h>
 #include <linux/dim.h>
 #include <linux/netdevice.h>
 
@@ -205,6 +206,9 @@ int hinic3_qps_irq_init(struct net_device *netdev)
 	u16 q_id;
 	int err;
 
+	bitmap_zero(nic_dev->rx_oom_bitmap, nic_dev->max_qps);
+	enable_delayed_work(&nic_dev->rx_oom_work);
+
 	for (q_id = 0; q_id < nic_dev->q_params.num_qps; q_id++) {
 		msix_entry = &nic_dev->qps_msix_entries[q_id];
 		irq_cfg = &nic_dev->q_params.irq_cfg[q_id];
@@ -264,6 +268,8 @@ int hinic3_qps_irq_init(struct net_device *netdev)
 		disable_work_sync(&irq_cfg->rxq->dim.work);
 	}
 
+	disable_delayed_work_sync(&nic_dev->rx_oom_work);
+
 	return err;
 }
 
@@ -273,6 +279,8 @@ void hinic3_qps_irq_uninit(struct net_device *netdev)
 	struct hinic3_irq_cfg *irq_cfg;
 	u16 q_id;
 
+	cancel_delayed_work_sync(&nic_dev->rx_oom_work);
+
 	for (q_id = 0; q_id < nic_dev->q_params.num_qps; q_id++) {
 		irq_cfg = &nic_dev->q_params.irq_cfg[q_id];
 		qp_del_napi(irq_cfg);
@@ -288,4 +296,6 @@ void hinic3_qps_irq_uninit(struct net_device *netdev)
 		hinic3_release_irq(irq_cfg);
 		disable_work_sync(&irq_cfg->rxq->dim.work);
 	}
+
+	disable_delayed_work_sync(&nic_dev->rx_oom_work);
 }
diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_main.c b/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
index 0a888fe4c975..6d07edfc08ac 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 
+#include <linux/bitmap.h>
 #include <linux/etherdevice.h>
 #include <linux/netdevice.h>
 
@@ -33,6 +34,8 @@
 #define HINIC3_RX_PENDING_LIMIT_LOW   2
 #define HINIC3_RX_PENDING_LIMIT_HIGH  8
 
+#define HINIC3_RX_OOM_POLL_MS         250
+
 static void init_intr_coal_param(struct net_device *netdev)
 {
 	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
@@ -76,6 +79,43 @@ static void hinic3_free_intr_coalesce(struct net_device *netdev)
 	kfree(nic_dev->intr_coalesce);
 }
 
+static void hinic3_rx_oom_work(struct work_struct *work)
+{
+	struct hinic3_nic_dev *nic_dev =
+		container_of(work, struct hinic3_nic_dev, rx_oom_work.work);
+	struct hinic3_rxq *rxq;
+	u16 q_id;
+
+	if (!test_bit(HINIC3_INTF_UP, &nic_dev->flags)) {
+		/* hinic3_open() sets the flag after the vport is enabled and
+		 * hinic3_close() clears it before the channel goes away, so
+		 * keep the pending queues and retry.  The teardown path
+		 * disables the work, which bounds the retries.
+		 */
+		schedule_delayed_work(&nic_dev->rx_oom_work,
+				      msecs_to_jiffies(HINIC3_RX_OOM_POLL_MS));
+		return;
+	}
+
+	for (q_id = 0; q_id < nic_dev->q_params.num_qps; q_id++) {
+		rxq = &nic_dev->rxqs[q_id];
+
+		if (!test_and_clear_bit(q_id, nic_dev->rx_oom_bitmap))
+			continue;
+
+		napi_schedule(&rxq->irq_cfg->napi);
+	}
+}
+
+void hinic3_rx_oom_schedule(struct net_device *netdev, u16 q_id)
+{
+	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
+
+	set_bit(q_id, nic_dev->rx_oom_bitmap);
+	schedule_delayed_work(&nic_dev->rx_oom_work,
+			      msecs_to_jiffies(HINIC3_RX_OOM_POLL_MS));
+}
+
 static int hinic3_alloc_txrxqs(struct net_device *netdev)
 {
 	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
@@ -94,14 +134,25 @@ static int hinic3_alloc_txrxqs(struct net_device *netdev)
 		goto err_free_txqs;
 	}
 
+	nic_dev->rx_oom_bitmap = bitmap_zalloc(nic_dev->max_qps, GFP_KERNEL);
+	if (!nic_dev->rx_oom_bitmap) {
+		dev_err(hwdev->dev, "Failed to alloc rx oom bitmap\n");
+		err = -ENOMEM;
+		goto err_free_rxqs;
+	}
+	INIT_DELAYED_WORK(&nic_dev->rx_oom_work, hinic3_rx_oom_work);
+
 	err = hinic3_init_intr_coalesce(netdev);
 	if (err) {
 		dev_err(hwdev->dev, "Failed to init_intr_coalesce\n");
-		goto err_free_rxqs;
+		goto err_free_rx_oom_bitmap;
 	}
 
 	return 0;
 
+err_free_rx_oom_bitmap:
+	bitmap_free(nic_dev->rx_oom_bitmap);
+	nic_dev->rx_oom_bitmap = NULL;
 err_free_rxqs:
 	hinic3_free_rxqs(netdev);
 err_free_txqs:
@@ -112,6 +163,12 @@ static int hinic3_alloc_txrxqs(struct net_device *netdev)
 
 static void hinic3_free_txrxqs(struct net_device *netdev)
 {
+	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
+
+	disable_delayed_work_sync(&nic_dev->rx_oom_work);
+	bitmap_free(nic_dev->rx_oom_bitmap);
+	nic_dev->rx_oom_bitmap = NULL;
+
 	hinic3_free_intr_coalesce(netdev);
 	hinic3_free_rxqs(netdev);
 	hinic3_free_txqs(netdev);
diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_dev.h b/drivers/net/ethernet/huawei/hinic3/hinic3_nic_dev.h
index 9502293ff710..5d6710f13b2c 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_nic_dev.h
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_nic_dev.h
@@ -112,6 +112,7 @@ struct hinic3_nic_dev {
 	struct hinic3_dyna_txrxq_params q_params;
 	struct hinic3_txq               *txqs;
 	struct hinic3_rxq               *rxqs;
+	unsigned long                   *rx_oom_bitmap;
 
 	enum hinic3_rss_hash_type       rss_hash_type;
 	struct hinic3_rss_type          rss_type;
@@ -126,6 +127,7 @@ struct hinic3_nic_dev {
 
 	struct workqueue_struct         *workq;
 	struct delayed_work             periodic_work;
+	struct delayed_work             rx_oom_work;
 	struct work_struct              rx_mode_work;
 	/* lock for enable/disable port */
 	struct mutex                    port_state_mutex;
@@ -145,6 +147,7 @@ void hinic3_set_netdev_ops(struct net_device *netdev);
 int hinic3_set_hw_features(struct net_device *netdev);
 int hinic3_qps_irq_init(struct net_device *netdev);
 void hinic3_qps_irq_uninit(struct net_device *netdev);
+void hinic3_rx_oom_schedule(struct net_device *netdev, u16 q_id);
 
 void hinic3_set_rx_mode_work(struct work_struct *work);
 void hinic3_clean_mac_list_filter(struct net_device *netdev);
diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
index 309ab5901379..ad6b65fce9c9 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
@@ -555,6 +555,8 @@ int hinic3_rx_poll(struct hinic3_rxq *rxq, int budget)
 	struct hinic3_nic_dev *nic_dev = netdev_priv(rxq->netdev);
 	u32 sw_ci, status, pkt_len, vlan_len;
 	struct hinic3_rq_cqe *rx_cqe;
+	bool poll_again = false;
+	bool oom = false;
 	u32 num_wqe = 0;
 	int nr_pkts = 0;
 	u16 num_lro;
@@ -571,8 +573,10 @@ int hinic3_rx_poll(struct hinic3_rxq *rxq, int budget)
 
 		vlan_len = le32_to_cpu(rx_cqe->vlan_len);
 		pkt_len = RQ_CQE_SGE_GET(vlan_len, LEN);
-		if (recv_one_pkt(rxq, rx_cqe, pkt_len, vlan_len, status))
+		if (recv_one_pkt(rxq, rx_cqe, pkt_len, vlan_len, status)) {
+			oom = true;
 			break;
+		}
 
 		nr_pkts++;
 		num_lro = RQ_CQE_STATUS_GET(status, NUM_LRO);
@@ -581,12 +585,24 @@ int hinic3_rx_poll(struct hinic3_rxq *rxq, int budget)
 
 		rx_cqe->status = 0;
 
-		if (num_wqe >= nic_dev->lro_replenish_thld)
+		if (num_wqe >= nic_dev->lro_replenish_thld) {
+			poll_again = true;
 			break;
+		}
+	}
+
+	if (rxq->delta >= HINIC3_RX_BUFFER_WRITE) {
+		u32 free_wqebbs = rxq->delta - 1;
+
+		/* Refill stops at the first failed allocation, so a short
+		 * refill may leave the ring without any WQE posted.
+		 */
+		if (hinic3_rx_fill_buffers(rxq) != free_wqebbs)
+			oom = true;
 	}
 
-	if (rxq->delta >= HINIC3_RX_BUFFER_WRITE)
-		hinic3_rx_fill_buffers(rxq);
+	if (unlikely(oom))
+		hinic3_rx_oom_schedule(rxq->netdev, rxq->q_id);
 
-	return nr_pkts;
+	return poll_again ? budget : nr_pkts;
 }
-- 
2.43.0

