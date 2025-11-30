Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852AD3019BF
	for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 23:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764545748; cv=none; b=Jsj4zFvoF9Nj6iHVRVdHx2k6wGPCjdcly+UriN1dh5Og3m+KyC9HTR609iKhiBHqS+feyYf4a6cdhcMoLIyfK0B6/f2g6IVXTPIw9BFhwE2OLsl8fDwm6s0fI8O0foToY3SkLfOQPQjAEnhdJGDgSFLvzEJiWUIYjcIHcJKt/CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764545748; c=relaxed/simple;
	bh=axdc3q5KY7YeHULab/TvgzOYs0oof9ugiogriyYfhIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NsExkpN1gm0cmXi3454ctsarFgNK7eaw2eb5KWwzpXMt8EijHnLo9TMVYeuB9Ws3Z4OnbLIKxLJv+L6o18efOUa0WaFeI+wUaZ8+JVmTip1UB78zc7FcD5EtWYaHV4SkP4V9R/BZO+Gf8O2X11asgvPgZXtkhWkahNxlh+NKdIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hW2T56/9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hW2T56/9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779d47be12so28624405e9.2
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 15:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764545745; x=1765150545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiBEtLY6CE0u/w5HMF7IyfpDPmY7qzN3np9POU+8r/k=;
        b=hW2T56/9lZoz5dDB2hbeMi10w+NI9hvUGF2tnpyqxzo0X6iZADY/x7OHvZnkU5Nae+
         FrPn103TbQOJ1bByOrS+5fwUEA7diy7o6wVXGlGryAjH4EveU52tGsJT//A/4PBaXxFc
         RzWXfGJweKuYXf6ZEfxGu6n+i8e8xazeKTEVbElZvi1yi2TULJS3SPVtaE65/8XfwV5m
         oEMvTvP/0JEtJPz5vOptE+0bB0jBRM/K3vB4PSUOwcO6UDcE0O/dNRKw3WFG2Qmfx4Jt
         Fz462+2I7Wd00etw0jUBIUQmlMMYssZfWdt3XVjgqCPU+NCJqfFWb2vnhXM8MAoFDfD0
         TkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764545745; x=1765150545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiBEtLY6CE0u/w5HMF7IyfpDPmY7qzN3np9POU+8r/k=;
        b=luYY84Xyq3bovXp/ywqjLKqEv+ZgjIYtO8Lu1UL/lMBxNC0IiiZzMqRXKuZutn7/Gn
         WklO2gfTA2vI3/DpzGa/SvAD6g7KVTPJFpv6Dbx0eD6qGKRpvM6CwCJUCyJ+PoJmCvIt
         bMKndfEOEYK/yxKSze5+3BtTOnqy0wiX0hdlIKSsg7vKUbymVaOpKDE6EMeTSwR3SiPG
         pBNQWKUUlnw9y/z5odxv59cTsApVYCLSsSe1dsgv7/mBZAIs6XuiczkfbG05y5HWGC3D
         esbyMd51CsG0G4wbZ9iL8zvZjO3LEztUTpM3PNmh6shYag0/pQQ454ptrlAx0P0b0H+V
         ZTMw==
X-Forwarded-Encrypted: i=1; AJvYcCWsltCT7qA/JYvJdz1HJwqXCOQrojXcipcVuBDy/k+8BsSuoTPrzKwmpmUtqPO6+Nffp0X6lq5qmrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmPEHjG1rSCIJGTEgEnnvvARn3yyh7D/ymtR19ln6qMlv6dpua
	+3L+MWrBUxdi/nJaH3BIa/7fPlNJkIUEKq/+9AgVImnOQ4u9/hHXdCBT
X-Gm-Gg: ASbGnctS4Pa9PWh/aydfWF06osHr43ELRx1fzc1Bn0KEb091PYFW/mt2h7Yg1IuePgw
	xFwirVWYMmfjQ5gqp/e/CNm/vmCGyfLdwj8MsGUHVXLcKjIQI4J8UjEHv1fMHFvuMSMw+KrO5sq
	u/hz1Vs1mTHTEv68k3ysYiclQ8ccLJWjt0j7bNppJzan9PbO8Cr/bZFVj3gPZWVL9hR1+fGMCv6
	nr84LJ878fnU82v4wjUM/gvh2TI09JCKtSxtslEP4Xn1DV6eU9UJXnyVPqqNSrF1jeAcze4SoTJ
	dJDh/sh3G4pxVJO9NnKwdD8kiDSZZ+IYyWcavP7fqdNoZ9vOt/RjhJ1x4oqiSnbyIm0OdETYPrw
	IKLPimlLcOLnjPbbnjUJ8K2pbX8CGz9RNBsTEkYcHaCGsRGxdpBjA83mEH+Gi9Nu2PI0SWWPu8y
	2FYXAopqJ+8RaBqVmEw7kGlT+ZqU5v/NpBAbHhA2dnnkJnsnqOVgS+iGuE9aulIVqypr3uTIiu9
	hIcwVUkbZWLLrOz
X-Google-Smtp-Source: AGHT+IFUzT8FPG5bXMl+et7+tgKZinOOAHIypttasPvwu7QxpymSGXEfBTXOVOEmLIwEs4nL6pXgEQ==
X-Received: by 2002:a05:600c:4fcb:b0:477:557b:691d with SMTP id 5b1f17b1804b1-477c01eea7fmr324319555e9.25.1764545744807;
        Sun, 30 Nov 2025 15:35:44 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040b3092sm142722075e9.1.2025.11.30.15.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 15:35:43 -0800 (PST)
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
Subject: [PATCH net-next v7 8/9] io_uring/zcrx: document area chunking parameter
Date: Sun, 30 Nov 2025 23:35:23 +0000
Message-ID: <d1482a39a4f69928537e7750c4d9b3fe31311ffc.1764542851.git.asml.silence@gmail.com>
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

struct io_uring_zcrx_ifq_reg::rx_buf_len is used as a hint specifying
the kernel what buffer size it should use. Document the API and
limitations.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 Documentation/networking/iou-zcrx.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/networking/iou-zcrx.rst b/Documentation/networking/iou-zcrx.rst
index 54a72e172bdc..7f3f4b2e6cf2 100644
--- a/Documentation/networking/iou-zcrx.rst
+++ b/Documentation/networking/iou-zcrx.rst
@@ -196,6 +196,26 @@ Return buffers back to the kernel to be used again::
   rqe->len = cqe->res;
   IO_URING_WRITE_ONCE(*refill_ring.ktail, ++refill_ring.rq_tail);
 
+Area chunking
+-------------
+
+zcrx splits the memory area into fixed-length physically contiguous chunks.
+This limits the maximum buffer size returned in a single io_uring CQE. Users
+can provide a hint to the kernel to use larger chunks by setting the
+``rx_buf_len`` field of ``struct io_uring_zcrx_ifq_reg`` to the desired length
+during registration. If this field is set to zero, the kernel defaults to
+the system page size.
+
+To use larger sizes, the memory area must be backed by physically contiguous
+ranges whose sizes are multiples of ``rx_buf_len``. It also requires kernel
+and hardware support. If registration fails, users are generally expected to
+fall back to defaults by setting ``rx_buf_len`` to zero.
+
+Larger chunks don't give any additional guarantees about buffer sizes returned
+in CQEs, and they can vary depending on many factors like traffic pattern,
+hardware offload, etc. It doesn't require any application changes beyond zcrx
+registration.
+
 Testing
 =======
 
-- 
2.52.0

