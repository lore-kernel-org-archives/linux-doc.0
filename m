Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B3D2FFDFC
	for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 23:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764545741; cv=none; b=gh3cVEDqYItef+7HZAQRZC4vdIQ03G/hgMT6Bd+9y1GPdc57EwA5qTMKjx5NfdNI4NjzU1O/DgJ7NC2f2IEfA1U6JQ2mG1eyuybJf4pjmNZ714ZKVZidXSViezQSOr1u9m7RNB9SudZsZ4mX7kTQ+T/bbmowKEPEx7XZgDyjW6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764545741; c=relaxed/simple;
	bh=OGKzBuKu9HnGjv3V2KIOUMpBLQDNN5wbAGzT3ICtN0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OI/NLvD8cfhgpXr/Gvw9pX/AOn1ivp5TmFkkhi9jyCZkXNq2OVAw0J7PAdyikCYPNIObvUKXXntwu4b1WmokqJcFJAJUucgpjNygMYoY+MQyw2BQT975zO6id4jFRnllQe4pVA/cGwP+DBtAfedibxVHWYfUTFGvPfTmL579NvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOK7YvSz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOK7YvSz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so34854705e9.2
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 15:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764545738; x=1765150538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Etzl3qXtEXxRUk5ZEMYr8GzSvCBjbQ/vWysP4cG19PU=;
        b=QOK7YvSzRpIM3bmocDTZSTJZ+AT8aIuEJ68zb/9IfM3EH8n+V3khm6fZ54vC6Yeg/d
         k27s32TTV9aqixkwBGJzPzJAgPR5m+Ln06/MJXEfNWwAP2xsMAPJaPngIyRIbYmUhSoF
         yhqSGo5Yw/mUTf1bO0IsrT1NapU8git1uef7ourInA0Zjb56atcsEq7D2tRD1syPvo7V
         ZQIZ84sAONRc5byf3x4m5Vfkgjx76wb/k3cuP5/N/nhBS7thhug/gLRKyVycUBxiSjOm
         67tCPQtPsZinagA6YJzGB5kInMI1PRxiTCe886LOiKyTD5xeniNRwhInzQnPKeVL6ei/
         ZwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764545738; x=1765150538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Etzl3qXtEXxRUk5ZEMYr8GzSvCBjbQ/vWysP4cG19PU=;
        b=DJ2YWGdEY9q04zJp16/6Kq8ZtmZSkXP7+/paOLwSplWuKf9tanpANsQtHFTR0trB1o
         bCgXdGr6cwZSnsQUMvKbcIyGwNgc7A8xT7V5mOJ+/RAj1ATXyMmJSLmGhpI7qWFnLfBc
         lho6BGQhVtgf4ePttQNABYfXlZLx5chPPMNHe+vQN1U7vzuJft4g0cFK0OIGr7qi/ai4
         IdKrl73InK2eFBvwwswgpdHfafF2ylj9WhdiMffLQG9lYsklu4qtD7jRRxdDcM+J9Ac4
         XAVVJbEHLbrRmtD4hW75xuemoMcyeIGTMwvvC/I8V+6q4AA9CQPRytT6fP5d7GcXMgLy
         XDLw==
X-Forwarded-Encrypted: i=1; AJvYcCWUIL+47rjbMSAxBlrkM32+yOtEXrzT+OQ8yvsSqgO9pIsk7nbokHGl4syGqTy5e3dB6idOYhNQSC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbaprEkQ6kgiP1hvFRNTpG48PGbS6GU+p8UyOg2F4owy1YFSME
	A5QzCiGkqA5ldYD2P5u55lfVYvOHOtYF7EgtTgSItkFgBcFLKOz7/E2I
X-Gm-Gg: ASbGncuLVsFKwqvinTcnhuJVhakGwJ+X4y9GufDC4oQCOJP3Pr5HR72uJv////G1+xL
	MKpIZrrytvpySNi1aCvMxkyJaKJgoHxXMzeANhgkX4cEtJsfC1DbFkizf5HVYbReWHG/WjKha12
	Tymiadzi2UB6PlfQAx+8UD4odrP00IkgLUvZB1DD0KC+iD5CObjTO0DisQht4yizIg7x6+WcTGn
	hn9fo1rawnMFsF8oRgtC/0YH1UCYMcuq0xDVm7b0NR0Zxhg+0o4rSvx/tkN1gp8yT3aKfwL+3/Z
	qkBOCK9Y31E7YJNXDqUk4UVxRIHIMC1loXEhR5T6TqRNJdnQ2naVG1nu60wFkCQIRXAyssAO2Lw
	yFdHbBehuVrA/FqAh26peVYFcubsmJLM08GHRf8V4CFJeVo1PA41TKl4r0hhQNZWxnLE9ZnFrZd
	pnQ93HBnUTnGgfopwHy13JCOf4SRKQL6rfKrC/9MZWnDzDbvps0OWqRKkmfOqYsCHyCo9NHqkrj
	P8hHY0td8Nj64Vp
X-Google-Smtp-Source: AGHT+IGIUBkKFTjVVCw8JO88WO04GjOPBXSs8x48lo+BhVoIg3ql1cUd33a7wo+Dz7e5cUTvz/0ZMw==
X-Received: by 2002:a05:600c:1c1b:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-47904aebebdmr257224895e9.14.1764545737736;
        Sun, 30 Nov 2025 15:35:37 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040b3092sm142722075e9.1.2025.11.30.15.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 15:35:36 -0800 (PST)
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
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Yue Haibing <yuehaibing@huawei.com>,
	David Wei <dw@davidwei.uk>,
	Haiyue Wang <haiyuewa@163.com>,
	Jens Axboe <axboe@kernel.dk>,
	Joe Damato <jdamato@fastly.com>,
	Simon Horman <horms@kernel.org>,
	Vishwanath Seshagiri <vishs@fb.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	io-uring@vger.kernel.org,
	dtatulea@nvidia.com
Subject: [PATCH net-next v7 4/9] net: let pp memory provider to specify rx buf len
Date: Sun, 30 Nov 2025 23:35:19 +0000
Message-ID: <0364ec97cc65b7b7b7376b98438c2630fa2e003c.1764542851.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764542851.git.asml.silence@gmail.com>
References: <cover.1764542851.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow memory providers to configure rx queues with a specific receive
buffer length. Pass it in struct pp_memory_provider_params, which is
copied into the queue, so it's preserved across queue restarts. It's an
opt-in feature for drivers, which they can enable by setting
NDO_QUEUE_RX_BUF_SIZE to their struct netdev_queue_mgmt_ops.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/net/netdev_queues.h   | 9 +++++++++
 include/net/page_pool/types.h | 1 +
 net/core/netdev_rx_queue.c    | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/include/net/netdev_queues.h b/include/net/netdev_queues.h
index cd00e0406cf4..45c1d198f5bf 100644
--- a/include/net/netdev_queues.h
+++ b/include/net/netdev_queues.h
@@ -111,6 +111,11 @@ void netdev_stat_queue_sum(struct net_device *netdev,
 			   int tx_start, int tx_end,
 			   struct netdev_queue_stats_tx *tx_sum);
 
+enum {
+	/* queue restart support custom rx buffer sizes */
+	NDO_QUEUE_RX_BUF_SIZE		= 0x1,
+};
+
 /**
  * struct netdev_queue_mgmt_ops - netdev ops for queue management
  *
@@ -130,6 +135,8 @@ void netdev_stat_queue_sum(struct net_device *netdev,
  * @ndo_queue_get_dma_dev: Get dma device for zero-copy operations to be used
  *			   for this queue. Return NULL on error.
  *
+ * @supported_params: bitmask of supported features, see NDO_QUEUE_*
+ *
  * Note that @ndo_queue_mem_alloc and @ndo_queue_mem_free may be called while
  * the interface is closed. @ndo_queue_start and @ndo_queue_stop will only
  * be called for an interface which is open.
@@ -149,6 +156,8 @@ struct netdev_queue_mgmt_ops {
 						  int idx);
 	struct device *		(*ndo_queue_get_dma_dev)(struct net_device *dev,
 							 int idx);
+
+	unsigned int supported_params;
 };
 
 bool netif_rxq_has_unreadable_mp(struct net_device *dev, int idx);
diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
index 1509a536cb85..be74e4aec7b5 100644
--- a/include/net/page_pool/types.h
+++ b/include/net/page_pool/types.h
@@ -161,6 +161,7 @@ struct memory_provider_ops;
 struct pp_memory_provider_params {
 	void *mp_priv;
 	const struct memory_provider_ops *mp_ops;
+	u32 rx_buf_len;
 };
 
 struct page_pool {
diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
index a0083f176a9c..09d6f97e910e 100644
--- a/net/core/netdev_rx_queue.c
+++ b/net/core/netdev_rx_queue.c
@@ -29,6 +29,10 @@ int netdev_rx_queue_restart(struct net_device *dev, unsigned int rxq_idx)
 	    !qops->ndo_queue_mem_alloc || !qops->ndo_queue_start)
 		return -EOPNOTSUPP;
 
+	if (!(qops->supported_params & NDO_QUEUE_RX_BUF_SIZE) &&
+	    rxq->mp_params.rx_buf_len)
+		return -EOPNOTSUPP;
+
 	netdev_assert_locked(dev);
 
 	new_mem = kvzalloc(qops->ndo_queue_mem_size, GFP_KERNEL);
-- 
2.52.0

