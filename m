Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA93266B72
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598041; cv=none; b=dFzHQ5QPVvsjXj9jgh3LziikZ5ia9y+4Obci2yexXxxzljebC6Ti1mF6MaOltG4HzmmvxiEgg4E6HSJg34uCA/gT1u0yZ9/8aZTAqH+pw92vc4Ux6dCGiNpHNxCekRX6P14wmt3SulBNgl/5uh8tttwPAxFHb9v7dp0U4TjqDjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598041; c=relaxed/simple;
	bh=5P8lBcnY72RfMeCPYtgutQ3A/2HLslyf3RfBjOagIBI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jOU1/JybCaTsPd9KtirqUudTyYStn22BRkKBKCXcix336KdpCJFOpZNQ0GCrOD/9nPWVDu5Lx9wLtL9/uQumjuhKHZO1V/hzb2o1iufwhrqnGvzlOJH7GFykI343LtKqXpd/6OFUSRqOyqUXqMN29CUubsRSvgGczcJSPVgSrUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKefBjae; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKefBjae"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482e257a23aso1266562f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 01:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598038; x=1789202838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dAPnfFUNF7lq9CSa9bFXP56fVVdhSMxJj+LHsOxtOD0=;
        b=nKefBjaeBU+GKVREFGbXqDa+3VEM4BlrfHU9ELEzDzwbqRv3/32MORvxDWyt6VWvqE
         lEFjaVmHtWPAcx7KtgqS8EJ6kWaroXaRuXSm2PSAlKq0i+8HP1o5ife6amIEN8EP2tF/
         YvYw2h5hrsU57aEOSxuACmj3TzskvtzCbM8xRcMF2EnaYjYwOUZQEqoye2Ljlkn5wPj3
         zbfcg9gTCT+c3JljnRzKIaSKi9YXiZPHzN6/2abJ1rGmSLNta1Ye+h4f4usPHspiHmlE
         GxYSbzUCVdAFc0Oaha2VA0C2lD4yc71PNVNnDjelJ2xk1iWM4o+rg+/vbSKYc/xXlarU
         6qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598038; x=1789202838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dAPnfFUNF7lq9CSa9bFXP56fVVdhSMxJj+LHsOxtOD0=;
        b=H1eio3VxQHue6g+7kWzs6lmfaLLnfLBE/w5RO8OD5SW2sNR7GkbNMdbyAVvJXAg8k3
         GZSOC64mU1JoJkM7kQ4kAWe6W8DGp/Qoae+nTR193khtFYgS8pLPZGMqlf0by/hDNUft
         y4un6pnPlbbHtD1xJIG9ZSIlAgrCp/oZYIvX+bU1nLynnCgQathOODcO3/+8gE2JYnr5
         H3d2AAMbbOAJ9icqr6VtI5ltBcYFVxg0eg4Q8rDhxv4KGkZza9DCsfw10JZsILkxQgAE
         kTXm2JPKSz6hIXkURtO8P4yUXcQI1BKybBr2TaQ/DeyoWsYBV6F/k6zjmmYMe9RG/rCk
         BSAQ==
X-Forwarded-Encrypted: i=1; AKwUvBz65iCLAxegnVkihFl7pS4GNC8QmddtWnaVS2/Bo6vyt46I8sqCgDiupc3nLwDza9zRsy+opOuAvUs=@vger.kernel.org
X-Gm-Message-State: AFuF++mlXvu3zm8/COU/TllRU8TSifFzYmw3F3DSuNS+wL2BPgS2gz9A
	n+gAHo7O89Qz9+ChXrCnmfsR/d9ljHDCwH3HisnN50Znyi8ZhMLZlBGB
X-Gm-Gg: AYBFou3nAGOKtn2DldqDmwoQKOAbth8co0XzqzE+DGokTK4NgvEqZob49aO1UbIQDy+
	XD/1DkkJ+sX75gjNNU3CMHbDLkoA19qKtkh+GRb8AcCuZ33W0OgNyFgvLEkUoVDo4s4KnnWdP+b
	2+FNEZz1JYQbmBbEx77UKidRFVw2/OoRQWBRMPDAfhSK9pR7ivmXALPhyLm0CZXHpQmqsxd0zdz
	iHzzGg1nQi3DCHFmSPFSeIGhRVGVhqXiyFLPALnmvir1pk6xgeHqwCUoL7/MTn735Zo7t+tFjjA
	Scfi59Pjs3WJTmxRJBMjP5MlnsmJh4h8cImxJzXyBjPtUDOO/Fz0NNR/gX87TQGxJRBU58r6nSw
	nmHPnpKPvarm8nR3nrwWz6geDRWpkK1V150+qAhU77NW7Vrkc9In3rBr/ZPMpf+F0wm1t5um4Q+
	28UWuWmnKRjYyBe0wHZ96LMlRq39ktU3YAxxTHp+/9tirlWdujBPOzqiL3MqeeX25K/qm+kqlzH
	oj8qGnW7xsetTtaSKZslkOUeQcCtezNIzBi8HrX/Zy6WprJFp1QCU2BGZ5Zx78mgMcQmLQFAN4Q
	QfnZwTSLGi3jWHaEz9LmfVKmPIkIobp0jnlftH+7B9J3vCRdvjHvkGwCulUS6xIrDXlleLebYq1
	8TQ==
X-Received: by 2002:a05:600c:8b8a:b0:49c:ee08:6ed1 with SMTP id 5b1f17b1804b1-49cf81eafe6mr118482415e9.5.1788598037748;
        Sat, 05 Sep 2026 01:47:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm105314675e9.11.2026.09.05.01.47.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 01:47:17 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [PATCH net-next] docs: networking: page_pool: Use page_pool_put_netmem_bulk() in the kernel-doc directive
Date: Sat,  5 Sep 2026 10:47:11 +0200
Message-Id: <20260905084711.40105-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

page_pool.rst asks net/core/page_pool.c for page_pool_put_page_bulk().
Commit 024bfd2e9d80 ("page_pool: make page_pool_put_page_bulk() handle
array of netmems") renamed the function to page_pool_put_netmem_bulk().
Since then the directive finds nothing and the bulk release helper is
missing from the rendered page.

Use the current name.

Fixes: 024bfd2e9d80 ("page_pool: make page_pool_put_page_bulk() handle array of netmems")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/networking/page_pool.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/page_pool.rst b/Documentation/networking/page_pool.rst
index 817f8b78d246..d0be2b800a06 100644
--- a/Documentation/networking/page_pool.rst
+++ b/Documentation/networking/page_pool.rst
@@ -83,7 +83,7 @@ that NAPI context, the page pool may safely access consumer-side resources
 		 page_pool_get_dma_addr page_pool_get_dma_dir
 
 .. kernel-doc:: net/core/page_pool.c
-   :identifiers: page_pool_put_page_bulk
+   :identifiers: page_pool_put_netmem_bulk
 
 DMA sync
 --------
-- 
2.53.0

