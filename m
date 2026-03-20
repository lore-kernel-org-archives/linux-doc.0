Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E0840DFC6
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 05:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773985055; cv=none; b=Wn5OFr5MPGNKytBD/9YBf2kgJiFTb6bzFjJ/2CBFlQHrE2D8KbnKZUKw1QAqdQDfhXg7CGFXmiUgdXQU2oS87cNMsMaVBwancl66Z3wrdbwjuf/hOPuTzXHkntzYklwLXE6u9PeRGndXz9PqP3sPSBVfyMn6g4SBKyVV+InDrdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773985055; c=relaxed/simple;
	bh=t7AUkyahrA7jetaNYrGD367jzrlPTnRWAlYOYrOS3To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UaNTPK9X8b6OtMH5+yxp4Q59oeJcQXTvL934IFwuI3v47Qp5bDfNdfFll0yy1pkL6r95TPb/Mevun9egAV5yE0Xc06tMVgkOp88D6BrYWrOWb0Get+TiRXjVUevcNqkWtrUMQYtX+IV2cKJIcyVJjZ6z+emFf/97mulUyp4yElo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bkgkja1J; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bkgkja1J"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so1187439a91.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 22:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773985053; x=1774589853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7AUkyahrA7jetaNYrGD367jzrlPTnRWAlYOYrOS3To=;
        b=Bkgkja1JkGg4Uz5rSH5OcEJ1jqgHDLY7epOedCplYNx8UAxg0z/Txis7awIJ9057iY
         Z7/uFGNz0JBrZp571g5hcTI2O/0N0ZbuzuEv6dH8dIMzlTcMzHy3o++C3xT2VAY+x1yK
         9dbiHU8/VkyNx/X1t4HBFnQsZLiVE14ZmETgajn6ZugVfae8odKkSKxX8GY+dP5jM439
         a5dzuWCRvL57o7j0dh83o7DrKMSzisYNJQrVc2LR6HSmtkkKDWhnsSBBKuphAiFAx7dZ
         DpRmhgviJGNjGoeEnDXwP50n/+4vUljII/6amyWHOanqC8MLvs26u6abh2liIudaruP3
         EYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773985053; x=1774589853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t7AUkyahrA7jetaNYrGD367jzrlPTnRWAlYOYrOS3To=;
        b=himtzKn1PLC+g4QmX/JXQBnf07EvwdvEPzfEMz1Jjti+0uuPTVajsA+nbt05JszEfZ
         IjkF+H5kzfBEBxH/1LHdHcdTrsTwSZctedw9sfZ3ZU3Gy7Ghxjo6FG1W5SWsyMm5zaZs
         u/TygJIKBuP2t2T05rwcuUG+zGaWC8NSN5AqrAPOjzQ8TBUrtg2pn5cZroDjEECZmkht
         ePexn5aBNM/KmZSwuEEm+uWze9B5zOUCb+dOVtZy1oBGLI2QYPdZFRNJgagW0seBLsDY
         4rzd6T5QVjFlXII05/9hWjJ/92omyJnBnFhHwGXRaPfbBXQH44AxB1tgDk6KPdwVJZpQ
         8l5A==
X-Forwarded-Encrypted: i=1; AJvYcCU973/Zr78OkQGJ8SP2R/V6fOmGdjTiD8A6SIY9Kzm7Q4M04IJLV5Wt9m7gRJnN7LkFkS8AMEbB9J8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0yvB5OQGWb5L4Z6ZSX3ApaNlbi3cZJo+lKhQJZQkfOM1RkksQ
	yAxc5sgdcup8WBDvDr6glxP/FbvY9h4uKJD3OzRVsAtpS0wTg0z14+UV
X-Gm-Gg: ATEYQzwPphAmPpS2f67IXaV5qTTLi5xDZE+ujkbTYQa55C7ALk/kqpIqzPm4iNqkYmZ
	tYpJdPY7pY0THa274myMfXeAIotDF4baH8TneI9MAh2xxy6Ml0gkYQGsKs/p1yiiKwIA/qVxGnf
	1dLI7O4tBjKWcDb0tD7u/ZuBuTL8z7RzujHpL+E2hBPEtB6kDqBuwZ95q5u7xG5Y/rH/t5JFzC/
	4gt9EcfqGjamlwHbkJZhhQWCRzRLVq5XTU6cb1yORQ2dRCdN0kNuSG1r2Opb8cXI5Nf/qj7vjBS
	Hzx31966xJ3UXgGFgZFfeLwSx+S3rc63sGYuGZ3tM8dSVYIHzBHAciM+q9//i9Axa5OZ/D3ifpQ
	tytFpyfRXbxXJlQhuSTJOdtZo0H0IaLhugmECudnofN9wIjHCg/NAmXAL/RoPsvlzBIdZS9SBqa
	r95MIdDeNey8/cWIwbS12W+b2UaNCvV0d0Lmw7ltIQhsNDZXye7k1guy4ObynXMA==
X-Received: by 2002:a17:902:e850:b0:2b0:58a8:5f9b with SMTP id d9443c01a7336-2b0827de53fmr18104835ad.49.1773985053460;
        Thu, 19 Mar 2026 22:37:33 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:898b:301c:d085:a35:99e7:ffec])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08354bcf0sm10226655ad.33.2026.03.19.22.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 22:37:33 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] Docs/mm/damon: document min_nr_regions constraint and rationale
Date: Fri, 20 Mar 2026 13:37:28 +0800
Message-ID: <20260320053728.213664-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320052428.213230-1-aethernet65535@gmail.com>
References: <20260320052428.213230-1-aethernet65535@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current DAMON implementation requires 'min_nr_regions' to be at
least 3. However, this constraint is not explicitly documented in the
admin-guide documents, nor is its design rationale explained in the
design document.

Add a section in design.rst to explain the rationale: the virtual
address space monitoring design needs to handle at least three regions
to accommodate two large unmapped areas. While this is specific to
'vaddr', DAMON currently enforces it across all operation sets for
consistency.

Also update reclaim.rst and lru_sort.rst by adding cross-references to
this constraint at the end of their respective parameter description or
usage sections, ensuring users are aware of the lower bound.

This change is motivated from a recent discussion [1].

[1] https://lore.kernel.org/damon/20260319151528.86490-1-sj@kernel.org/T/#t
