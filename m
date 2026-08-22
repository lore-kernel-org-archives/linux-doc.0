Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59073C4176
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 12:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787401039; cv=none; b=k9pW4x7Of2gxT8TXwxlb3eywzN5YqfvwX2EXHkkTt6Ou+a/NZd+NhJwsekBdbCqhYamFKnkRDDoW5cGtuywcRK+mDFak8qWNwsA1ntm1bh4ompv72ZfkGx31DyI4dLhNmW5utiowVUdsNlBzgdaRZYZNQiMXjZbj4V7piBvMqTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787401039; c=relaxed/simple;
	bh=S0snZ8uKMMHY2KvFdwdzpAL19mHXE6f76vdtkx3uAYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WqZgI5woudGGvEeXrBsYySnRjh5FbtBQwgHq3HD7i+pFlomMJRE/RGPSC6GHBrySqcYfxN2dpNQlvgCgeKyKGZba0BfPn5i3VZHTeuIfyzevn4w3nJSRWvL+AznCIN+xzDBjoVBfgohCxWbzQhiT5f2d5xf2yw9AVB4MjcAAFIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNnzjQkH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNnzjQkH"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso3306006a12.0
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 05:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787401029; x=1788005829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8zamBZylGLfyBrf2U8aA1K+M4CwgpdMHKvZaU2DV3CY=;
        b=GNnzjQkHEMpUlBlX0HS+ZiOrXzdf5/b3IH75IiEYYfMHBmEFBDTaPzzfzgiuJCIHOL
         uEr0eEVpq6xaz0LPvG9gy43lFLFt3P6G9iK57RdL8t/JZwlobuPmPcmBzrMWg274HuSD
         ie+ozhiPEDFG5cmj047lwHmZl6ss8tpGdaxLsFUkKnW5hDoMbTiLx/W/wf4vM5Y5LaAw
         x431/+GdvRv5EPPczvW5f0oCI3m1sGjuTShp8Wuu6O0dTBGP7SPiXRiEcQYnSU+bJpKh
         zLFp6XxaP/3jHnQ1pB4toHWMGEnJP5jVR2Oj0/Vu+wSfNuPp+NHEPH4HYJhr/Ye/Fzkw
         WiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787401029; x=1788005829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8zamBZylGLfyBrf2U8aA1K+M4CwgpdMHKvZaU2DV3CY=;
        b=bVRB+UmaooRdJOfztwVUDUEAE1puwXifvefHquabv4P0BkrAdOyOOcik1F8OtQsgby
         oYlkZnj8xzoN1pyuzEmMsCws+ZtYv3vO0l2Xuqa053/Rc5mP7xDgUGbm8EWp9C7ZQhzt
         rodWBx7Z7a10Bylli4EtSOWdq62ZZxdwCNKT/CP50PhG60oCgU7wdPviuOPLfhXOwJYQ
         G+Aq8QUPj6EBa9khkjm8HPh0ejWWaW8xZFkpkAkR5+Pgf3nodRmD9tF4ini87d0hleDN
         +A5CM+Z/+iWd5UirF/bDjW+hqqTzbMIyTRC4aaz+9hKQgsgTcM+42nqBme2Be/ashGfu
         phpA==
X-Forwarded-Encrypted: i=1; AHgh+Rqus7dEAx9Y0LD3Dsi5/H67tiflTnLRj04AGf+3zP835W0qCwJ9xUcL4caCuvfqvp4D5lFTqsT1Mx8=@vger.kernel.org
X-Gm-Message-State: AFuF++nlQYhrphIexUVZbPGK39Zxih2Cd8agEQKcaphNS2wfu6FOGmkJ
	lLr6hfb58PpkW+bbnWxKdnTOx7TjVRYsySrar+Ri/1jArwrf5f28/nGrcCJRnRAP
X-Gm-Gg: AR+sD10W8XsNHYXb5tixJffKQSZGNiz03cXp7sfTLpAGXAGrZxroU1ix0shmamCBQKB
	IOlA7Zrp1ZDjxdCq2tij2HHWByJRPc7Rmcj++QO4PacFAkFXMCyrsjQh1fON0BNqMKSuYmoUDLG
	m43YFiB4OyXhrWgx8H9mlkBrS6n89fwBz/RQExyfaiwtlGGXnKpSOChFwxSiLz5w5yHfTNNqaRs
	NvVQtAAYiXh4EItjbsFvyt7kCe92nQS0KHdacVJ7+9UhCYgLYC4XwrmRsz8pVyNTqzja0idoFhl
	RTPNDOdeWb4ynq455wADfrfLeJkc2DgToI4lFRrEGeBnI0HfI3LX0fIKjRbPPPAsvhnhcnGl754
	638EScHWQi7XeF5bGdkj1kQoM45EN/qJvWDBMK6mwFnrz28sZLq1DznxMrttZa094ccjeVsGfpe
	t9FMRHoGFb7sw3qZrXapU4Gpik1HtgtJw5VFofxkOIotDQKpcQggm5axMUWNPI8ZLOfcI5CXc27
	k/mkrCJJZV9JGpLbp80SpUBy5e2Pdt1XPmCS2T4nu4PLMF9AMzvCsS/d/APFhbkHZ0c0okh/KPT
	vL8PbWqSHHxwkblX9ZKGFmjk74mnDFH8+Cbjxpa2PGpExCqM6z6G/x5fRKmJJAMdjk2y
X-Received: by 2002:a05:6402:5042:b0:6a3:eb58:dcfb with SMTP id 4fb4d7f45d1cf-6a42f1ddad2mr14242382a12.10.1787401028842;
        Sat, 22 Aug 2026 05:17:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c30casm10998322a12.7.2026.08.22.05.17.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 05:17:07 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Zi Yan <ziy@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] docs: xarray: Fix xas_try_split() name
Date: Sat, 22 Aug 2026 14:16:50 +0200
Message-Id: <20260822121651.1559-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822121651.1559-1-kmehltretter@gmail.com>
References: <20260822121651.1559-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The iterative split helper is xas_try_split(), not
xas_try_alloc().

Fixes: 3fec86f8aa8c ("xarray: add xas_try_split() to split a multi-index entry")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/core-api/xarray.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/xarray.rst b/Documentation/core-api/xarray.rst
index c6c91cbd0c3ce..3d2b20c05a937 100644
--- a/Documentation/core-api/xarray.rst
+++ b/Documentation/core-api/xarray.rst
@@ -490,7 +490,7 @@ entry at every index to ``NULL`` and dissolve the tie.  A multi-index
 entry can be split into entries occupying smaller ranges by calling
 xas_split_alloc() without the xa_lock held, followed by taking the lock
 and calling xas_split() or calling xas_try_split() with xa_lock. The
-difference between xas_split_alloc()+xas_split() and xas_try_alloc() is
+difference between xas_split_alloc()+xas_split() and xas_try_split() is
 that xas_split_alloc() + xas_split() split the entry from the original
 order to the new order in one shot uniformly, whereas xas_try_split()
 iteratively splits the entry containing the index non-uniformly.
-- 
2.53.0

