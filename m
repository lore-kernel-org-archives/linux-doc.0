Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248760;
	b=LEaqMZTLMoLPUBBIte1TpF/BGgXtPkb+cVbOX7kXTLywXS/sbpa3D6xFkHzYTvkDI23B
	 Y4azcfDKYDMZH1vGlbYhvwC6sip7vaQ26Hp9mNHEwaV0D0VEPXTC32i3QOpDaUsgd0Ult
	 Ik9FiU8qr0E/tLleU+500FstWFs7F2+hdJ03gbFKBTauZVlmp8yQ/QJJiAlRGIGcSfSiZ
	 6TY1WVrGSAK6K0QhaJhjVau0vA6gNCYpZBm/AL+nlDb6UHavNmmUoT4jDUOrhQ3sy4k9d
	 NuLTF9saVrlWNxePbs1Ffw/ObowC706TSv8G4ET6j0zDYihu0R8MSXVITRH0XUE1J8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=QwEhXQGhncgxAenLKf9FgZtSttnofeN4/QkcfEPx9jk=;
	b=zUwo4NJUZgpleyvQYxCscHrLjbDD/os+NtASD8ii8sPDKvEWeOpKn9CSQ6MeaDZ4vu0L
	 OGYqs6PDd5+irnRbskC9z576rvZVa0NoB0IDrNkpen7IYqz4Dn8Z1WCdwft0fLD26R1Ss
	 2d1vo0mXrbL60Q3IVwz9RZybdOxAQTvmB61Si46hqMJXQ3n/tA/uQJ5vxES0f/LMVCPnu
	 7yvE7uMMWQsApSfffPc/9gyPa9sXmCVUdWAsrXYHit8KTyftPIJBuxVVsp70TH8PW8ZjQ
	 PiQ9nV2j66W0S9/1dLpq95Lve8CqK342Zp5HyDx3YFx1Dbtf/MQzjUDVPTJn1JCQ/mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AvIo5Cen;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678A1606F3AE
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 18:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 678A1606F3AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AvIo5Cen
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c49df8fe86eso92576366b.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 10:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794248759; x=1794853559; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QwEhXQGhncgxAenLKf9FgZtSttnofeN4/QkcfEPx9jk=;
        b=AvIo5CenHwqJzR0/aJvWxFF16Sm33oH5itV/RnAWKoJNiKZaHyjmxs7yggU3oZzKS2
         wo1L7TCp83gitouvSBciLM1T2iE0Pr27jaS5tvlvsvWE/8bmY9O7lGn35qsVCmUl/+VH
         I5e0hWUb8ycsB5gEjdjyvnncJJ/We9yLpkk4vY5KhGsyF6thkS8RNCkaQVvdO3dJrc/b
         o7npwPhhTJ0hpH91FBqWkuarog07XO6YdY44//RHEU8cWvmU6QGlL6Q2vQ0RYf80PkW2
         sJ3DSGi1kV0jIofBK8rjXFVlow++yi4U9cK+y0urrlACc75yW+onGAj7erJHnYg4P/Ku
         dDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248759; x=1794853559;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QwEhXQGhncgxAenLKf9FgZtSttnofeN4/QkcfEPx9jk=;
        b=kLUEanLSyMoUGl01U7ElUVFLamOPgBtBhhhUfksfj4pjn3xWSdY23waDBlGfvudv5o
         Qfh6d3EjI1Oo4x9Lv2rQu9MTyrifGdnpKjvi1Ckw1FokHsnD4J5u4GawrHAX9qSUUi/8
         Iwahv1E4vp9l0z3gEv/rDIOqzBHyrL06xnp2e0aINIKAHjktLyz13jGP997XTfSUvmz8
         qehvc1lvUDgZuQUg7WPjzwLefLlFCGnrrScI3x4NLSMw0kyQLm39D5e6S2VHjdB0De6L
         OqNhwJKbir4ryWmQRw0oqcg7d/c6FQ0vZ0o3QMu9iOjTjgkGeQBK3jRayrr2/ve0gKpg
         3Gew==
X-Forwarded-Encrypted: i=1; AL+hErGm7yOJGueU/yraMg5gOyhlhaT1r46Sd+IbgXAYag7Y+sh/QAKE72rck/T+ZgPJRIanvExXKFDDXwM=@vger.kernel.org
X-Gm-Message-State: APuU4Z81ZK7wZwCS96a6T3GPyn8RZsQhehA0rI7+ZF6M1bUq7Z9/pZzX
	uuK5PKTAOvsZTX+RCMD1g+P2a4Kx7we9opqTLC/zsmVsXdu8Smk0BrMOqTkV7sKg0dr+zgI2W+W
	mxV8Egg==
X-Received: from ejcxk8.prod.google.com ([2002:a17:907:d808:b0:c4d:1c8b:9299])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:2f06:b0:c41:5e31:5184
 with SMTP id a640c23a62f3a-c504951eb65mr12737766b.13.1794248758596; Mon, 09
 Nov 2026 10:25:58 -0800 (PST)
Date: Mon,  9 Nov 2026 18:25:29 +0000
In-Reply-To: <20261003212241.3432303-1-lrizzo@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261109182533.3594984-22-lrizzo@google.com>
Subject: [RFC PATCH v2 21/25] net/gve: Use GFP_KERNEL when pre-filling RX rings
From: Luigi Rizzo <lrizzo@google.com>
To: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Willem de Bruijn <willemb@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	iommu@lists.linux.dev, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-block@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luigi Rizzo <lrizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

When pre-filling DQO and GQI RX rings in process context before NAPI is
enabled (e.g. gve_open), use GFP_KERNEL instead of GFP_ATOMIC so page
allocation (and CoCo page decryption) can sleep instead of dipping into
atomic reserves.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c | 7 ++++++-
 drivers/net/ethernet/google/gve/gve_rx.c              | 8 ++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c b/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
index 6880d1531ba5e..3b13aa4999ae5 100644
--- a/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
@@ -223,13 +223,18 @@ void gve_free_to_page_pool(struct gve_rx_ring *rx,
 static int gve_alloc_from_page_pool(struct gve_rx_ring *rx,
 				    struct gve_rx_buf_state_dqo *buf_state)
 {
+	/*
+	 * Use GFP_KERNEL when pre-filling RX rings in process context (e.g.
+	 * gve_open) so PISA metadata init and CoCo page decryption can sleep.
+	 */
+	gfp_t gfp = gve_get_napi_enabled(rx->gve) ? GFP_ATOMIC : GFP_KERNEL;
 	netmem_ref netmem;
 
 	buf_state->page_info.buf_size = rx->packet_buffer_truesize;
 	netmem = page_pool_alloc_netmem(rx->dqo.page_pool,
 					&buf_state->page_info.page_offset,
 					&buf_state->page_info.buf_size,
-					GFP_ATOMIC);
+					gfp);
 
 	if (!netmem)
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/google/gve/gve_rx.c b/drivers/net/ethernet/google/gve/gve_rx.c
index 81ea800e66e94..89f287b678bf0 100644
--- a/drivers/net/ethernet/google/gve/gve_rx.c
+++ b/drivers/net/ethernet/google/gve/gve_rx.c
@@ -161,12 +161,16 @@ static int gve_rx_alloc_buffer(struct gve_priv *priv, struct device *dev,
 			       union gve_rx_data_slot *data_slot,
 			       struct gve_rx_ring *rx)
 {
+	/*
+	 * Use GFP_KERNEL when pre-filling RX rings in process context (e.g.
+	 * gve_open) so PISA metadata init and CoCo page decryption can sleep.
+	 */
+	gfp_t gfp = gve_get_napi_enabled(priv) ? GFP_ATOMIC : GFP_KERNEL;
 	struct page *page;
 	dma_addr_t dma;
 	int err;
 
-	err = gve_alloc_page(priv, dev, &page, &dma, DMA_FROM_DEVICE,
-			     GFP_ATOMIC);
+	err = gve_alloc_page(priv, dev, &page, &dma, DMA_FROM_DEVICE, gfp);
 	if (err) {
 		u64_stats_update_begin(&rx->statss);
 		rx->rx_buf_alloc_fail++;
-- 
2.56.0.542.g3ef89b7020-goog

