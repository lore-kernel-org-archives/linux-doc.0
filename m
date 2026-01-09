Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5EA3587CA
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 11:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767958151; cv=none; b=Dc6yWrEEuH7yqkwOMn7HtCVn78PCSwuM1hvRfiwC+6WDyREKWzdKkqIorlVjMPJcqW95gwaXvAKKEbw4DHF/aiEbPi9x0pG1jVBmwcFvcAVejoyHgo7xrXEyn3BJ2KIUcY5qF6vVh663uVHgL27kjqNkD2lr2lGEQhIWzpFJVrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767958151; c=relaxed/simple;
	bh=hKOxjq4fxJ+iQfib8Cm75gZgmDPHfB9Dr0qLWGLYXFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cY7E+agIxxL3NRFpl6veH9ELJislivtUth08RxC6mL00r1vkhly5RwiPCJBnlByBusb+w2tBqfzU8I25rkwgbH+BLZ8irtBsg9apbxXzJQ85fFYf28Ib6LWiRW2UEy3dEsDZDnXp/XDT3pjnwOr11t5uP28X3ee7TXo3mQ3ZhAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHHhRw72; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHHhRw72"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so27625265e9.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 03:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767958146; x=1768562946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWL7hbAkNRsIM9hHu4g4BkFlYyqPgZDU68a7iQIhzDo=;
        b=HHHhRw72TWPZCJ341hwOHL6/05wsgcs23mXP7RxJGEyIoqolIVbOMIqTOfpQt19zRM
         05n786aOs0DWt84e8XLXAC5urr/+RJonEsXhgsyEH819l3O5KdywIuIfw0WnfhAmedEg
         uElfdPLyHABR9T9kn2/wImSEOSjFbFraxvGE4IWOrY27GvqYIpRjZdw0Tasra0/Bjn9X
         T2ihfDVlOFFSlA0l5EaD/n4v4vOGSjXZHeH81b4UhXAztYFI/Pix/7Hn/20PAtoPvrO0
         5dG/AjptJRhve38dtYwUa/tU1t2/T36wZ7vM52kc4sQM6AhFBe28pqD+JAL4a8l7eHnk
         rDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958146; x=1768562946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TWL7hbAkNRsIM9hHu4g4BkFlYyqPgZDU68a7iQIhzDo=;
        b=VsKNMVqF3Z7qPhPyQJBtGyfTDljdVDClr9vd+f0ikzEjV7oyLKBzUzRg7GL5yZLNpy
         e+65pGBmfxFbUeAlHuCNPFRoyXYYOGWPUCGMf+vvlZblXaLy+VycjyHWO6w5gLKEMR3O
         kF6hYCwWpwNHrufGt1UxJVjL8SfejYYy1wJhfRbldgXbkIb4IPqbU+5XomI9SQeaLyle
         IB6Bj94nKkamJMH85m2imoVy6/dk8JwSyM0d5p7SKy7rk1MPDjlq+yq8YC8A+JtI0wUp
         1LrQ4nWqpVbE8l4uKu7CjblflU6GRk/KJlUWRPhoMnNOd0jztmvssosc8TcUDrWd5cAV
         zHkA==
X-Forwarded-Encrypted: i=1; AJvYcCVeDmGTPGHk2ny7m11XMgxFYXQl+3wS8Ez8gfpC+H1JxpQe/3jaXlTgqa9jEolnFyIybq6gmHJeAQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPK53rGks0rJJfJNLDO1yCrfr3We6H1eqKGI/xrjxIRiC3C0rO
	Uz/1Xn4JCBDVD+ZoLn3uDyJ6kDQgRI7/TyTD5XBsf3jYiv/z1XK66TF5
X-Gm-Gg: AY/fxX4EuGdNLmrADs4xbewLnqmGB0K2KoYYNNiCygidXjx5Sfs50N8aHosDeK/6fUW
	DBrKyyY0O01xziFa/bEO3mFMgL+nZvT0rykmwYvPssymBaONQrEemYxf6Cgnj38Y/2ne0FKo7Jv
	CZGVDXZXL0s+hTEJIkG/fxDF8ClWBHENljt4178FzZLFpmEhJAzkr9M3b6G+RMPT6Nnixzyk9DX
	VJduo4aznHcSmdz0cTZVEvZoD8zLeV41HaNFiz65CRvj5B6gJKmvpyd/DtD0fXBtAif6QzFyLA/
	nSF5RAPoXzJtMNE8YlQ4d5NK1cOA+OtqnGokxyXQqeAv2vc2iO0ITkhS6t4j6hLAJT1G5oyVNXJ
	vQuW436qjU6F1DlE4dQ8i3049yld1N44q4a308elk7O8FTf+ltJhZOq+DFHjiN9VgZF1+kQdmTX
	gxKDSSr5xNNvB+HEkJla1mWoJzFueLR+5P24d4295scHmlrkgy9tlMJD3ImdiuJ0dFYCBU6w==
X-Google-Smtp-Source: AGHT+IEtu//eEPFSMQCQc0x4+ohl+/zP3PbtVY9Fq75VCKqTNmy1GQDGxEUmS6COuOk11FJ2AmC1hg==
X-Received: by 2002:a05:600c:1f8c:b0:477:7d94:5d0e with SMTP id 5b1f17b1804b1-47d84b40955mr99606675e9.27.1767958145751;
        Fri, 09 Jan 2026 03:29:05 -0800 (PST)
Received: from 127.com ([2620:10d:c092:600::1:69b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636c610sm60056985e9.0.2026.01.09.03.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:29:05 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Ankit Garg <nktgrg@google.com>,
	Tim Hostetler <thostet@google.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Ziwei Xiao <ziweixiao@google.com>,
	John Fraker <jfraker@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Joe Damato <joe@dama.to>,
	Mina Almasry <almasrymina@google.com>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Ahmed Zaki <ahmed.zaki@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	David Wei <dw@davidwei.uk>,
	Yue Haibing <yuehaibing@huawei.com>,
	Haiyue Wang <haiyuewa@163.com>,
	Jens Axboe <axboe@kernel.dk>,
	Simon Horman <horms@kernel.org>,
	Vishwanath Seshagiri <vishs@fb.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	dtatulea@nvidia.com,
	io-uring@vger.kernel.org
Subject: [PATCH net-next v8 4/9] net: pass queue rx page size from memory provider
Date: Fri,  9 Jan 2026 11:28:43 +0000
Message-ID: <da8aa10eaa0e4dce52a0b39ed7e3829eb70e22f5.1767819709.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1767819709.git.asml.silence@gmail.com>
References: <cover.1767819709.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow memory providers to configure rx queues with a custom receive
page size. It's passed in struct pp_memory_provider_params, which is
copied into the queue, so it's preserved across queue restarts. Then,
it's propagated to the driver in a new queue config parameter.

Drivers should explicitly opt into using it by setting
QCFG_RX_PAGE_SIZE, in which case they should implement ndo_default_qcfg,
validate the size on queue restart and honour the current config in case
of a reset.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/net/netdev_queues.h   | 10 ++++++++++
 include/net/page_pool/types.h |  1 +
 net/core/netdev_rx_queue.c    |  9 +++++++++
 3 files changed, 20 insertions(+)

diff --git a/include/net/netdev_queues.h b/include/net/netdev_queues.h
index f6f1f71a24e1..feca25131930 100644
--- a/include/net/netdev_queues.h
+++ b/include/net/netdev_queues.h
@@ -15,6 +15,7 @@ struct netdev_config {
 };
 
 struct netdev_queue_config {
+	u32	rx_page_size;
 };
 
 /* See the netdev.yaml spec for definition of each statistic */
@@ -114,6 +115,11 @@ void netdev_stat_queue_sum(struct net_device *netdev,
 			   int tx_start, int tx_end,
 			   struct netdev_queue_stats_tx *tx_sum);
 
+enum {
+	/* The queue checks and honours the page size qcfg parameter */
+	QCFG_RX_PAGE_SIZE	= 0x1,
+};
+
 /**
  * struct netdev_queue_mgmt_ops - netdev ops for queue management
  *
@@ -135,6 +141,8 @@ void netdev_stat_queue_sum(struct net_device *netdev,
  *
  * @ndo_default_qcfg:	Populate queue config struct with defaults. Optional.
  *
+ * @supported_params:	Bitmask of supported parameters, see QCFG_*.
+ *
  * Note that @ndo_queue_mem_alloc and @ndo_queue_mem_free may be called while
  * the interface is closed. @ndo_queue_start and @ndo_queue_stop will only
  * be called for an interface which is open.
@@ -158,6 +166,8 @@ struct netdev_queue_mgmt_ops {
 				    struct netdev_queue_config *qcfg);
 	struct device *	(*ndo_queue_get_dma_dev)(struct net_device *dev,
 						 int idx);
+
+	unsigned int supported_params;
 };
 
 bool netif_rxq_has_unreadable_mp(struct net_device *dev, int idx);
diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
index 1509a536cb85..0d453484a585 100644
--- a/include/net/page_pool/types.h
+++ b/include/net/page_pool/types.h
@@ -161,6 +161,7 @@ struct memory_provider_ops;
 struct pp_memory_provider_params {
 	void *mp_priv;
 	const struct memory_provider_ops *mp_ops;
+	u32 rx_page_size;
 };
 
 struct page_pool {
diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
index 86d1c0a925e3..b81cad90ba2f 100644
--- a/net/core/netdev_rx_queue.c
+++ b/net/core/netdev_rx_queue.c
@@ -30,12 +30,21 @@ int netdev_rx_queue_restart(struct net_device *dev, unsigned int rxq_idx)
 	    !qops->ndo_queue_mem_alloc || !qops->ndo_queue_start)
 		return -EOPNOTSUPP;
 
+	if (WARN_ON_ONCE(qops->supported_params && !qops->ndo_default_qcfg))
+		return -EINVAL;
+
 	netdev_assert_locked(dev);
 
 	memset(&qcfg, 0, sizeof(qcfg));
 	if (qops->ndo_default_qcfg)
 		qops->ndo_default_qcfg(dev, &qcfg);
 
+	if (rxq->mp_params.rx_page_size) {
+		if (!(qops->supported_params & QCFG_RX_PAGE_SIZE))
+			return -EOPNOTSUPP;
+		qcfg.rx_page_size = rxq->mp_params.rx_page_size;
+	}
+
 	new_mem = kvzalloc(qops->ndo_queue_mem_size, GFP_KERNEL);
 	if (!new_mem)
 		return -ENOMEM;
-- 
2.52.0

