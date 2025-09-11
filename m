Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4003136CC9D
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757607828; cv=none; b=Hy4aR6CMgNfLrR4gDDQZnkqoHLecnYQ4pLAqXGJ5aHeKwW2kuzyUUmUkTRrQJpNm1/3Kt/8QSFMvUxlxUYVEgnQr1WJ/p1iKTQPfKbxnBb9P/oZaEVPOdsrU69ea4KH3HOkAZ9qOHXZtHp47XewIMPnJKqmK8OdGxumqvQNcUoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757607828; c=relaxed/simple;
	bh=gdRxCV3dbaFjfI2cfHOKBREPk9DDd3LTFs4jZWiRD54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6+/hHoTeNp1fA+eKer9IPOWgxffzXYTUTayjeTDR+uFUAd5ZZwqXMUpgqs50LpuTXIs5BFPGy07JjpJb5Mmu3NefdiKDdol98n1/UAmB+8p2S0HxKOso9NpIlc2BU+8defcS4nvu4XqgEioLc9uEEhoE1KYb7egDI1mYfPUKYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VY3POhRl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VY3POhRl"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7723cf6e4b6so762375b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757607826; x=1758212626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ugQgxXVFkF9wG9b5WaSCNOwOilaoH403e0Uwi/B/lqY=;
        b=VY3POhRl4WhKQGA8AJ0dKvOnoo0nMKW4OaVEflC546K+yBqV+g93OKthqxw3uON+Cn
         v+yKQjQYKpYEr3EZTOgL5oI49CMr6pJOYRCyCfBJDMp8KFaOjqg4XjemA0LQEnwy2rhw
         TqwSFD9I3vNbSu9QXMS4nPMb8Zaq1yptL6BrcxFqKXiSyvUMWVyzu0Af8qlLaPRiXzIv
         B2eqghpFJopQUT45wpaIRbzOPIetKZJOZO00nYXTDS4Ipd8HIS5BJvUIv+UphppXOBEM
         iAyxNdnVqwilwf0tUan/OJm8q2N4qkouhVNt5/18Z6bcEhxQwiIU80rH1rL+/0UJ0bIS
         V5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757607826; x=1758212626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugQgxXVFkF9wG9b5WaSCNOwOilaoH403e0Uwi/B/lqY=;
        b=CcvE2XR0WAcFR8PaBhrgcC8RP++0dvpzriZE9Oxl9CnfXEqwwotOIIFDntAi9QjcFh
         X6QENpAEMok00iMnr/XEdBwfCVie/4l65FRApS3oDBDbtn6KRzt8+KbjCMbtNTwiNqQL
         WA3gh9BlM4HxLrlpirExh9f+a6B6zod4N96Jkl3zV/QOwPEuOdsmxZeTlzCHtnyf0V3C
         hNMnvdE1JqkfnGb5pynMPlfTSo4e8QDHcNd0kIuwy5aU7OoQqRi/VDdhsM0AWu4mIPmF
         BrPTdx/79Pjv/BJP5QviDfhMqLEtOSWkAU8lWw8ZSUUAOlsNfMaSrjBEe5nKxdrR4eBa
         XblQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq7z4byLR48S4FZ9eeOXXj41w+Cg66CfZKU/IlQG+3YMm6A/sYQ/MRm6Xg+VALN3ilZ658DbOQouE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2lKD3rpOGvgjblzpw+D9zhvfui36uhHKSXlzYwrOEnEonM+qR
	chZ1xIzHRDsSKhiOZw5FQwZlvEXkprfgWV6zGNh/EZH0p12xOV0T6BIe
X-Gm-Gg: ASbGncvoq4oSzhn9rTLpvHkA9viBcHKZlvy8oW58zSQV+JSZHDXLlKRQeMuCiDH0PqW
	EgVdulGIhYu5fFmv+npWsR2vzy/PwFFtdzrbWoEosGsJxPsclpfsOuEpQIZT4L5yqIeH3LcBloi
	AKpXRl87qQZTf8cikuZDn0+nD5HXf1AkTC9Vx+LCZgbrYDxD9WvN8w+rQFWBG5zeo5GGcCJEjZq
	QIEYTAAKVQoFhpmscHM52YxNUvGxZooq8LNRaTUUhw2wdqliB0mSOSJE3s7vwxMcG0FxM76+Ldc
	B2DTaSQOwiHIhbKX29zMiteHd2hihAMQGfBM8Si8fz6PCxAmxaZ0wU5oZmC7/q1wOrbZG94Ihy3
	SkyE8x231ivZ/c/i2Aa4t3xmYxeu4yCWT6hgAD6m7WoaVnYlCByZuvP44gUgtrZDqKtqeMurCoX
	sAp1zWl6xE/C5xhYKqXjzbKpBnv1Va7aNmrtS930A=
X-Google-Smtp-Source: AGHT+IEEi/kiOLuEW5zDU33cKWDz/GEJ/YhUOAwUcErjr+0ySOxI5rpKmstBb19ZMw68qtyisktweg==
X-Received: by 2002:a05:6a20:3d0a:b0:24a:a45d:7a26 with SMTP id adf61e73a8af0-25345a4498dmr27933903637.48.1757607826347;
        Thu, 11 Sep 2025 09:23:46 -0700 (PDT)
Received: from yash-Bravo-15-B5DD.local ([14.99.167.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607c471dcsm2567567b3a.96.2025.09.11.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:23:45 -0700 (PDT)
From: Yash Suthar <yashsuthar983@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yash Suthar <yashsuthar983@gmail.com>
Subject: [PATCH] Documentation/process: submitting-patches: fix typo in "were do"
Date: Thu, 11 Sep 2025 21:53:36 +0530
Message-ID: <20250911162336.16261-1-yashsuthar983@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a typo in submitting-patches.rst:
"were do" -> "where do"

Signed-off-by: Yash Suthar <yashsuthar983@gmail.com>
---
 Documentation/process/submitting-patches.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index cede4e7b29af..fcc08eb93897 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -343,7 +343,7 @@ https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
 As is frequently quoted on the mailing list::
 
   A: http://en.wikipedia.org/wiki/Top_post
-  Q: Were do I find info about this thing called top-posting?
+  Q: Where do I find info about this thing called top-posting?
   A: Because it messes up the order in which people normally read text.
   Q: Why is top-posting such a bad thing?
   A: Top-posting.
-- 
2.43.0

