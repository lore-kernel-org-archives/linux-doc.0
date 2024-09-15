Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059B5DDCD
	for <linux-doc@vger.kernel.org>; Sun, 15 Sep 2024 01:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726363255; cv=none; b=lzzFpMWvB9RDp09uUhf2N58VvW/WMlO3eRfikzDDy05wNIqbrQm4q4tVywwEpBEaYG74nsaF+lw95ry/dkR5VqG5JTt98uXC6ptXI0TsGnt5reSKaxsk3iae9/qYQSzcB9z5DCOSZpXc/A36PWWwoRSggyuYtiTVcxE/x2H0LYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726363255; c=relaxed/simple;
	bh=2fqPz17MRcLXtYYBT9jcWjUzidfYf/z7eYbmCSZjWTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=H1TmSQQV8vglxTQABNt//gR7WYaVgBt/qhU/0nLQvtOlBS/4rSQtI4ToXOL+hM3ku5Mh9HE5EKFwIbL1TETVm8Mg252tNc9Y42Wwk+jgr7wZ3iomVvxGj/d1So4hSc8DWuuN65Ne3x+/m1GbPISI3TGLkFGiywtzjYL43ofIjFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=fLOCq/fP; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="fLOCq/fP"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7d4f8a1626cso1662780a12.3
        for <linux-doc@vger.kernel.org>; Sat, 14 Sep 2024 18:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1726363253; x=1726968053; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldxygdAUBk4mdAzGg1OPlp5HlR7yVW+p2ali8303Ccc=;
        b=fLOCq/fPdeg29GlI0YJw8IKiK/6VYhKglyV9dSYMXnEOf0R8BWfQtAHE/Y3M+uUT5r
         m1bP4JS5f7M+fkYIPPznGAImbjUYLlmZ7FialJGo+XMrWb7iaD9fBv9X1wt+WDgxRqJI
         WLhTu+Lyp8q5E8dsSCw7bSB1UiVzbB8LT0SZse0PLI5OglkdVY3Kquzvtd5Y9DYRXQ5J
         3sGOlDCOHWrDREtmVuwDJXLFbdc+qku4XJU2rQplPaBQd+EvYiIausrPCLmFib629wHW
         sbw+gdIGDm6W3xdEW0xDDTEsu2PrHTRM+TTI0+tn0zT1gBfcCemoeTfAXxy3TR49PlED
         BhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726363253; x=1726968053;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldxygdAUBk4mdAzGg1OPlp5HlR7yVW+p2ali8303Ccc=;
        b=jUFzZTXAw7U5mPKPB/Dg0icbcJHoAirtLPHZ3S8DmmmZksqdfOUc1YHCXp98pBWzjg
         CELr4PJOhvinbKdsUzekBMnpVPh3s4F8d+gGpSzEXoeYUzsOpyunBfM/cSrQzmibkbzW
         GoxtH1GZqvjgwWw/1K8G/WrBI2cj/rFeil5x85rzYRe5ByHJqk2UaFc5QzRgfTFSPJDh
         eN8/h50xiKnyZAF+jqDmNCcBEflVYJLHFU+twbvLoo5ooi7beazmH56heya+JzhON8Em
         h+8Wl/kWv+3/be+agysnqX1nP9GOk+PEe15uKHcoC3qGFixs26luah4Ol6pIFCzIKDrr
         +I3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfoSpM/9JOVzzSS/JvRMdV7Tt2HOrWHLUFUrE1tqaYNO1fXBBEuJ/7fEzqLPAtYbGR1uimSZKUnMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Ajv0x3rvY+li7EQWzmjkMp+rMkXNiBBDZ1afQNAd9diI2he2
	W4bv4EwPyF+6R+rKAuuyjVqC/qaH0vIyp/aWfwYNWpK7KCjuDNlHdUU0eDigdRj7CijmkH8B7Lj
	VCMc=
X-Google-Smtp-Source: AGHT+IE0yowzjkvInt+ft5+xweE+VUrTmnfVWN9Wxm7pcrS1764om0EdmXZEOykQ9o1zzDGEix2zCw==
X-Received: by 2002:a05:6a20:c996:b0:1c6:a680:ef3d with SMTP id adf61e73a8af0-1d112db5de9mr11518495637.28.1726363253133;
        Sat, 14 Sep 2024 18:20:53 -0700 (PDT)
Received: from localhost ([210.160.217.68])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-7db4991cfd2sm1787114a12.48.2024.09.14.18.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2024 18:20:52 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sun, 15 Sep 2024 10:17:48 +0900
Subject: [PATCH RFC v3 9/9] vhost/net: Support VIRTIO_NET_F_HASH_REPORT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240915-rss-v3-9-c630015db082@daynix.com>
References: <20240915-rss-v3-0-c630015db082@daynix.com>
In-Reply-To: <20240915-rss-v3-0-c630015db082@daynix.com>
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

VIRTIO_NET_F_HASH_REPORT allows to report hash values calculated on the
host. When VHOST_NET_F_VIRTIO_NET_HDR is employed, it will report no
hash values (i.e., the hash_report member is always set to
VIRTIO_NET_HASH_REPORT_NONE). Otherwise, the values reported by the
underlying socket will be reported.

VIRTIO_NET_F_HASH_REPORT requires VIRTIO_F_VERSION_1.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/vhost/net.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index f16279351db5..ec1167a782ec 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -73,6 +73,7 @@ enum {
 	VHOST_NET_FEATURES = VHOST_FEATURES |
 			 (1ULL << VHOST_NET_F_VIRTIO_NET_HDR) |
 			 (1ULL << VIRTIO_NET_F_MRG_RXBUF) |
+			 (1ULL << VIRTIO_NET_F_HASH_REPORT) |
 			 (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
 			 (1ULL << VIRTIO_F_RING_RESET)
 };
@@ -1604,10 +1605,13 @@ static int vhost_net_set_features(struct vhost_net *n, u64 features)
 	size_t vhost_hlen, sock_hlen, hdr_len;
 	int i;
 
-	hdr_len = (features & ((1ULL << VIRTIO_NET_F_MRG_RXBUF) |
-			       (1ULL << VIRTIO_F_VERSION_1))) ?
-			sizeof(struct virtio_net_hdr_mrg_rxbuf) :
-			sizeof(struct virtio_net_hdr);
+	if (features & (1ULL << VIRTIO_NET_F_HASH_REPORT))
+		hdr_len = sizeof(struct virtio_net_hdr_v1_hash);
+	else if (features & ((1ULL << VIRTIO_NET_F_MRG_RXBUF) |
+			     (1ULL << VIRTIO_F_VERSION_1)))
+		hdr_len = sizeof(struct virtio_net_hdr_mrg_rxbuf);
+	else
+		hdr_len = sizeof(struct virtio_net_hdr);
 	if (features & (1 << VHOST_NET_F_VIRTIO_NET_HDR)) {
 		/* vhost provides vnet_hdr */
 		vhost_hlen = hdr_len;
@@ -1688,6 +1692,10 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
 			return -EFAULT;
 		if (features & ~VHOST_NET_FEATURES)
 			return -EOPNOTSUPP;
+		if ((features & ((1ULL << VIRTIO_F_VERSION_1) |
+				 (1ULL << VIRTIO_NET_F_HASH_REPORT))) ==
+		    (1ULL << VIRTIO_NET_F_HASH_REPORT))
+			return -EINVAL;
 		return vhost_net_set_features(n, features);
 	case VHOST_GET_BACKEND_FEATURES:
 		features = VHOST_NET_BACKEND_FEATURES;

-- 
2.46.0

