Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBC7268C48
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 03:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745377897; cv=none; b=DSEXlQaO1UBbS0/n9/yPaMh2fTYwY/9uSHoV/apTAJUzBjxy2Qb5RrZzziDQs8H6nDSu9Su0OIlXBGOaqDZnpjF2PQIqkUJT3xjfoOKvTycT4ZIYohJ7NdYnedgUZgHMeOAVpI1R9ZowBYuU2fklu6LGrfcUCIzS1QWrkFIGpZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745377897; c=relaxed/simple;
	bh=R1n+zaUcaajUS+QJKbtDHHCIKgGrd7M1r+jqgogtioc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jVRiOG2A+mZuHTMCzKJ4bEpP2UgtPdsGPaIRxrXi0hpcuw5R9HV0llnl9yVWlmNlJpGGwHrJWkIXkQ8qXLFqTFOvDSjxLW1AWWVtvX560YutyUoga8Rt9kMSK9uYgTvD1dtif8oOAPDKMVwioCSfb4g13cNbFaRkbfNJnBZY778=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qSFJGB83; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qSFJGB83"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso4191814b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 20:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745377893; x=1745982693; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dj0whsIoLIY8xfxGCTW0cmb/UVxuNztUDb84L0w97oo=;
        b=qSFJGB83mtZTFSGuIDKqDqwiH3nTnArBaexGZq8tCF0Iw8eXKbZ+mvh2pV0wXTLGkx
         BMfG877VmOzYCJQLx2TO0JBDrlC+69g0Gj9M9Mki64STVL3833Q++/KzO0yDhRgXYtRG
         FVEzSWok9O+EpLLIH94yJkCPpWN3OctTURLUsAK+m8QjEYDaT/chKUO3QRl0h4lYKz0T
         eTG3cpxDeLaLDi4XOuMA/BZ1HSVeeOIoQ0mWbGGC6i/ZpITxEozd65HQMNrG61qjkcW0
         SowEz9hLdtSPz1lgNWhjPOd+X7pajptOIGOywDRnJoR5LGEj46H7aotsToRfpjmjH8Hu
         NkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745377893; x=1745982693;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dj0whsIoLIY8xfxGCTW0cmb/UVxuNztUDb84L0w97oo=;
        b=T4GiuQte8ExdDi3+s5dGsVbdn5NXksw32ao5q1OI+1vJcmbEub+f6xbzkiCLqkhLVp
         Lb+cK9IiADiLhpWDyQ53X01lfUXmeCgShPpNDh9nSbJWZ67OvYb2d91w5eb6nN3cwi8A
         ZLqZ8SWhXrLuIqrlqdmnF/CXRAL6ZtWJUCxFOQSZV5sTIewBTDVPpl92KXEgxYQLWDGB
         HraQpqgG4FBd5as9veCIvrqymW7OJ2MlFJSqNgSpTubnpyQ7L6scHu4mKOqk8+nRiL+3
         SaUkFc7rx8LR2eI5S9idqfkDdSZbc9OnbExuTEdDrSROdOste4YzmkiDBvhxKJq7p58E
         S+kA==
X-Forwarded-Encrypted: i=1; AJvYcCW63L9yyaaiQ2VgdewTgJEJsXUz0GlHJyeuIDQ5qLTBJfZhTZYyBbZyil9EEtmtxTjmsjsvABRk2eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHDgX43X8MohpWDfqBmHMGl69ABGvfnb0sflrN5BsrsNvkwTjb
	9w0oWXQjjEf5NIomWwHHfPhxLh11YpSzj8SXKkdwAM3YJ03fjDIqtDyxRAETo1UbAJIC6RKPnRh
	Zi91npQqiHHak0g235v3JCQ==
X-Google-Smtp-Source: AGHT+IEznertOZQbmSsfV0WFF7VBpVpkcqUX6bXWoLaE6jTBVKTuO7UdKxqSHSGv3VnIIE1gjXxfUrhCi7P19IBIIw==
X-Received: from pge16.prod.google.com ([2002:a05:6a02:2d10:b0:af9:8f44:d7ec])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3399:b0:1fd:f48b:f397 with SMTP id adf61e73a8af0-203cbc76991mr24720535637.23.1745377892877;
 Tue, 22 Apr 2025 20:11:32 -0700 (PDT)
Date: Wed, 23 Apr 2025 03:11:14 +0000
In-Reply-To: <20250423031117.907681-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423031117.907681-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423031117.907681-8-almasrymina@google.com>
Subject: [PATCH net-next v10 7/9] gve: add netmem TX support to GVE DQO-RDA mode
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, io-uring@vger.kernel.org, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"

Use netmem_dma_*() helpers in gve_tx_dqo.c DQO-RDA paths to
enable netmem TX support in that mode.

Declare support for netmem TX in GVE DQO-RDA mode.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v10:
- Move setting dev->netmem_tx to right after priv is initialized
  (Harshitha)

v4:
- New patch
---
 drivers/net/ethernet/google/gve/gve_main.c   | 4 ++++
 drivers/net/ethernet/google/gve/gve_tx_dqo.c | 8 +++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 8aaac91013777..b49c74620799e 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -2659,12 +2659,16 @@ static int gve_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		goto abort_with_wq;
 
+	if (!gve_is_gqi(priv) && !gve_is_qpl(priv))
+		dev->netmem_tx = true;
+
 	err = register_netdev(dev);
 	if (err)
 		goto abort_with_gve_init;
 
 	dev_info(&pdev->dev, "GVE version %s\n", gve_version_str);
 	dev_info(&pdev->dev, "GVE queue format %d\n", (int)priv->queue_format);
+
 	gve_clear_probe_in_progress(priv);
 	queue_work(priv->gve_wq, &priv->service_task);
 	return 0;
diff --git a/drivers/net/ethernet/google/gve/gve_tx_dqo.c b/drivers/net/ethernet/google/gve/gve_tx_dqo.c
index 2eba868d80370..a27f1574a7337 100644
--- a/drivers/net/ethernet/google/gve/gve_tx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_tx_dqo.c
@@ -660,7 +660,8 @@ static int gve_tx_add_skb_no_copy_dqo(struct gve_tx_ring *tx,
 			goto err;
 
 		dma_unmap_len_set(pkt, len[pkt->num_bufs], len);
-		dma_unmap_addr_set(pkt, dma[pkt->num_bufs], addr);
+		netmem_dma_unmap_addr_set(skb_frag_netmem(frag), pkt,
+					  dma[pkt->num_bufs], addr);
 		++pkt->num_bufs;
 
 		gve_tx_fill_pkt_desc_dqo(tx, desc_idx, skb, len, addr,
@@ -1038,8 +1039,9 @@ static void gve_unmap_packet(struct device *dev,
 	dma_unmap_single(dev, dma_unmap_addr(pkt, dma[0]),
 			 dma_unmap_len(pkt, len[0]), DMA_TO_DEVICE);
 	for (i = 1; i < pkt->num_bufs; i++) {
-		dma_unmap_page(dev, dma_unmap_addr(pkt, dma[i]),
-			       dma_unmap_len(pkt, len[i]), DMA_TO_DEVICE);
+		netmem_dma_unmap_page_attrs(dev, dma_unmap_addr(pkt, dma[i]),
+					    dma_unmap_len(pkt, len[i]),
+					    DMA_TO_DEVICE, 0);
 	}
 	pkt->num_bufs = 0;
 }
-- 
2.49.0.805.g082f7c87e0-goog

