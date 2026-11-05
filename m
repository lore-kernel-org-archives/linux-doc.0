Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917272;
	b=Dqya+Fus+28VNfC19gg24c3FZ8BM+Ll7DhO8KLLY28jZf6jAKnm5QF7M7UBeOTeXBVn5
	 ZatUkp52+iwWNrnbLKqBYwtv/aVD4xXq7j14jAehYp6bQmmMmdUe8vemTjxmcst+iPpD0
	 J2Awk+rAiBr5REozMtCMFgLWFn+Oze11bqG2B7t/79Dr2rdFe16kiysJvMrffR8TalLnF
	 6PhajkgJENBjZtmMI3IgbPRnBEOZlDNHis2szksen95ukN56xIBm0lQkZWZWRxmWuJsHg
	 gWpnYVX0MjXQsakx/lLqpzQipq0eKyN64jRWek2OjqtR3RIbMq+KsINeM/fBVp0onoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Acd/QpdNjaZoFfEYKM7452m8zFvnMYypavI01EcAq44=;
	b=LSwIbsBTbWbTSG8NsGygYRc4ViTXah+m433dIc6LdrhIlX6lkKnk3pLW+jSu+fqL3c73
	 +5iCQ7MA6wz7zt0ivsDwhRN94dcJib+nFcBwRmy2QKN5WR6KZEtIKi2/jImeB8mNamdpB
	 BvddqyeqZQvx2QFodToVd3l17lk+CL7J4/A78mPa+P7KxVTBBgR1idAb445WnZNHWBoMb
	 YdzhwNSmwnGbIMKoeF1gv1fkQFumfV2Vs8Ha5HGnpCddtrs7l8X4bwq4BcIxXcfyu6FJA
	 9zU3c8gISrkNsWsSCaeT9xH+aU/8OUYtZqvVzw3B3qRlxucmNU2e4WigzeFsRxHs0yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpahHltS;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C746606EE8C
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 22:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C746606EE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpahHltS
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36cedf1bd63so1384379eec.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 14:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917271; x=1794522071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Acd/QpdNjaZoFfEYKM7452m8zFvnMYypavI01EcAq44=;
        b=gpahHltSOyFyzTfMXDIYVv/IO8fAwDTU17+d5bpsCt+yDVFs0wG1xrAMoRJicRmKPa
         gKI8s57ZpODIASUIp5wXVVvn0dIMueFV6tmFExcufTlIvRDJ4FwcnjfpO1YiuNJYskh9
         wLBlCA5zt/TFk4FPt/ikmVcTIxK+DS/GQI6BDUCn7xk5eRTj+QDNPe7/IfzP0+PoqJDO
         f6Klxp95jMLnpk15i8axVytxSGb3KcE2gi3iZOQscKPFpp/t5tmXo2nxodEhCP4PNuci
         E7Zsalf+0684reRO+DpFrYWLcmSLFMcGH2zy2tw6XNi9+YUIR+sge4x6dG1zkuero/lF
         dJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917271; x=1794522071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Acd/QpdNjaZoFfEYKM7452m8zFvnMYypavI01EcAq44=;
        b=Ye3JH266D7gUer5CZXZxZYPvpDmzcIP8/eWcsBqYSCadjxLKQx3nV4/OUqI/hiMgf8
         gm0yejlEEaKd/kyUo3SwKbdOAYRCa11VeTcSXDNBemMK2fgD9Yk1k4jab8U2zZhD+biL
         v9e0nOK5FGnteVSOPqHGUSFATIw1Mk5PvAUIjNrOD9BcuGkolfQ+BJ67egrq6stEja21
         QCCYxAWwA7uH80iYZOgbJ99oKC18t4kVvXfYwiZX7vSkhlqQRav3jLDpZUaoZTotCXEY
         Wj9/sNEZatPSHmB29CxzdORog3gY5MpVPfyg/eujI1DMZTtjyEakDIfA5r5XOWVMVndJ
         dvxg==
X-Forwarded-Encrypted: i=1; AKwUvBxYbhVJmv+mJ9CdYE8+IvH1yThvlu11+vfDVAoKWNyzvXxpti3KY8hEXNtCYMM0LznWxgPw4LJFMpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QmfpfPj/rQRKYWDxad5P92gI7h+pPsQUNiJ5awhm+OmtLMsX3
	1/wTLaBgFV8eWU/0lG0dBtX9QojNpTAYMaxDPaA2klSzf3zkAok+JrAC
X-Gm-Gg: AYBFou1/B0biUGOlqUwIOYIM3UoPWEABptyQ2nx0v0S8sHRlAySInbk3+U3Fex3p539
	U3vCJzTV8PE++o+TggLkIxVuBNxiLHmQsPLcIe10mBDCPEl5bl+8s87GduAtqSuNU1KyebmA8Yv
	0weohMHm+cSvvIclnCgMXTEZ4Q5oJa4BCOPqVhYTfzvs1n+9xcgaVc3iAHzHL/tK+UcKYALORCn
	+hjmtXSiTn224V0Kaqj0fO7VCxE9xmTLvbABZ9VFdxk26pG0yTO0NeF9GT9svwlInGnoVxbMKm6
	UDsJn/GguBjkAzvTUR5rU4sy+dqXcVuoS//b7I09mg3qqYHU7ppAnCjv5XzlPMMcePVhOEVwT1d
	5VZKmNFQlGokt57g77vIvVegyaLciMaEk5PJj63ItI1dBXKjriCPgowp66u0swniuPR+kHzvFTt
	vMGEoH1SE8D3gazc8Q/SRHZfOFbOPXLiIYKWsl7L+bMKVdu94QZJnAY8v8CG1lJzm9zajm0nGyj
	GGNMIPruJefhm76RzgN+dtSg9zlAMH4zDLhtt93gBpNyHdkqso/xrtp10ldHFUZv0J4topFCcoF
	UNkozwsOYDnt1FXDwVKxk4U=
X-Received: by 2002:a05:693c:8854:b0:36c:a1bc:6102 with SMTP id 5a478bee46e88-36f6f88bc79mr764065eec.0.1793917270504;
        Thu, 05 Nov 2026 14:21:10 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:72::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8d44500sm51197eec.5.2026.11.05.14.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:09 -0800 (PST)
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
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 8/9] net: devmem: size TX net_iovs from the dmabuf sg table
Date: Thu,  5 Nov 2026 14:20:57 -0800
Message-ID: <20261105222058.944293-9-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105222058.944293-1-sdf@fomichev.me>
References: <20261105222058.944293-1-sdf@fomichev.me>
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
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
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

