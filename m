Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2962FF664
	for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 23:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764545739; cv=none; b=t3Gt3uSEanoy8Gw0rlrld9tGdBWHeL3eKOnPijMv70ixejhDFOO2CtxycdtjBykvu5LO3MBeLR4v8qVmK//XhzHu8O8jDzoXz1GOWg0p4bewQBQ9nZhRUx04Lya5qUxZT1NgNRXgnn9+iXe5E7I9PLlS0PYtxW5YXeFRV5pH1Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764545739; c=relaxed/simple;
	bh=LSh5hLuiJCxDRwJ+BQ+Xc7tCZE16QA/b770rYhc+vp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LkIQhqJh43x4G4a5lhDQvxXW7vn6miXRCIFdgs8K4zQ3Ikhn033epdw7tB9ycPIsFjdk/lj05d2Fi+WRPy74Mc33atMCDAnIKjB+kOaS7xXnTBLNnxenKvFQuiEXxUUeg4LPydeS03K5kRXjg/ZWOCcnbedAkVLtSboD/YM+EEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7UypCOO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7UypCOO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so35074385e9.3
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 15:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764545736; x=1765150536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BopLoWIhKj7xpDJExutQghL/d96/x+rVfP3p1ohtywE=;
        b=D7UypCOOix839eTbKC/dmhlH6EbPRl2Q9K5FTyuaos0ra5SfgnRH67yxhdXonRzNE1
         JLm/05xwKtxykCoPmzkttHKzOmVki1Jk1KIITlrwiebCDzkATqj3aa0lBfnszDQIwT8i
         ct5CkJNOqMBUydrm89AS2BFiomYcBjCX2G3YsZ3MSuE3aq/ps+ZtYJQxcjULM/Z81xPm
         hqjkAzibMOr0aVfM9a0KkPmay+GuLD7jQddO38eBauV6wOpy2qkK/5B9RIqXSr/PB6RZ
         W0IjlPfXngCtYQbDJzdtD1CA18rqtwJrrgmy1LKiYd9iwF0gqqaZhlRZv5MoKAlOlV0a
         F4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764545736; x=1765150536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BopLoWIhKj7xpDJExutQghL/d96/x+rVfP3p1ohtywE=;
        b=fua5cRu9J8379aoBH/54o9Oe9Zn+Xy1duxxZ/LU2tg8Qi6FbeZkTQucWi5yUVk3QwA
         wEDrA0eRBAB/mxEWvE+Biyq+U9xOM900XYf7O7i9RcKv7QAxK/gIKGf72hAGKdTj5wxm
         92FrMwPPw72Wwa1TVeO1Y2VLZM7T2TJdAfYKFnaGrA8Eu+flfHjYv+eud84M/LpRqyIK
         LzjBYJFd+48K77U87nj/aH9UDcygJTGlxl4oNiVmHp2+SiFcI6oPUM5B9PdEykW7yeYd
         pVmXAPG+vhaphXHbz5EumAe92HSjr3jtrCFchzAe6KQH4F/V54HmcaClZCShWXggCKBZ
         NsLw==
X-Forwarded-Encrypted: i=1; AJvYcCXQlZGSCfiPAnj9kExtWH+9XK/8wV/u8g3AJZTP5cpyshy0I2Lr/FIVJbhDZMMHfOAucFAeR9bKlwA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw08Yd9dvvpD9oT808BlDrUXZXw8x4uswG+D8a5WyfwfGihgWKW
	WhC+hQfSI77VFDOyPRiqDA5EIrCXhTIgrSMk5WEtRXlUbCc193pJ/v+d
X-Gm-Gg: ASbGnct6FEHqEb8mIxK0ff5vnzuG9qyfZtVvi2agS9obOTakP/JKKZGL7RGJFvn2yQL
	LOOyt8qis9oLbrYMHkujX6lBgCYmGslP8tH1klFXVYuls/FyDsJuj1xOXS5u8gK4VozKOzo5KQ9
	it2BvSr6Tohvtc77eA0ykxn3I5MtZthtv++JaokYsqZFKyYlCgoYscR2RFtihm/HHo4s0RZ0Qpf
	MWUJPabXQrAm2jFV9+4CyDnm7IWptKDZh9tWlDF/Moa9EbOOA8dlZsw3yR297TxN5PHiLJcwH2V
	oQkw4NOgFGAXZIrUXQC4Ux59enbTGDc/N2OZxwJsLk/xaOozNgQnfzYr7PTbZzCxjobSFv9qVAd
	SAdFpAMU23PyVzuXBBMe36t4EqemdYdjVEFp/K0nvVkbbuZ0JaGXC3Gk1zD9xmoAa9QmgrK6WI9
	c1az3JixhWb3OEureuzumTvNffvjL5yUR2BU6GesnIbdWfPRIfEX14DfYtjbdZL/CzIjoKCaWsQ
	Ospj3H2S0e0xCiuKjTamGiFMrc=
X-Google-Smtp-Source: AGHT+IHISYLGMcAbCVZNiKeY1dtZPkbvCAz/q8vqp6c82/yUdHZQKIhPMrYnHbV51FKqG4IwK4u77g==
X-Received: by 2002:a05:600c:5252:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-477c110328amr358728235e9.4.1764545736071;
        Sun, 30 Nov 2025 15:35:36 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040b3092sm142722075e9.1.2025.11.30.15.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 15:35:35 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Yue Haibing <yuehaibing@huawei.com>,
	David Wei <dw@davidwei.uk>,
	Haiyue Wang <haiyuewa@163.com>,
	Jens Axboe <axboe@kernel.dk>,
	Joe Damato <jdamato@fastly.com>,
	Simon Horman <horms@kernel.org>,
	Vishwanath Seshagiri <vishs@fb.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	io-uring@vger.kernel.org,
	dtatulea@nvidia.com
Subject: [PATCH net-next v7 3/9] net: memzero mp params when closing a queue
Date: Sun, 30 Nov 2025 23:35:18 +0000
Message-ID: <374b055a2119076d43336008817248854774668e.1764542851.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764542851.git.asml.silence@gmail.com>
References: <cover.1764542851.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of resetting memory provider parameters one by one in
__net_mp_{open,close}_rxq, memzero the entire structure. It'll be used
to extend the structure.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 net/core/netdev_rx_queue.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
index c7d9341b7630..a0083f176a9c 100644
--- a/net/core/netdev_rx_queue.c
+++ b/net/core/netdev_rx_queue.c
@@ -139,10 +139,9 @@ int __net_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
 
 	rxq->mp_params = *p;
 	ret = netdev_rx_queue_restart(dev, rxq_idx);
-	if (ret) {
-		rxq->mp_params.mp_ops = NULL;
-		rxq->mp_params.mp_priv = NULL;
-	}
+	if (ret)
+		memset(&rxq->mp_params, 0, sizeof(rxq->mp_params));
+
 	return ret;
 }
 
@@ -179,8 +178,7 @@ void __net_mp_close_rxq(struct net_device *dev, unsigned int ifq_idx,
 			 rxq->mp_params.mp_priv != old_p->mp_priv))
 		return;
 
-	rxq->mp_params.mp_ops = NULL;
-	rxq->mp_params.mp_priv = NULL;
+	memset(&rxq->mp_params, 0, sizeof(rxq->mp_params));
 	err = netdev_rx_queue_restart(dev, ifq_idx);
 	WARN_ON(err && err != -ENETDOWN);
 }
-- 
2.52.0

