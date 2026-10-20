Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532704;
	b=bW+5YZuCOlEoXthVWTZdRA8ZOPER6YchGupClZd2tCZPrg8ONVTOaC5nCN26//l7z/GM
	 dtYbZF/HQYit3aeufpJTiqdfSsRJ3n4g6l4RhgZMSRuS+dabXVRTdANV1aanxHExswISu
	 7KtWyei7NbA0+JS3M27Ca1t4PdGgXiZ33H34lTGKKTwPS0a/pg4ayoWmcAPVHYNilF5Y+
	 6Tb2Ohvzb3hv4Mjj9iBIs1WHoTNxI7gAmPCnoBh0J/OdtsAmOR9lcPHlfX2GO02nXIwTB
	 z+cdfpG53gaxcRLVl7lydtkMcI1ZUC2NeZRt1aU8WJSYYTWr2hioq5mkr8GIdDKAQRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cfAvdLwXfWjd40UoEy069YQpliwsafovGfmnhOmQbDc=;
	b=vqfP0x8GnHft/nKjqhTvtCVu0fP/N/czK9zw4QJaCENPDRrWDi8hyPYJ7ElU+G5UQj83
	 xSxAZwwQwiy6Fx/HBOSwL8mqkeRZwsgOVyD+g7N8Hebh9wVogPzOtbLik5+ALa9QNzhhT
	 mxwcboW+SfGF2UreC7/A00ZfCgebxinU91O+en5LmytxPtMdl+H91pcxAHMt42QG3T6SF
	 +HGjPa8omFE2IybQk+ai64GraNG4pm4gTlRHV4LyH7/l0j645Mk907WxbODrwBe9qeYu0
	 u+DTZnknu805XSBae0azItDGdpKPHOyst0OdDyjrmpP0Ww+omZNrFMsGJyLpsjZM/qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="M9/nW9xi";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB30606A320
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 21:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB30606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=M9/nW9xi
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so694883a91.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 14:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792532703; x=1793137503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cfAvdLwXfWjd40UoEy069YQpliwsafovGfmnhOmQbDc=;
        b=M9/nW9xiXHNH5cAM4l4UytRW3tUYuKEg38HW4bOk5CXDt6X70hNM1dCysYV7xAmWNa
         o+FyFEEMvTXkHQyrzsFn9G3vGnhtH3WR2BOl3yBsu848b+SQkDnNGlauQD5iM/gceBZ9
         w3Y2cpV6ap6ddfacMymj2E3FSZmNwCDUEydfcnPffsa4W1ZcXfwcQQnhqSD/WfQgbAzG
         1yL0AHndXWwuhGsUQuDE3ZlmdH1gSMXuzss1HODYBZ7RwNFJtF6VfRbYj+fzgMBxBJQR
         GQ2VOqlKlOkgTydZika1x0DHKA/IPZHOPzcZBiOhAmvaIB/FXXkEp4A13etbEuYSHBq5
         +iHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792532703; x=1793137503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cfAvdLwXfWjd40UoEy069YQpliwsafovGfmnhOmQbDc=;
        b=BXqnRLSPkrRAXHwr1bcTYX/L4ZdI+SX24hyG83JPBNaZQrE+k/jbXmuWivXrvVzPgF
         bjD5FfWPGoGgESacsZdVEbDLfHdOg5nvNih/tK2cQ5d/f/BD79WydyNO+mrrVbNBXkvL
         lPckbWBFx0gx77Qt1x1pX4764G7gu1P/HjDmmLYRrxEAqo97URz02TE9kWZIqYiibpID
         hDHK/wXGlDvV4eJSsaL5eN9yPCw6mC9F/bnBtjkVlN7biswHX4kdGf8KDab3dsVzxXCl
         ZePpaGGghExDGy878PhRGX7A8lypKmIuQvQnN7XNX1Tzrg8Aq3+QIvBICwc+IX3CLFWJ
         9ZXg==
X-Forwarded-Encrypted: i=1; AKwUvBx12GwZTnedmKVLhFm7Bhd05cwmHzKr9ARDYs6bYFo/WPOK7lgwMoHo1xilKs3MhhzkIjot/vClaC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4tQEGqFn89YyB52Z8h3spi6dm9vaQUqJAt+ZW7hgwUfUSCWr2
	UVeFCmQUWj0X3/8ZMx5SzQwM50ksAzEM0agP3C2IO9/YR+0YbEt0tTY3hx9dQ5oBSDfqI/k8yfc
	/KpNRy+nJAUhRnFa7/hEjL93neLOEV6lJpoGnV24L6WUm4STAO517
X-Gm-Gg: AYBFou2cmwUSlsVFVF+MHv4YsFxcBzKkWXws6ol8nyTlfHksCm9/SYaWcnXdd0r7/ak
	qyLK95ioBHKZADCjqlJAQvJdfRccYbwpz97K6ZvlF/WQK/1+IoRY2tqgDXGOWgBW3wS7gDVrnjS
	Gr6R0O6A+ahwMD2enuZo1tz85zpntAEvAaJuxSMd238SMFIWrj/BWT13My00LbbKP/RJIbDtR+Y
	+J+E+TTflLo3kRiOQNJLN5mo6fljaKFtA5dMVdazRXUHGm4WcY6neSpkZsfn/HLzwS3Fr3Z6qpK
	u4JiEUydmK5KeXsVBRmc553RDYQHd2eamTdUM/xnLYoEhiwejft1QbB1Oz+mJj+xUPSVxhlGHx3
	O/4PPJ7dWPHqOPVmOhpk=
X-Received: by 2002:a17:90a:fc48:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3ad86f1ad53mr123540a91.27.1792532702744;
        Tue, 20 Oct 2026 14:45:02 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ad816f490csm559018a91.2.2026.10.20.14.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 14:45:02 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 212A9402B5;
	Tue, 20 Oct 2026 15:45:02 -0600 (MDT)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 1BF17DC0D46; Tue, 20 Oct 2026 15:45:02 -0600 (MDT)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Boris Pismenny <borisp@mellanox.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] tls: keep TX and RX hardware offload on the same device
Date: Tue, 20 Oct 2026 15:44:59 -0600
Message-ID: <20261020214500.972308-1-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
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

After TX is offloaded on device A, a route change, or a change in the
usable-slave set of an 802.3ad or balance-xor (layer3+4) bond, can make
RX setup program device B. tls_device_attach() sees the existing TLS
destructor and keeps ctx->netdev pointing at A. The RX driver state on B
is then untracked: tls_dev_resync() and tls_dev_del() are invoked on A
for a context it never created, and neither socket close nor
NETDEV_DOWN on B calls tls_dev_del() for B, so the driver context leaks.
The reverse setup order has the same problem.

Check the shared device binding under device_offload_lock before each
tls_dev_add(). Permit the first attachment and a second direction on the
same device. Reject a different device, including when the old binding
was cleared by NETDEV_DOWN: the TLS destructor remains installed and
tls_device_attach() cannot establish a new binding. Setup then falls
back to software for the requested direction.

The RX check precedes allocation and software setup. TX uses its existing
resource unwind path without calling the driver. Document the shared
binding and clarify that fallback is per direction.

Fixes: 4799ac81e52a ("tls: Add rx inline crypto offload")
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 Documentation/networking/tls-offload.rst | 16 ++++++++++------
 net/tls/tls_device.c                     | 24 ++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/Documentation/networking/tls-offload.rst b/Documentation/networking/tls-offload.rst
index e5802bcd4d22..cf0e599c06a1 100644
--- a/Documentation/networking/tls-offload.rst
+++ b/Documentation/networking/tls-offload.rst
@@ -71,12 +71,16 @@ During driver initialization device sets the ``NETIF_F_HW_TLS_RX`` and
 pointer in the :c:member:`tlsdev_ops` member of the
 :c:type:`struct net_device <net_device>`.
 
-When TLS cryptographic connection state is installed on a ``ktls`` socket
-(note that it is done twice, once for RX and once for TX direction,
-and the two are completely independent), the kernel checks if the underlying
-network device is offload-capable and attempts the offload. In case offload
-fails the connection is handled entirely in software using the same mechanism
-as if the offload was never tried.
+TLS cryptographic connection state is installed separately for RX and TX
+on a ``ktls`` socket. For each direction, the kernel checks if the underlying
+network device is offload-capable and attempts the offload. If offload fails,
+that direction is handled in software as if offload had never been tried.
+
+Both hardware directions share one device binding. Once one direction is
+offloaded, the other direction must use the same device. If a route change
+selects a different device, or ``NETDEV_DOWN`` has cleared the binding,
+hardware offload of the other direction is declined and it uses software
+instead.
 
 Offload request is performed via the :c:member:`tls_dev_add` callback of
 :c:type:`struct tlsdev_ops <tlsdev_ops>`:
diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index f11d0528fc43..9df183d0dd97 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -1022,6 +1022,20 @@ int tls_device_decrypted(struct sock *sk, struct tls_context *tls_ctx)
 	return tls_device_reencrypt(sk, tls_ctx);
 }
 
+/* Both directions share ctx->netdev. A second direction must use that
+ * device; after NETDEV_DOWN clears it, no new direction can be offloaded.
+ */
+static bool tls_device_can_attach(struct tls_context *ctx, struct sock *sk,
+				  struct net_device *netdev)
+{
+	struct net_device *ctx_netdev;
+
+	ctx_netdev = rcu_dereference_protected(ctx->netdev,
+					       lockdep_is_held(&device_offload_lock));
+	return sk->sk_destruct != tls_device_sk_destruct ||
+	       ctx_netdev == netdev;
+}
+
 static void tls_device_attach(struct tls_context *ctx, struct sock *sk,
 			      struct net_device *netdev)
 {
@@ -1157,6 +1171,11 @@ int tls_set_device_offload(struct sock *sk)
 		goto release_lock;
 	}
 
+	if (!tls_device_can_attach(ctx, sk, netdev)) {
+		rc = -EOPNOTSUPP;
+		goto release_lock;
+	}
+
 	ctx->priv_ctx_tx = offload_ctx;
 	rc = netdev->tlsdev_ops->tls_dev_add(netdev, sk, TLS_OFFLOAD_CTX_DIR_TX,
 					     &ctx->crypto_send.info,
@@ -1227,6 +1246,11 @@ int tls_set_device_offload_rx(struct sock *sk, struct tls_context *ctx)
 		goto release_lock;
 	}
 
+	if (!tls_device_can_attach(ctx, sk, netdev)) {
+		rc = -EOPNOTSUPP;
+		goto release_lock;
+	}
+
 	context = kzalloc_obj(*context);
 	if (!context) {
 		rc = -ENOMEM;
-- 
2.50.1

