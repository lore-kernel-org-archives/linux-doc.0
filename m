Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119CD1B3953
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363664; cv=none; b=FyEQEYkktvcAPi1scEVkCVQRsjfn/w/von1igQarXvuBi9ACL1nAT7VDsG3y6nEbWiPveQwkmMc3rgBeIVzzLAtzimtKNYAGY3oIEMYzKHgA6eIZi6iN2whgf9XwQto6nYqyrJJ9vyqhEnUxMdU4TkUIX6iOUNZHdutYRlllun8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363664; c=relaxed/simple;
	bh=D/KbHpktOZmWZkuzza0bk8f9eJQf34LwugBKMP/xt28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJ0on/LFSLoZDBFW5w+6W1+k2gYYnwDPxidBsGTfi+3CkncRQvnKlJ5nRu6KyAh15CHWu8XQDa5czg/FctJTiZqx41+kwlpOxmh46lLLaug1tVZm2Q/Z+mkh2vcohQQFP3chzOP1UJs6l1HGsUKbfIVy4RsocXvLU6StXT7zs5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=erS+JdCq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="erS+JdCq"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21669fd5c7cso74151735ad.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 01:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1737363662; x=1737968462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vp+Td7/mzSbTV1DDL8auTuqvLhIjXvEzrkpgi0EGeVI=;
        b=erS+JdCqfnuExX8uZXModadJ1FqWrBeReeWKS7FZkm13Bxt5k7bj01bYGaspvaDrFU
         4MqUiTfYESAZ7SggT6fCxFVHKDh5vJ5wqQHnlI4a9PEtOTKCDk531A2QBXeDsY5leKbX
         DZaNt/FcU4nha/kjLhdDcrcfgbRD5WXOkdZ2YvW2IY/AgYCflbJVsAKlAHauHHtA66uE
         MXDLWqcFKc3MY4qZOzKHl5qh6lU6wGf5srEy4N9JRWJKFkehV5OZO3kt8VugGPYCTyfs
         21Jdoi+5bzBoPEPEGmg9/uBbh/4qHwJ4R+gkU8gKyYLrSGtcvru1sMFjmjUWTrJbnJbs
         pNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363662; x=1737968462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vp+Td7/mzSbTV1DDL8auTuqvLhIjXvEzrkpgi0EGeVI=;
        b=kuQYQ/nGl83KhQ2uTi18UN7MPmkTkHN8W5k8V2qXtTbtSzv821tVzquWOZw1KGRrOK
         L5/AGprHF5Z7yEwG7YBGS/KUMgb7uvZE5qYQckuzv3OcAcshXcfQ8YHQFDTTNfikp4W0
         GEfRIoVYTFNs5y/+t+XvLhKHSaNto+mckxmamODm/84zD3oKL0e+z6PTGayOY3Q04L2Y
         oP4rKQ+FSnzwqUw9mZ+P0p+0eW5i1T51+iKtiQtccxmJJO728z8oGjZhSLrbZb0EquEQ
         IicvjjgmuE3tXvk4h2hRnPYL2oEvQaPgreTMVLd59S3BXthTlEAs8OTv/6OambWzcoiK
         sclQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2R6s8FfUadzwEH9XoK9pXP8Bmh3jc4HIrnIG0QfyLxPSjSX7uVqfsmz5LJ2WsnsWOmEAtcclRCv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeau2PiOJ/QjN2iIXwTvQxLa6KGkH4mPmx5G8Wer+T8cHA3I5k
	qLu9PJWv2xk/fqAZk11iRe1IP5jH/glpY/J0p5tR9rGDWFr6//NKIKEEWgLIMH0=
X-Gm-Gg: ASbGncsLEInV+eycFzJmOvxkHoBLEHIVO7pkMGMwEFshhNwfNfXwpjJjd8SdUlmszUO
	0yq6COLsItT30AAakO838sT8IecQsDvxw+c0dS4bbc/0pDVG7Faj8UPH0aXpPenvT60KblfJlnk
	RB2dx1fCFkeKduevzbRO1ouPpZZT6h9Fg39SJkmrgHzbr3MyIxN+Hn1NEW9oUsqVknviGO4SZqB
	bQCfq58ULY1YzeFqNMHM0wYr7p1DZD/x0iE3R/77074GExFjdth0N8vm8QDuKG3o9KooXwN
X-Google-Smtp-Source: AGHT+IFW7W3w/ZoXT2erNaTWxN+NcvV4dQQ8KrLwwzVKL+Zt7YL2px/phEUI7pHUKYl7ycKYIP1eFw==
X-Received: by 2002:a17:902:d542:b0:215:9642:4d6d with SMTP id d9443c01a7336-21c3540c875mr170754915ad.17.1737363662228;
        Mon, 20 Jan 2025 01:01:02 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21c2cea0942sm55819465ad.10.2025.01.20.01.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 01:01:01 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 20 Jan 2025 18:00:12 +0900
Subject: [PATCH net-next v4 3/9] tun: Keep hdr_len in tun_get_user()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-tun-v4-3-ee81dda03d7f@daynix.com>
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
Cc: Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.14.2

hdr_len is repeatedly used so keep it in a local variable.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Willem de Bruijn <willemb@google.com>
---
 drivers/net/tun.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index bd272b4736fb7e9004f7d91dc83c69af5239bfe0..ec56ac86584813f990fabf4633e4d96ca81176ae 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1746,6 +1746,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 	struct virtio_net_hdr gso = { 0 };
 	int good_linear;
 	int copylen;
+	int hdr_len = 0;
 	bool zerocopy = false;
 	int err;
 	u32 rxhash = 0;
@@ -1776,6 +1777,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 
 		if (tun16_to_cpu(tun, gso.hdr_len) > iov_iter_count(from))
 			return -EINVAL;
+		hdr_len = tun16_to_cpu(tun, gso.hdr_len);
 		iov_iter_advance(from, vnet_hdr_sz - sizeof(gso));
 	}
 
@@ -1783,8 +1785,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 
 	if ((tun->flags & TUN_TYPE_MASK) == IFF_TAP) {
 		align += NET_IP_ALIGN;
-		if (unlikely(len < ETH_HLEN ||
-			     (gso.hdr_len && tun16_to_cpu(tun, gso.hdr_len) < ETH_HLEN)))
+		if (unlikely(len < ETH_HLEN || (hdr_len && hdr_len < ETH_HLEN)))
 			return -EINVAL;
 	}
 
@@ -1797,9 +1798,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		 * enough room for skb expand head in case it is used.
 		 * The rest of the buffer is mapped from userspace.
 		 */
-		copylen = gso.hdr_len ? tun16_to_cpu(tun, gso.hdr_len) : GOODCOPY_LEN;
-		if (copylen > good_linear)
-			copylen = good_linear;
+		copylen = min(hdr_len ? hdr_len : GOODCOPY_LEN, good_linear);
 		linear = copylen;
 		iov_iter_advance(&i, copylen);
 		if (iov_iter_npages(&i, INT_MAX) <= MAX_SKB_FRAGS)
@@ -1820,10 +1819,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 	} else {
 		if (!zerocopy) {
 			copylen = len;
-			if (tun16_to_cpu(tun, gso.hdr_len) > good_linear)
-				linear = good_linear;
-			else
-				linear = tun16_to_cpu(tun, gso.hdr_len);
+			linear = min(hdr_len, good_linear);
 		}
 
 		if (frags) {

-- 
2.47.1

