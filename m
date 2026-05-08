Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2547261B92
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 02:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778207305; cv=none; b=Yb4uCFYPmasOvvuq2NPHRT/Sh+qP0xKCkJeGawEQpfVJbBW4lU47XiB5ox5ArZgq73n8yUmTl+uo0+8N/yCPDseN8rK9nIOMhXSUzaGttsh9KBa2dpDh1/Yd4duFB7JQuvCBUzEYYZlPL9SpE4wSywkmjFujvN4EosjK+eHJQe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778207305; c=relaxed/simple;
	bh=+7QTIX5Jfo66d6mEZMrs1AEpc/60dOeYIBi72Pnw4Oc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uksfmQoQmqqtEgjjFZvxMiw5EqKe8gHngUbx+1XAOU8X72vcARFCfV3Fx+Cqk+wgYtk9yzNWOmvbyIvVjWUyDVfAtCWpOkJ2XtJqqze/GxPVIBbtqce1eLUMznOSHORIuAB9SvO3ndhORvFmzlwTWuT+Qdr1MprmZAnSEm0PMyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLpKlMdD; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLpKlMdD"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8f15e900586so77785085a.1
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 19:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778207299; x=1778812099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUYPma61DuZ861cw0OU1+Spsgt2qqloLMXWRlKAMWS0=;
        b=WLpKlMdDWf8ssoDqTXeiMepCA96DEA1XW7hGQxqGsGeLdlxdDtNoLM3wpEjNWyuNe3
         cfLunuPjxcWCJ1J5eXbthIGzawsbSJRSrwXL5XCyC961BZfOA2+sX9qNTkxhicO/TsC8
         77SPgredSwe/tLHa+9ZNPS8IB80caRPt67FU4LHsvRo/0BequWoPF4+mnIFsnCreqNCN
         kLEeg5pONNPf8Wxhda8EwLnHe6wCjJj4Jupm8Wab1WlMmdhDrM0kdbPv9GZMQ0b9PtOs
         kTvc8VgBSYRPw/7clbN2sKHer3AkBPIjlKMfA6jDy7I8vsENHdGBbQnPVyP3lgYrBU+9
         AU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778207299; x=1778812099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KUYPma61DuZ861cw0OU1+Spsgt2qqloLMXWRlKAMWS0=;
        b=tV6ueNmelgUG29z1sHBejGPrqvTR6E/eEweI7W95khYCQPJyT4Izw1vtYlD1KUlW2k
         Nmdwioe1X2nqR57cYutMTQIqaUaJtnTSIXahakf3pMB8x4zQZflRB64AtVeuQS6D2o7b
         EPr7aVZe1Hu4kMtYABGSnXh1+P0aQh0c2bRiyg9G7EEX+eYvrlp9snDpFTi0ULmYrhQ8
         Bt2zPSjsHizE2/SBmpP6KjwsxuWq0rBubaWwLVxzka2V5PRNxV0NA528T0uuDuiMBZcI
         tLPKBs113b0jyru1NKZuDS/1KCzLrYPzOs4vhdoZX1lyG1atjVd+Hq6uSSfo4CVKVm0R
         cTPA==
X-Forwarded-Encrypted: i=1; AFNElJ89/ldMSLToh7lCo6ADagrzfvp9F5+chnD0jlgMQJz/ibh7Bi3b6pJhko4RWpxdot98SHWQf23cv54=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPK5gAuWQRVz+4G1bdhgEPqO4HkhiYHK6BGCW3wEGjJxksrac9
	K8gAXtqJpnaUb69/+5mzOpzntBsN2Be8+3brOTv8EfHb35N4XwqbUoxO
X-Gm-Gg: AeBDiesVnCXZR7KbF8SJen9imuG4dOqC/0i8t8haftPvKt8R93ZIf55v9LMNuz2pr2V
	Te0BbJJAOkgyBv2bqnpujX0fHT2HIRbuPMs0AflUGN/FYLiTd7yogTFRNQbpnaM3YwWkWeYkXXL
	7NAH1aKuSUAFf6pF4/DL7//5ey1VMGuk6EQhWAce1pcMGAs+fCJsn7t7UDf9Vrr+qTXj/S036Lo
	UrYp9g9CrqPxgEmdovdro9SPz+chn35GdxvbJhEk64oUVbygZPtKeZLh819Nkgi5ADbr1pg8XN6
	+D7ERACxLg0d26gufzIyhCf1SLCcIU/n9g+t2C3dRsZaqpofUFPf+DWSJC2ZfrVYEtQZvDxyb7G
	3/3a8CkKYhuogWpOIgkUXgnxDcfZCU0bkrdl0rGs7RWkFGI8Xwz55Mdzxu0AtJlP6bDe5Iu3qim
	rDWZbB9Sgisbi9Y1TvevFHDZJxFg+QSwOz
X-Received: by 2002:a05:620a:bd3:b0:8c6:d309:f9c0 with SMTP id af79cd13be357-904d3fa42e0mr1519549685a.8.1778207298730;
        Thu, 07 May 2026 19:28:18 -0700 (PDT)
Received: from localhost ([2a03:2880:f800:45::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm63298085a.19.2026.05.07.19.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 19:28:18 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Thu, 07 May 2026 19:27:48 -0700
Subject: [PATCH net-next v3 3/8] net: devmem: support TX over
 NETMEM_TX_NO_DMA devices
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-tcp-dm-netkit-v3-3-52821445867c@meta.com>
References: <20260507-tcp-dm-netkit-v3-0-52821445867c@meta.com>
In-Reply-To: <20260507-tcp-dm-netkit-v3-0-52821445867c@meta.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Michael Chan <michael.chan@broadcom.com>, 
 Pavan Chebbi <pavan.chebbi@broadcom.com>, 
 Joshua Washington <joshwash@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Michael Chan <michael.chan@broadcom.com>, 
 Pavan Chebbi <pavan.chebbi@broadcom.com>, 
 Joshua Washington <joshwash@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
Cc: dw@davidwei.uk, sdf.kernel@gmail.com, mohsin.bashr@gmail.com, 
 willemb@google.com, jiang.kun2@zte.com.cn, xu.xin16@zte.com.cn, 
 wang.yaxin@zte.com.cn, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

When a netkit virtual device leases queues from a physical NIC, devmem
TX bindings created on the netkit device must still result in the dmabuf
being mapped for dma by the physical device. This patch accomplishes
this by teaching the bind handler to search for the underlying
DMA-capable device by looking it up via leased rx queues. The function
netdev_find_netmem_tx_dev(), used for finding the underlying DMA-capable
device, can be extended to support other non-netkit NETMEM_TX_NO_DMA
devices in the future if needed.

Additionally, this patch extends validate_xmit_unreadable_skb() to
support the netkit case, where the skb is validated twice: once on the
netkit guest device and again on the physical NIC after BPF redirect or
ip forwarding.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v3:
- Fix validate_xmit_unreadable_skb() bug for non-devmem
  unreadable niovs (should not be dropped)
- Major simplification of validate_xmit_unreadable_skb()
- Fix prematurely released lock in bind-tx handler (Jakub)

Changes in v2:
- In validate_xmit_unreadable_skb() to check netmem_tx mode before
  inspecting frags (Jakub)
- Lock bind_dev around netdev_queue_get_dma_dev() when bind_dev !=
  netdev to fix lockdep (Sashiko)
---
 net/core/dev.c         |  3 +++
 net/core/devmem.c      |  6 +++--
 net/core/devmem.h      |  9 ++++++--
 net/core/netdev-genl.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++----
 4 files changed, 72 insertions(+), 9 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index fbe4c328a367..268417c9ef22 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3999,6 +3999,9 @@ static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
 	if (dev->netmem_tx == NETMEM_TX_NONE)
 		goto out_free;
 
+	if (dev->netmem_tx == NETMEM_TX_NO_DMA)
+		goto out;
+
 	shinfo = skb_shinfo(skb);
 
 	if (shinfo->nr_frags > 0) {
diff --git a/net/core/devmem.c b/net/core/devmem.c
index cde4c89bc146..644c286b778f 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -181,7 +181,7 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 }
 
 struct net_devmem_dmabuf_binding *
-net_devmem_bind_dmabuf(struct net_device *dev,
+net_devmem_bind_dmabuf(struct net_device *dev, struct net_device *vdev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
 		       unsigned int dmabuf_fd, struct netdev_nl_sock *priv,
@@ -212,6 +212,7 @@ net_devmem_bind_dmabuf(struct net_device *dev,
 	}
 
 	binding->dev = dev;
+	binding->vdev = vdev;
 	xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
 
 	err = percpu_ref_init(&binding->ref,
@@ -397,7 +398,8 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 	 */
 	dst_dev = dst_dev_rcu(dst);
 	if (unlikely(!dst_dev) ||
-	    unlikely(dst_dev != READ_ONCE(binding->dev))) {
+	    unlikely(dst_dev != READ_ONCE(binding->dev) &&
+		     dst_dev != READ_ONCE(binding->vdev))) {
 		err = -ENODEV;
 		goto out_unlock;
 	}
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 1c5c18581fcb..f399632b3c4b 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -19,7 +19,12 @@ struct net_devmem_dmabuf_binding {
 	struct dma_buf *dmabuf;
 	struct dma_buf_attachment *attachment;
 	struct sg_table *sgt;
+	/* Physical NIC that does the actual DMA for this binding. */
 	struct net_device *dev;
+	/* Virtual device (e.g. netkit) the user called bind-tx on. Must be
+	 * NETMEM_TX_NO_DMA.
+	 */
+	struct net_device *vdev;
 	struct gen_pool *chunk_pool;
 	/* Protect dev */
 	struct mutex lock;
@@ -84,7 +89,7 @@ struct dmabuf_genpool_chunk_owner {
 
 void __net_devmem_dmabuf_binding_free(struct work_struct *wq);
 struct net_devmem_dmabuf_binding *
-net_devmem_bind_dmabuf(struct net_device *dev,
+net_devmem_bind_dmabuf(struct net_device *dev, struct net_device *vdev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
 		       unsigned int dmabuf_fd, struct netdev_nl_sock *priv,
@@ -165,7 +170,7 @@ static inline void net_devmem_put_net_iov(struct net_iov *niov)
 }
 
 static inline struct net_devmem_dmabuf_binding *
-net_devmem_bind_dmabuf(struct net_device *dev,
+net_devmem_bind_dmabuf(struct net_device *dev, struct net_device *vdev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
 		       unsigned int dmabuf_fd,
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 4d2c49371cdb..b4d48f3672a5 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1077,7 +1077,7 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 		goto err_rxq_bitmap;
 	}
 
-	binding = net_devmem_bind_dmabuf(netdev, dma_dev, DMA_FROM_DEVICE,
+	binding = net_devmem_bind_dmabuf(netdev, NULL, dma_dev, DMA_FROM_DEVICE,
 					 dmabuf_fd, priv, info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
@@ -1119,9 +1119,43 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 	return err;
 }
 
+/* Find the DMA-capable device for a netmem TX binding.
+ *
+ * For NETMEM_TX_DMA devices, return the device itself.
+ * For NETMEM_TX_NO_DMA devices, walk leased RX queues to find the underlying
+ * physical device and return it.
+ */
+static struct net_device *
+netdev_find_netmem_tx_dev(struct net_device *dev)
+{
+	struct netdev_rx_queue *lease_rxq;
+	struct net_device *phys_dev;
+	int i;
+
+	if (dev->netmem_tx == NETMEM_TX_DMA)
+		return dev;
+
+	if (dev->netmem_tx != NETMEM_TX_NO_DMA)
+		return NULL;
+
+	for (i = 0; i < dev->real_num_rx_queues; i++) {
+		lease_rxq = READ_ONCE(__netif_get_rx_queue(dev, i)->lease);
+		if (!lease_rxq)
+			continue;
+
+		phys_dev = lease_rxq->dev;
+		if (netif_device_present(phys_dev) &&
+		    phys_dev->netmem_tx == NETMEM_TX_DMA)
+			return phys_dev;
+	}
+
+	return NULL;
+}
+
 int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct net_devmem_dmabuf_binding *binding;
+	struct net_device *bind_dev;
 	struct netdev_nl_sock *priv;
 	struct net_device *netdev;
 	struct device *dma_dev;
@@ -1171,22 +1205,41 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 		goto err_unlock_netdev;
 	}
 
-	dma_dev = netdev_queue_get_dma_dev(netdev, 0, NETDEV_QUEUE_TYPE_TX);
-	binding = net_devmem_bind_dmabuf(netdev, dma_dev, DMA_TO_DEVICE,
-					 dmabuf_fd, priv, info->extack);
+	bind_dev = netdev_find_netmem_tx_dev(netdev);
+	if (!bind_dev) {
+		err = -EOPNOTSUPP;
+		NL_SET_ERR_MSG(info->extack,
+			       "No DMA-capable device found for netmem TX");
+		goto err_unlock_netdev;
+	}
+
+	if (bind_dev != netdev)
+		netdev_lock(bind_dev);
+
+	dma_dev = netdev_queue_get_dma_dev(bind_dev, 0, NETDEV_QUEUE_TYPE_TX);
+
+	binding = net_devmem_bind_dmabuf(bind_dev,
+					 bind_dev != netdev ? netdev : NULL,
+					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
+					 priv, info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
-		goto err_unlock_netdev;
+		goto err_unlock_bind_dev;
 	}
 
 	nla_put_u32(rsp, NETDEV_A_DMABUF_ID, binding->id);
 	genlmsg_end(rsp, hdr);
 
+	if (bind_dev != netdev)
+		netdev_unlock(bind_dev);
 	netdev_unlock(netdev);
 	mutex_unlock(&priv->lock);
 
 	return genlmsg_reply(rsp, info);
 
+err_unlock_bind_dev:
+	if (bind_dev != netdev)
+		netdev_unlock(bind_dev);
 err_unlock_netdev:
 	netdev_unlock(netdev);
 err_unlock_sock:

-- 
2.53.0-Meta

