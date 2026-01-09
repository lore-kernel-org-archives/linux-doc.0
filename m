Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FB9303C97
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767958141; cv=none; b=jXWLEW9fA+FWSf+kz+SGPCR3kMz5DFYmc9vXb667uiFmEYOVeKHSz7uYl16m1EFuwcBwhEGL7l3kD08SNOqsbKB5lUL9ufqO8njS8L1y9L4QpHoyC9HQ+BH0it6U/qq0EqPfwkvnecs4fNGKoUpSJFoO2aiZqWtypVsSORUWhdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767958141; c=relaxed/simple;
	bh=LSh5hLuiJCxDRwJ+BQ+Xc7tCZE16QA/b770rYhc+vp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aB13l3SPNJT0cSh4hGHcKcYW81S5nhD9SD2c760DpdPFgDj9I1Mdur/JB9FpjRo7M67lkkIIMXKYaGNrM8dG+TikISPWZpZWsIwvYkybMyyMXyNnz2OiZt6W4UDRHafg3sSCZC2U0E2zEtLAXFwucK5pm/gcsgfxCn5lk+LpN+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/ZG7m4w; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/ZG7m4w"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fbc3056afso2314381f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 03:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767958136; x=1768562936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BopLoWIhKj7xpDJExutQghL/d96/x+rVfP3p1ohtywE=;
        b=b/ZG7m4wKVzkwXfuLm6QGnOAJp/HgaQTkKoDf4PPERpRrW/xfPh/U86HYEqTVWFaAG
         g2ZzP0xHeWS/pnMNnNON5RAq/fUxI0a+XKI8/U/MRV7sY/5X834K0gd3oCw3qkjULuVk
         zbg+ctPuua5VxpGTkqH/YoBA+YIjplcnWshRHz0iUllOQ/X9O5k22kzUU2zJQtShydIU
         mYFw3/HG9Rqu5xERUCHnvYY18SouLf5BPujcesnOYA8lX1gDF5I65J6qayMEbAQ0GvL1
         1zXiO/qOJFWNfcQS8VLSgL6nKXibWjKJq+OG6dGZBG2AfAP763X1NOgvjYBmNjMevPAR
         7Ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958136; x=1768562936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BopLoWIhKj7xpDJExutQghL/d96/x+rVfP3p1ohtywE=;
        b=be6ROo6sAPfeVxNv52n9CD6J2hyaxUnzNYfhAu3dGAI1gDKOYhq2YmseAPQJKiPmpV
         uWUNOp1Vc4j8l2WDVHIxj2bwfEG40rNAStVskvQWc/9rZhkT8fN+LMXvekbzEnCJHTNQ
         /JwtfIlIUcF7CspRwLPaAC53XIBBJlWrQKO0PT2pEcvc1RI93UfcE0vY8jvXoNpcyvDO
         8CVWxL11c6cY8EyjjuLSv2WjUUzdyfCqmBvEH6gGu99VPxJDAQHBMrXHDPnL/JNKTeT2
         8sU/Wkid6V93rAfnUN0/yVHLam7ot71uP622zdSIww4qF5MryAgGWldlGOs/7QjL3vwO
         OXTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhXsvlK4EUJ1xuCX4XHKbKe6zkITUuVIM7e3MxLKuJwgwyM5FvEhPyPWE2BXTIi/o3uIcIIc4LZOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzplOyWX+IyZMGKieQxlNSezIWLTEQTU2Xo44L0+FLh9xnWvRP6
	3azhs2S2PhgGmVtaCjzJLNEBvH9kAFaW02XcWkqLxPzb/4EWA0CmLO0S
X-Gm-Gg: AY/fxX6nm1aTSw74PAXIX2kbYN2bWgPYvK5F1/ThuBmcPc7AJ9bYulPlBpWiGYbaQIY
	6XQo/8++Y6qQhUn1n0hUJivC6HxeaK/TeT3WtbJ1Lv88EHIbijpmmAvE9jJiWhXXAXH4Vb6dIVw
	XA8niyryOOCx4wLb7A09sNOvOnv70ywN1e544HkXCGcpXwuZHyiQVtPV08LOyyK6Hxgyf+rjV+m
	rGjPTFxjTpJ+WuJBdFAXm+FfbIHtT7oTWDtZo9HlawLkwqB7KE8Y+zNMaoTti+wCsjYgjpCiXBw
	Fv0dIeatM6EYRWiCIsl/V5tUcJe2cJz93lFdr9eW+xdZLsSOucWi3/WuAoaCaQwOGAFcJkzZ2h3
	mS5AOEyFCOSCw9bDYYmOBujABNA8Pg/VRYDBNTeODyX49VBsdB/IWKrZsdKzT4BqeOiTTfGN5uo
	BCvnDStcqhFKfu+1zcOqTwNF0uyaUu5iyi5RfpgssucaXYIQuz/ZK9/LPOlnMF3K/x7Ak8Gg==
X-Google-Smtp-Source: AGHT+IEDJTcPs3tUFs8ntvCdNub/oE0byZocsnwzSH3zb12a+mdPTDeqfaJ1kCUtNpxFLR0tZ3foXw==
X-Received: by 2002:a05:600c:620c:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-47d84b3be47mr99997755e9.32.1767958135835;
        Fri, 09 Jan 2026 03:28:55 -0800 (PST)
Received: from 127.com ([2620:10d:c092:600::1:69b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636c610sm60056985e9.0.2026.01.09.03.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:28:55 -0800 (PST)
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
Subject: [PATCH net-next v8 1/9] net: memzero mp params when closing a queue
Date: Fri,  9 Jan 2026 11:28:40 +0000
Message-ID: <1414450be1abf13a812cbcfc3747beb6b6f767a4.1767819709.git.asml.silence@gmail.com>
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

Instead of resetting memory provider parameters one by one in
__net_mp_{open,close}_rxq, memzero the entire structure. It'll be used
to extend the structure.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 net/core/netdev_rx_queue.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
index c7d9341b7630..a0083f176a9c 100644
--- a/net/core/netdev_rx_queue.c
+++ b/net/core/netdev_rx_queue.c
@@ -139,10 +139,9 @@ int __net_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
 
 	rxq->mp_params = *p;
 	ret = netdev_rx_queue_restart(dev, rxq_idx);
-	if (ret) {
-		rxq->mp_params.mp_ops = NULL;
-		rxq->mp_params.mp_priv = NULL;
-	}
+	if (ret)
+		memset(&rxq->mp_params, 0, sizeof(rxq->mp_params));
+
 	return ret;
 }
 
@@ -179,8 +178,7 @@ void __net_mp_close_rxq(struct net_device *dev, unsigned int ifq_idx,
 			 rxq->mp_params.mp_priv != old_p->mp_priv))
 		return;
 
-	rxq->mp_params.mp_ops = NULL;
-	rxq->mp_params.mp_priv = NULL;
+	memset(&rxq->mp_params, 0, sizeof(rxq->mp_params));
 	err = netdev_rx_queue_restart(dev, ifq_idx);
 	WARN_ON(err && err != -ENETDOWN);
 }
-- 
2.52.0

