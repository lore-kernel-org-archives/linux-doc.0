Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E76228C9E
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 06:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738736599; cv=none; b=iwDyg7PwdltRf0IBj8EwU1DHoqseR3g9WuiBLF7r/6jMJZaJsk1TXmVEPnNMzLeuxIqkVBVthyP7BujbUA9VPonIlxodbgWdck4VaWQVICHdk4nnAvfruTnd7wgD1T95Px3COMG32NSSPXcEdQCOAbtuC1xszDm7+QdUqUfMYfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738736599; c=relaxed/simple;
	bh=a8oH3PNmwIVYj2tKdIrFjYF4Tj+2irxY4kfMh7WOKvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=lTxruTgQEp5JIybk0ci/FYHj7Oj7wKvqPZXNaFjccjbIlLX+v+xYSdYMx0FOT0PHsvmgFSbpqJhV6Qu1RaQnE5xI9l/OpUnTONC5xyvSYdhnTiXmXb3YZJWOvYpgBphIjphlGfoaRx5wz/QV/20jCcwYYUrkV0+mMk27tb6J3aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=RhWE+Q9Y; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="RhWE+Q9Y"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f9d627b5fbso1765937a91.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 22:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738736597; x=1739341397; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8srIBeyhs4OWM9PodAkxe8Sc4dGj/gPqaYG7YjTXw0=;
        b=RhWE+Q9YEROWBWGUSsYw4nh41epxfN9ekdl/kBLgKyRwQ/XWMNxfvCWGeJBidggLOG
         twM0vPMHhK1Y8DeiC38RTqjBea6wvvmOJVW3RlkMBPs/u9tKbv5WfMExqbKBftGbyKg5
         er7LClnJskywKV3zwzNZpCkak5i8VF3KY2vlGOtEkEAQ9qtWBcRqVpYw/IVcq+ZcqiEx
         gtW1Iqi2IcPmtNBPB3Bs9Wi5QwCAf2IAiIvFgiJV3ns4SCSXOKZPYz9/SexaKIc9UC1Q
         OpLpLGkuyz6RNuxUg0iHOcQBDTz9i6KEfHZOoLCmb+l+FcInIRKEmK2hKERtEE53Es1I
         NsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738736597; x=1739341397;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8srIBeyhs4OWM9PodAkxe8Sc4dGj/gPqaYG7YjTXw0=;
        b=DYWbpCISaFvma05MlywZ6DZllpm0yVi9cu8wqTmy6YSYwtN5Crsy9FptPyJosLbz92
         arPhQ+Ex1zbfF0jVPL2fl0nMZM30IqtOFkObT2aKqzeEPdqZBDQWib4Xpja+UO/w6WdM
         AxtaTTBQ9sTqrTf8UB6CveeHv/m9k6xLGyVkvxK6VOqpI2G8JmGoSqDHut7dnEDD+uJa
         jTQ42BgE4fhA7sQDdHQaV56uIfS4b0owjwgo8z3H+i3ojL6PqWMtqrj/h8RsjlPsJcpx
         I/PQXJRbBrToV3alUiJCmYF6PNzicUJ6LGctUh2dmHxrgcCNRQixAqdg8PRKB70kk1SL
         i3vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaeuManJQ51ZKgWXuaeTPucY+agfeYIuQFBcpFcteLs/uY/EdbVxgVv7DmP/ap+OrVj2FioMjckMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNM1eCDkz5BAARhnw2T6fTSPo8VOsTahd2Ov12dLWcTMP+a8rE
	RHtMadAw+NdFYqxduVasM5z5c7KHgox+zFy2CCqBH5rtrFcu/c0PIeS0pkcNjoULwnzsIC1xzhw
	vVrU=
X-Gm-Gg: ASbGncsJkyt+45ryY8BECd7mMXS8XysAgolmlDv5UXDuKixJUQoz6YacXbeBHAa7jiV
	ajLbIzdeMG8WLR/Z5o+KVEHNUwaxXHzq8wk4o9TwbPFB0J5LwBcp2+ObA4Ou1HP+rg+IfewfvLE
	DxDpfmVaezOmBds2jQm56yl1LtLuA86ymleWawa+VvXv6zVnKQK+3MXFeLiKQ11ZSuWHVHgYnNk
	YZdiYaerYXjw7RCyjoKSKpFTc68PtE0d86+E3pEER/OiHoAGseOdQfiPlkYOY0ge9c+gn8BNl4J
	+/vmg6xV3mZVZ0uKA4E=
X-Google-Smtp-Source: AGHT+IHg1+FvFT5HDL6SfSKULAJ1AqWAEtxmHva7Bnl4TG97CsA76lSGxTRKSfzGYdWpbEr3lj3N/w==
X-Received: by 2002:a05:6a00:2e14:b0:725:ffe:4dae with SMTP id d2e1a72fcca58-73035122ac9mr1991170b3a.10.1738736596777;
        Tue, 04 Feb 2025 22:23:16 -0800 (PST)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72fe631be56sm11600664b3a.4.2025.02.04.22.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 22:23:16 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 05 Feb 2025 15:22:28 +0900
Subject: [PATCH net-next v5 6/7] tap: Keep hdr_len in tap_get_user()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-tun-v5-6-15d0b32e87fa@daynix.com>
References: <20250205-tun-v5-0-15d0b32e87fa@daynix.com>
In-Reply-To: <20250205-tun-v5-0-15d0b32e87fa@daynix.com>
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
 drivers/net/tap.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 5aa41d5f7765a6dcf185bccd3cba2299bad89398..c55c432bac48d395aebc9ceeaa74f7d07e25af4c 100644
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
@@ -663,13 +664,13 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 		if (!copy_from_iter_full(&vnet_hdr, sizeof(vnet_hdr), from))
 			goto err;
 		iov_iter_advance(from, vnet_hdr_len - sizeof(vnet_hdr));
-		if ((vnet_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) &&
-		     tap16_to_cpu(q, vnet_hdr.csum_start) +
-		     tap16_to_cpu(q, vnet_hdr.csum_offset) + 2 >
-			     tap16_to_cpu(q, vnet_hdr.hdr_len))
-			vnet_hdr.hdr_len = cpu_to_tap16(q,
-				 tap16_to_cpu(q, vnet_hdr.csum_start) +
-				 tap16_to_cpu(q, vnet_hdr.csum_offset) + 2);
+		hdr_len = tap16_to_cpu(q, vnet_hdr.hdr_len);
+		if (vnet_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
+			hdr_len = max(tap16_to_cpu(q, vnet_hdr.csum_start) +
+				      tap16_to_cpu(q, vnet_hdr.csum_offset) + 2,
+				      hdr_len);
+			vnet_hdr.hdr_len = cpu_to_tap16(q, hdr_len);
+		}
 		err = -EINVAL;
 		if (tap16_to_cpu(q, vnet_hdr.hdr_len) > len)
 			goto err;
@@ -682,11 +683,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
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
@@ -697,11 +695,9 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 
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
2.48.1

