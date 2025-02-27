Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9889A1E834E
	for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 04:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740629546; cv=none; b=DTssKvmfcTGA7+rITod1SDRsMpAWwm620sf9RcM5Oa5lh3ZELyRQeuPs+vCE28DAjpqBuI91MtYsK52uOSv7vuC6onA1OrwmzvB7RS5Y34se1t8W9lkYA5g7KXmxvT/XtH01NH2OkZIsN0+FgqKAkKZZuds51KXN0QTbEba1Va0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740629546; c=relaxed/simple;
	bh=GvcT8AKSmZkQfzKz7YEMgUlDLlmUyxkr186tf9XcX4w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L/cgS/Z9MGnGFoXt9No8gbQcuDzu6fvI8Zns0pOrfPTpjJ4/3puGek8GkHBd3z4ggv0yrONt0wnYGlgqEraL+faNtQ/4bjnN2JxkFHKu4UpANO0uS6cfCAOSELqKoD97Q14UfPYDEeYzKRYZLF02yIhMXzq4G/vHe9VxnxYX5rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v6y4S31Y; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v6y4S31Y"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fc46431885so1781860a91.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 20:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740629544; x=1741234344; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1BK8UWHjd2d73PlicaTz2yvcD3Y84sSY5zmWMDwEl4c=;
        b=v6y4S31YKv4x+uW9O+Igp8KrfXI3dFYNdGbVp8qu8vT9jCfd3QbOl1PVy5st92cxY5
         KnI37iEcM2f4L/5JL0DUV2yD593EpbWDcxy/mvArqJ9n5SLCbGTyTt26HtyzPaEqxSMf
         Q9Dhml0AhVw2z9pSStOGA1ZA/fCBRh0aHBOon+xzxw35W1FuRONNsbNYIlTTu/EK4KIM
         pb4dqVsCgkKVWycO/sNwDop3+m5KgYz2aPLnjTU78EurqMnH8vhOP575WzyJuxmG1sH7
         gk2nyaUm8YLZl5lJXf+bdb1UD9fNkhv4XYSnUqkzGMeO+ls0I598okWGTmhAV4McFFeT
         O2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740629544; x=1741234344;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1BK8UWHjd2d73PlicaTz2yvcD3Y84sSY5zmWMDwEl4c=;
        b=Zdr0jVvaxjpdeYa/7OQfCYoifs6Hk7jjWjNwg928Zltti3DkrkEOCcHgpU8JfpkzZv
         veBipjWXAYdntPnXgn08SvsEooln73EoDu7y7J+ic3bo9EmmuxLNgEkh9UFsWg4Pakxv
         DbapYni9ngkrEKMEFd16k6GJteoMnnOt4BCOJURNgZsr19MDp2FkZHUgS4Nn5XPo5fg7
         wNWXp/9Hb+XbQvl0u8p1oW0XL7NJvYfU2aerEw37POtfQ0xUOJU6iW56qsX4I2wvVog0
         3x0+cg3eIGBScgj32g4mhhU2MEce1Mf9wl0aWLkTc8tCqasHYHWOhI/Oe/r/fyYAuX8N
         Ftug==
X-Forwarded-Encrypted: i=1; AJvYcCVQV9qr6xYiNAhR1ADRfvCarKVusPFtn5H8zlVvAEs0Aw9EAGLC8w6h1Yfw5wW79RYxZ9MS8G7Hoxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcS/vRu8PcJsOCnVW0Q/OfFKmUuKVF0b+bk7V3zyP+fXMuPgF6
	f3JrvbRBogOKWYzyVrpwLZ6km/VvnnMh5tG/L6JcGAPN+0dLQ+rkmGMxEzCl5mG0sIPSKWiMFKM
	VDCUYh8IwT8mg6z5Yq/rHiA==
X-Google-Smtp-Source: AGHT+IHTUySLG4gKkq1561d2wLktf6kPf+TzsmbkPTQcuGF4Ixx/z+TeQmg+TX9wQn3KAepG/Npu4ft2SXxLD33YGA==
X-Received: from pjz6.prod.google.com ([2002:a17:90b:56c6:b0:2fc:3022:36b8])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3b83:b0:2f6:d266:f45c with SMTP id 98e67ed59e1d1-2fce868c637mr39635027a91.2.1740629543963;
 Wed, 26 Feb 2025 20:12:23 -0800 (PST)
Date: Thu, 27 Feb 2025 04:12:08 +0000
In-Reply-To: <20250227041209.2031104-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250227041209.2031104-1-almasrymina@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250227041209.2031104-8-almasrymina@google.com>
Subject: [PATCH net-next v6 7/8] net: check for driver support in netmem TX
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, 
	asml.silence@gmail.com, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Victor Nogueira <victor@mojatatu.com>, Pedro Tammela <pctammela@mojatatu.com>, 
	Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"

We should not enable netmem TX for drivers that don't declare support.

Check for driver netmem TX support during devmem TX binding and fail if
the driver does not have the functionality.

Check for driver support in validate_xmit_skb as well.

Signed-off-by: Mina Almasry <almasrymina@google.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>

---

v4:
- New patch

---
 net/core/dev.c         | 3 +++
 net/core/netdev-genl.c | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/net/core/dev.c b/net/core/dev.c
index 3f525278a871..80636c569cf4 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3921,6 +3921,9 @@ static struct sk_buff *validate_xmit_skb(struct sk_buff *skb, struct net_device
 
 	skb = validate_xmit_xfrm(skb, features, again);
 
+	if (!skb_frags_readable(skb) && !dev->netmem_tx)
+		goto out_kfree_skb;
+
 	return skb;
 
 out_kfree_skb:
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 6e7cd6a5c177..6c5d62df0d65 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -972,6 +972,13 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 		goto err_unlock;
 	}
 
+	if (!netdev->netmem_tx) {
+		err = -EOPNOTSUPP;
+		NL_SET_ERR_MSG(info->extack,
+			       "Driver does not support netmem TX");
+		goto err_unlock;
+	}
+
 	binding = net_devmem_bind_dmabuf(netdev, DMA_TO_DEVICE, dmabuf_fd,
 					 info->extack);
 	if (IS_ERR(binding)) {
-- 
2.48.1.658.g4767266eb4-goog

