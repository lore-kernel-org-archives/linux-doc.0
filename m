Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248759;
	b=ysdASmv7QyTEfBWy1bbOh4hTJgEj2OdYXIFcKCERPx++s7wUnyW9HB81wxtP4h5R/8T4
	 UiMSuY8KrEU0cqFBNmoAqJrQ3xACMSXFAVuiytBl1LlF0FZoHHEWSfYGmvPGIlE8d4/Y3
	 VLdBnmdzMx669JeYqAq7LQP2B9XpAHgOms8D9bNHQQksJMTqN2rcbCWkVdujyGRJxQUqQ
	 oIN94fCpPdMcUYBjs3WH2IK66RNsbeWbsG8qKNoiw1oChb2HZDvwCkhO5pdakiyrFbn1E
	 XIpLuDWOpcMsQvvrXRxaA40YJpUjz5P8HkA5qQa2jtek66vy8I2zrCMFBwCTQI+6/7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+CkU7K8AN4V+yWUdhaz7RzC7M7eZI1Az06smW8kAgic=;
	b=tQVAajiLcXTydUY3Ol7c+dHYYnoqZAZ+yfTz29mcej3RioVJE6pTN4kDOCfBF8ls7n8u
	 F8fOQwTSMdYK9FkI5MPW8Aea8QpOde3ulrtf6cLfOweptpZCrOHkQCt88LMPyd46NlbDA
	 yctz6m1nimarx76X/AHpF0dKt+O4XkwefZ5dXCcdpV2de/Po3wfq+fdFv1XqdzA14tPKb
	 H4YrWIEITzaZjwG3tq/4+EdCd3Y18sKpxwSrWAix3LS8jlzGgK/RdV8DMl03m5R4jn6BN
	 f3XXSIF7KgyZ12WvIO2rdWGhST73XBEePFn7fz0jV3X8BbIuJDwVn94cPKqMLNB7hpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R6OAKMoz;
	arc=none smtp.remote-ip=209.85.208.71
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9CC606A330
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 18:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E9CC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R6OAKMoz
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b3f6d9827eso1143073a12.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 10:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794248758; x=1794853558; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CkU7K8AN4V+yWUdhaz7RzC7M7eZI1Az06smW8kAgic=;
        b=R6OAKMozRhsfHxc8EcFZ+huhXHTUifLuDNzp7irGIsSVjqGoEY8d3mnCj8nZacKwCK
         tQjHTykFoNlf0UYBL86bFR60Ft9ii0rZNy4AnXfoDNBGCqinPb8lYiDputfVY37esCod
         Stwu2HR69qRmwMRHsFxx8NkupoLJfp0s88yuwKkYT6rme4ICe+iHCiInAXkwoeeA1+w9
         cyYPFkxgZipGbELGJqF72MWVZUUT2EMNcvjMhAApgAV39wIcFHgte86waciFObzQGRye
         PybV+ZHUA42kHm/FA1V+PTrZ3xqif6+W415XsAU3kHv7W3f/6IF+E3bwaxK/V6n9F11+
         RtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248758; x=1794853558;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CkU7K8AN4V+yWUdhaz7RzC7M7eZI1Az06smW8kAgic=;
        b=Bi7jmmB0dndWIj6H1Fmbo2uxAyYjHI2A6EHjQXybyPmmVeWfgyAFmicPqR2q2J9tg/
         56b44fk8e+HblQIIVyb7DXabdCLicFAEHzhaNuW3TPCwWUhJy+efVG4tvDO8XG19MlJ+
         /5hgFyNVecJCC1X/ToZbriijj8D7dVy1+mvzh1vNnyilV6Owo6d6bYsZMhpSaa0s2Hky
         WQAqLfhLMBJSFHQvMczcozy48XPO4DOE5SsYgthnXRaO7b9SWPgQweZMR0tCX41dvNWx
         DDN5wGoE3N76h1zChGNt+4bH+QU6CK/klHab/VU1Nwv1VXiGtUG2qedxbxgKuO53mpdr
         VjkA==
X-Forwarded-Encrypted: i=1; AL+hErH5v0pSdOhGhvAg96anhLHnVKmKLs/UXAtzS5hdSebGqpjtq0OocNVnqYAZWhOG2B4JLUe3QrJh420=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k25BHyKlwoeCLhwTcpjkGKX4wQyMeiuELT2xxEZY0pCOxRI8+
	sIHepkT4R9MCoDB39s/gsB+1tL5ma235xs6E978443Cnm6+HyS0Qb+nSbm1ZVt6Mhq71CT0qvEx
	b0uQUgw==
X-Received: from edqs3.prod.google.com ([2002:aa7:d783:0:b0:6b6:fa4d:3bb9])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1f05:b0:6b5:7872:3905
 with SMTP id 4fb4d7f45d1cf-6b756afbbd0mr357136a12.31.1794248757581; Mon, 09
 Nov 2026 10:25:57 -0800 (PST)
Date: Mon,  9 Nov 2026 18:25:28 +0000
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
Message-ID: <20261109182533.3594984-21-lrizzo@google.com>
Subject: [RFC PATCH v2 20/25] net/libeth: Use GFP_KERNEL when pre-filling RX rings
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

libeth_rx_alloc() is called both when pre-filling RX fill queues in
process context (for indices 0 .. fq->count - 2, when buf->truesize is
still 0) and when refilling RX buffers from NAPI softirq.

Use GFP_KERNEL during the initial process-context ring fill so page_pool
and PISA page allocations (including set_memory_decrypted() under CoCo)
are not forced into GFP_ATOMIC context.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 include/net/libeth/rx.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/net/libeth/rx.h b/include/net/libeth/rx.h
index 0e736846c5e8a..de1e5fe44aa40 100644
--- a/include/net/libeth/rx.h
+++ b/include/net/libeth/rx.h
@@ -106,10 +106,17 @@ void libeth_rx_fq_destroy(struct libeth_fq *fq);
 static inline dma_addr_t libeth_rx_alloc(const struct libeth_fq_fp *fq, u32 i)
 {
 	struct libeth_fqe *buf = &fq->fqes[i];
+	/* fq->fqes is zero-allocated and pre-filled in process context for
+	 * indices [0 .. fq->count - 2]; slot fq->count - 1 is first allocated
+	 * in NAPI. Use GFP_KERNEL for initial pre-fill and GFP_ATOMIC after.
+	 */
+	gfp_t gfp = (buf->truesize || i == fq->count - 1) ?
+		    GFP_ATOMIC : GFP_KERNEL;
 
 	buf->truesize = fq->truesize;
-	buf->netmem = page_pool_dev_alloc_netmem(fq->pp, &buf->offset,
-						 &buf->truesize);
+	buf->netmem = page_pool_alloc_netmem(fq->pp, &buf->offset,
+					     &buf->truesize,
+					     gfp | __GFP_NOWARN);
 	if (unlikely(!buf->netmem))
 		return DMA_MAPPING_ERROR;
 
-- 
2.56.0.542.g3ef89b7020-goog

