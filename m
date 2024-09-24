Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD08154458
	for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2024 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727168479; cv=none; b=EXyf6SPOthkiy8iNXXdLiZdFb3Xb28P9aYwDPgiIHOFstA9DN4VGBt6wxJ8d1ZdmiiBkRsixYluTDqYHWp51YYF/40DVf+9NnbsQ+kAXknfb56Aw4Lr9g323uYWH2d7LpAat4kP7zbUQRxUqd2btQ5rIl48wdo7fTOH1oVTypJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727168479; c=relaxed/simple;
	bh=MyD71HI4MA2yAUC70K/NmNxJQezcMoO+zPtOIctDAQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=J1lljVerqE/2KcvYqH7YSoUYLMPdZdkvhNKdNTx4juVtP+nP5h+0Q7eyt9TN6QuHA6KLZI2+sCFUdg7Cz3czcze+9bgRHLPWpzrIt3LlxgF407EFUO2cnGCGPPttI4CCQK64YNX9ZlVK/T26lM8u1JseMVVmDNy8ZVtwNaOi+GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=zfHKkb3K; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="zfHKkb3K"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5365a9574b6so7368358e87.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2024 02:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1727168477; x=1727773277; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1kAAAtErX+Mbn0MQOV75jcovDzbdqf7yjREy+JSPNM=;
        b=zfHKkb3KibxvDG5DI/1jxvJJM9Gy5bFU/hA3gzLoOJNG5cY68nvUbFmZoJNWOoPbDy
         QdaYyjaAb+YHTb32soahm61/QCfUkLcbYwh9MFZW5VVNL3CnoQdVdOQEuqrB0aeLDAbR
         wRsROTSzAzcptQ2AAQrlEtHnd8Fz+gu3i052WcwCW5HwebECApodwXSohXu2OJ7Cdy79
         h5/KonEDAFIGqVzRjWdNiHm86V7XbNMHG27rsxEEoxK8YMhIa4nv/54xCGrM76BqW9B7
         Ojr/B48NlthQ1kxLCxVYD16uTnewynObyTOFg5WHAtJQIu6qyBr4cMq53p64xoTMd7+o
         kyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727168477; x=1727773277;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1kAAAtErX+Mbn0MQOV75jcovDzbdqf7yjREy+JSPNM=;
        b=dBpWxHtVk6IwjkTOXKxml9PE7E2NH/EM5U308Mq8MnFKMk75jkO9M8L7gcJcROie8V
         /+0g71T7uJ+wl5qYkGq6szVA9Y4yf+3X0XIWXlYRK8bgPkXOJUnppouR5Jbp8835yQsE
         /oIPY4E3g/XoTTLo6huCx+cQ2sPn8hO9BxHSCM7wZlTVrrkHfZ8SRvNdtSA0ajs2AF9E
         ebBALK1HP/oYnsSOLceozewKPFRDKTjmFRuzXZU0bnYheFDP+8nexGy962NGZjv0TOCC
         cMBS/hbnqpDzSDA5SgiAz9uk5nzOdB1odu1kcb1hRzQxfmgCIu9Q9yv/EnmDMxYsWx64
         7jVw==
X-Forwarded-Encrypted: i=1; AJvYcCWrAG81AAaLxjYfSE5eL0xkL84gwmGXpaC10EuuEghSrKGi/rzMvWS6HMvXZVWWN1c6X9SmKxKHNZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9VdSRis1xmy0EE0p8qloYHBE/J00CTFqwgPEE6GOuplB7wBXd
	WrDfkIBnW05A3wbXMNHcDAqtRjei7uEu0DPE4XlCZsZ0uBZIreMxptj6D5L6e5M=
X-Google-Smtp-Source: AGHT+IFwbEJheNGzEgD5vAlxy6ttzfcaZu81VFeEqJsY1P5iYb/DMCt1ffXE/8oRaqbajpxcR435Vg==
X-Received: by 2002:a05:6512:39d4:b0:533:c9d:a01f with SMTP id 2adb3069b0e04-536ac2d6a7amr8799569e87.4.1727168476563;
        Tue, 24 Sep 2024 02:01:16 -0700 (PDT)
Received: from localhost ([193.32.29.227])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-a9392f34959sm59743266b.8.2024.09.24.02.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 02:01:16 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 24 Sep 2024 11:01:06 +0200
Subject: [PATCH RFC v4 1/9] skbuff: Introduce SKB_EXT_TUN_VNET_HASH
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-rss-v4-1-84e932ec0e6c@daynix.com>
References: <20240924-rss-v4-0-84e932ec0e6c@daynix.com>
In-Reply-To: <20240924-rss-v4-0-84e932ec0e6c@daynix.com>
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

This new extension will be used by tun to carry the hash values and
types to report with virtio-net headers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/linux/if_tun.h | 5 +++++
 include/linux/skbuff.h | 3 +++
 net/core/skbuff.c      | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/include/linux/if_tun.h b/include/linux/if_tun.h
index 043d442994b0..47034aede329 100644
--- a/include/linux/if_tun.h
+++ b/include/linux/if_tun.h
@@ -9,6 +9,11 @@
 #include <uapi/linux/if_tun.h>
 #include <uapi/linux/virtio_net.h>
 
+struct tun_vnet_hash_ext {
+	u32 value;
+	u16 report;
+};
+
 #define TUN_XDP_FLAG 0x1UL
 
 #define TUN_MSG_UBUF 1
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 29c3ea5b6e93..a361c4150144 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4718,6 +4718,9 @@ enum skb_ext_id {
 #endif
 #if IS_ENABLED(CONFIG_MCTP_FLOWS)
 	SKB_EXT_MCTP,
+#endif
+#if IS_ENABLED(CONFIG_TUN)
+	SKB_EXT_TUN_VNET_HASH,
 #endif
 	SKB_EXT_NUM, /* must be last */
 };
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 83f8cd8aa2d1..997d79d5612c 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -60,6 +60,7 @@
 #include <linux/errqueue.h>
 #include <linux/prefetch.h>
 #include <linux/bitfield.h>
+#include <linux/if_tun.h>
 #include <linux/if_vlan.h>
 #include <linux/mpls.h>
 #include <linux/kcov.h>
@@ -4979,6 +4980,9 @@ static const u8 skb_ext_type_len[] = {
 #if IS_ENABLED(CONFIG_MCTP_FLOWS)
 	[SKB_EXT_MCTP] = SKB_EXT_CHUNKSIZEOF(struct mctp_flow),
 #endif
+#if IS_ENABLED(CONFIG_TUN)
+	[SKB_EXT_TUN_VNET_HASH] = SKB_EXT_CHUNKSIZEOF(struct tun_vnet_hash_ext),
+#endif
 };
 
 static __always_inline unsigned int skb_ext_total_length(void)

-- 
2.46.0

