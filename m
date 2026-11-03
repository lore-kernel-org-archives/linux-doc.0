Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749917;
	b=PKCHW0P8Kf/m2Mfqr3fn0008dSBPpUCV63KZZB/euCsevUywtMnaokLiaPLiiN4kEs9L
	 t8/YxCsq5yY1u2NptLc7zbIeiZf/Sna1idm/zD9C0DNXF/cXjlUfOcndGJSro6HkRrwmz
	 XIxM0lVKmK50lkCvNgL/zq5bCJWgLElbr3maSOgz8Sjbx+mjCxsmqMtq2oZj/AomCZeNc
	 aR46WquQG/pz9xGdDOD/kY0ieJdnPJo10IEIq8M4UWuLlV/74t4DzWjcgWlcaXMTXKpNR
	 I8xRhQUkl7VTKZbaywUH1jqmTBHsYUqwrBjJQ+jpd1aTP340R7pCd6hIzdT1s2Ig6bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
	b=BABP7TGbnDerJL4uzdNaF4N3D0vqGChW3Zg2mnbBfXlBjszkeKmkJSqlcnLCI7X7bQXl
	 g8uJftOU2BhH1mFQ+YxMVrPGQ2exGJGqOK2iWNeE9TLBiEDVzpnSzX4HXS+W+dMmhrZmQ
	 cjZYEscDBec3Na9gvqvYcWsQ7U0bUHHEBPgQGqbl0hjojDU5cEWtm2rswPfjS+b2Nim4T
	 jtS4feruj7YD5szYQYaj2931ZNUH4zvQYYDVKrCUxadTULBKlQfHVQGqiBBKjUC1dTDo7
	 1hWK1Ibzquis7SSMyUn4TWNEEpBzag0zeI6YLKN9V11VR9aGD99LhmcIpsldeqfkDDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymIuamZd;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8266B606A339
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 23:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8266B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymIuamZd
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so101785eec.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 15:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749916; x=1794354716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
        b=ymIuamZduOqjQP+JlREaO486TG55zElM5UJP0I+Z7Srd38FOkvIVfnj0cQ19vFaX8T
         vbW1UjHBuM3xOXLeE0vqO7dMUwNoQ8T1pdUy7Su39nL+CjrnAoND3xnXyWjPBrEeQ6ay
         XiGoBmRKi65wZvpxF4WB6wv2tJd6RuAWTpXy+/uWGZzlqO6u4XSV96XvYBl6EdXOfIe3
         yB9H0TjCH0Johjhyr+V+LleBKot5OGITADugJg/+iJZAhZbI1DjgR9th6PXnL7tSCyfL
         ZFJzvNcbRauR4GYj3uHb6VOPD6t9MB2XJHyiK/vAtqMQX+NRxJT62oGDmHNQCG8zJGbt
         W/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749916; x=1794354716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
        b=QSqCSsmX+s5s8ySGRsk1cuGaEg9g29zKF6zb6VYIOveiAFEVmw9CdbkFGgHsOW4dgM
         ZfhY9QV9WbwIAbd9b7xpadzEJ7KdetJ+y9SQ+EJ82kYt2vYo5q4HknHhTfrT3pGdnBRK
         bdXLk2h8d+gjss+CZ80C4B/dkXgGCEicBG+NKvhV82I8ykzMKcCf0SlVcRavNS2EN0on
         matvi84XYDqDtxmVAUxgYM7FS/M6H8czB6oHJMUWxqbVuf+sNLj8pmKv3IKf1uli7N8V
         HbqIkge6eUwfEho8gXvjxli+LJ1lIyXkl17tBp0tBLIeOYVjz5EedG7P6kyYWquRBAZA
         iQvg==
X-Forwarded-Encrypted: i=1; AKwUvBxAlwtFvhjRqgARL7/i/Qtg+uyYomIcOwedj9gpYKr1GMjtc8xviFgr4RIRfDKiiVoXBwfIG/HYwHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ynw9cT7oceCdPUVrRHu1+hYZc/tQS7P3QY8hvFYmLef69Q/OV
	Rc1c31YJupy7tKkz/p418uqIjEWVnWWORIs71GaS/fQrhL95YyY8bGQi
X-Gm-Gg: AYBFou13yHTXASnnej1bsZewOTMbDyP0ofcSHOX5FWD0Jl2jIDkuDnTMPzxQBoXbqtr
	0wnXuMbhFdGzlaeO42c7rHPSRXZ2eeb88IOdeR/I0rq3Ndpw7bAo64vdFn6JCmRh2JBlSwf7HVz
	7BhQ7h7Ptt4N6HXOHP4PVf4ZRE0ryY8nNe7N4G6ws+QG/awyUYPNAev4nkLHc5Y5mgpdD8KCuzO
	yr3IKlNavBZuAKsmVFKJ1pW8EKSacBh+idpL25ZIN4Wahz+ksOnVOsiJPHq1WQiEg2wU81oj4h6
	T1AidlixDmVcGIIVP4KCD3I4WQRgj7qJ+Gr4VEaWzzI5+jL0aC9lyCqMjwpHLvQLYW2B+mCUEwe
	pyOeLMnHYB0THmT48cJKKj/PYLKk98wqIktNTEqYjq5FWkLtUIu+3u5eux+0sVDzhewX4Ek7qP/
	a9HPWz1bzDe0FbVs9EBXhQibfCwczR4eW9j/qewnMmiTsdxlpxfORZFdKwVvB9477Kz1Fib+so/
	l8rJamogGn7iuQhQvXipwm5KQnm8spGfUAK3zY3Muph4Y+1UVLZJSAlFMlSF15Ng5hXFUBEHyVF
	jhrN+gDcHb0lZf+uFe7p8IM=
X-Received: by 2002:a05:7022:e807:b0:1b2:4188:840b with SMTP id a92af1059eb24-1b2418884a4mr4392819c88.25.1793749915551;
        Tue, 03 Nov 2026 15:51:55 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:68::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm3165448c88.17.2026.11.03.15.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:51:55 -0800 (PST)
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
Subject: [PATCH net-next v2 1/7] bnxt_en: let the stack segment GSO skbs with too many frags
Date: Tue,  3 Nov 2026 15:51:46 -0800
Message-ID: <20261103235152.1904727-2-sdf@fomichev.me>
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

With MAX_SKB_FRAGS > TX_MAX_FRAGS, the xmit path linearizes skbs with
more frags than a packet can have BDs. For GSO skbs, linearizing needs a
large allocation, can produce a head which doesn't fit in a BD with BIG
TCP, and always fails for unreadable skbs. Clear the GSO features of
such skbs in ndo_features_check instead, so that the stack segments
them. Non-GSO skbs are still linearized.

Suggested-by: Eric Dumazet <edumazet@google.com>
Link: https://lore.kernel.org/all/CANn89i+ps_CozfOyRnKav0_LUmSekJ9ExB5JkDbTAVf_ss_98g@mail.gmail.com/
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 757c7266ce15..e7a4190a8c78 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14300,6 +14300,11 @@ static netdev_features_t bnxt_features_check(struct sk_buff *skb,
 				skb_shinfo(skb)->gso_size))
 		features &= ~NETIF_F_GSO_MASK;
 
+#if (MAX_SKB_FRAGS > TX_MAX_FRAGS)
+	if (skb_shinfo(skb)->nr_frags > TX_MAX_FRAGS)
+		features &= ~NETIF_F_GSO_MASK;
+#endif
+
 	switch (vlan_get_protocol(skb)) {
 	case htons(ETH_P_IP):
 		if (!skb->encapsulation)
-- 
2.53.0-Meta

