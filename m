Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917262;
	b=s+cTX/l7quworqmnOQ5qRY+F1vMT+XjGxCyeEaQRaEwqlEXpzBdDA9SVZj+XBjBcZYLm
	 V3kMhiiTAHas+VIWZMPj6jFDsbGxBREXSpHr+yjXJjFxnnn6EQEVP4ujgvu1SfLss84Cc
	 z/9ECuZZMOeJ1lp0yC2KKhXT4JnhNlhA5Juo7GBqoL+BaZtCt8HTdClJuEipmeTM7xUDe
	 pTUQv20u6nWUyOHJGZiv3cX4ODdnxTMm/K479V2JwoRnE+KYW89eXiQb6Rq3D57TmFRcx
	 8wZJmbNuXBytZwQQx1PuUIkJJU4FNOXHcUHhAVV6S+LDrSub6EE9xhzLYGEP0+zwTBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BAX35U8nNHwzvrvZe/2+mPjA18tDD45pOn0BmV7GNC0=;
	b=kuJMwDWbthSqfg9s9x6s1BcN+J7FZh9GTSuLl40nDzznu2tUI4VqyDXYx3w5ZwfbpC9e
	 37NWDIzYGnAgchkDo/0Bq5/H4HU4/LboTuhyggBqz2t0FFDlJ9NkWSnhPyqS0Wo2iBFqD
	 sRkc9+L5tEGEzl0zXOKXLj4Ijo/IaMdhkr8D6E+pYZfYf8GTaRBZB472F8SKo8XehiAvD
	 7tvBloDnAyeWPIpHX52tNsO5iq/WOO9VKnkGKv/XCLsIlteGsvUsEpyvam5/k4K4auGQi
	 MOankvcG2NCO1dYLWTfIeFfu8hX7HS/+LEUncgpqAns3zY579lbfWIB2B1z1BZ9dhwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+KzCRPw;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5650A606D805
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 22:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5650A606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+KzCRPw
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-1397ad3d891so39003c88.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 14:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917261; x=1794522061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BAX35U8nNHwzvrvZe/2+mPjA18tDD45pOn0BmV7GNC0=;
        b=e+KzCRPwGRMk1BKNG+tsQfz+EP0W1rS4Z26bw7m+52ZDtQj2tRPd8kF2bk/cIbpAng
         oGqnOFDZLoU/JqjgFICwTFI1ou/Nv3AnHlnTGRyo8K7mbaGg9wvwossPFQhXfa6VqkZG
         8UlgrnKuX+60euKUPpM1cQwbJLyxunEH1kaU6zYvGzoKEGDA6PTH/YT2PGCENTQkLofL
         OBryTBIZs6DNLJSHweKDiqBC+plTqFqp2ifPBhB6qvV7AQdDT9oB2lBU9Z2XDQouFnAM
         3YZYRzJTaJWSxCbyV0BBHUU02ueo+SWcZesSKmd1c94t74F6KEoYeVRccSoDXKRF3F45
         lnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917261; x=1794522061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BAX35U8nNHwzvrvZe/2+mPjA18tDD45pOn0BmV7GNC0=;
        b=Z8nhDlwDSW05K2av6ih6O7lz8tI7jby7WEReXrBz8uONS48hgQVXU1LQgxbPgQ3Bd7
         scarHzqdx5aEHcNQJ2iuVrwr1Zd0mw4ajGji/JdS40bYIWugIkmqZV4Wbn6W7rEWueYZ
         8nrDJZ0LMhURKDXTPT5t5tbIDiiUgcMR4W3RV9qTYbonJALfjfi5QK4CwWe4tFw/DN5W
         AU6tSJckYEF5QGAT0Os8vkFUMCX33o3JnoXzXdmsrdYZE6lEheg2zGjQ3nAsytAnaBzL
         lm5QDhmZ5N+yQg51of9WAI8YShvOwY2sIcRy2oyZEQ6Nb4Pxkl2c77IRTi2siJwGsAS7
         fkeg==
X-Forwarded-Encrypted: i=1; AKwUvBwvcCTl8wvrbhSSl0TIyfHNxPH/+EHsbYkHiAQ4IURSkeCa1tdxXVBIfZJn9AhDczHzxOdgbYVVGtE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MK5JtONHe9RDOWiZ9QPYk9q9HozeLzJTitYOtFAwZPe08WqnP
	LSbbc1b1iJG2w92RKBIU+Rz2gOO9yc/DheVM97jZDj/YZlWww8HMGttd
X-Gm-Gg: AYBFou2T2ogAkBicYdNxTfATINxwlrt8M3FzWsI3XnmuP47Mg+RExKN+xqXL8Sp99R6
	Y7pA2hlmdf76NOhg3SbhQDiwzbpgxVnhLSYDUTZCUyGgrAcKsONjiasQNHAWF0vLZdg9RXNluCK
	YcE8uRLNq0fgxIlqL3P7c8VV7rgT4COGYZ2nxyzzHQEIDg0DKc4nhSlQH3ZQB4SyZGLdJr1fP60
	6qnFPqwzQ21D/g6zngGlEiBfk6EnAiu/HY0Fek7vO3/xV/kESExIs0uSbpPM585/+NAJ/40ZwKg
	1+kdTQM3iF/TQhr4IlQjzkwXpxrxjdzfXljc5xG2S1WRBbcQOmoMpDdf2FAJEWQhklvWrob8Ikx
	uJI0BOpWpF0H0A2G33CArV0jlr95rFHnsX6qk0ZdjIZb2NkhF884fGGJP2AjKtTBDk+T54l/oxl
	/iaDJ2SftXhOBwGs2l6VA0GRlDxzwLsyIp/OKH0Q0qyOhiIVQJ0i5/0X0SVOVhYqPhe3PP5vOLl
	qzKnb5x5f6hT1ImpkNKoaUMu9nlZW+nfl+QrC3vijssEP1XMceA7JWieslY/MyOVAgOXzrQaa0d
	9Y1gLUQfjhRf8s2JiXjFlaFoQUhJlSRUJda2A2Il7Chk
X-Received: by 2002:a05:701b:4346:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1b25d286bafmr512275c88.2.1793917261068;
        Thu, 05 Nov 2026 14:21:01 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:68::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm20396895c88.1.2026.11.05.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:00 -0800 (PST)
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
Subject: [PATCH net-next v3 1/9] bnxt_en: let the stack segment GSO skbs with too many frags
Date: Thu,  5 Nov 2026 14:20:50 -0800
Message-ID: <20261105222058.944293-2-sdf@fomichev.me>
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

With MAX_SKB_FRAGS > TX_MAX_FRAGS, the xmit path linearizes skbs with
more frags than a packet can have BDs. For GSO skbs, linearizing needs a
large allocation, can produce a head which doesn't fit in a BD with BIG
TCP, and always fails for unreadable skbs. Clear the GSO features of
such skbs in ndo_features_check instead, so that the stack segments
them. Non-GSO skbs are still linearized.

Suggested-by: Eric Dumazet <edumazet@google.com>
Link: https://lore.kernel.org/all/CANn89i+ps_CozfOyRnKav0_LUmSekJ9ExB5JkDbTAVf_ss_98g@mail.gmail.com/
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Michael Chan <michael.chan@broadcom.com>
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

