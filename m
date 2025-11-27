Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBF6314B79
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 20:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764276273; cv=none; b=pAJEvRYc0bJ4uJI6tSG3A4zltwlCJLnLwsPg87aFfNnSdxsWQlYe5EKpJ//+yoykwcfUEjcw18Gcxb7uXq51c4m5/CCwNEtZNrwoOZRlAedXhbeVZwP58w+O5Cs3xFRRHLFDOQkrj0lcPH3e2IPN13GkTUYKNH1gH2oEwWa/99c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764276273; c=relaxed/simple;
	bh=wKLX50upMBXTkaYsn5OUPjFxWSff+rFLBPN8t4x3gXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwRnAebhvIWdFL+CW844NuTLzFPiQqN2coMpFOX0gSph6Isw1+iaQRN0l3+21j+TRxJbJ4GirUtQQr03OcQKSQElovqP8kFHDixjlD1d/EzzrGQDe3yJ0/FX5DL+vZ8oZK90F1oI3L4y2s1R7ghjMD6HmzzJh59MzUWxbA897bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUPfxoq0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUPfxoq0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47755de027eso7519845e9.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 12:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764276271; x=1764881071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqckiZGHf3bNG1zTutRGSVS8PaQ4OMxeAJnwQy2/Q0I=;
        b=aUPfxoq0Hio5ZQS2G2fSjo0D2AbYa5RAD/3sviTaZmeuhfDe4kUhhkqG2F9uicqq0T
         8NM/Iw5A++YZYbDOWzRar66j0C11LjMgtJQF7Dr5fk1sihqoS+x+sa3pvL9OeooNkjq7
         KrYdJIji7Lnlis05CvAHPwGc33gcPaQFQmFnwH5+zLPNn5KYaumjEHhuj4TqR6GZeilF
         a2i7co6DnN73ELuYq1t1Tdl9td/uKBKv3Ggw3Oe6Cfv+n5nxpVI/CpOmzwBx9XMxr2O9
         V0o5xHOiytQhzFticuvKM+PxRrxyhK1ykMRjt0+y7fkSOZcr6gq1zdHtYoW0onuSX8wI
         iyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764276271; x=1764881071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QqckiZGHf3bNG1zTutRGSVS8PaQ4OMxeAJnwQy2/Q0I=;
        b=U4DdpOmcFsxbkqSjprOmqfoR2MiTHJfbJx5+DsUWbXOpyPP1IB7kLcIFCQdlu/TTyi
         uKPXDGTNQjUI7eICJBY1uWh/ywOeu8CG7rRQWIdbQiBbzq6IjeZCcLTCy9N3cD8px9ul
         EpB4m50ZyH1nCPC4hCaaZLarpHeyI0REAhUUkp6d5eZ9DD8Vzl1aNhN6fWa2gpjP48jz
         mAVH0BZrcCXxOtff5Ul5DLaEueH/pwyMFhetax8Nhwrf0kuiw/mpAK0+gLavie53xGDD
         c2pSRyWrsStJ42e9XPtRc1mmVTJ01qzU2Lr/wjgalnWmK5CPyTva/pfj7lBCFxkbDO8K
         VDqw==
X-Forwarded-Encrypted: i=1; AJvYcCWoA5J4veAPnogEg0t1q3m/g8MTkdqJsUCQM3u9gMvmaPExMubrdVMeTL0IejVeSVfeJAt4cCZn27I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEHAhlgYlUAySDQsL6uWRvWV0Knmx/Qxp6SMAIrWq2vjepo3lY
	LExBOnt5EKAwSVqwMETQ6Kfou1b7T49OxXg+RAoqBLpeUxkQTv9k37Eh
X-Gm-Gg: ASbGncuI52M6UfgnDLSVwMvkZambyRjeIrVZ76dPNyN+rJmNdKGjLWCna3c+EjnPbIf
	vTAMDGBtweYrBfdw2jBk2wZhgUEIhORVRA5akKh0Cpgbiv451mE104KypUBZpLiLIbY+nxTNa8Z
	XyTtOP4Z1VWf2VcGoL9iXjhHeYdUZ9KeJ9FlIXqulu9C3glVWqxrvoVfgy2N2InfEPEXULw2vE1
	Hu+UTTZYFHVcnV2tcAXaPbICZ4ID0CWpMJ5rAahOM9F1thjTSUB1nD/kaAB1Nu4STeLPXukCNY+
	EkSUlAh5jL4/bzIloNqlwFmPkL4u85Myd+YkVlOpRi5Aj0InPn8VM3CVrjhDFghhAWtCtfe70Y1
	eoOChuCUd/nlL2fzLEuN0r/t6sdzgN0D8HWGN/RAsSIwpCWVuiVahbjGRGC2nHSELQSIcpsubaK
	uaX8+bkl+8EVA3MLddif2Lxx7O
X-Google-Smtp-Source: AGHT+IG8xP4HJO4DnqjJPYdufQcB54g2uija30UcXEQTiQoRe6u8ZY63WY3zQ9RB9/Vh8e5LOItojw==
X-Received: by 2002:a05:6000:2c0c:b0:42b:2c61:86f1 with SMTP id ffacd0b85a97d-42e0f34a082mr13136672f8f.35.1764276270574;
        Thu, 27 Nov 2025 12:44:30 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d614asm5346105f8f.12.2025.11.27.12.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 12:44:29 -0800 (PST)
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
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Simon Horman <horms@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	io-uring@vger.kernel.org,
	dtatulea@nvidia.com,
	Stanislav Fomichev <stfomichev@gmail.com>,
	Mina Almasry <almasrymina@google.com>
Subject: [PATCH net-next v6 1/8] net: page_pool: sanitise allocation order
Date: Thu, 27 Nov 2025 20:44:14 +0000
Message-ID: <337ee90a6464e9b9ab09d1850fd9aedcb0e13679.1764264798.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764264798.git.asml.silence@gmail.com>
References: <cover.1764264798.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're going to give more control over rx buffer sizes to user space, and
since we can't always rely on driver validation, let's sanitise it in
page_pool_init() as well. Note that we only need to reject over
MAX_PAGE_ORDER allocations for normal page pools, as current memory
providers don't need to use the buddy allocator and must check the order
on init.i

Suggested-by: Stanislav Fomichev <stfomichev@gmail.com>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 net/core/page_pool.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 1a5edec485f1..635c77e8050b 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -301,6 +301,9 @@ static int page_pool_init(struct page_pool *pool,
 		}
 
 		static_branch_inc(&page_pool_mem_providers);
+	} else if (pool->p.order > MAX_PAGE_ORDER) {
+		err = -EINVAL;
+		goto free_ptr_ring;
 	}
 
 	return 0;
-- 
2.52.0

