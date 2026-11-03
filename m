Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749918;
	b=v9W0iS5cI9HJ8iteSMlhM3G3X4vrk1z+KoCIf6K4D7yxd+DliBFNy+ZSqI79GqMsfUhr
	 3eBPE+F7L/4FdUzjQpqvfhD/lazlFHfXh4EcwWtIVd5VPVqEu7tV5xxkgEN7eYbR9g3ra
	 y1+1mMoTZU/rwbux5t1WiZbgyxeVEGVffQ98/HpOi3iLurUK2lnqKW3EyT5pHwZBkhggF
	 6giGQ8P01qK7ufv7cM6ymZbTSel53uuQiDVx0pWY1w37sbs6dQQE/qOxUD4DJ+Jly6LbK
	 UF4dM5rxZWMJf3/7EuzAQS8G/Nnz2KDcNrmezqWuvPpbstar7imq9sUTQGLIR9/DwcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=fJ7IQIOXNs//1G8hg9c5EGbjN6OnBWvPLJeIH74gcIY=;
	b=ILORUV/orCck7o2FugmlRJbE3OgK8RiPTAP47xZHXRP8WsbjE+OLXQ05FNxn1JzNXhcX
	 WK3lLaFmAieWw1o3fINkQheXFG/xlVHOGMyyjdsl1CXWEkAzWYV98b2HxBSYjBTBoW+RQ
	 YvQlM4X00dOdwExemYvcxWreBBuetYX4uvipjaVaBPV1hZyLs0MGMlEPtgMChHruN4nmQ
	 vt5iuOrL6S9CkA5+SVX2EcmsHMq5BGXRu9U0Vmb7U2WJnHNMo70vxSYw0oUxTTPosrWZd
	 Tp1UsJlKC6loWgnaMo18o8pSDhzRT26RPN74SZ2+h9vL2HZKz4g9Ji3qon/PbOnN5pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWA6wz+g;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22204606D81B
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 23:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22204606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWA6wz+g
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36c9919c659so93545eec.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 15:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749917; x=1794354717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJ7IQIOXNs//1G8hg9c5EGbjN6OnBWvPLJeIH74gcIY=;
        b=ZWA6wz+gpgHjh1WQ5eaQidrNz4Hzm3YQ8yeDFG++7giIdaEL6V0GQwJaQi1OskRj0k
         +zip9+d3WalbJESP2kwkC022l+JuQR654DJvkHmcsyNWZMTCvN0ElGkjE2tAcUQYah5/
         gSpizDmU3DsXOnWZpLiDpfqOmhZ8YQaP/9tWHA1qp5AhqlxO89TPz8gwG04DxQ8lgaan
         pOiYTu0jO990rh37d2ZAEwe0SqDrBe4tBitHRe7tiwWn0Dmk/K87zRQ2aeznObVW2CHt
         roz7IHwemorr2dqr8E+YfCKI4huU4b5tkmn1VJDT5U6JVMlV7QRteohMjbiWP3pu9S0p
         pU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749917; x=1794354717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJ7IQIOXNs//1G8hg9c5EGbjN6OnBWvPLJeIH74gcIY=;
        b=QVabmpmowJ9WP3LOabmonVUEKIw+MRmG+tTsQTqPKwBFO4uhyzdTl0uFIjL10v8sg1
         dvPcDiaCkfZsPW2rBdsM9dkRhDk3RfXvVxDYcb5YuuygYSHkGTP2n/pSGUHxuEXFemEn
         GaYQTw9jy/sb0VgJN2WWFdCTqyEui/jKFx8F1IEiN25/S6ou9VtqAwZB6ixA8RjVoUzs
         I1CKDiIQcxzXcdkryi6MhMjwnd+p2GzOauM4ljfJLjSP+mVWWjA5emUIkweC/5jxMpGc
         l9GR3oUjj8nFO4TR41oJxVzaAjhtaHQdWEbh2gR4t/yGxcg0rPcZzr0F9TWoc1j9ISXx
         C6hg==
X-Forwarded-Encrypted: i=1; AKwUvBx08HbBpPG2FzGEJI/PU5sjyqLYByPwImsEsYXoM55TAE4LmBJk5xIy8bw8LGlKBGXIXb6CicayPrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TUKwiqAddaDupm5Zy41DPZfEdNtinHu6aCo8FEtJxM1DlsCZ3
	Rbr3FnkIk+YTfu0vyfvNzheLT/Wn7aNrB0FlHXtctWd1KxhQT5czV3vb
X-Gm-Gg: AYBFou25PgbLimA9Horhkt68lLTny9t5TMgASSVdi0bsIlH6gdIJpR0QMT7YQv+9gtF
	LwZH9q67urLlO308rQmFRcgLe+Ldw+kgW4RSA6WMs3z5mTaNudUsLzwzPOrxn9PtfFIan979kzP
	I39DG1UIS/TkAL/8Cv5kSVEFeocautL1wuO4wmXDGQyKXgH1wiM6+ZX22oXpM3Kle5WhiOI7sc9
	FaMC83v+bqb2dLGgNzVWh/ckA0fVLpIfkG8pvsjgQegWwBk3vuWB328yliUM6GOVqFsHRRehQmB
	6z4hKWibYAFTCjKnkKcDSVxKGCmZZArFdgpgtaGb+VrvYW3VABCVxSn8+d7KZ0imvtC921rmOt2
	ERu0+/xCBu7fKc2DoOzbveGw3nvHNA8dejS2/nllR/PEgLorFThCvsDSUM5jTe5cGaauxNzABwt
	vvYo/49JuAozSwmP+nSXojKP4qVqmvhonf51/p/HoNE4u7TyXtZdW4PPHg6l8Stdzoom1mVLbaX
	ofMphyYT430p8bh/eQO8W3hUnIILuipOhLb6nBhAKbYBYxL9LRCfu9bpN7t/3qcAD7ddseud1Mm
	7kJzC3sJiDQft6rY6gYXNCs=
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr23417013eec.34.1793749916956;
        Tue, 03 Nov 2026 15:51:56 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:71::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm1876335eec.27.2026.11.03.15.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:51:56 -0800 (PST)
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
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	razor@blackwall.org,
	daniel@iogearbox.net,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 2/7] net: devmem: charge the frag length to TX skb truesize
Date: Tue,  3 Nov 2026 15:51:47 -0800
Message-ID: <20261103235152.1904727-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
References: <20261103235152.1904727-1-sdf@fomichev.me>
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

