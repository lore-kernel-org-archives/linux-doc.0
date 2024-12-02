Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B761DE8B1
	for <linux-doc@vger.kernel.org>; Mon,  2 Dec 2024 19:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733169313; cv=none; b=Kz1dFZQGxBC7KrqqxlFCbgtRSQbnkbpST3Y6lFq+/Uqyn40Oak+Lcjwf4YROGbJItg5ipdbGU2TW9VK/Y3r32dLqLplnHkIRF8tbVFdsmc17IEQpq2hoB8tiC+ypz4KKO+L18MCGa2GxgONnlNiZpr5XO6nyXtzeszkesDbIijE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733169313; c=relaxed/simple;
	bh=pxh8grUMvqJBGylhMPYpSUfz6LOHGp0+0GbZkYU8Sto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h7kFkmDRAM2qgIadX1S6cCB8Kg5Z0aCVi5Rr8jNS6UjxUi/sb+0s21UxHL/IVoz2mHIGN6FDIuTsa68R098mxlO+jhA2b8jXCMUo4gwoYqUoxFRy5VMQCj3/KEzXC69M++lfexV2G6lXmyg6DOAqRe+U2xCQgkOLIR2RV437vqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kutsevol.com; spf=none smtp.mailfrom=kutsevol.com; dkim=pass (2048-bit key) header.d=kutsevol-com.20230601.gappssmtp.com header.i=@kutsevol-com.20230601.gappssmtp.com header.b=x8OEk/c4; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kutsevol.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kutsevol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kutsevol-com.20230601.gappssmtp.com header.i=@kutsevol-com.20230601.gappssmtp.com header.b="x8OEk/c4"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b66d20e9ccso225970585a.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Dec 2024 11:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kutsevol-com.20230601.gappssmtp.com; s=20230601; t=1733169311; x=1733774111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXntLZOBYToAE4e1z/0kMPS4CzoGHC4HyiF9Kuy9Nlg=;
        b=x8OEk/c48nCRvKmXUfA79UqY+qqWzDCbDya23kdzb4WLONyfEweo04BNh7ll23eZDj
         7hCPFjGRAN+dPsCkvkhdMW7cL/eu1BjD3FPkmB+euEeBDehoVxAHna7w0gHstyAo4zId
         Xhe23QiLcK0IYl3tjXYoJfe31fwbPIUbaTYLCt3p4fngLKmbRPEXIzjy7yvHa61Os3ya
         yNkQD6LPr8l5imc2Pjg1Ioexg336eI9BNGUid68Idkxiu6zbjnuYEeoztjWyroYxxK+T
         MgCzghMvNbmQB5hzTxK7HQ8PByYYr/Qw8WHhiRhVyOdeXO80yOTLZ31tpmrUzE9a42NZ
         9Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733169311; x=1733774111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXntLZOBYToAE4e1z/0kMPS4CzoGHC4HyiF9Kuy9Nlg=;
        b=mH1KrFajRNfSGC0QVkAkoDdXANBRcDlgEEv8wn/ecGDmQVIalqyMiFFUm4TnSGpOXW
         3nSRg044GqjBNQ3nbBmEpUrWIT9e55TXg6rL2To+KRBcqmnWGWmIY9G4X5UWMWe/f041
         TkXvB/hSgMdazC6KIFs0TK8qerYGO2hO5FqBPiT+nWRAOYDRSZRiHh/LTTRnKZI3qhNj
         JCzGkxvi7IptDM3T9maOHDcZymi7QgKyShF1dHIAJ5fKcxpqGHiTG4EElTMoE64bNbs/
         Mv41GzNp7+XAv/N8qUWljwoCp2pJ09tezgKw6PuKsSV1HEwtlyGlsipCNabPmNufR7eX
         AHZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnfs+vIfR15aPjmdYtstnqEARkvcgEb0V4pC3wpdMjVmAKJThPSTKoUz5z/OrMeZTCmjIFndXa3Ic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxft5idpW8GIJsyef9TZf6vCutG8IedrIBuT8b5ZUkB7aA6SybB
	upP5qqefrafJhiXFogblIz3WdQnmsfFKhBCgPV0K6SUQSurBnfEoI0THH4SBj2E=
X-Gm-Gg: ASbGncsXdXazUJ9ZVE28KqJDC8W79FWrpAd/HoN/5jkla2NiapyD1Fy34XcVyLpOuRf
	/IFklQ7PwAVIl3PSNxUpTHOB+o9dRGi8lPgsVmq/o8+rh9zXxf8WzL15rF2hJ5yEMGLc83PmXiW
	jZy2fwsB395flscROJRpd5BbvEJePyXuNVtzwYtjes6XbUnupDu6nrmJhQuOzigH54Vu06Ongor
	vCHrLyVRChXhwaISOwE5Oezpf5J5KEdSqkVxXZ0cgDMQkVyWdVDbkvmEO4zc+u8rCV5wQByuu44
	ZtkR0bMmHBUYM/D8Kw==
X-Google-Smtp-Source: AGHT+IH7jMHZuSZZo2PI/NEGFUcGD0IVLK+ivsRBO2IP+SpUjaEZ9qlKTaaCydeh+UEE77QGG32ckQ==
X-Received: by 2002:a05:620a:290a:b0:7b6:6b34:879f with SMTP id af79cd13be357-7b67c28383cmr3468499785a.22.1733169311004;
        Mon, 02 Dec 2024 11:55:11 -0800 (PST)
Received: from localhost.localdomain (fwdproxy-ash-112.fbsv.net. [2a03:2880:20ff:70::face:b00c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6849aac8dsm439338585a.77.2024.12.02.11.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 11:55:10 -0800 (PST)
From: Maksym Kutsevol <max@kutsevol.com>
Date: Mon, 02 Dec 2024 11:55:07 -0800
Subject: [PATCH net-next v5 1/2] netpoll: Make netpoll_send_udp return
 status instead of void
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-netcons-add-udp-send-fail-statistics-to-netconsole-v5-1-70e82239f922@kutsevol.com>
References: <20241202-netcons-add-udp-send-fail-statistics-to-netconsole-v5-0-70e82239f922@kutsevol.com>
In-Reply-To: <20241202-netcons-add-udp-send-fail-statistics-to-netconsole-v5-0-70e82239f922@kutsevol.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Breno Leitao <leitao@debian.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Maksym Kutsevol <max@kutsevol.com>
X-Mailer: b4 0.13.0

netpoll_send_udp can return if send was successful.
It will allow client code to be aware of the send status.

Possible return values are the result of __netpoll_send_skb (cast to int)
and -ENOMEM. This doesn't cover the case when TX was not successful
instantaneously and was scheduled for later, __netpoll__send_skb returns
success in that case.

Signed-off-by: Maksym Kutsevol <max@kutsevol.com>
---
 include/linux/netpoll.h | 2 +-
 net/core/netpoll.c      | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/netpoll.h b/include/linux/netpoll.h
index b34301650c47..f91e50a76efd 100644
--- a/include/linux/netpoll.h
+++ b/include/linux/netpoll.h
@@ -57,7 +57,7 @@ static inline void netpoll_poll_disable(struct net_device *dev) { return; }
 static inline void netpoll_poll_enable(struct net_device *dev) { return; }
 #endif
 
-void netpoll_send_udp(struct netpoll *np, const char *msg, int len);
+int netpoll_send_udp(struct netpoll *np, const char *msg, int len);
 void netpoll_print_options(struct netpoll *np);
 int netpoll_parse_options(struct netpoll *np, char *opt);
 int __netpoll_setup(struct netpoll *np, struct net_device *ndev);
diff --git a/net/core/netpoll.c b/net/core/netpoll.c
index 2e459b9d88eb..8ae10306c1a4 100644
--- a/net/core/netpoll.c
+++ b/net/core/netpoll.c
@@ -390,7 +390,7 @@ netdev_tx_t netpoll_send_skb(struct netpoll *np, struct sk_buff *skb)
 }
 EXPORT_SYMBOL(netpoll_send_skb);
 
-void netpoll_send_udp(struct netpoll *np, const char *msg, int len)
+int netpoll_send_udp(struct netpoll *np, const char *msg, int len)
 {
 	int total_len, ip_len, udp_len;
 	struct sk_buff *skb;
@@ -414,7 +414,7 @@ void netpoll_send_udp(struct netpoll *np, const char *msg, int len)
 	skb = find_skb(np, total_len + np->dev->needed_tailroom,
 		       total_len - len);
 	if (!skb)
-		return;
+		return -ENOMEM;
 
 	skb_copy_to_linear_data(skb, msg, len);
 	skb_put(skb, len);
@@ -490,7 +490,7 @@ void netpoll_send_udp(struct netpoll *np, const char *msg, int len)
 
 	skb->dev = np->dev;
 
-	netpoll_send_skb(np, skb);
+	return (int)netpoll_send_skb(np, skb);
 }
 EXPORT_SYMBOL(netpoll_send_udp);
 

-- 
2.43.5

