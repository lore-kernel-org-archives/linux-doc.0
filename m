Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63924213E93
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741345306; cv=none; b=EsiV7y/PiQ3qRwjpJKXovGveqOEeGWkq33vzLuVAKgYNHRaXCuiXIgm2AW+jK9IgazmXrzi+NsY6lcL+VLGMFaXnoaZurf/QmoXO+x0VmLMqTxXd2f6sQVTB/JwxFMZgQdQJskO6j128QFeK2CNAJ/RRHc64OCRhl3v4mzS/iG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741345306; c=relaxed/simple;
	bh=0OHQ36QrTe7B1BaBYHRqBfDehy2+CeWD8fTKK9khYSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=RD8jYVBj551JblnyvW2NVJjn2uPA+sYI4nWZJv/XEwkC11U6ObrYYXgMR5XBmg94TqBOQ7qZo4inPZ60pO4qKD2lVG0rvxqeo/2OqS8gMlNJAD4LeJcNEQBc/CdyDVx7EF9GZ++u6cwKooIt6SbxQQnks0xZsyURZ5L2N/TUaKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=pSvSd49D; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="pSvSd49D"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2240b4de12bso1947745ad.2
        for <linux-doc@vger.kernel.org>; Fri, 07 Mar 2025 03:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741345304; x=1741950104; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hESKaeLsTlVoI9NZlnZYgG71APAUJLtsH2I4Uu+Ek7s=;
        b=pSvSd49DoWaQg/f0IZCJ+wGwjbFt4a5hvjUDiz3wJ4lUQFyWw53uwpuwFf2hj6jY5Y
         r3frdY8PkzjsgnQBOgnqgfolfyjWx0EfU1E1sC5gh3fKxCB7vLeJTqIIBEflHsJOoMdn
         R/ja6NKtbcJKrg1Ni/VaJqn16aOpSjD5M3s75q4bL0orOOILL9P4ccV3PYiEeWhbryoP
         DyDl5KWuSqzshm52yQ787w2gYBqyFsX6D9uOtebp3s/fhJsY3P37tj8njvytymqit+4s
         Fx6wLPk1Tsj4Smlm7TxYUW7ibEhjNWTJgJcRP+8cYpkWUyIMPQpIHzC5nE/SHgCvIWqR
         Mpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741345304; x=1741950104;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hESKaeLsTlVoI9NZlnZYgG71APAUJLtsH2I4Uu+Ek7s=;
        b=ru/SZjqJh9HKG4OCEUM/ZttKywfZwtx2bqKmcNBCR6DpcdgndmMvKe+09NLPSBU+Ig
         3b6JqJy+S8VDZEOC1vb1ZJ4p+gLcLnQ75jBYyw2qALbgy9PoQd/v0AGbOpcVwM8CCEoj
         x7RsJVfNxYzUUwoZyQBMGfZRyuRiWRCCJSG+YU9knUa9Z4Q23EqQY+/+bnyzpKSOiw2j
         XBPyxxuIPWyDgt5KfMRZcaWO+c4oVXHls+5Zoe3UMEkzIlO6AqFcuaq5JD8TA892TKBV
         SA3fTYZLS7sFLP15bh17eh294FrOxaeYmyxJHtnqWshLadLw5NrueAuAaCHtyAxJUr3R
         6WJA==
X-Forwarded-Encrypted: i=1; AJvYcCUYb86mlVW6h4oakNAcM+Meojbv2GmyLeDsUF+oJDR9xqlZkTGjNdUrhBeVxuJ7OtXCaEf7Eh5bo2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCa4woASeAusp0Q09rogfnGTw38yZEyDRXPRBeLURsp+hv1b48
	J4iTATEzOWYMZ8Gh6tedo6en5JmHoZFR3uVdslruNlG5vjII2JHDBvyCVILlf6U=
X-Gm-Gg: ASbGnctRUo2fXjjS7v4xpJgKPb0eiiSAYru5d856+fxN/4/rHWh0+R/Qcl+LplkIO06
	SaGbuP+uxkLz5oBD2v7Biyoh29IQ7hHpOlvCXIjXnGSDefDQfIb1HZmHWSY+Om4HMWXQ8dRwMqz
	EId5G8q0LYAy/gNUWQzmhzZMW2IoTevLjSVm9fm+/jW6gUlt2U2NftaMCi9rfVV0x4dwJW8drzh
	Y8PWSpPTgcEvjIrN3f7WY3iH/EX/4iHp9/T+JRzSAbWDSMv6KoKjhmCTkFj7AkrDYJ4IhXCHaR5
	HOG2StA2946XtWFXIJ8Ov6pTk46HBEnZ04/SkkkrxLR3dnFr
X-Google-Smtp-Source: AGHT+IFjXPz+rtxm9fbn+OJtTENM9UvJxDY3nmnkxyWgPEnLzrhO14S9pj8Y+h3HFl0juxuW+kAxWw==
X-Received: by 2002:a17:902:d505:b0:223:37ec:63d5 with SMTP id d9443c01a7336-224289945e7mr53616935ad.28.1741345304575;
        Fri, 07 Mar 2025 03:01:44 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22410a8ff3csm27196145ad.161.2025.03.07.03.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 03:01:44 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 07 Mar 2025 20:01:18 +0900
Subject: [PATCH net-next v9 2/6] net: flow_dissector: Export
 flow_keys_dissector_symmetric
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-rss-v9-2-df76624025eb@daynix.com>
References: <20250307-rss-v9-0-df76624025eb@daynix.com>
In-Reply-To: <20250307-rss-v9-0-df76624025eb@daynix.com>
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
 Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14.2

flow_keys_dissector_symmetric is useful to derive a symmetric hash
and to know its source such as IPv4, IPv6, TCP, and UDP.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Lei Yang <leiyang@redhat.com>
---
 include/net/flow_dissector.h | 1 +
 net/core/flow_dissector.c    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/net/flow_dissector.h b/include/net/flow_dissector.h
index ced79dc8e8560e25a4dd567a04f5710b53452b45..d01c1ec77b7d21b17c14b05c47e3cdda39651bec 100644
--- a/include/net/flow_dissector.h
+++ b/include/net/flow_dissector.h
@@ -423,6 +423,7 @@ __be32 flow_get_u32_src(const struct flow_keys *flow);
 __be32 flow_get_u32_dst(const struct flow_keys *flow);
 
 extern struct flow_dissector flow_keys_dissector;
+extern struct flow_dissector flow_keys_dissector_symmetric;
 extern struct flow_dissector flow_keys_basic_dissector;
 
 /* struct flow_keys_digest:
diff --git a/net/core/flow_dissector.c b/net/core/flow_dissector.c
index 9cd8de6bebb543c3d672f576e03b29aa86b9d34a..32c7ee31330cf52df05d7a23b3e50d1a1bed9908 100644
--- a/net/core/flow_dissector.c
+++ b/net/core/flow_dissector.c
@@ -1862,7 +1862,8 @@ void make_flow_keys_digest(struct flow_keys_digest *digest,
 }
 EXPORT_SYMBOL(make_flow_keys_digest);
 
-static struct flow_dissector flow_keys_dissector_symmetric __read_mostly;
+struct flow_dissector flow_keys_dissector_symmetric __read_mostly;
+EXPORT_SYMBOL(flow_keys_dissector_symmetric);
 
 u32 __skb_get_hash_symmetric_net(const struct net *net, const struct sk_buff *skb)
 {

-- 
2.48.1

