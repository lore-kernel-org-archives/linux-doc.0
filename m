Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917266;
	b=GDJMTLKSx3oikrUNjJWvfqTV96rtVIEjMCakNf09CZWOKAp5Qd+xwxWk6zr5omd/NI5p
	 bMhXnvC0GBgSUYbPiBadWpxZ8wrUnB8ulM0I5+1Gvfa7E9FD/yoKlXfEPCkQnlU3nIUaf
	 lLUVZ75b/hL9JoTSbaKZLjWJ+2ImoOitDywEEJ681xUfpaaCGSosAIi6mrycAIZS3n+B7
	 SGI2WwZW9UrsvajhL3zkEVWAwuY0Jmu5L9RAWsFOlIPox1l9GPd0g9FPXlDYSp58KEi7d
	 eLBV9R9vwg4p2NWhee9kXG4JB3oBPkblm9NhnCQtvKm4O/YJqxKSzO8WMbC1sMw+CaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ppas129PwuUiw2Xw8Lcjz7A3XE0ezJjL976wMeb8fos=;
	b=m+2Twm77Z2CYU/VptsfQAYD2VhlKaeYZ785zlo82dOA3OjXW7BAwtyE9Exom/NS+s1o7
	 Xnol3HpjxYp56CKAWGRoZ3gPWazYCKswfQnQIn0AENDq4gDaCKDo5zfkwvUtoYrkLCe50
	 oQoLqL1CHtcRAExkm+/eoit37ERVilaS6Xsye9gfcLQ7Qwc7/CJyWuboKl9JpCGELa4Pc
	 Ov/qxcI4oYEvmMbVmpnUqHckCm1iJfT/83VwthWjZwLxyPdJuu28uL77d8p6R5ShYbfYY
	 +9O2sii26iBX8+lyYOyyPqxsqTtf8Rh2hwDZ+3ckqUrAaCgR8mMTt3+4WvnwJmKSeMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ei07+fDw;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F209606D820
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 22:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F209606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ei07+fDw
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so618eec.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 14:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917262; x=1794522062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ppas129PwuUiw2Xw8Lcjz7A3XE0ezJjL976wMeb8fos=;
        b=ei07+fDwVksjzCrwDH10oAlXvu/ahqITqWe8qoe1bC7FXoipcduGF83vODfy+8RG4b
         DbJWVQXwdB8brnziFnLnjzrcg9QWK4kPPYyKAZ55quymum6L0ksay1Ps7FWvjzzcqX6y
         iPpt9MF0fN3iMWibQtwcW8leLr/v9+sxjVep6so4TwLRDz/waR4liSB62fLaVAULBsxB
         vBS2pJJ88SsioL4u5X+jvRzJJaX6RUJXayEyJt6FRrYKh+tUjeZ/AoxNcxveEWC7KdWS
         xoK/Oz1eVOUEi5dzMcZ/k51F48eIQEgec2XnG++AmLK0zNN6LcPEuHcRO877EwUyaikp
         Z71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917262; x=1794522062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ppas129PwuUiw2Xw8Lcjz7A3XE0ezJjL976wMeb8fos=;
        b=1G5M1p8uHs3cRUH+1ZaavQXSEMYP+9qsHWSZXPEpp0JSzuNwczAWMJ3FN/zwDOEJog
         dkhBxPWJJgeBrwvs2+4Hegei4e5U12aPVWWUMTT8GjqBmH151YbYt2VQZ7Id2N7ICOu7
         I0x7Twc/x8h5ph943REGcWsNvxngwlVXXcTTsME+t+/szBdENriSdOIgs27nE0TvXsZe
         4PC3F7WG8txarLRJrCH49Zq0z0vjN18Oiu/UzN5Oz0+FxuiKbcT9/j3gPHSk+/rxLJ5h
         YwkNdppHYaSr6BDbaug239A+sVsUQuOpyMjx6evUSw3OykpFLiVc51MFWw9GS5tO64yB
         b4rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj8PmqbDjyrXG1tvN7obLux10T2xqFjAUYZSkeenmMguf60Cy3VFO1+JixRg+8k9AKQIvxxfu9kks=@vger.kernel.org
X-Gm-Message-State: APuU4Z95bU8nh8n/8a8PgrKjtIScV8WLt7Ovm51wkW1ZGAUDbfnJWYwu
	ldUP+YQpOV6ZLcPyQVltUo7r5lHY0QOrB8n0jc97To6J8sUYlEWH9ya1
X-Gm-Gg: AYBFou2UGZZmUTWmqtaGewLnY6L/r3YA8vxl3rkTehKevCS6K/WwOwmxfiBTEFrt/Uc
	h20Nqp4Xmj1ymjBLXBMUtkN6dv4/hMtQMXpamdv6M+b1JDfBq1Kf0NnK847S43KI++hj7DFoL+a
	8eq3u12q8snGkD9Y7fDdGXGiKJ5cNnq4nGlIXcNMjwdraxM5s1qYVFKKN2etbbv/SP8FilUyxNg
	DYPmHrKI/j7HlTDgejDqWwzZLsqwz4VUM0E36Fm2JA1O3J+PKMTRQjWAHDFhfsMy4F8LlNmMVn4
	i3z5p5cjwYXcaPnhtKjRXrmtye764tAosS4vj6WvRsxPMkQB1mtzpgeHTYcOteJE9G2LCGiqIhO
	Yr3P/2+YIj7/JdVJgv0FqPx9gF1/MfcAd8a6ylYkqTVYiE+2V+fzuhW4d7bmhOMPbp+jAnmyLNT
	Co67Wrfe7hb1ZchMqT3M34dZeq/j7HJv6/IsX24cm8ZvGKJucgyJeD+rDMJHm0C8KupbSNOv/iY
	qBYUy16aBKDpMrzO43vohEGCaV+h//HZL2SCSn37j543KKub9MHaQjFcEJOn2KXrfUM70prOI3Z
	r/rAAu6nGsOh92C30f+DcHfPhg5u4PB/6jVezxXIN0h1
X-Received: by 2002:a05:7301:1808:b0:36e:f2f2:37fa with SMTP id 5a478bee46e88-36f75443f3emr684024eec.8.1793917262361;
        Thu, 05 Nov 2026 14:21:02 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:61::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a718sm39021eec.4.2026.11.05.14.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:01 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 2/9] net: devmem: charge the frag length to TX skb truesize
Date: Thu,  5 Nov 2026 14:20:51 -0800
Message-ID: <20261105222058.944293-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105222058.944293-1-sdf@fomichev.me>
References: <20261105222058.944293-1-sdf@fomichev.me>
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

Devmem TX charges each frag the net_iov size, PAGE_SIZE today:
zerocopy_fill_skb_from_devmem() adds PAGE_SIZE to skb->truesize per
frag and __zerocopy_sg_from_iter() charges it to sk_wmem_queued. TCP
uncharges in bytes as acked data is trimmed from the skb
(tcp_trim_head()) and uncharges the rest when the skb is freed. A frag
shorter than a page leaves the difference charged until then, which is
small with PAGE_SIZE net_iovs.

TX net_iovs are about to grow up to 2MB, while frags stay bounded by
the skb and many frags share a net_iov. Charging the net_iov size would
charge up to 2MB per frag: a 64KB skb with two frags would charge 4MB
and fill the default 4MB send buffer on its own.

Charge the frag length instead, which also matches what TCP uncharges.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 net/core/datagram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/datagram.c b/net/core/datagram.c
index ecc30a6f8302..489d92fe6dae 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -737,7 +737,7 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
 
 		netmem_inc_ref(net_iov_to_netmem(niov));
 		skb_add_rx_frag_netmem(skb, i, net_iov_to_netmem(niov), off,
-				       size, PAGE_SIZE);
+				       size, size);
 		iov_iter_advance(from, size);
 		length -= size;
 		i++;
-- 
2.53.0-Meta

