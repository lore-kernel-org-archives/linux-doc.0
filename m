Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED3031B823
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 20:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764276280; cv=none; b=QZixCAXQF4Re80XV9remqVFGSY+nxfaHY4aFepK1ogovvy17WV6XnpJ5NhxOfjhSNcA3iDFpmcE3UxkQ4Z48j+RhIkd3uqJcOXDwHCanlu9n9nC/C5qjxz/VDDnw5v1CZs4wo/mFORErKIiv5t0tiXSInyZ/qdXChDIRrhXTYcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764276280; c=relaxed/simple;
	bh=D2EsVI2xh2ZhL05Tk+r0h3Pg9Cl/77LcPo6nKDQSuGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qge0ei/5CR37SAeysL31og8HSpvrQBU6xz/+ZJjNUKNoTWZmHRX3XXa7SZSx9nhzmwrhEapqLOJHJu805W3L72JJ2SwQNd+P23vBAnqVj4uDdzadYcI0t56Ggg9wbbM28YfFKD871hZzqZASNNC/z96aNjvmYBVbEOiBxNyLJg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DotU0Rr0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DotU0Rr0"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b32a5494dso741559f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 12:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764276277; x=1764881077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vy0XbKcemKbh0CcuwZvqfWEa3IvL5tyGOdRED1Ad+uQ=;
        b=DotU0Rr0wYeSWTrWjGX/hBXLnQeUJKMJjdb5kKAplXeQlnY0TpvGr0vyMBlJOvTUwk
         Xjgkiix19rVRe8+vvy8g9kTRuKDtzTXAWUsm9TzfgAbeVmVMaULHrPHsPnxqi2Ev2ioC
         c/xFZQQZzexZLpT+l7tmuwnRQK0/daDbEN9GbGVwrYiyAuzPS3cev62PXtoBd0H8P3A0
         NV1jpL/DnDOGmDI63j3gSIfs7Jv+Os52cf3gKKvNTK1G9l8Cxca7ZyJIMV7VSk2vOKGh
         s0wH9bBwWYbS4dj/u2VBgZtJ6xcsiFIVNAsuFkxcdueUhB2srfjlNlcNG/ekJVufYK5J
         5Ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764276277; x=1764881077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vy0XbKcemKbh0CcuwZvqfWEa3IvL5tyGOdRED1Ad+uQ=;
        b=Rp49oeOXJ2IG4fB8iMJyr1w0940xEcIn5ZmP7UXA2+WsUG4vw9KM8eqMReuryHOJ68
         fnAWKwJIi5zvZJkxHPFwoz7hxOfxjJUd3zOHy91zgnb2bOGrVHRXCOK+5oy1iduztAsp
         PaB7v4kg1P7llhiGRNSx2KCZDgQUiSTZ0Jn+dKbEHmSzhxWec6UqubDgotM9iDrqmM6C
         ACPWGcp/DV0guC/gQ78iBSBEhBDLc2C+i/MWPRO/deiw1FghM7OCxrELXWAGlSNI3Rc0
         IoklPNEPeP/y5+HXvpJHWJUkc/27WfUzYlJbELTmWSWiugZfvpwpwOYuRa38GaE1gAmK
         M1kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY1yODnxmpKb1YJTtfbeeAkOPlgtuDGHwfyFUCTYNUamMKvTGAFVaBSxeS07tHtlz/Z6qp6x4Dg2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz8tlp+KQvbeO/gn/Dn5z6oUAC+XyrJagZZVhJ150Wez5ZUhnP
	8AVfpOrVbxfM6ZsWAAFyN/429CfLmaG2krca04AaSAYwKnHR6DRK0si1
X-Gm-Gg: ASbGncvQiOFJVij7cObJelCVRUVHuhK3IyB9Q/hwjT+xFoYeEVC7h/QHv1uZ9+Z/b7F
	FxUi42JDqv+oEVp6lWcBqqCpU2PJacIw8U3rOPlcmNtIKj5lTPKA9Iveka2gIKquX/s5ofNORmY
	2aoqJoJCqVhauxVbzDTr97iSVblAOfKSFVu3P76Q0Y/bw02HZrRY4mhWYtPeVVRD3NV94g1LC1d
	danH+b+dpC5OBVz9mMPeXzNfF2hOmShoV73PcWHXBgWbaGza47LhG0YW3u432c1nUVfxX2sQYVd
	LI08TSDK0wnjHWor7kcy6jp8ut3tqIDzE8xZq0TlE+L5xZSIgyy20MSKMLEnYx0TPfk/+rKQTjY
	/PcT0htW5JRgJFQ2/sDh/stUVvxdHZ0hFXd1aY3Y1CFvG7Zb2LsZHeyQ5Y5rVrhe/BmSjtEQ+kk
	BrpOiSfEqdU9xhMA==
X-Google-Smtp-Source: AGHT+IE4EdepoSGguIef0SYCibCymaDm7WjMY8rUmVSyXGFaZ7vrRrlEhrAxCK+PPLWhSAF3UH6tKg==
X-Received: by 2002:a05:6000:2f81:b0:429:bc68:6c95 with SMTP id ffacd0b85a97d-42cc1d520camr29604197f8f.47.1764276277267;
        Thu, 27 Nov 2025 12:44:37 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d614asm5346105f8f.12.2025.11.27.12.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 12:44:36 -0800 (PST)
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
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Simon Horman <horms@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	io-uring@vger.kernel.org,
	dtatulea@nvidia.com
Subject: [PATCH net-next v6 6/8] eth: bnxt: allow providers to set rx buf size
Date: Thu, 27 Nov 2025 20:44:19 +0000
Message-ID: <9342d7dd5e663d3d44419229d6c9971b67e3f059.1764264798.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764264798.git.asml.silence@gmail.com>
References: <cover.1764264798.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement NDO_QUEUE_RX_BUF_SIZE and take the rx buf size from the memory
providers.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 34 +++++++++++++++++++++++
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index fc88566779a4..698ed30b1dcc 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -15906,16 +15906,46 @@ static const struct netdev_stat_ops bnxt_stat_ops = {
 	.get_base_stats		= bnxt_get_base_stats,
 };
 
+static ssize_t bnxt_get_rx_buf_size(struct bnxt *bp, int rxq_idx)
+{
+	struct netdev_rx_queue *rxq = __netif_get_rx_queue(bp->dev, rxq_idx);
+	size_t rx_buf_size;
+
+	rx_buf_size = rxq->mp_params.rx_buf_len;
+	if (!rx_buf_size)
+		return BNXT_RX_PAGE_SIZE;
+
+	/* Older chips need MSS calc so rx_buf_len is not supported,
+	 * but we don't set queue ops for them so we should never get here.
+	 */
+	if (!(bp->flags & BNXT_FLAG_CHIP_P5_PLUS))
+		return -EINVAL;
+
+	if (!is_power_of_2(rx_buf_size))
+		return -ERANGE;
+
+	if (rx_buf_size < BNXT_RX_PAGE_SIZE ||
+	    rx_buf_size > BNXT_MAX_RX_PAGE_SIZE)
+		return -ERANGE;
+
+	return rx_buf_size;
+}
+
 static int bnxt_queue_mem_alloc(struct net_device *dev, void *qmem, int idx)
 {
 	struct bnxt_rx_ring_info *rxr, *clone;
 	struct bnxt *bp = netdev_priv(dev);
 	struct bnxt_ring_struct *ring;
+	ssize_t rx_buf_size;
 	int rc;
 
 	if (!bp->rx_ring)
 		return -ENETDOWN;
 
+	rx_buf_size = bnxt_get_rx_buf_size(bp, idx);
+	if (rx_buf_size < 0)
+		return rx_buf_size;
+
 	rxr = &bp->rx_ring[idx];
 	clone = qmem;
 	memcpy(clone, rxr, sizeof(*rxr));
@@ -15927,6 +15957,7 @@ static int bnxt_queue_mem_alloc(struct net_device *dev, void *qmem, int idx)
 	clone->rx_sw_agg_prod = 0;
 	clone->rx_next_cons = 0;
 	clone->need_head_pool = false;
+	clone->rx_page_size = rx_buf_size;
 
 	rc = bnxt_alloc_rx_page_pool(bp, clone, rxr->page_pool->p.nid);
 	if (rc)
@@ -16053,6 +16084,8 @@ static void bnxt_copy_rx_ring(struct bnxt *bp,
 	src_ring = &src->rx_agg_ring_struct;
 	src_rmem = &src_ring->ring_mem;
 
+	dst->rx_page_size = src->rx_page_size;
+
 	WARN_ON(dst_rmem->nr_pages != src_rmem->nr_pages);
 	WARN_ON(dst_rmem->page_size != src_rmem->page_size);
 	WARN_ON(dst_rmem->flags != src_rmem->flags);
@@ -16205,6 +16238,7 @@ static const struct netdev_queue_mgmt_ops bnxt_queue_mgmt_ops = {
 	.ndo_queue_mem_free	= bnxt_queue_mem_free,
 	.ndo_queue_start	= bnxt_queue_start,
 	.ndo_queue_stop		= bnxt_queue_stop,
+	.supported_params	= NDO_QUEUE_RX_BUF_SIZE,
 };
 
 static void bnxt_remove_one(struct pci_dev *pdev)
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index bfe36ea1e7c5..b59b8e4984f4 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -759,6 +759,7 @@ struct nqe_cn {
 #endif
 
 #define BNXT_RX_PAGE_SIZE (1 << BNXT_RX_PAGE_SHIFT)
+#define BNXT_MAX_RX_PAGE_SIZE (1 << 15)
 
 #define BNXT_MAX_MTU		9500
 
-- 
2.52.0

