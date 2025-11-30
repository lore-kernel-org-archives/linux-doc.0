Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD622FE07E
	for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 23:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764545736; cv=none; b=TxcdX4RuNGFtdTFsj2Qr0UlyefTj6qUP5bG4/4T53ZFOkuNZt1YCGnRWa1HV9RMrksZHYsCYFOb5swlAn347ku2i10SPcI92wVX3BjO3erJXUN1v9e+NZsTMGIc8F2LZXeHJPKC0k8Lmzpsznu4mmXtzS4Yx/pH308yLL27TSi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764545736; c=relaxed/simple;
	bh=J+v78DVUuvU5F3kifckIxv2vG5fH2TZFf9LLLr3M6jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXH5ZPBdp9s6p/1D5vBGc+A9GaJokpo+jmHDu//bnvGFdMqx3w8MDm4WWe4i+J5dLOdEOhRRUyEjczKKjjkIp/QY2lJAr1j3O8Qr5YZejITycvySF1vSX2AiG8/lPg/WAgDQ4cs101QZf606IY2tecWGt9wpoavHIwxJs3DAOsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+se13Sj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+se13Sj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so23735385e9.0
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 15:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764545733; x=1765150533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGfI5v2bo8QpS6mN8gMlhUgE+Lz+xF251MkehL1RpaY=;
        b=S+se13SjkHj/Mp9LCNMSncllJh85+8gmEePKyT9QQ1FeU1NvA4/hKKHhtgxeY22vuA
         RezFwgh7Zx6Tvg0ocqgegG0eczuKVtH2u3dBoZV0GE86hPg6BOGNtEX4DHQJVlSHniIr
         rNaablOfsG333wImhegHcAcvHj+KnTDJiw0aFsWHNStAn6oXX50ViBNQ4iMAIgLqaxOM
         AhuwWCzFBZSgZJw14DjgVoa8icC/ZLgZAGsgAa4oZdx/vRpTJksBJWpriR1ABkAVL3Gx
         rwo7hR9F5GiAGeEJBhr/wqfzTqitjKfSqWIjJdL0iShISoRwma0XU4o0vdhkOkjnmJVK
         E37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764545733; x=1765150533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CGfI5v2bo8QpS6mN8gMlhUgE+Lz+xF251MkehL1RpaY=;
        b=c5YXBvH5FzjR13VJd9o3nTIdx63tCIYqqLdUP6e+Ev/oXqHcF5y8bMZ6THEQp8EzKD
         F00chJPKgdO0+7XvN8KrnCu43S19NBCll5OoNu16LYUc8F+Iq+xJz7jLBX2FWTjET36e
         44nJtmcKr2jGx8TZsQ17tPND/kqdT3i/XBbSEIL+1hBWbisf2e80fcEHvA1u/l52eBgn
         HjX+3BRVYkeOkPlAcQ8iou0P/XkgPuv7ZkYJYUwsWPPWlCfWC/Dk5sk5JgvI+iKj2zxK
         aImMlQ7p3IDHMfhOdaBW0RUZq7dGu/G2zrIWZ57Y7ehhEYWjrrhpbq64QRnndD55sJJk
         gWxg==
X-Forwarded-Encrypted: i=1; AJvYcCWdpmdDrY8fcnOyS2qJgZdzfHlBVxlLpEe2L3LkF40q0xwJQrwJ+jXsEdUty0cxoTqNU8dQA0PXzOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNB1kz/EhbRoABlUEMg3ma4HovHiQmeEH/Xj1HQ4eiWtSRNtuv
	BQkhZnNR2U4I3CHVB4yKcdh0ZLeVyDLOD8Q55T47nI2bjFE5W4D0rWUY
X-Gm-Gg: ASbGncuZOq3pCDB0Gr2e1iCX7BD+2XLz7NM/7L08qvUSDH5OsTzbmYzy27IHJk77sQX
	4stFyCjCncuXadR+vZ+TpVtU2KD+S7tNid+n/BnxdkMWZO9wsd2qhkHRszEHGiUBHWK2mKDNeLz
	T8q9hwNIhvcJpBcVqrxu2CAMQOjWHTiI+IWAGcqUJ68jqZk3Ax3EcaSmvKhTvlPdWkIQ2abl2Jv
	PhwUG5J5y+kcIPef124ORqduKhM2YVf1jXDKCq6EcOsTNbEL4IcosRXA996wRMGjyIj2w0ywxuV
	e3MRhzDjoF+UvaRWcgkDqMB7Wy3tORMQe8ZR/wCbW7gFYjrM29BNkbobzzi+yYF7UaWJ30uG+9s
	lRNCKVUaoqrgcMlHdrzQ8lzK8I9QFuJmyUEKVL+a5XKJW56PqJlMgqiPKfOhlR4kZSSwvoBmvZS
	6l9cxptmL3oDO3cJPbHkTGbFTY1Varfv0a7RCW9Qss1g4/yel2+ot89QHBNJ45OQjYxcAq7vAa9
	Qgq9KJ26MrepwlQWPzDPNwKruA=
X-Google-Smtp-Source: AGHT+IF67CntAQ/arhcWo5ytqV99C28dV2Q49OsMgdQEXfIMhJP+Hcig8yH6oHJJ/T2ZRfd3/soE3A==
X-Received: by 2002:a05:600c:c490:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-477c10c8596mr322154935e9.1.1764545732812;
        Sun, 30 Nov 2025 15:35:32 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040b3092sm142722075e9.1.2025.11.30.15.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 15:35:30 -0800 (PST)
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
Subject: [PATCH net-next v7 1/9] net: page pool: xa init with destroy on pp init
Date: Sun, 30 Nov 2025 23:35:16 +0000
Message-ID: <02904c6d83dbe5cc1c671106a5c97bd93ab31006.1764542851.git.asml.silence@gmail.com>
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

The free_ptr_ring label path initialises ->dma_mapped xarray but doesn't
destroy it in case of an error. That's not a real problem since init
itself doesn't do anything requiring destruction, but still match it
with xa_destroy() to silence warnings.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 net/core/page_pool.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 1a5edec485f1..a085fd199ff0 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -307,6 +307,7 @@ static int page_pool_init(struct page_pool *pool,
 
 free_ptr_ring:
 	ptr_ring_cleanup(&pool->ring, NULL);
+	xa_destroy(&pool->dma_mapped);
 #ifdef CONFIG_PAGE_POOL_STATS
 	if (!pool->system)
 		free_percpu(pool->recycle_stats);
-- 
2.52.0

