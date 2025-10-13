Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B7F3148A0
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 14:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367248; cv=none; b=DRgepOY/5H8cBr1ej83HPGynz7+TsvcIZbuBRQW6r4aXMjwjE+SCHe29XkLyyE+hXn7NgGUdeloMdJyAJ4F0X0k9P7r/wcGr5rf0KIEOsofNMbWs+pR2feEtKRUcPYNaZQbPuCy8tdds4XYQW8r3WurJEjA6btqpR0CZVC5sV2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367248; c=relaxed/simple;
	bh=UN20xXoo/DIsknQaKnQS3nE5pqQGdfuGllMStEKfLhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+3JZDFlyRh6sWcOd/5EdSpJYuHQYiv/dg8c82OvNwoTvX3yBklk5hHqpVxCVbil46nMAU0hFzFhjvJKDEaDpYL3IIlhSQM9jHyWC1wTg7jfiZQO/oupR3qly3276eCtS3zmWhQWlAJtFcwPBJedoI7lhcXIKSwfjlJPYZ/Jmro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vqk0YYK4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vqk0YYK4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e430494ccso24899535e9.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 07:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760367243; x=1760972043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBVbea7flwKQsaU79NLWmhrt2gwy8JKbrcaG5BbSXQs=;
        b=Vqk0YYK4D39Lu3ifEgEsEVQoPaxkf9bJepAlOQBM79Vx3AxqTiUZmN0owgmjsEjzOG
         +EUXHJdOAb3fDTEloWsDBtBHUQDqOgTS4KrsQcwZ6AfcJ3pew8XTxJkywrhFfJupikPo
         gG6plI4kX8Stj5BPTj3JMNGg5bISxNAchPeDHn4pwm0tpwVcG0gLIPHKltmbZ+zvvQKv
         mgA/VlnG5okocDEzcM2C0Co+BFPDv25CGel0/VNvAtx038t3jqqACW8B8oevVONulD4+
         9NOxAE+P3JjJxpheoXkxJIKweAEnkxYtPSj43uf0lrtZUkcmIRh/utLnFyV1YR9SxEra
         RwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367243; x=1760972043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBVbea7flwKQsaU79NLWmhrt2gwy8JKbrcaG5BbSXQs=;
        b=IDacy5dGKzRJcmJtmIkCs48+XKFhbgP54JiqXZDks+AfcUjq/Yhv9jLBIGTm/Sa9/Q
         319RwXq6ftq1pYS7X1+qf987i8vOQSPZ+mqAXzW8tTidV5fyjOZbxfuh3+aNa0XzYw30
         G1ReRfJKed6PnS3UmJMeLNujS2dI7BbF3GhLtNkH4cbCuWc0iAlsfDrwPZhfe7vhTsLy
         8k//S+6iN6yjsRmR/fzde7EqADWEe8Q36XHf2PKM04+hBTGAgTwGa+4XgfNMcU9OdS6T
         6ko0Zb6Quwu5P0QpGZtM9YbxF3p8YLbC/j7vinGQ81DIqzI3t5xu/36Z0ct3Gb+ZFIny
         kNvg==
X-Forwarded-Encrypted: i=1; AJvYcCWm+16qzW2zjk3z7A7h9CSDwJCbk5oNlp9n0x1mpD2/T34CbGSCMNaKmKkgVgMxtCZdZ7sfk8I8jPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YySPEIk/b7qGZ4Adh56kjSX6uNDKxy/aeaSy9yosnnqpgWXsD+r
	YNnrjbd9Dh/y/azAr0ayhh2bqPLXXRhtKj8JMH6zAPO0lwF4xJSz69Vb
X-Gm-Gg: ASbGncu6rptUHv62Q3LduABYuoLP3fXlk4S1/I/CdBJ/PyK97jlpPmenlonLMQMPfG8
	8Pyw3nerBFRQ85XgCSqqB4zBsDWgYXci0j6otJ0kbnLpcFfh2BjlB+oAPV6ajKBi/QP31uxwacG
	f+8BuQUuVzx6mZrCC6BfS0SVck2LY7b8t7UsHQTcYcdf9ooBcfIWCrZmhd8u9SoiOnNjIwbqaof
	SJxAKEoeQPflnY1Q6dxQsFZVnP8lsHzNITicTtAg6ILoph0vnonQSvB1X+tzZdEqQMr822WaeTt
	gUeRKHotKhetJSJtxQDJh/fGqrLcY03Xe78VrhNiUxAWq/H5Rflv2ucuIbi7Y2Oa1M1M2mwOiTb
	psMExIgHMssGCdA53aDUVs6JH
X-Google-Smtp-Source: AGHT+IGvZad4w3tGfNyelo8jRaGthiTAOmBgbASb/CfTYlM5+kxTUyX0ReE6Y+6587qOM/YD4IdmEg==
X-Received: by 2002:a05:600c:1d1b:b0:46f:b32e:4f3e with SMTP id 5b1f17b1804b1-46fb32e4fa5mr121333895e9.37.1760367243089;
        Mon, 13 Oct 2025 07:54:03 -0700 (PDT)
Received: from 127.com ([2620:10d:c092:600::1:eb09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0e70sm18641085f8f.40.2025.10.13.07.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:54:02 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Jian Shen <shenjian15@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	kernel-team@meta.com,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Joe Damato <joe@dama.to>,
	David Wei <dw@davidwei.uk>,
	Willem de Bruijn <willemb@google.com>,
	Mina Almasry <almasrymina@google.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH net-next v4 22/24] eth: bnxt: support per queue configuration of rx-buf-len
Date: Mon, 13 Oct 2025 15:54:24 +0100
Message-ID: <29f1f23b21eb1de0920aa912bcbefc6312160102.1760364551.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1760364551.git.asml.silence@gmail.com>
References: <cover.1760364551.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jakub Kicinski <kuba@kernel.org>

Now that the rx_buf_len is stored and validated per queue allow
it being set differently for different queues. Instead of copying
the device setting for each queue ask the core for the config
via netdev_queue_config().

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index ea95a06ae62b..a734b18e47c4 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -4320,6 +4320,7 @@ static void bnxt_init_ring_struct(struct bnxt *bp)
 
 	for (i = 0; i < bp->cp_nr_rings; i++) {
 		struct bnxt_napi *bnapi = bp->bnapi[i];
+		struct netdev_queue_config qcfg;
 		struct bnxt_ring_mem_info *rmem;
 		struct bnxt_cp_ring_info *cpr;
 		struct bnxt_rx_ring_info *rxr;
@@ -4342,7 +4343,8 @@ static void bnxt_init_ring_struct(struct bnxt *bp)
 		if (!rxr)
 			goto skip_rx;
 
-		rxr->rx_page_size = bp->rx_page_size;
+		netdev_queue_config(bp->dev, i,	&qcfg);
+		rxr->rx_page_size = qcfg.rx_buf_len;
 
 		ring = &rxr->rx_ring_struct;
 		rmem = &ring->ring_mem;
@@ -15928,6 +15930,7 @@ static int bnxt_queue_mem_alloc(struct net_device *dev,
 	clone->rx_agg_prod = 0;
 	clone->rx_sw_agg_prod = 0;
 	clone->rx_next_cons = 0;
+	clone->rx_page_size = qcfg->rx_buf_len;
 	clone->need_head_pool = false;
 
 	rc = bnxt_alloc_rx_page_pool(bp, clone, rxr->page_pool->p.nid);
@@ -16032,6 +16035,8 @@ static void bnxt_copy_rx_ring(struct bnxt *bp,
 	src_ring = &src->rx_ring_struct;
 	src_rmem = &src_ring->ring_mem;
 
+	dst->rx_page_size = src->rx_page_size;
+
 	WARN_ON(dst_rmem->nr_pages != src_rmem->nr_pages);
 	WARN_ON(dst_rmem->page_size != src_rmem->page_size);
 	WARN_ON(dst_rmem->flags != src_rmem->flags);
@@ -16239,6 +16244,7 @@ bnxt_queue_cfg_defaults(struct net_device *dev, int idx,
 }
 
 static const struct netdev_queue_mgmt_ops bnxt_queue_mgmt_ops = {
+	.supported_ring_params	= ETHTOOL_RING_USE_RX_BUF_LEN,
 	.ndo_queue_mem_size	= sizeof(struct bnxt_rx_ring_info),
 
 	.ndo_queue_cfg_defaults	= bnxt_queue_cfg_defaults,
-- 
2.49.0

