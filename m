Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAEC2147EE
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 07:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736406863; cv=none; b=osIIqvNznv5q/TDctLCyf62Lv6287F8sV3QhQeAhst2waqsEtqhsoYZ1rNRbfSk+JUXbp0MoNShiGafGcrvIMrlia60na67LVLjcn8qJLFAWWedQ2xElBjIg29lcXgsicw1er6jaAKjqFedTeZPDDh143sE46tgBaaZd4bvp1A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736406863; c=relaxed/simple;
	bh=BSM7DgNUt2aqdcBjbMe4R26JPGIRCbc7iP5uO0U8WDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=mvGxRi7u4PzpY31B4PCfAdQ2syQKehA+FlnsiWWVUYY5OTpUXfF9nOdjdzPn9jEEZmMWU34gICJiQbmd6GFkdE/z/EnXaf6j5BlJnZ4r2keE9udCM4Mw9UuBXvulj0RQCi24cXNhTAptozunePt68iyh1aS9n6f4XFo8kvRkD8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=oXFTU4mO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="oXFTU4mO"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2164b662090so8114455ad.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 23:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736406861; x=1737011661; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jsv9MJq3uIz1TpM1DnTlfmh6B4pnNr2T13dTstPwHw0=;
        b=oXFTU4mOKPrkfVbMSsitSGO6nIUhAK0TK/0LOguHaktzIJlaihQv+qBaUrH2qVD8/4
         G7i44wxpooNITwDuBDXP0ZqCbiuP+iKFtQBnQuLMhIjWlK4Gn90ibH//oUnBRdwP9tEJ
         FQrUdq6m8U7705fFMFhbhPf1N3nX88toarX/TmpQ3hDb+JWcabS8X9SD13tsFSfiksl8
         o2V0+1ylU8abAf3Wuc3YwB+tqS/9Fy82/wW7ouZzEeNu4CW5mUXCjYln7bGCVJStUk/G
         ADPdxKjvg3FtSeneQMBQBX34ogdROWZ5eRQD/+PXgeH5ZG+SNFHqhNq/+8ISvwyV7bHE
         yZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736406861; x=1737011661;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jsv9MJq3uIz1TpM1DnTlfmh6B4pnNr2T13dTstPwHw0=;
        b=tVof1rJvPZftUk1D1EKIHmn8eEPvW2L7LHn8P5cwMRv388McXRuOrgB7cNNYziyUrR
         lCdMebbLzmx86b43Qhd6LEf3E2ZDKk8l/5PwWl0omhNYgsJa5HL8QYvaqbWZZSOKioUm
         zTx+wIEn3o+wEmQorLiJxwY5vIMJpJFjRF5Wm9AQUOByb5XyD5pxRcLaNDx3y5TbgYe9
         hwFNrnSSs1YkHFat4JdZTWHo6OQOCnpkyCZl2PDusFFnrke1xP69DlYWLZh5O2DEBlpL
         M0Oy2WO7ODjWtMjruAYOp3MEq2IXorjZb6BKQV++D5ECywrz5a3OLx0Rowv4cmmQb53j
         cCzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYVGNPPhvOz11d4xvccHKOu0wZVQJYxHRJsKG/wcju2q24I5rB+znmxhbWPXmfZAMmHw3KQ4cG6gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIRiMjGUxUC+rN3kTAJW5rewebMGgJA5iKqRrpJrEeT/RmGcL4
	EeFrvpMKJaNWvoGALwbi0DbxGAt1OmMGQeRfJYLZb7BIGHPimFwyKG+Ykg9b+Jc=
X-Gm-Gg: ASbGncvPqzflgP7gYkhsuco5plUYrntyj5BPblSZ8wVgeX9OJFOvIuVdiUct9IL0N75
	lUPhMkb7R9nFZklhiqV7aU6ns1f5B93EkUH+SiETJCB8BZS9ONExEXkDgbrY0AzseOw54NJ+NWd
	RtJbEhIN15634eQyqhiJA3ryqj2pq7Q3qnnggTRqrqfy8GEv4lruVOpwq0+Le7knAaxuCOUd9/T
	QHnvC7ZrKJ52swzFu7rcYwrB21kOXLzHo0mDYpiid0GYnlY7AyyvHTa0E4=
X-Google-Smtp-Source: AGHT+IHWt2iyxhsURGGm00T78Ud8g8z49DZ1+HVJANgH+a6WNvQ5wGbFg/saU0NxSmQebXyhzwWD4A==
X-Received: by 2002:a17:903:1112:b0:216:138a:5956 with SMTP id d9443c01a7336-21a83f59822mr91255545ad.19.1736406861198;
        Wed, 08 Jan 2025 23:14:21 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dca025desm338521435ad.256.2025.01.08.23.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 23:14:20 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 09 Jan 2025 16:13:40 +0900
Subject: [PATCH v6 2/6] net: flow_dissector: Export
 flow_keys_dissector_symmetric
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-rss-v6-2-b1c90ad708f6@daynix.com>
References: <20250109-rss-v6-0-b1c90ad708f6@daynix.com>
In-Reply-To: <20250109-rss-v6-0-b1c90ad708f6@daynix.com>
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

flow_keys_dissector_symmetric is useful to derive a symmetric hash
and to know its source such as IPv4, IPv6, TCP, and UDP.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/net/flow_dissector.h | 1 +
 net/core/flow_dissector.c    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/net/flow_dissector.h b/include/net/flow_dissector.h
index ced79dc8e856..d01c1ec77b7d 100644
--- a/include/net/flow_dissector.h
+++ b/include/net/flow_dissector.h
@@ -423,6 +423,7 @@ __be32 flow_get_u32_src(const struct flow_keys *flow);
 __be32 flow_get_u32_dst(const struct flow_keys *flow);
 
 extern struct flow_dissector flow_keys_dissector;
+extern struct flow_dissector flow_keys_dissector_symmetric;
 extern struct flow_dissector flow_keys_basic_dissector;
 
 /* struct flow_keys_digest:
diff --git a/net/core/flow_dissector.c b/net/core/flow_dissector.c
index 0e638a37aa09..9822988f2d49 100644
--- a/net/core/flow_dissector.c
+++ b/net/core/flow_dissector.c
@@ -1852,7 +1852,8 @@ void make_flow_keys_digest(struct flow_keys_digest *digest,
 }
 EXPORT_SYMBOL(make_flow_keys_digest);
 
-static struct flow_dissector flow_keys_dissector_symmetric __read_mostly;
+struct flow_dissector flow_keys_dissector_symmetric __read_mostly;
+EXPORT_SYMBOL(flow_keys_dissector_symmetric);
 
 u32 __skb_get_hash_symmetric_net(const struct net *net, const struct sk_buff *skb)
 {

-- 
2.47.1

