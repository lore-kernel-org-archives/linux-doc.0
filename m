Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22E321D3F4
	for <linux-doc@vger.kernel.org>; Sat, 10 Jan 2026 02:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768011543; cv=none; b=Xo58pi5Lrc/jw9t+BVwaEJ6Dc1qVYYJWOi8s1qCqpONWKY0fxreH41gSdoBWWOvyQ1vcVLBA79UzP9y54wvWRZVh720VmlcxoNup3dzGRJE2hwOJ40U/h23EIQf+NWwpKhrSjYHd4KaOEnUJjdoQQaxfz6e/fIoqXJivDeWW2sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768011543; c=relaxed/simple;
	bh=xiO09bVBGC8/K7L0bw2p16Wp9QD28tXsWfMmjzD/Ua4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfHpLWxmX1Un2qgnzmlgs6bvd/pVag5j4ahjm1xWd42bYdKHbrWcDuWbmCggjnSJJgcy02sEl6fpzrSpR+WkNK7DXIVpI7cWZay+OLmM43AW4HVtJTfLWUm5z8drFremCVsIdQ+sSGZQm+IdJzE47b7ON+YtQ7L/MPSUQWZANP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aP3KPlyY; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aP3KPlyY"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-790948758c1so51460757b3.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 18:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768011541; x=1768616341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07Oq7s3cDlA8pW6W82CkM0efPRUiBJHxCtezHHHyhNs=;
        b=aP3KPlyY6zoY7wXyxuDu2CZQUwNdvvHc35TJGW5jxMrfnSDqkZXyLPcBG/23GZsOku
         +SzTOovsD4ZTn547tqu2cDRpKnMKEbIDBs9G+q1kBW30Ou0bCwPCBKToUtTe9K3DDMMC
         Ohuzeq6Bh6zK3AFt4y965A0yZlfbmg7XvB/lzx30Qv2e8kOJRUB/6V2PmCPEWYisTc9a
         ZIaCQRPoXgxxFE1wzWPANO6w1Yctt4oVjzagCSmI5wSSHgVhs/uT+h2mXpScaiKeOspL
         lIbXHhSREReuTlNknT2UKD+aui96R3GSDLqTRd51j+I4REL5tMJhMYS7npzTAvWIZJtj
         aSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768011541; x=1768616341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=07Oq7s3cDlA8pW6W82CkM0efPRUiBJHxCtezHHHyhNs=;
        b=ej1bpsRT6NlasHO/Z6rH5iwn7nyrmixqP0GzSRwACDlUokOdRazu+1FpyI9DsZpiQ5
         ITAKmevg0BPi4cobOYk+4NP2KdCMRK1GhfoTsRNsZj+LDT2kJzlznrAtkvyX0jg0vo2R
         1coHfvqVetbhsGqISTdLQmfevk4TcyCn51rkEeJCzqplZxtpvQH0TuaDoSseqJMd+8Cp
         dbWlSkZUKywHORvecz2XffJIyoV3bHRMSGx2JkhSpTowj8tm1EwoNqMI/eFe+lFI2lFo
         SopA/gWKT9bLCMNPajq9tbJhnEIkW9IUAvv8tbiXpbtzQkynkGuHzBPnybLhwvsMExnT
         fAXw==
X-Forwarded-Encrypted: i=1; AJvYcCVsu4/NoTClKLG+cbm4JVm1Zk4BuiGUVNbt+wti4D4PiwETYRzCbq1ziIP9Fsu3G+3nGuocjT3Rgfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTwVrd/7io0kkGVfRDdXrlsqzgZEkWMLzASbQ66ECeqzgDJrRO
	Rql3oNVajn1KoxAqN+86DdrCIUgRXno8YlDYzZV/Tfah9kbu4vWZ3kfu
X-Gm-Gg: AY/fxX50x/Olymo63F5LSx2PlO5klqGWMm88/VsyEkPOaUB3LhXiCxk6pIpOfTwXCQ6
	F5+04XyIFJlhg0JrmPiaiUQlGAjl/bC5ZXpQu7ymhFmU/2nU4+//bP+6MH1G8JNCPTDwrpWHed4
	Z3B0I2you3JkGlji8p//2Qjf8PePH/fgQBIcO1F+ZSB77Qbz60y90MjvjHecygsm0E4wVb8qJ9V
	ZrmYJ4imQYOgj2mmw6ypDxYiSV1XKOUSRtNxLT/8YIJayMf8I2CrfPToPquUeWq2IZaGuw0v6/t
	kDrVoor8RQVISfV+oqrQPXcle+vOGYNKz0zpm1OjftfGPlfibNNBnZ9EwHV4zrztPliFGbQ6PCs
	KTH5uxWwVYTuDGCqECPLF8VNA98vTVF6hee+XRf+ErG+XBdolJ7kzQf5XyGd9670kLljprBdVSJ
	D3rK0TiT93
X-Google-Smtp-Source: AGHT+IGfZcTckoYQm0PZ8TzEz8YmdS7X/s2FUArN0KlH5v6g1oChNJ7JGYZdwCItZFhkXd+klVUdmg==
X-Received: by 2002:a05:690c:6704:b0:78c:5bb4:1d27 with SMTP id 00721157ae682-790b568d427mr107537007b3.38.1768011540680;
        Fri, 09 Jan 2026 18:19:00 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:a::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa6713e5sm46527227b3.29.2026.01.09.18.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 18:19:00 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 09 Jan 2026 18:18:15 -0800
Subject: [PATCH net-next v9 1/5] net: devmem: rename tx_vec to vec in
 dmabuf binding
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-1-8042930d00d7@meta.com>
References: <20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-0-8042930d00d7@meta.com>
In-Reply-To: <20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-0-8042930d00d7@meta.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>, Neal Cardwell <ncardwell@google.com>, 
 David Ahern <dsahern@kernel.org>, Mina Almasry <almasrymina@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Rename the 'tx_vec' field in struct net_devmem_dmabuf_binding to 'vec'.
This field holds pointers to net_iov structures. The rename prepares for
reusing 'vec' for both TX and RX directions.

No functional change intended.

Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 net/core/devmem.c | 22 +++++++++++-----------
 net/core/devmem.h |  2 +-
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index ec4217d6c0b4..05a9a9e7abb9 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -75,7 +75,7 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 	dma_buf_detach(binding->dmabuf, binding->attachment);
 	dma_buf_put(binding->dmabuf);
 	xa_destroy(&binding->bound_rxqs);
-	kvfree(binding->tx_vec);
+	kvfree(binding->vec);
 	kfree(binding);
 }
 
@@ -232,10 +232,10 @@ net_devmem_bind_dmabuf(struct net_device *dev,
 	}
 
 	if (direction == DMA_TO_DEVICE) {
-		binding->tx_vec = kvmalloc_array(dmabuf->size / PAGE_SIZE,
-						 sizeof(struct net_iov *),
-						 GFP_KERNEL);
-		if (!binding->tx_vec) {
+		binding->vec = kvmalloc_array(dmabuf->size / PAGE_SIZE,
+					      sizeof(struct net_iov *),
+					      GFP_KERNEL);
+		if (!binding->vec) {
 			err = -ENOMEM;
 			goto err_unmap;
 		}
@@ -249,7 +249,7 @@ net_devmem_bind_dmabuf(struct net_device *dev,
 					      dev_to_node(&dev->dev));
 	if (!binding->chunk_pool) {
 		err = -ENOMEM;
-		goto err_tx_vec;
+		goto err_vec;
 	}
 
 	virtual = 0;
@@ -295,7 +295,7 @@ net_devmem_bind_dmabuf(struct net_device *dev,
 			page_pool_set_dma_addr_netmem(net_iov_to_netmem(niov),
 						      net_devmem_get_dma_addr(niov));
 			if (direction == DMA_TO_DEVICE)
-				binding->tx_vec[owner->area.base_virtual / PAGE_SIZE + i] = niov;
+				binding->vec[owner->area.base_virtual / PAGE_SIZE + i] = niov;
 		}
 
 		virtual += len;
@@ -315,8 +315,8 @@ net_devmem_bind_dmabuf(struct net_device *dev,
 	gen_pool_for_each_chunk(binding->chunk_pool,
 				net_devmem_dmabuf_free_chunk_owner, NULL);
 	gen_pool_destroy(binding->chunk_pool);
-err_tx_vec:
-	kvfree(binding->tx_vec);
+err_vec:
+	kvfree(binding->vec);
 err_unmap:
 	dma_buf_unmap_attachment_unlocked(binding->attachment, binding->sgt,
 					  direction);
@@ -363,7 +363,7 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 	int err = 0;
 
 	binding = net_devmem_lookup_dmabuf(dmabuf_id);
-	if (!binding || !binding->tx_vec) {
+	if (!binding || !binding->vec) {
 		err = -EINVAL;
 		goto out_err;
 	}
@@ -414,7 +414,7 @@ net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
 	*off = virt_addr % PAGE_SIZE;
 	*size = PAGE_SIZE - *off;
 
-	return binding->tx_vec[virt_addr / PAGE_SIZE];
+	return binding->vec[virt_addr / PAGE_SIZE];
 }
 
 /*** "Dmabuf devmem memory provider" ***/
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 0b43a648cd2e..1ea6228e4f40 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -63,7 +63,7 @@ struct net_devmem_dmabuf_binding {
 	 * address. This array is convenient to map the virtual addresses to
 	 * net_iovs in the TX path.
 	 */
-	struct net_iov **tx_vec;
+	struct net_iov **vec;
 
 	struct work_struct unbind_w;
 };

-- 
2.47.3

