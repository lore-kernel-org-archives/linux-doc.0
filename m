Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B2731C59B
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 20:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764276281; cv=none; b=YEmmTcdE9VA34JtYQwATRDSvCPJawK7nE0q8QFlLhmt4K4stYK3gbm/eQdOW9y6yhCtyjySIjygsLY1OBQtIOIuCHSpse09Gy/UOIhPlg9prbxJ7GQ2KeahFhIK0fCCzo9B5UqkJQKuopdl5wlOIW+9GGDDu8/F/0RgFAbztQhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764276281; c=relaxed/simple;
	bh=axdc3q5KY7YeHULab/TvgzOYs0oof9ugiogriyYfhIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bb59/F55sLE9VfKuT8aZHqHTGBxwl9tA1Mp3OKBnUK+AfYSoV9hok/Gx9L/6y98awZKZlKvwglRRQ2tYaQYq8dVHpNr+RkZ8ajzNSUaDEFTIk3QaYj1gAyM+SgRpPSyMYexAlaYItEcHJqMyE3ZKfKBeTNkRKN+cDqDlxXsGEC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqDhn6GK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqDhn6GK"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b32a5494dso741569f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 12:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764276279; x=1764881079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiBEtLY6CE0u/w5HMF7IyfpDPmY7qzN3np9POU+8r/k=;
        b=bqDhn6GKwVSWrXbEMlo9ZGu0yzMC0QkDwYCXmcYQnyzym6MrPDUA4l1LiZIYhC+6/6
         Ihh5WsKL3Ta1Ki91SGuygKjQScfQocfdAr8n9AJK4u/N1Q3I8wGRgPkBKtXmwmjDiKqA
         PEUEtNQKPwzJvtHYA7H7z6OLouMgaqdzf55HXooUUJcaF1VozXD9q9VDDjdsILbYn2Ol
         TPEHHF1+RX+anO9mIsjpDsviMbLWmjyRlYtcp+4nX/jhyxoVj3204PQJFUtzOPkQfdop
         64cZsM+6f2un+Mkfr9JUTPWul0n1IwIFZqkUwn2hO9pPRxfQcEOzLud481IpAHWTIzLx
         WLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764276279; x=1764881079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiBEtLY6CE0u/w5HMF7IyfpDPmY7qzN3np9POU+8r/k=;
        b=VqIO+nqYrcoiqzkYdTftwlX5cPAru6hkQGVmxfdOteP1uVphbbuoHknIpBZpQkcOox
         F+pTRNoa6Ln5TVS8Xn0q5ZkUMofiPbLoFSs5sXg1cxOYhJzuzO3yIkNv8eQpSi1OSkl8
         y39m7ws+DUHpyrLTg2dizFZ8I2ihVmOg44WhJKxrZ5BMFLnWutRmpxKKxELrQIZ9nSfd
         KwokmfVhvao1fFUpXI4o7A/HRGTMyidMUczUyZhLIgC+omsC4WepL1I+bvKNOk2Iktmw
         QlV+gjmuu9BQuhSsF449J6c1kHF+ndoUqAdNnuOgEKCeToqC7favL3TwzHsa4RMOqgtM
         bGzw==
X-Forwarded-Encrypted: i=1; AJvYcCWSxuk6EsueMvLb+OlRU97l7AmJPekLRz8pVcS9avn7ixsgrOemz7H1RN7sn6jf2tAt4EVBtU5Btjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyC8+O0Rc+TziF05XHGi7RZy33pgzOlgllNXP6gwxid3QzB27Z
	g/5whxEEesMbIjlhBtJKtLTSReOzAVHRQXmCWmSwu6qUKMxjrSaLkOLl
X-Gm-Gg: ASbGncvvfVQJhCdQqxORFi1mLiR4C5Hy9hveYPGWUJa65CQ227iZhB1ffzFGtj0crLH
	tKQFm+VMpJ3gKCBckCb4Yiy+t+Ie8kQIaCkDZosfqYPffHPxPNd9tjSuMFG8SX8nm0AEOML8Gjo
	mtPJNvYaxddHvQSPXDTBC4e7f6cCFnFSsUDwgoz7t5Qe4K80xzIvAgUaktRnAfssJTa73E5k3mH
	FIEbbDGModkMrpb9S3eVjtAPCy1ImHSR7wSUDbjSlJLE1h3Nmxn7d7A5+JhS+Tp8ONSE0tIlUba
	UrtBnDVJ1GCmoxHRmz+tz/0oFXW/2Ku3PvnCrcLBVNCah3/ZfJ5C7maR34BTV/WrJc8h/6gNORd
	XBgFgeA7aj9sd+sUpicNMAsHF17eJnxIYJC9JMNScyQ0mdG2HVXHN87OrxNqCaPW7S0/wJo4Bij
	f83C12Nuw/in86QIk4jm6bcqNN
X-Google-Smtp-Source: AGHT+IEQspnbxTQ8o9d1WAB81UB4DgymWXC24t8k33OrSVdVGqsW2IGOJclHPDPSInbs1ZNAtOHzXA==
X-Received: by 2002:a5d:5f93:0:b0:42b:3e60:18ce with SMTP id ffacd0b85a97d-42cc1ceea85mr27045133f8f.18.1764276278582;
        Thu, 27 Nov 2025 12:44:38 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d614asm5346105f8f.12.2025.11.27.12.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 12:44:37 -0800 (PST)
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
	dtatulea@nvidia.com
Subject: [PATCH net-next v6 7/8] io_uring/zcrx: document area chunking parameter
Date: Thu, 27 Nov 2025 20:44:20 +0000
Message-ID: <a17cb10f4595458bc892015a40aa07798936841b.1764264798.git.asml.silence@gmail.com>
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

