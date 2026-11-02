Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646882;
	b=ua7CFYxbefFHCeQu7nA5aVN4fhM5pjGghCoXflBmBP6DYFBkAqqSzKl8D/I/nT+ev36P
	 DUrvPscIN/pA1zj9mfTDJiKZFjWXVumrRg+Hjni7U3qMs6+oBEMXTkw57TyofBariOV1T
	 bAXnZfUh4QB/pEJlIMlvINTWyOT/ZYIpEC/d4jZ3t9Cz9rq8/4tPZOovdHC3ZuQnQ8ccz
	 wlXmwUoVaELAm17p24MKSNq/E6ZsPmJdWfcjwKNLWPr9mDLlrA6PH+87fKz3sqTkVYuT/
	 jcomlLy2er4U9/EOyr9RIuUiLvT/eJb3oPXBkLu5WmWyPwgXaXuqDqTJiSc+i3bJMaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8mRY0dC3iNi2EAcGRxVrgoSrZHfhv1W7z/F4/S56g4Q=;
	b=vfFOVa3sMX5BjeabBFfFHPoLcB18fQcn1J77f0j3WHfQWy7RVB/NnK+NJM0pXdWyMfab
	 CjVm3/7pnajGF69t/9cf+lng4P8AYh3xfsnwY1EL8SfIG3sOoa6a2ECAAM/gyRItp8FP2
	 /Ph6f4pBcbQZELEkjJesYdu3oD+GpeuzKPKgfGQ/PBAnLAwTCvbuEhZ7u2N4LJ/WRpyUe
	 239IhGTER3wVUEXbnuOj+wyHJ/+4l3aeFErX74RRGVI3XZBJIuFHKLVO1IOiaHzhQnkj/
	 nOvRoxHJjYJmxBp2aCPrcHEg9IMM9e62iVpLZbZn78pZ6UKIZye8i1qKCzBM/qLS/yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDDON54F;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C02606D80E
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 19:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79C02606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDDON54F
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso1360822c88.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 11:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646882; x=1794251682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mRY0dC3iNi2EAcGRxVrgoSrZHfhv1W7z/F4/S56g4Q=;
        b=SDDON54Fyhv73iNsVlFcX6vkzj1Rcqv82e8IHNU2a9H2pE7/NUK+8QmuBhS/KW9bia
         Zj+q5+Bg2h+pm91gZhtPSRaKl9cb5II1TdTvAZVuFY3LNv8pk/I+TblRU/ufynzkWtk5
         VVv1ZM6i5z3mHDgCxVk9BfgaG5WEEDx/rABAA3+Dl0OMmJNNeUN8Hw4GGw8pdaC6fsWK
         GlkTIuLe0Ax9uMdRZhd6RT9tFbdU/pZdXv8HigKnphgjNsJA1+TNO7F/yfw43naSeJIz
         4idQqPyETGY+ma9czrAsaGDP9RZs2ND6WUFkk3vmHYhiOPWz3GkuVqIeOI9uA37DYnTy
         whaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646882; x=1794251682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8mRY0dC3iNi2EAcGRxVrgoSrZHfhv1W7z/F4/S56g4Q=;
        b=ETA3h0tyL+f3OaIC4DBteSbGpWUJOfmu0D2cJTJidDWNW34pOe9QgN4ancZAzJswdA
         jcL4mQwW9BxJ8VNFMC8329MqGRWh4KgezbwiMi4DmrovnUKWCkst2m8VXBYuXw6PhWp+
         FX1QXrBzpSYQfSMJ0bKkDrr2zW56ekBM5BPKG76e2JyTyOjO0lZPzzGW55fBGEMCZro6
         ySAr1kTcVSYNjuWnkyHZ+JCQjcj7nvUXUjBpRmXfPhM1W1my90rnzryt24ZR+j3EWyt8
         lqlkIUL7fp71m75ysaLpoGNj/FkUJUf5L+4X4/KsUbMPv4fDCAWioM30rH9PMAC5sRIH
         aoYg==
X-Forwarded-Encrypted: i=1; AKwUvBwb39HqTIi3MoXpJ4Tf3eZAVDNpkeUsOrrNNLRloOihxEoVbgz+TsJGIcycaJFx5+RLaNJ3BclXyUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvl89e6jqbmJp/NnoHBC8S6RwB4ZTJiaH7K5AWGQh0wr/5qmQs
	lNL7n5EszNvNY1ezqTwubTp1sx+Qcfzn64R7euLdx7us+cFtsYvpdkVj
X-Gm-Gg: AYBFou1Sit1JdlGV4/2nbZMaxCZh1oZZBUT6Rbd9l5tHLn9X5A8Yu8v8Xy3/C0QCxxc
	u1VeHP+CtW2ptD1ItBIiu/EgDgK4GVqj9/4wkBLwhK6VkSB9gzRh7qvo/IJG7nOQ1FHmKpVxPsO
	9k2wbUmnI9AJo9ZF+/G0+wI85O5B7X5GB1/qOyG13i/zeVwP9KqB8L4Qy4z8ybmHL4G6+0wOqx9
	XK8+2ajGwa1zA88BR4ovN58e4eYh+XXSP1mEcLC12GEVetjtDC//RrT8oTBG9FfOWnyhJzYBuqm
	dpqVtWDWT7G4xPHFiiyilyow9K32tQFqOgFZq1acn21Mcb8MrScQoQH8TN8kyoTEItUP2iIyHfW
	rTIbCG6RLQ3cE3ff2e7oAy6WHj4eU3wDXgHf1r2BECDfFf/4aIC44mGzA5GmTMPX0RORdwkaAYl
	PxGKRmuNB/B+SJT/JHsbJ7di37EomcKDxtnLuCVa0uVRter9c9FF/LOzVmPHqEbHAvJ+rNNKYhO
	fBlzdbPyxKY65bM1z5dtWxdy2CPRjJ+N7nrjmUDpNqa6d9Q4Ej6z1h4vJMgO3qVoMEvvFOyfDyX
	Dhcv9IlEOz9Y1badCdtE5Zo=
X-Received: by 2002:a05:7300:2442:b0:36a:2059:6c85 with SMTP id 5a478bee46e88-36a42454b4dmr18746729eec.34.1793646881637;
        Mon, 02 Nov 2026 11:14:41 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm40157681eec.21.2026.11.02.11.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:41 -0800 (PST)
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
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 2/7] net: devmem: charge the frag length to TX skb truesize
Date: Mon,  2 Nov 2026 11:14:33 -0800
Message-ID: <20261102191438.1059771-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
References: <20261102191438.1059771-1-sdf@fomichev.me>
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

truesize isn't well defined for devmem TX frags: they point into a
dmabuf which stays mapped for the lifetime of the binding, and freeing
the skb releases no memory. The charge only feeds sk_sndbuf and TSQ,
which limit queued bytes.

Charge the frag length instead of PAGE_SIZE:
- TCP uncharges in bytes (tcp_trim_head(), tcp_fragment(),
  tso_fragment()), so the charge must not be smaller than the frag.
  PAGE_SIZE only guarantees that while net_iovs are PAGE_SIZE.
- Frags shorter than a page now count their length, not a page.

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

