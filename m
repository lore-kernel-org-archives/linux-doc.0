Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60181F8EFE
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 11:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736336476; cv=none; b=Obyenc7xTIM5yX1swvsSWtfax54iN4FFQuoRz/hqQNrfzGCGKjHVPZwxNTTrCSpf6ReMuWc+m4c6Nu7pBRorYTdiGHqPrsrbVrqyw6lvjA6JDWfYpZiPZHqpEDErcWL5AgZpW3g24LYRCZEcEB8WTUCO5P831Xrna6jKTPWb6Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736336476; c=relaxed/simple;
	bh=3se5b6ZtcapIk1Hj4cssqIsg8szJXXkbOptd2HkOcvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=O8BJkJF8/fswoOxHrIe6s/I0GhwGdFstNmRPyGLHcgXwBigUlPaN3IZck6zyjb1vqBD0mi/cCtFuDpVNyMIitanPcLqDpCJoOFtkp1U/uQkSB/CAzCCCIlI2Td2RZ9lC/NGFf17NR+hophzxoOQut+9vb+euBuvhFAsdDGvbdv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=zM1czloq; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="zM1czloq"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2efded08c79so19377510a91.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 03:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736336474; x=1736941274; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/vBDwZ1bg1e1swp4oqyRL1d2OsnyaZOIbrFToORcQk=;
        b=zM1czloqv0UV/90fK2rdkrxN+ZY60mhHl/ZYSJ9rHeQiW4eyOpA1E+thUrTj6zioWc
         s598jUHvTxuWkXw6pmtfxEF2bE2fSIiHEEzYPEJt9bN48jNUidJ1avW81VhCOkJOfFwg
         UvVgmYc02uOgVB4VrXfldtlls2Q/S5vl7/wA8+LPHyV6PlKe5W9cXjG+AZ33K5DX8vEe
         Ljw/up4z1U73PQTs6zLkxaGZg1BcE/DgXhBElV7rs6HAIOvNn3nfKn20B7AngL/ceUX1
         3FMADKRwpaf7hw4/4D4rb4UlFQNF7RnJlzRrfIWbGf25ji7LoXxAfAaMYPK3Y9eolHPX
         p/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736336474; x=1736941274;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/vBDwZ1bg1e1swp4oqyRL1d2OsnyaZOIbrFToORcQk=;
        b=QYO+mM7Jg8WTBU2Yx3ZB1t6Oe7FvfdC+8odd1kBu8pfaZxQktFtq8s4RVJYCIXWc4s
         qUK47BK79fUDZqJxa7l5mhnRV4Q+zctfCZgBZNqzrjnb0P/7P71qGUkrbYt3MRU3A5WM
         NVKqtqRnKkx0SO1Z9mqQs2+IzSwpdkpeSNCz8CC1q5oE7be+7fcQEXowvvTj15/yf3YW
         2icNT69SNpYy/Psi9eUpDjouXhmtQTZUS17ugvRmdSEmvoQTy02zAtSLaVjSuPshNOpK
         YmSJ20e0n+YAXn66/syAJeUeP2DJP8hWmYGseGVcRX3BncrS52DKlo8hiWGakfPpi/oP
         +2qg==
X-Forwarded-Encrypted: i=1; AJvYcCX/Y82l5wKPk8eHG01Cv2sW+6Q7cUBQrG9jUAjZyc+KKcMiqe6SFsoieRpCpTDXkqLsEGN55M3twBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwocGVczbxmXvgA/QwMcsf6ebATQep+X8+5SS+HQOBwT+DUp4xe
	CDXXUn+0Nd0/I2HtZs8X+jbcVdSzfeZDIAA5zMNa7wIJgCb9vN6DQa+7jyUYBAg=
X-Gm-Gg: ASbGncuqv2KqHrhJjNMhUTPjRrMdC4L/RoCzLxP1O5VVRhdCzxkXlD2dzG2XfJYqa2R
	Wrce0a25fAy9fpcvP/wJJD2drk07WpuMrOHhzXHehpB36Wh/AxfFccle5rCWN8dKypAraP4IPyv
	Js82NMy4NaUDDk/e4eb1PJ0s1CX6KEekg6NMKADHkCiKuFfuYU2t/7dsJdurXSNybs78bK//q5e
	yuMjMNiIexpvcIza5xyv5TiXGIHVCk5M1kkKiVu/qQ/PV7oDvDeTofJLcw=
X-Google-Smtp-Source: AGHT+IEF8qMJ7NIeisRWLUDr1vgbLpWM1JpUxFEsueCBmq3r2f5ah2dV4+8clMjFEVU+QatbWr90SA==
X-Received: by 2002:a17:90b:5484:b0:2ee:b8ac:73b4 with SMTP id 98e67ed59e1d1-2f548f4265emr3092055a91.36.1736336474242;
        Wed, 08 Jan 2025 03:41:14 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f54a36a5adsm1383037a91.49.2025.01.08.03.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 03:41:13 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 08 Jan 2025 20:40:12 +0900
Subject: [PATCH 2/3] tun: Pad virtio header with zero
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-tun-v1-2-67d784b34374@daynix.com>
References: <20250108-tun-v1-0-67d784b34374@daynix.com>
In-Reply-To: <20250108-tun-v1-0-67d784b34374@daynix.com>
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
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

tun used to simply advance iov_iter when it needs to pad virtio header,
which leaves the garbage in the buffer as is. This is especially
problematic when tun starts to allow enabling the hash reporting
feature; even if the feature is enabled, the packet may lack a hash
value and may contain a hole in the virtio header because the packet
arrived before the feature gets enabled or does not contain the
header fields to be hashed. If the hole is not filled with zero, it is
impossible to tell if the packet lacks a hash value.

In theory, a user of tun can fill the buffer with zero before calling
read() to avoid such a problem, but leaving the garbage in the buffer is
awkward anyway so fill the buffer in tun.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/tun_vnet.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/tun_vnet.c b/drivers/net/tun_vnet.c
index fe842df9e9ef..ffb2186facd3 100644
--- a/drivers/net/tun_vnet.c
+++ b/drivers/net/tun_vnet.c
@@ -138,7 +138,8 @@ int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
 	if (copy_to_iter(hdr, sizeof(*hdr), iter) != sizeof(*hdr))
 		return -EFAULT;
 
-	iov_iter_advance(iter, sz - sizeof(*hdr));
+	if (iov_iter_zero(sz - sizeof(*hdr), iter) != sz - sizeof(*hdr))
+		return -EFAULT;
 
 	return 0;
 }

-- 
2.47.1

