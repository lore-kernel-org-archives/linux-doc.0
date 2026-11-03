Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749924;
	b=rWnP3bkqmLQF0EF9Mgw8B0vVgl96mYQdy9Kz1fcVOaqwmet8Rs6pyYplagEOTKDrjjpm
	 RTdu7jQ2GTlxKVfZ9uhWq62Tn+n5nBG67don15xtUvdxDEHgjj69/TVhx9n6FUFD+Pln3
	 hFM0QTslreTQ6oK6cnhs/91dMO87ZkParYwhCmFgVEXXYvaWnF700Y81fTJSeFD1G0vHo
	 ucrWqD0nP1A5j+CW1ZRDLiK8qrPYO5aOByM20iAZvDRdoi5JEpPQECqXW7ZY4uk/IBMv/
	 4bAGPTkKO8LDwjg9oaNeNjRKhSlmt6+qvR45dFvnDbnWWzGNuKVwrr0xCxBa38wpR3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YK0Xr740yMaz303kQAw5xU/hri305+ZpCPlJBa3zu5I=;
	b=tKKuoZ2+FEu9lbPoc6Yae7Ie2JMwVKEK1OuFkAUZXsC8ybR+Z3m6yxMB4zCsjyxYQ+bD
	 ifIUxlqvMQvAt1Y9DEk34FVTjb4Tx3iFMp67GrN4DDuNx15ti5GV5wZuDHoxTKBk/uN+i
	 V2IHqFgn3H+H7ALRw4SuZ6ZuXx1Qen0EkBdVGg7kfYzVO7yCyoPzDBetoObCxE2i80nA/
	 I3fw06kHBUIAg5WucI2kao6+ZKeUluYNJ9QfSS+QpindrdyjCoifi7hOR9BBRwp98Tgcs
	 VS/TQVY14KYDiNw7O16J5Ob02LJ71yKT6bBqcyyH/tPywMoOaUBST9BngW0K4jVsDyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ibeH9DzR;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67442606EE9B
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 23:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67442606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ibeH9DzR
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso60597c88.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 15:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749922; x=1794354722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YK0Xr740yMaz303kQAw5xU/hri305+ZpCPlJBa3zu5I=;
        b=ibeH9DzRIx4RfJPxFHevHlDLr/xdu4QlU9YCsTEV7vBw0l4zutu1+wX3cGgEFI0Up+
         CVu0HBGKpCLnauFhvNuKxdWvE/qXcbaTNrYSZKDwDqF/iH2b7xd0T5PgFqQwR7BDn0pa
         Rq1D90uB+attIqkpLE2zIEaD5/5JfR0laKPNMuYywldn2ktuZtRARf+yB6gMO6LqXH3a
         hEFFwo2eCeXcLrFsUYt0aR79LL7Zm/IG9nk+H074IXsetu1oYEevVpEpoge21ZwSDkZe
         UC9DLBOB+CdzmX6Wz71LszCuBKJN1fdZfHa9hb4u8IeSILYNKVjY8c97A8kW9FbNWbPl
         fWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749922; x=1794354722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YK0Xr740yMaz303kQAw5xU/hri305+ZpCPlJBa3zu5I=;
        b=g4UK35a22XJnnL1UbGL63WYcEI16TlJuIvPh/Q1SVGw4p8r/YwAdQwbSTuUxRJ17I3
         hGhbK3nAhMKoxVHSwvP74V0JwOKtPAIyi80QdZsRwqE92LE9ci9Jki6d6MxzSGZTL4Ye
         IFyz0yZ2llP/6cbBtLHXb+PTwNeeTKtKP+DBKfh9aQ6+d4sqZgp/264KDL+rh9JxqMKQ
         aYJ4XX0671WNIWfIgTsYpDYuYCDKFVxok9j51gTAMfUUYESHLtLQxr1Njqs3XtSQ1q0H
         wR5a6ZHqM8o1NyPhP86SxBygWsQbDubffvkior1Bj9Pl5KZAOu2mpTL/4uQqKoTQwSvw
         9aDg==
X-Forwarded-Encrypted: i=1; AKwUvBwiIE5JE75i6F+VH3YtVZl62l7Va7uSrTcf333sl2HRqyEQ5JA5drYI0xJr4+Yfyp7YrvZXmGLzCjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F8Tcc3z6Ee/InycezdAibeFLJ6FjIHvR+AdZUHCx1kjwQuDo3
	jdDx6BDuqQGTja/+LvGGCzVcXP6rFf1vFopytVs9fg5OBZJXjwmYV60v
X-Gm-Gg: AYBFou2c44pTt7ii7w54xxNIja0iSNBVoN8k5L4qIPMiMrc74QVIPQzdV6HP9qD+2k5
	HhDjbKz2/q8hsLKvKe4K75LgpPaXM8RDoNXU7eYCuCvDoy7QBDO9VvUF9oYvJf5focVFJoByyyw
	3jsimqV9qNVyvLs1KEX+CiQzLx/1e2O94A7ip8kLiuJWP9FeKuUlnycd2Bva9X0VVtais5DomHy
	IRiZ0Afa2wPwpSYQbq1uuvXszg1lBCIrFDQkyGetT41+SXY0PC3AFs4q7UrShaR6/ZHj8KJtxXZ
	yN1Ur2BDBfytbJs9g+uoPJstce1wq2llcZ99CeiA9pbrcdCviHfbjV1EXnqcttPcQeNSmBOB4Xq
	DKMBbEZsofLL2AYPlO68RrDMw22pixb3vvg3Tz/hNOp1pqveaDL2/YlskZfZizHE2CJN6vQUBPI
	In/e7qMf3Urd+VrLuo0csksgG5rudZNtW12pQVzbh2NCn1VfjCqfEhmR9N9nSDmwfLyGDgXfSsa
	W+GrehUlEuX0kEcjJRlqEKthMHmPbn084r+exUmuj6EUXYMbnJ8TGfE+amsG4+Z80ho9EVMjFkt
	jrXH7ZAJtRrY+4JfIrManuOKQNJX40U77OvnW45lpmM1
X-Received: by 2002:a05:7301:6405:b0:366:83dd:4704 with SMTP id 5a478bee46e88-36a423dc7f8mr22151511eec.17.1793749922079;
        Tue, 03 Nov 2026 15:52:02 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6d::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm1439560eec.28.2026.11.03.15.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:52:01 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	razor@blackwall.org,
	daniel@iogearbox.net,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 6/7] net: devmem: size TX net_iovs from the dmabuf sg table
Date: Tue,  3 Nov 2026 15:51:51 -0800
Message-ID: <20261103235152.1904727-7-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
References: <20261103235152.1904727-1-sdf@fomichev.me>
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

PAGE_SIZE TX net_iovs cap devmem skbs at MAX_SKB_FRAGS pages (~68KB),
which makes BIG TCP ineffective.

TX net_iovs only need to be DMA contiguous. Use the largest power of 2,
from PAGE_SIZE up to 2MB, which aligns every DMA segment of the dmabuf:
- 2MB hugepage-backed udmabufs get 2MB net_iovs
- no UAPI change, TX addresses are dmabuf offsets
- skbs are still bounded by TCP's size_goal, only frags get larger

The net_iov size doesn't depend on the device: frags are capped to the
device limit when they are built, and many frags share a net_iov.
Capping the net_iov instead would only split frags at net_iov
boundaries and allocate more net_iovs.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c      | 28 ++++++++++++++++++++++++++--
 net/core/netdev-genl.c |  2 +-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 19c039ed2cb2..98c9594dbf99 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -181,6 +181,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 	return err;
 }
 
+static bool net_devmem_sgt_aligned(struct sg_table *sgt, size_t size)
+{
+	struct scatterlist *sg;
+	unsigned int i;
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		if (!IS_ALIGNED(sg_dma_address(sg), size) ||
+		    !IS_ALIGNED(sg_dma_len(sg), size))
+			return false;
+	}
+	return true;
+}
+
+/* niov_shift == 0 picks the net_iov size from the dmabuf, TX only */
 struct net_devmem_dmabuf_binding *
 net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		       struct device *dma_dev,
@@ -191,11 +205,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		       struct netlink_ext_ack *extack)
 {
 	struct net_devmem_dmabuf_binding *binding;
-	size_t niov_size = 1UL << niov_shift;
 	static u32 id_alloc_next;
 	struct scatterlist *sg;
 	struct dma_buf *dmabuf;
 	unsigned int sg_idx;
+	size_t niov_size;
 	size_t niov_idx;
 	size_t i;
 	long err;
@@ -221,7 +235,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 	binding->tx_max_frag_size = dev->netmem_tx_max_frag_size;
 	write_pnet(&binding->net, sock_net(nl_sk));
 	binding->uid = sk_uid(nl_sk);
-	binding->niov_shift = niov_shift;
 	xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
 
 	err = percpu_ref_init(&binding->ref,
@@ -266,6 +279,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		goto err_unmap;
 	}
 
+	if (!niov_shift) {
+		niov_size = SZ_2M;
+		while (niov_size > PAGE_SIZE &&
+		       (!IS_ALIGNED(dmabuf->size, niov_size) ||
+			!net_devmem_sgt_aligned(binding->sgt, niov_size)))
+			niov_size /= 2;
+		niov_shift = ilog2(niov_size);
+	}
+	binding->niov_shift = niov_shift;
+	niov_size = 1UL << niov_shift;
+
 	if (!IS_ALIGNED(dmabuf->size, niov_size)) {
 		err = -EINVAL;
 		NL_SET_ERR_MSG_FMT(extack,
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 384fdc5ae514..bfd229bd31ca 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1261,7 +1261,7 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 	binding = net_devmem_bind_dmabuf(bind_dev,
 					 bind_dev != netdev ? netdev : NULL,
 					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
-					 PAGE_SHIFT, priv, NETLINK_CB(skb).sk,
+					 0, priv, NETLINK_CB(skb).sk,
 					 info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
-- 
2.53.0-Meta

