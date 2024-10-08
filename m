Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BC91D07BA
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 06:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370490; cv=none; b=rjl1lXHuGhXJ98D6F/rqWuBMsps3T08UGmpjroDfEvbui0OHW+xsh2sCBYProf1iLcQ+xeNTq9FlUpf1yv0FOr7O2e9RzE0An8cjavAA1PpItkQ2C4I2DqLgmPVKgE4HwdvTzNsCQBVBEpdHSHM8nAXDXrASUMaH69a95fAJ0vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370490; c=relaxed/simple;
	bh=uaol2IGqvlm8ZTxu7WxkWiZOHaSPhvJu+1yhZK+cfFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=A0zlUK2R0qETmZmh4X+opinSl2928IPrCixK6eB8nH5lX+9C44O5FMu8jfOc7mYEabYYcrv/zK9qFN8lRQyknerV5XZEul4v+MVigg0FIEqx4LEtUV9vCwY9uCqJ2f3y4dms8UX5izfqNymXYuOP2MjRbc4sp+Zl9M5z/FUzxis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=fqmv9pvY; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="fqmv9pvY"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71de9e1f431so2885740b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2024 23:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728370488; x=1728975288; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUS5KMA/ewmQfZHiSllXFCUo7ZXTGgrN42vxjEBIbqQ=;
        b=fqmv9pvY8o9ipB+kE/rimSv/RWtXp9Zt7Zk088OiBWve03Jeyw3r4yukwWurgEX08X
         kjxPa4uGST4v/qU5GKPnCMwYQkhvqoYjFoxQv1FkrNTJAeIVGwuVRERB9qGNTaHVw2oe
         sUDAgPl/s+Slbpea/GS9wWepvx2SQTFEHaRlJRurp+TrL87gMen7NPDqNJp7DPhMv8xs
         omd+KMgS4JPNsPjnQsWX/o2kETJSAp4xU8m/rO0H5BYExEOVQvElTxbymh2pBeHKMadU
         na7+hEHkFwBAJ3o+YDcKig5xw1WRieOOt2vnCR4QdWitYP8bGoH8EonRZdRn4CoX84Y6
         l0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728370488; x=1728975288;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUS5KMA/ewmQfZHiSllXFCUo7ZXTGgrN42vxjEBIbqQ=;
        b=L2KH8WDOwo/+ECbUNGlwcYW4eCXFe6hb8SeGRrv8QRLKkhnnFE163yJJ1V5cOf2S9p
         PHExL7U+AQEK6egM4PXcLGURpRjwzhbEf2WDOHKpO/nh681ZlEmCFT99MBD6av2z8RuB
         j1F+Rixo9t5QGc2NBU9kIWY10TzwgRryFftqxCfjq7Dd8DhGFFS7l1pw3kHNJKWarXd0
         FdwMbjuKPT1+aaQbOheUhjRHsI32XcVA6raW32dlc4z4KrkhoLTK5c8rVWjuvAgfVxdm
         J8kXPGFV63ic5YOmFIltSw2GmupwLJ6UHwuadgZ/0q/LDSlgBZH12Ba8ZjWGh7rcD5y+
         AIzg==
X-Forwarded-Encrypted: i=1; AJvYcCVFAWJkDxLBvy0ApXarykoTELGLUY7wLNCnIDfVHKXl8fJ9ez2LtOQgfTiHBi0BgfCoPMVvfK94pa4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh/b9cpA8KbIJYwHb5U3XgY7CX+J1eJmVXVMrXZ+JI4/EH56U2
	L0nsUU2WUOehJZMWQ/LkRi3dBp1aOnv0q2gYO3kx5W4HaRiZp0iUxE4r/T51uBgzoaJj4a1ha+t
	K3wM=
X-Google-Smtp-Source: AGHT+IEKcNMiY7wzLXe5eQDoa0aLQOUol5zSII/XfgY6pIxMP/K/JQLspO3LpuBtTgX1dSRwe3ohkA==
X-Received: by 2002:a05:6a00:3e22:b0:71e:21c:bf1b with SMTP id d2e1a72fcca58-71e021cc1bcmr11161687b3a.14.1728370488090;
        Mon, 07 Oct 2024 23:54:48 -0700 (PDT)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-71df0d6521asm5477837b3a.166.2024.10.07.23.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 23:54:47 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Tue, 08 Oct 2024 15:54:22 +0900
Subject: [PATCH RFC v5 02/10] skbuff: Introduce SKB_EXT_TUN_VNET_HASH
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-rss-v5-2-f3cf68df005d@daynix.com>
References: <20241008-rss-v5-0-f3cf68df005d@daynix.com>
In-Reply-To: <20241008-rss-v5-0-f3cf68df005d@daynix.com>
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
 include/linux/skbuff.h | 3 +++
 net/core/skbuff.c      | 4 ++++
 2 files changed, 7 insertions(+)

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
index 83f8cd8aa2d1..f0bf94cf458b 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -64,6 +64,7 @@
 #include <linux/mpls.h>
 #include <linux/kcov.h>
 #include <linux/iov_iter.h>
+#include <linux/virtio_net.h>
 
 #include <net/protocol.h>
 #include <net/dst.h>
@@ -4979,6 +4980,9 @@ static const u8 skb_ext_type_len[] = {
 #if IS_ENABLED(CONFIG_MCTP_FLOWS)
 	[SKB_EXT_MCTP] = SKB_EXT_CHUNKSIZEOF(struct mctp_flow),
 #endif
+#if IS_ENABLED(CONFIG_TUN)
+	[SKB_EXT_TUN_VNET_HASH] = SKB_EXT_CHUNKSIZEOF(struct virtio_net_hash),
+#endif
 };
 
 static __always_inline unsigned int skb_ext_total_length(void)

-- 
2.46.2

