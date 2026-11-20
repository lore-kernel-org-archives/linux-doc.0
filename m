Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144478;
	b=L1t0NdHU2cB0lEQfQC0NdtJsA31fw9sSzUErOZ0oZ2kKexyK7wZd5UBdGInwvOws1461
	 H951Z5btSzqNK5Gjb5Gl4T31tshWamu4kVCEhbFfseOK+1FlQ3N+QEGVIFwUe/zkp5/fi
	 kRZJws+YCCX7z4eC+FiTCAdxgg/5FY3CnGte4hU0HTpWmcg3xyFReDhmApG7PBt1V4Doz
	 0BqcWQ06oI+TuJcVM8nrEx1rJA3ZagEDW6KhfSvq+jxpfxnAQsP68K7wuUCoAX3nGRwpD
	 iIRw8d6ulUdB56uk1Wq9JW2NbDF9XddXKAA/AlLamCfQlX1CTrMMWNsQXViC17VpwYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144478;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Fqhyxi/XKJk1CMXUwqX3Zy5btmxTmfCzun9LLTwYHuw=;
	b=uFl5bGdY0lh4PB8FWTBOg7+UFdvoXwRGMueH2Y2xLWCD6iHrb5EeZcpQWCWAmu3Ivmsj
	 AZx5pIpJIZF4O7D5h2vpF9BEsxeeycdoKPM6zPq8EMZCGZ0IHYc9empy1ubpGPKsqCCO2
	 V65fZBFgXBEqYkNHeap3+yYB146ZH8PvtjXLQYBkSyYLD2FFxFtu6M1HAfjXZ1sV5RSSU
	 kn8TSrvGY86VirheE1GKgJ8pZAGW3w7c0ebtDaQe7XQ0ed3VCkFVuea3erVCWEFj/m1bM
	 RFr5awsIi1ioaVYsSCHusm0fCe8tvqoOUfGq72kNyDjlbxo2QY1jgL6YLSdja2zDFMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=pQZYSPhC;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC55D606A32A;
	Fri, 20 Nov 2026 03:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC55D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=pQZYSPhC
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Fqhyxi/XKJk1CMXUwqX3Zy5btmxTmfCzun9LLTwYHuw=;
	b=pQZYSPhCEOpPwp7cbP3+kBCffu2wL2D43VzEqSYzSZsard4HrrJBsOgxeoxuZc+HS8HfAPyLL
	dF681+mQ3DcCKr3p+tHwiYudeoWgEZSL55udnx+6wgXJT8Y74XjD0fdY94A1nQG35/IUYYPPTan
	FmVWDEzyceoi6rSxEPr0Uv8=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jW0mg6T8YzKm9b;
	Fri, 20 Nov 2026 11:14:11 +0800 (CST)
Received: from dggpemr100007.china.huawei.com (unknown [7.185.36.44])
	by mail.maildlp.com (Postfix) with ESMTPS id 5CCDF40578;
	Fri, 20 Nov 2026 11:14:27 +0800 (CST)
Received: from whupemq100015.china.huawei.com (7.152.185.230) by
 dggpemr100007.china.huawei.com (7.185.36.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 20 Nov 2026 11:14:27 +0800
Received: from DESKTOP-62GVMTR.china.huawei.com (10.174.220.94) by
 whupemq100015.china.huawei.com (7.152.185.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 20 Nov 2026 11:14:24 +0800
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
Subject: [PATCH net-next v05 1/1] hinic3: Fix the RX stalls in hinic3_rx_poll()
Date: Fri, 20 Nov 2026 11:14:14 +0800
Message-ID: <108db7be0cfa01bebd988de86750d9f4b8c0e6cf.1795144996.git.gongfan1@huawei.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <cover.1795144996.git.gongfan1@huawei.com>
References: <cover.1795144996.git.gongfan1@huawei.com>
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
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemq100015.china.huawei.com (7.152.185.230)

hinic3_rx_poll() leaves the loop early in three cases, and hinic3_poll()
then completes NAPI and re-enables the edge triggered MSI-X interrupt:

  - a large LRO packet consumed enough WQEs to cross lro_replenish_thld;
  - napi_alloc_skb() failed in recv_one_pkt();
  - hinic3_rx_fill_buffers() posted fewer WQEs than rxq->delta - 1 because
    page_pool_dev_alloc_frag() failed.

In the first case a completed CQE still sits at the head of the ring, so
nothing re-arms the queue when no further packet arrives.  In the other
two the ring ends up without posted WQEs, and a full RX ring makes the
device stop raising interrupts, so the queue stays dead until the
interface is reset.

For the first case return budget so that hinic3_poll() skips
napi_complete_done() and NAPI runs again immediately; every pass consumes
CQEs, so the polling terminates.

Returning budget on the allocation failures as well would keep NAPI
running until the allocator recovers, which spins a CPU under prolonged
memory pressure.  Handle those two cases with a software recovery path
instead, the same way hns3 does: record the affected queue in a per-queue
bitmap and re-arm NAPI from a delayed work 250ms later, independent of
the hardware interrupts.  The work calls napi_schedule() for every queue
that failed and does nothing when the interface is down, so a work that
races with a close only clears the bits.

The bitmap is allocated together with the Tx/Rx queues and freed after
the delayed work is cancelled.  hinic3_qps_irq_uninit() cancels the work
before the NAPI instances are torn down and before the channel resources
are released, so the work never dereferences a freed irq_cfg.  The bitmap
is cleared when the queues are brought up, so a queue that is brought up
again does not inherit a stale bit.

Fixes: 17fcb3dc12bb ("hinic3: module initialization and tx/rx logic")
Co-developed-by: Wu Di <wudi234@huawei.com>
Signed-off-by: Wu Di <wudi234@huawei.com>
Co-developed-by: Teng Peisen <tengpeisen@huawei.com>
Signed-off-by: Teng Peisen <tengpeisen@huawei.com>
Signed-off-by: Fan Gong <gongfan1@huawei.com>
---
 .../net/ethernet/huawei/hinic3/hinic3_irq.c   |  5 ++
 .../net/ethernet/huawei/hinic3/hinic3_main.c  | 51 ++++++++++++++++++-
 .../ethernet/huawei/hinic3/hinic3_nic_dev.h   |  3 ++
 .../net/ethernet/huawei/hinic3/hinic3_rx.c    | 26 ++++++++--
 4 files changed, 79 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c b/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c
index e7d6c2033b45..f83c1be0c808 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_irq.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 
+#include <linux/bitmap.h>
 #include <linux/dim.h>
 #include <linux/netdevice.h>
 
@@ -205,6 +206,8 @@ int hinic3_qps_irq_init(struct net_device *netdev)
 	u16 q_id;
 	int err;
 
+	bitmap_zero(nic_dev->rx_oom_bitmap, nic_dev->max_qps);
+
 	for (q_id = 0; q_id < nic_dev->q_params.num_qps; q_id++) {
 		msix_entry = &nic_dev->qps_msix_entries[q_id];
 		irq_cfg = &nic_dev->q_params.irq_cfg[q_id];
@@ -273,6 +276,8 @@ void hinic3_qps_irq_uninit(struct net_device *netdev)
 	struct hinic3_irq_cfg *irq_cfg;
 	u16 q_id;
 
+	cancel_delayed_work_sync(&nic_dev->rx_oom_work);
+
 	for (q_id = 0; q_id < nic_dev->q_params.num_qps; q_id++) {
 		irq_cfg = &nic_dev->q_params.irq_cfg[q_id];
 		qp_del_napi(irq_cfg);
diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_main.c b/drivers/net/ethernet/huawei/hinic3/hinic3_main.c
index 0a888fe4c975..5cc064f9351a 100644
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
@@ -76,6 +79,35 @@ static void hinic3_free_intr_coalesce(struct net_device *netdev)
 	kfree(nic_dev->intr_coalesce);
 }
 
+static void hinic3_rx_oom_work(struct work_struct *work)
+{
+	struct hinic3_nic_dev *nic_dev =
+		container_of(work, struct hinic3_nic_dev, rx_oom_work.work);
+	struct hinic3_rxq *rxq;
+	u16 q_id;
+
+	for (q_id = 0; q_id < nic_dev->q_params.num_qps; q_id++) {
+		rxq = &nic_dev->rxqs[q_id];
+
+		if (!test_and_clear_bit(q_id, nic_dev->rx_oom_bitmap))
+			continue;
+
+		if (!test_bit(HINIC3_INTF_UP, &nic_dev->flags))
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
@@ -94,14 +126,25 @@ static int hinic3_alloc_txrxqs(struct net_device *netdev)
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
+		goto err_free_bitmap_zalloc;
 	}
 
 	return 0;
 
+err_free_bitmap_zalloc:
+	bitmap_free(nic_dev->rx_oom_bitmap);
+	nic_dev->rx_oom_bitmap = NULL;
 err_free_rxqs:
 	hinic3_free_rxqs(netdev);
 err_free_txqs:
@@ -112,6 +155,12 @@ static int hinic3_alloc_txrxqs(struct net_device *netdev)
 
 static void hinic3_free_txrxqs(struct net_device *netdev)
 {
+	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
+
+	cancel_delayed_work_sync(&nic_dev->rx_oom_work);
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

