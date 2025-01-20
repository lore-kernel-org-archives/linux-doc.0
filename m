Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E59C1DF991
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363704; cv=none; b=aOqsPxs+c8ZamPnPgIOfyAeNoiqxbAPi1LkAiid8oMPu/4hz+AAcM0RPqyEA/WFakJNjZvoOLamT5w0BnoAUQHeEdJnp0675IwQnb0PWnd0WPzIaVL5oef7/GqHlJgVsJnUCHGmdwN1psce90xEK4msFvkyjw1dADLOA7bLqAkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363704; c=relaxed/simple;
	bh=HCC1TB2JnsejBIhQXiuHZ87jAkzuIxmozdRWSI4CgLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=Dv8f2glU+bIU6AMB+zJekqafncVCVfOhimhhySPONefIt4XTofpDD0ce5De09XPiZtAclISRPbz1c+3mYq0uH/XfJi+iT6rekTF9GyArHeKfZnH5qNzcCTmPgh7FXVhlv9q6E/HttO+nnowbqguuYXEZ6CZmAdqS38gn2+xwJEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=1YqH7BNd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="1YqH7BNd"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2166f1e589cso103452695ad.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 01:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1737363702; x=1737968502; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=87auSTBirOR9mtDtSjr+Anr6dOurfYcbwGKWr12CzKY=;
        b=1YqH7BNdoGUdCnSOoOvGBxGfCJtE0qiYMq7HeDw+IeIAkGseIQc2uHXL5rFBPuAUc+
         3pFR/tOFg2NPEvoLkDfaZ5fuqTVqHyTHmw/8mjV0rOQUEgMh1yrOA6toPYvC3qoXdLLo
         lURp90f6W5L/wF+a8SJ1MALD7iTWBWcoXsWSJl+grYsB/201wkMLXEtG3PtatEOxKmle
         3reu/tVnEvyq7sFjpASk2cJieI6uarTc66ZMOn4cmyLNHOIyCeoNBu9cUuD+Hqcq+iWN
         Sc1BrFMS3QFA4hvwJpXy1e+d2WlqVanHdDPGvIzP9O6gAIEjT+PooNvTrZk2ndozkAAZ
         4OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363702; x=1737968502;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87auSTBirOR9mtDtSjr+Anr6dOurfYcbwGKWr12CzKY=;
        b=AWktvORQzyxPBFOO7270ohJ2YFSoi+gPYtIT5INt0eM/2+zhz9aXr3Knq5Z5HekYTQ
         9QCwYuhCe6GF3QA8jkWK7gsUxxmBG5pQZ2ZSW5vR8qMo6dWcsHV6cVqcka3iRFBHDfyb
         /pIzr7B+Ly9ruH6ru6vPGvf6Efw8beKF3+MK2iUcfA1Kx5pWMT3yrtzc2zhmB10x6y+x
         AcVzWpv0sS0Rq8WWhiyD+zJ81FC1V/z6NKIpb/X/UYMyElMrX497nkGFIxu2NHvERrd2
         AIcEgmP4wCBD1BqGPbpR0qkSHJNj9EZSksqLi6+PLDKv1KQG1FWT/flidCd/9DIybdn2
         QmyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjMmrByN/Flfd9wPKWD1T6EEYV0za0qB8kUCnHU/LvFIMLhubZabWoBSbFb7jTqXMDs1YO3YTS/Do=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUSeDnqrq/pbgQ0Z8NNU4E3bkOrkMthmG2YwmlYSibE9vdB853
	pGi3lvGQ0991PncDzddXWSjjviQw0yvJj/Pxb60vcghZZt/g4Pyqj5AerKHIeYk=
X-Gm-Gg: ASbGnctrBJrGSrUre+tgZZx8za7oO4sL4IB++IelkddphQUO/sgEQxNq7wKhgPSXv0I
	r6aQ25UlGIJVxYgQuRgE+OtJ+WMxE61nX4CIwaU7pafIG5h9kcAB1R1+zcp7c1v6vAZBLIPcl+X
	4U/4g2VdA3rGMJsH8bnGzubgp6Ide/eqQ+oWZ+sYc+0XokCfkK0c+whYkVlUc1d/qR8/COwK9NJ
	qbgDqzihjGedVXgQPpaAk2D76YPuct4F+ZbjS9ZURovvrE8ofM0ba7FpSqincJTB/fhXyxT
X-Google-Smtp-Source: AGHT+IGLR93WqsCZ053+MjqXMxSgfHfX9VZsicHSXVEe1/bIQZebS5wSQUjIqaTjuz4uKaG0GOmcHA==
X-Received: by 2002:a17:902:e948:b0:215:6f9b:e447 with SMTP id d9443c01a7336-21c35621db7mr180247815ad.30.1737363701892;
        Mon, 20 Jan 2025 01:01:41 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21c2d40278dsm55514515ad.223.2025.01.20.01.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 01:01:41 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 20 Jan 2025 18:00:17 +0900
Subject: [PATCH net-next v4 8/9] tap: Keep hdr_len in tap_get_user()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-tun-v4-8-ee81dda03d7f@daynix.com>
References: <20250120-tun-v4-0-ee81dda03d7f@daynix.com>
In-Reply-To: <20250120-tun-v4-0-ee81dda03d7f@daynix.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Andrew Melnychenko <andrew@daynix.com>, 
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14.2

hdr_len is repeatedly used so keep it in a local variable.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/tap.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 061c2f27dfc83f5e6d0bea4da0e845cc429b1fd8..7ee2e9ee2a89fd539b087496b92d2f6198266f44 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -645,6 +645,7 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 	int err;
 	struct virtio_net_hdr vnet_hdr = { 0 };
 	int vnet_hdr_len = 0;
+	int hdr_len = 0;
 	int copylen = 0;
 	int depth;
 	bool zerocopy = false;
@@ -672,6 +673,7 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 		err = -EINVAL;
 		if (tap16_to_cpu(q, vnet_hdr.hdr_len) > iov_iter_count(from))
 			goto err;
+		hdr_len = tap16_to_cpu(q, vnet_hdr.hdr_len);
 	}
 
 	len = iov_iter_count(from);
@@ -683,11 +685,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 	if (msg_control && sock_flag(&q->sk, SOCK_ZEROCOPY)) {
 		struct iov_iter i;
 
-		copylen = vnet_hdr.hdr_len ?
-			tap16_to_cpu(q, vnet_hdr.hdr_len) : GOODCOPY_LEN;
-		if (copylen > good_linear)
-			copylen = good_linear;
-		else if (copylen < ETH_HLEN)
+		copylen = min(hdr_len ? hdr_len : GOODCOPY_LEN, good_linear);
+		if (copylen < ETH_HLEN)
 			copylen = ETH_HLEN;
 		linear = copylen;
 		i = *from;
@@ -698,11 +697,9 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 
 	if (!zerocopy) {
 		copylen = len;
-		linear = tap16_to_cpu(q, vnet_hdr.hdr_len);
-		if (linear > good_linear)
-			linear = good_linear;
-		else if (linear < ETH_HLEN)
-			linear = ETH_HLEN;
+		linear = min(hdr_len, good_linear);
+		if (copylen < ETH_HLEN)
+			copylen = ETH_HLEN;
 	}
 
 	skb = tap_alloc_skb(&q->sk, TAP_RESERVE, copylen,

-- 
2.47.1

