Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F563E49DE
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 04:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139419; cv=none; b=nV63R9mB/16KReLlro2FNXt93OzUVXmlt4ZZOFmiaOtG1KXTrRqNmBaSX7iTZRax6hFARnzq8aMYYwK1M7uO8XL/QMINd4NLoTBmlyMmwzZ+GqHw7kM2iJqd1IBdpax4O/d+tDOyo8yCb5bfo+Y/Kp5OVRA9gOJjqc85wSJ6Y4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139419; c=relaxed/simple;
	bh=i+9Kd1wcuXXlxSDwbur+MJoqMUdg4kpmkXMrI0+T3eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRD9ME8UFJ9Ph+thGdaLr/IeTQtUZ3qtJu0D/fc6wMwJqG6oD7F8R1IRWOArlMQgqbgIPsWG5DKyhsRlgIKKj+5wXkKm5GWNnnC7vDLFZ1NV0azosJ4BbirvGfPz8rX0HyE7AGSCNEx2Tf0Q88mGRx1nI4YJc6Vd7ODriE8wgNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=of9+bqSs; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="of9+bqSs"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469f204f6so319426b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 21:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790139386; x=1790744186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qra++7QT1u/2cZF1D+tg8w8VOq0NYWF4+x38DgQtB7M=;
        b=of9+bqSssdYNRkk+UXpJY230Th16Gvy5rnrFpH5neKMzQKK2igP5NoowLchLab8HuT
         JyZXWsVsLAJP8UDXt6rlLRFU1dPcCPSseOskypHh6yizokhDTGn2g9/EG5Vxep/dSsxl
         xgEUEcJ7QLXyvN9h0kRkMceM+EYSC4QmKrKY8KHPJcKVGYi8A8ZxYj/KOY7Q7bifvLOh
         +VwatlaB1npSP0bR3Rfk4tJXMAPBI8rPjiGSASLwu0b7U8ndm2U6LyhKY5zh9Ri8TSAe
         IFWJT25dZAUmFWLIVedXlyKZqVrnyedDTvquL+PXY2BO+xyh5kNX6j492dx+7YhTGkQL
         nmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139386; x=1790744186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qra++7QT1u/2cZF1D+tg8w8VOq0NYWF4+x38DgQtB7M=;
        b=CXvv2G2P1G4FuPEq22d6DB2GpOxouaVfC8fcuJTugT2bZ2xWz64PgXZAipyQKAdGZc
         WDMXr0Iv4IlUEXyPirfcoeQKWSU5/lo4QfSj/ca3nNzwWahBZHH2nOzrm6tvvLrWqxxo
         JhJYjFtxHfud0rC1OogJTS7BJ3ZIT5rhl8Ybc7zbMbP35QYAvyequuChCKV5a+N1C4CE
         knFkiaA3/Jm1oirCMc64gcGnBgN6eNqWfkUhhDv3mOtPUd0Z6JBsm/TevbL6MO9PVDXy
         l4r/BECqwDjaF1f/TIfXseJ2lFow5azAZ0Z+5jOfnP1GEYvYQw8+tcSwu6q4V/TiRqIl
         Z1uQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4m92ffY5Vg9u/NtaHiH49JZdOHUQSxcv1NuIQxeLPzqVGANNegwIqHGSmCO2SNMlvY4mw+tSfmWA=@vger.kernel.org
X-Gm-Message-State: AFuF++nQgcmfWDokH/vuQ9eCsX+aMGgnZt22wsupB9nhcVS1zM8w8WED
	qp866WhqHYb4sl4DmEdvt3K+LzEU2uW8CWa7q9e1Df08cc4KksWex0Ih
X-Gm-Gg: AYBFou3GgXFVOtZOgyJ8MlpXqKLCpZNCHhwDtl3gBTDHSptkTCmG8RWSQl6x74V99yk
	Q8eLT4+c0w+lUT2IrgeMhj1pLY3izJWkeoSBg1FEzkrxEJT4QuGsspgiiWD9OI8ribIACAId5rq
	pqZVxpZWPMr4SjTWZXP6IKZWakqcej1ga1qjHEMu2QWTPdYoMcbYGP5O604CyPcOvP3GWvw4X1/
	XDokqKtQG+4ogHjm/M9eO34AqNEOz48hPt7fczrt8Q2H4Rt+MaTfRfDjqlYfSr3K4C+pDlmpNyN
	61/rBlrxtn82/iiYcmtOJzWIYU2bKFujIV0e2N7x4nFFuat7kS6Oo7r6tzC7quSfBRXGmpHkqZa
	10eP6kmvubb538dDdP4d28Lg5EhEWYzL7zOgyvHXArkcuzkG+3aadMXpy6vjOJw6Uz1ZaO7DEID
	h2JeVnqphXy5FTSDD+HP6hLX6JsBT/w8vvsozU4JBZkZQAK4aWkPLTDY17bbHeK9eLX+HJWMq7X
	r7G
X-Received: by 2002:a05:6a00:2354:b0:87c:d00a:f350 with SMTP id d2e1a72fcca58-87d1d6c1be0mr1485300b3a.48.1790139385958;
        Tue, 22 Sep 2026 21:56:25 -0700 (PDT)
Received: from localhost ([95.190.82.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cec2d34sm664129b3a.14.2026.09.22.21.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:56:25 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v5 3/3] Documentation: nova: remove completed GSP log buffer task
Date: Wed, 23 Sep 2026 11:55:51 +0700
Message-ID: <20260923045551.229259-4-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923045551.229259-1-vladazaharova2018@gmail.com>
References: <20260923045551.229259-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exposing the GSP-RM log buffers through debugfs is implemented, and with
the gsp_keep_logs module parameter they now also survive a failed probe,
which was the part of the task that was still missing.

Assisted-by: LLM
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index a01c362b1be0..28fc7329d56b 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,18 +141,6 @@ Implement support for instmem (bar2) used to store page tables.
 GPU System Processor (GSP)
 ==========================
 
-Export GSP log buffers
-----------------------
-
-Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
-(even after failure to probe the driver) through debugfs.
-
-This is also an interesting feature for nova-core, especially in the early days.
-
-| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
-| Reference: Debugfs abstractions
-| Complexity: Intermediate
-
 GSP firmware abstraction
 ------------------------
 
-- 
2.55.0

