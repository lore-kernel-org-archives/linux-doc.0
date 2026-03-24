Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530374AEE2
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774363760; cv=none; b=sGOCDurGUq3EInG7iu9L/tgjdDd2+Ux4hpCDhOA4uyH7iiKM7u5pQpP+YJmBT0YUqobRr/EvVc+kfXR+oEXU2bLZAC9LVJvnm19x7a+XUUfT/uatpY9V6zeP+3P2tKMs+CPkooYcgTE77z6ICtIkat4RU/Y0AaVcCayBTrdQjfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774363760; c=relaxed/simple;
	bh=XvSZWxaAXywlzabKR7BIDShF6Tq9Q+3wmC3P9wsxAqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZuL7fyR+nqBc0Mz4B1S9OO817R0j35Cn6mfoBtlBPv11l++9VZ+JymMAQVkBjOsG6Odq4xTTlZYXcEWu/wNRd1p6otEIWwmb9ckrtsXlp98/O3FwkpW+pxBKNEFvpvO6738IcZHkSwPv1xjm9GuM6leA82e0O3EgkCqQW9G8/jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ec9Yx0pM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ec9Yx0pM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b0abdde280so4996325ad.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774363758; x=1774968558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gSh9sYTNfvPCviCi4VjGmuUXLd20wXWnwnWNNQiCwBQ=;
        b=Ec9Yx0pMbykyBGKkbiPuIWSE3ZsuAWunaUrVXQ1qZ0DcQe7swWIE90qdE5PuSchhfe
         ZtAZHLCysOFS4571VgNYLo5daSj9EtfgqUydjsbt35hVU/ZZTJcb61BT1sy2S/mNEGLL
         r+YHxO+AnIm/4j6A1QDADYz6i3O7aWf0jzsU9kCDTeM8/wZEm+r4r33dDNR36Of641eY
         fZij+TqQVok+R0GL6HCQnPiR++sS/aZ5Oqq4H0F4UrWbFgZCOim3Ltwc0YaWrS0J+EAk
         tkDfF5AqxyqNEeQJs195Agrt5X4ydQ3tWW1X7f/AclmCFLLyp2d4Bi74g1x1hg4iOf1Y
         9Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774363758; x=1774968558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSh9sYTNfvPCviCi4VjGmuUXLd20wXWnwnWNNQiCwBQ=;
        b=ZgQ+GdUqWH0ddaLBT1L28QT/KSqHf5fMBXi10RuP24QkogJ5RPFVAYq0v6B31nah3R
         bRbVVuEHf0iW266rDbTWzZHgOYl/+SYR3f93BT8916iyPFWASIoAovSQmeIp3mwGHlzB
         sKn5uOGk2LB0yp7TSBppKhKD+xY6Mh4hN2HACqsXfnJJ60kEqpCv8JEtQQJs4cApQW5n
         tEwk1amgPjHFHcEQCBGJOZ7nq4AS69jYedJOpeYuXxniO3hYqrSQ39CB8WpoJyr/INKV
         Z53CNn9NNBfkPGjub+CEuV9iAfbV2jamo8dkIDGuVAjU8VOhDTT6Pa17EVGWHRquiczq
         nNXA==
X-Forwarded-Encrypted: i=1; AJvYcCU4XtMmz+ZDNb8DFttq6Bb9se2ydZQIjrCCip8BhxlNuRfnN+sVhrX2vwQgfZQ2Cxg/ji7LXrnnTLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzESVinPlR5O7OFBXIYFAQYLoKtvErxWZUj/eL6R8k52lnNpwNn
	pdF96tA8FDxyPO1fo7pNnGm+IRlWLjMuKlH5iEKWcdXOnAMcxuuZfpPO
X-Gm-Gg: ATEYQzytdPZjtFEedP5LaK56CcfKksQgNpCszLXBfhabkPQ3MloBf10g43K5pBuGxVU
	nMrZ0kLaKbSSlcFiOEHBl26yyraO2DlhmRIXgRqYTn1y0/NRqEm/flmHD8vKoLCv4auuXLlDst6
	FoIckLOAX8YooFSbKEQauXKQABCji8M5G77McAA+B1zm75rFti2LrqNJKln/PVGKe+UarhiNtUG
	HD9xDgmNMtLDAZ6jvegDJ7hTlpC+lzHYVBMrQggSd3OP3Ni3kkAoCT/2fyH9gL2f6xIenacXe3B
	8epLrdtXCc3Mqp7I4ayrAg/jJ0aLKfrepnsB0iGcm/262U4mYZC4rLpmVZx3jUBmITG1sjR3bg8
	dgc4pgaQpxUvdATxxKg40u2xn1L9DSYkRtnBcwitt8msWc3oy7mtr99q81aDEkD62a1xufp4Ow/
	OnVr9veLOyIsrJwhbTz8Y3YB8=
X-Received: by 2002:a17:903:32c6:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2b0826d751dmr162082965ad.1.1774363757621;
        Tue, 24 Mar 2026 07:49:17 -0700 (PDT)
Received: from fedora ([2402:7500:a2e:a774:5078:e5c1:bc34:6044])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516ab1sm201252325ad.5.2026.03.24.07.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 07:49:16 -0700 (PDT)
From: Cheng-Han Wu <hank20010209@gmail.com>
To: sj@kernel.org,
	corbet@lwn.net,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	Cheng-Han Wu <hank20010209@gmail.com>
Subject: [PATCH] Documentation/admin-guide/mm/damon: fix 'parametrs' typo
Date: Tue, 24 Mar 2026 22:48:51 +0800
Message-ID: <20260324144851.12883-1-hank20010209@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the misspelling of "parametrs" as "parameters" in
reclaim.rst and lru_sort.rst.

Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
---
 Documentation/admin-guide/mm/damon/lru_sort.rst | 2 +-
 Documentation/admin-guide/mm/damon/reclaim.rst  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/lru_sort.rst b/Documentation/admin-guide/mm/damon/lru_sort.rst
index 20a8378d5a94..4f6a644be2ff 100644
--- a/Documentation/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/admin-guide/mm/damon/lru_sort.rst
@@ -75,7 +75,7 @@ Make DAMON_LRU_SORT reads the input parameters again, except ``enabled``.
 
 Input parameters that updated while DAMON_LRU_SORT is running are not applied
 by default.  Once this parameter is set as ``Y``, DAMON_LRU_SORT reads values
-of parametrs except ``enabled`` again.  Once the re-reading is done, this
+of parameters except ``enabled`` again.  Once the re-reading is done, this
 parameter is set as ``N``.  If invalid parameters are found while the
 re-reading, DAMON_LRU_SORT will be disabled.
 
diff --git a/Documentation/admin-guide/mm/damon/reclaim.rst b/Documentation/admin-guide/mm/damon/reclaim.rst
index 8eba3da8dcee..1f54a2d270f5 100644
--- a/Documentation/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/admin-guide/mm/damon/reclaim.rst
@@ -67,7 +67,7 @@ Make DAMON_RECLAIM reads the input parameters again, except ``enabled``.
 
 Input parameters that updated while DAMON_RECLAIM is running are not applied
 by default.  Once this parameter is set as ``Y``, DAMON_RECLAIM reads values
-of parametrs except ``enabled`` again.  Once the re-reading is done, this
+of parameters except ``enabled`` again.  Once the re-reading is done, this
 parameter is set as ``N``.  If invalid parameters are found while the
 re-reading, DAMON_RECLAIM will be disabled.
 
-- 
2.53.0

