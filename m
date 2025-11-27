Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D261E314D04
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 20:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764276275; cv=none; b=rT9+uuDwzcsXHN4MJyg3hdinwFAHXAVPxOqaoZN7hyD4N8o/cLyB+VX3qZ0Vh06rNAKf2ke6UIVzgc+N8dGXLZHTZ0RkBucrA4L0Lj5dnRmiZVAfwhmnNgCSQlw4xOIlX7IQAhCQkUOVcTQXLmicOR+G6f0FffVoqW+thSqX0g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764276275; c=relaxed/simple;
	bh=LSh5hLuiJCxDRwJ+BQ+Xc7tCZE16QA/b770rYhc+vp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DmD3s4Ujodle5Q4T8FHA+D862WQFtv/KTIhZGhA4HwYCHIHyF565uZYTjpGncw/MljoiGwhpWJBtL0DNwegd2eZ5rShfZlv2FJFCF4U6ua7af1JiEiWXcu+4ngnUGhTZrAZJgIgH3YXd4wD41GKBiGKL7M6nuvWo/DS8Dfaged0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4Vq6lT8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4Vq6lT8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477632b0621so6576065e9.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 12:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764276272; x=1764881072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BopLoWIhKj7xpDJExutQghL/d96/x+rVfP3p1ohtywE=;
        b=h4Vq6lT8dw57ZZH9qYwYgKj40DBAQA5xlFNwfRYEnrpMIrT0ISZ16ioVBQSBDlNS5s
         OKr7CBmJc7rpRztUcdIkdL20sYQCEqxfKNw9S2pTWdajS5IV8p+8OjSZ8vj4uLU0N8fc
         BUB0mMsV84s6iwxryLWxQUiMKv1OHPAmWpc5cbJCvnslwq/szwv6Gw/5Cv9PyXQe0ZS9
         opRJkfbKBH0wdTl1SrYT5U33BidBSxKRl+rXISl9ELU6C/NDEj3X7MYJdMAQgB8NLQOm
         mgAt2pktouiiow4hpjQgQZ+orqEmk9O0VTQbD04Yz5QaSYRPoBsLTLImjlrBB6FLho3i
         AMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764276272; x=1764881072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BopLoWIhKj7xpDJExutQghL/d96/x+rVfP3p1ohtywE=;
        b=v0STXxmN/oV/Uv3lbyr8SAX7GXYDjafSMGbnLOFAlMcweitia4jzojhGeMyPy+YPJo
         nLoQaRO0UaMQ3jeUkfNMoXRDcKZlW7HKwcip1ke1GyBgkPKa6OTkPONJRhpUZIrYrYKy
         n0BVKYm8loi0SDnS4kfcTPyMSV10Pd8t0jIdM44l41eazuUUuV6Rn8T91CAWBtZ6aJFW
         JlE5d+l5EFZMd98tQYPPCHJFsj/N7MeZ8pFYlCWqOacxmzVGSg4+TN3dt5M6izDRbO1k
         RBdUbWOwuFLWddfdaKweD6hsYWsKhMTWHkcE/lm5EE0b2eQvowY/mt1SiP1drlSDka7f
         sXcw==
X-Forwarded-Encrypted: i=1; AJvYcCXDbyVqPxrtmu8tK6nEok/2GQ0H7KMa2NjRse1rqvDsdb3IfJVp4FPYPnY8LdBBtxESAPCjG/0a7pg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuwrIcrtCxJ1qOMI6A1V/qRbDROE3slPO+5esU2JKTPzrYTVli
	oPRi69C68GyTn1kf9gII5CCacam4/EkjHK1bHtTYxSR2o+f7B1u9Im6z
X-Gm-Gg: ASbGncstODaBcDjLT2QmvpHBLpWcw4E9MY3U37V97gPR/rUplUn0vVGkeCPMQlbWfa7
	RQpyMmG2oEY+P8lh41FlObjOP8QW/zOHpF9I7HhUSyrrwbRlf4n1JRsW6GvF3fIs9/tXiEFpHW0
	hPZlK6LzN9ixZzsRIYc8w458KzprI6OzaObAHN8QlXZ4Nn+dz2St38VdOF7mtW+bjLu3F4tp3S+
	aLMdIRomWxYqdhvavnLWOc8uC7CrIwVMmLIjVxoPmeZy1jrh/gyss5Of6b/D4vi6IgTp4C4rlA+
	RubJSrhGkQwnB05dFUJi+qcbzNJBvIFUIenrba8wP9yRJ7WHS3eqsb12/jcYZmYC89Hmz7lTOax
	cb5gYBM+HgqYfJDsYcFKRSV/G+0RnrARWoVNJrHoYd8vmRsj2uy+6JQDBJemwls0F0kYkC0zSCE
	V5KC8/mkxafeem1w==
X-Google-Smtp-Source: AGHT+IFwRmakImgODlTFBacPBXxUnLB6FVPSTpr1ZGMe5y5759YvSUHXOymgL600ltx5XYutVYMrKw==
X-Received: by 2002:a05:6000:40c9:b0:429:b5a8:5c65 with SMTP id ffacd0b85a97d-42cc1d2d5d1mr27183858f8f.30.1764276271798;
        Thu, 27 Nov 2025 12:44:31 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d614asm5346105f8f.12.2025.11.27.12.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 12:44:31 -0800 (PST)
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
Subject: [PATCH net-next v6 2/8] net: memzero mp params when closing a queue
Date: Thu, 27 Nov 2025 20:44:15 +0000
Message-ID: <cea893ad1560a47f6a1c6c8fbfe1a308613d11cd.1764264798.git.asml.silence@gmail.com>
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

