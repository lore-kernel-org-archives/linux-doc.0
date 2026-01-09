Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EAC35A943
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 11:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767958157; cv=none; b=sCzrNOBwg4OmeTGDCDRYpq+pec6HjuQx7VEXFQL6C2LrOUFmXcwxfw55p10+PIoKXugoGtSz9hRlwh85rrih5J0+t4jEGaL1FSk0s0FyZtE3SMbHd55hRJQUMSq/VeZumqw9I0RAqVvwIsuKVZGlCUwnn/+90gx5Oh+zjeTV9FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767958157; c=relaxed/simple;
	bh=5qbU+cqkCY7Oy7htHErBAKE7+dTnE/mhpdnkukFkSXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NV7HiU5l0PpR3ryGNRRGQe3eFriTlJfH+qdmF81SJQDXGf9QdTzh+fAFb1hAH7tPhiuoPYlYo1nuhNXIxmLlcW9nUjnkw7XC5TkUZEfsDKQI5ZXeb2BHWyig+Dt+gIF3azQC4KSSy6wc2ZR8WGlClKKB+gaBGuny/Khsmc+J/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwHKJmqx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwHKJmqx"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so31211935e9.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 03:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767958150; x=1768562950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VL6yChlTp3dYpMCzBhFC2VDB7at7kYV7rRkhbUdhFI=;
        b=hwHKJmqxpH5w6iezA9snAeS/GLYfoExNv4gBKN9yxT/nDeYIHHuwMvAxdv6K15Pxit
         niT4NRbLo01etqSDQfSgfq2DYE8e4mjoPxd4fMi4Wv8RibRAlH9MdhdKPjmqYgqgI0VR
         JeL1VI0bSvL95e9j0035mOBpDqmXiruk/QjjTVAwFrXphkcYN+dzdzCdJGa3PRlPps5e
         q7OO7AmlTU1MOTuVnrN38SG63erPKbLNLAfPextQL2H6K7If8PxYvkGCffnLvJNcGAGg
         lJEIXfar3z9eui7C7ipzvK5iSpIHwzgY2p00ziAWbgkeJh7hYTA+mB2JBke/jH1FpXMw
         0hZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958150; x=1768562950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3VL6yChlTp3dYpMCzBhFC2VDB7at7kYV7rRkhbUdhFI=;
        b=Zuzr0OZVZSTCly9FPRHwscHcWBrHt/306R/862A56CijjZ5G3jIustsbs/lsDNllva
         XEx2WDQ+iyXltvzaM0O7VLfZrXJ+JrfOHVM58hkwrCHMqYhw9XO9GWTwhAXZdFGZWSiL
         yRgeN4rUyLT3XTj3CPFoo2Gl0N0E8r/6MH8nevzFsNSl4e8b1tko/oGC/m1PYEdxDS2c
         TzwYNHBJO6FRt8XyTU2B/xlvitppfroXPTSx5F/u+y8Kx6fIrGZZDahgPYoQZUhvyqsx
         OEHRcYuDGFKs9j75lspagegHJnV6eEALoGk5bQTSeGcy6a8hN6S7kNngQb1crGnSV+/e
         Xrdw==
X-Forwarded-Encrypted: i=1; AJvYcCW68bRsRtbdX+0jXw8/LfcbalW876TklkLxRwPO+JDV3gMS2I94P1pO0seAWvlPgDt85thjkGOPm2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMkMiAWMhz7q+hZpmr+jTXCMOp68rD7kC1T7Saj2jomunBGxAk
	IapBSV92XRSdZdGun37ltRRfQxb1IE+IUwGmhTLf26g+1XH94cQU38r2
X-Gm-Gg: AY/fxX4IT9eIEwJ8xmTeX8h5wybvf/zXfERztQQoprw7aUMk6rj0qa0n4ZlEw/z8xJ1
	secle45N4rQxpKz71BhgfV5RG8gkhRY1cvG6m0CzDRRcp++dv8uK0t2fy1KoYVv9o0OdEFogAQ6
	1yHFpKmWuF/1hTwK0qEcWn6FVCp0W+6829O+dl3etpJh1vnH0Tmo9MSwcQ8Fs1UBxiyRxYvlwtf
	31LWm9ufEvOU0d8/KBpCe9hjWeN1gXI6DEt4q6Z/SQKu1ZoBChBZTG/SfIqq2uM3GqkfguSCjcv
	zvb4wh/eA+9/eqKJiyQFDj0rZcPoRIOqDimPVhT25ZATKf8xRGg5DTlJZonAnnYnNV5l1bkwnlT
	Q+HeUTOKng2FylUESA51bUBdsEu1MUXQok6Piv4I7rTMygZjVSNQytX0YE1TvSFeL7u+7icu+MH
	ujsmEeqd7XRVG6fX89DjsjI3s+x+wGQSHRt2JyOJOq7VnKfbiWiZib697qYiyArkRgjVppOg==
X-Google-Smtp-Source: AGHT+IHy01qrbGB2/3dvCGWwtdhHYeGIDdQ2qK319mi7ENth+laC+xngVDxYXJWlkGJRgxWOxr0qDg==
X-Received: by 2002:a05:600c:1c28:b0:477:632c:5b91 with SMTP id 5b1f17b1804b1-47d84b1a2e7mr124151565e9.16.1767958149641;
        Fri, 09 Jan 2026 03:29:09 -0800 (PST)
Received: from 127.com ([2620:10d:c092:600::1:69b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636c610sm60056985e9.0.2026.01.09.03.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:29:08 -0800 (PST)
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
Subject: [PATCH net-next v8 6/9] eth: bnxt: adjust the fill level of agg queues with larger buffers
Date: Fri,  9 Jan 2026 11:28:45 +0000
Message-ID: <8b6486d8a498875c4157f28171b5b0d26593c3d8.1767819709.git.asml.silence@gmail.com>
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

From: Jakub Kicinski <kuba@kernel.org>

The driver tries to provision more agg buffers than header buffers
since multiple agg segments can reuse the same header. The calculation
/ heuristic tries to provide enough pages for 65k of data for each header
(or 4 frags per header if the result is too big). This calculation is
currently global to the adapter. If we increase the buffer sizes 8x
we don't want 8x the amount of memory sitting on the rings.
Luckily we don't have to fill the rings completely, adjust
the fill level dynamically in case particular queue has buffers
larger than the global size.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
[pavel: rebase on top of agg_size_fac, assert agg_size_fac]
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 28 +++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 8f42885a7c86..137e348d2b9c 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3816,16 +3816,34 @@ static void bnxt_free_rx_rings(struct bnxt *bp)
 	}
 }
 
+static int bnxt_rx_agg_ring_fill_level(struct bnxt *bp,
+				       struct bnxt_rx_ring_info *rxr)
+{
+	/* User may have chosen larger than default rx_page_size,
+	 * we keep the ring sizes uniform and also want uniform amount
+	 * of bytes consumed per ring, so cap how much of the rings we fill.
+	 */
+	int fill_level = bp->rx_agg_ring_size;
+
+	if (rxr->rx_page_size > BNXT_RX_PAGE_SIZE)
+		fill_level /= rxr->rx_page_size / BNXT_RX_PAGE_SIZE;
+
+	return fill_level;
+}
+
 static int bnxt_alloc_rx_page_pool(struct bnxt *bp,
 				   struct bnxt_rx_ring_info *rxr,
 				   int numa_node)
 {
-	const unsigned int agg_size_fac = PAGE_SIZE / BNXT_RX_PAGE_SIZE;
+	unsigned int agg_size_fac = rxr->rx_page_size / BNXT_RX_PAGE_SIZE;
 	const unsigned int rx_size_fac = PAGE_SIZE / SZ_4K;
 	struct page_pool_params pp = { 0 };
 	struct page_pool *pool;
 
-	pp.pool_size = bp->rx_agg_ring_size / agg_size_fac;
+	if (WARN_ON_ONCE(agg_size_fac == 0))
+		agg_size_fac = 1;
+
+	pp.pool_size = bnxt_rx_agg_ring_fill_level(bp, rxr) / agg_size_fac;
 	if (BNXT_RX_PAGE_MODE(bp))
 		pp.pool_size += bp->rx_ring_size / rx_size_fac;
 
@@ -4403,11 +4421,13 @@ static void bnxt_alloc_one_rx_ring_netmem(struct bnxt *bp,
 					  struct bnxt_rx_ring_info *rxr,
 					  int ring_nr)
 {
+	int fill_level, i;
 	u32 prod;
-	int i;
+
+	fill_level = bnxt_rx_agg_ring_fill_level(bp, rxr);
 
 	prod = rxr->rx_agg_prod;
-	for (i = 0; i < bp->rx_agg_ring_size; i++) {
+	for (i = 0; i < fill_level; i++) {
 		if (bnxt_alloc_rx_netmem(bp, rxr, prod, GFP_KERNEL)) {
 			netdev_warn(bp->dev, "init'ed rx ring %d with %d/%d pages only\n",
 				    ring_nr, i, bp->rx_agg_ring_size);
-- 
2.52.0

