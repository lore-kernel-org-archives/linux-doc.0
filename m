Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA32BD5AD
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 09:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758879290; cv=none; b=SoMuWr5OQ2O/dymfsxWEFsmiBNQYj24b4+KdvMdKQuDSo5ox5eUYYs1C+YOxv8TBLA4rjPNLSnArHgTtszjuuJ+Z+hQcvpL4SIhEEnaIa3h+axUxoLLaRe3d2tRtu8j7pCRo2rJs8MegmZNtqZmjkEOpyL7Duf6vRTS/Cbhz5gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758879290; c=relaxed/simple;
	bh=CXI0qMvWqpeePDr4xBG9e2uqemr9IpjeVUqDleKN93I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YfGxcw2ZIfcSxD66VCNm+OPV2tJgKzQT/+0a7LhvjL7gVBkP52n67SKRmVjSEZodpR9UJNGdY9PTYU6+LaoD4J+1Up5wtHc0xc/eh9vZsP3cbbvjZBrHIFsTkbOcOHTgaOdiOSUOBcbIeHfOQogTv/fH+B5n40JAJUAqFZBDl9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DP8ZBPeR; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DP8ZBPeR"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27edcbcd158so16191425ad.3
        for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 02:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758879288; x=1759484088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOprrquoKlbkEreJojZ4KykFg8G0TswcVk79ghRz+Tk=;
        b=DP8ZBPeR5oR1hon/YL568Z773lSOyxCG4Z+gZ1kHN0RH4xkQ6MEp6q4BSo9DC2Q/R4
         IXhE2EY/ogG6D1MV1CeWxmoVWyZMv5j0X1xq708K0wC80ly1w+mBMn24k6ARY5v1CrKr
         XR8NYrFaelqnSyv8jIE46QvZ4FVfYm2V1CgT1xvAGjKaNSc501uTFbiNCVmMeoZsWK9u
         M5hC2gJxnIWMk5vpq6q7D9fuC4rZsWZX8ecHwe0gWFnu9e+nOINMyVQ68oBFYFQn0QBr
         BhFjMLETOR60eoiZFOI+r4JQdbbBoaOY4PoxuEUJeFP/FabMkPoxihECfc0wGwg6kKMY
         u6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758879288; x=1759484088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOprrquoKlbkEreJojZ4KykFg8G0TswcVk79ghRz+Tk=;
        b=oG7EqaMgYHpH4riLDH3iXE8bOmLPEorQnY4KpZCgm3YApUzXwdn7kOGdmnZ4JpT+tI
         /vxkG+vk+zFJIA+QC+A5MDxpZwwMWbMlA799JILIGhaBCR7QBeFTPqfspGCb/OGb8EBc
         6gGQDh0siG/8gGUbOBO7hH3UiEfUBcgRxMi4tIHxgMwa9XN0jiiKLiMXwrovH3Mqh+mn
         Tou6KtfkYdVytJC0i1xzk43v0CvbzG49ojxqzy54xaGWdQcg5XSJJyijSxKvMMJcTtWr
         ttr+YY6ADDmoFzIM/49SCQv212+2BFUHs3HyYPUr1JlXLta6VmQzNTHHlmpWEVQW3aAX
         AMSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1NNfVz0H3ffU+aAZ3DHjsbYEV6ynF7jrFnDN8tdMuGSSSLbT4hu3qJPMu25OQ7WRCT705tfXFKqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPkwFNRRtUzGo8zoMNfgWZMGyty+KlcsN42wHHHfdWT9uyiDe7
	qEgajAMpoo1Je86hnMJ386xJvpNyAXF/YBhN0hn9OywF+E5SpWUQpdFmRZP9aazKciI=
X-Gm-Gg: ASbGnct/lP5Kh22WAiJJf6WiL0IQTz2V10Q/Lr+Twmw1EFTChDXKd53Vb3vuD09woe5
	keEiKiYhqPFkfb/8wPzxmhvZI4xGPMtcR+ouWyEzbMtS5hyhh/49Z4sHsNLJ+DJeIlUh60bA3Uf
	OPv7xqbOe07Rc5xSfESXmuYP0mUIu2gY6jZiGKLuyy0Lni+V7EnfaMQ5nBUsSfGmmxTz5QwUv0B
	svAR2UpuGE8jvVLjJUiRZc292Y/FgtKXMhBM1zidrZgNfNTWh7pKE1RPlIdlE2xBpWCC/6yXJJB
	U8ouujZG6uxL7vjn5469HM9+2omElUl7rXK/kVf4Mm+YkGQE0OT0g04KeK9rayRhuReGJl2QF+m
	W2GIwqggaIMOpXHKpzaCPU1W9YLhOeVqVK4OPoIhRPZeSeowUavylRfjKl8/tMefkayYUFiGuwl
	lcE8HrBfaz3+IU
X-Google-Smtp-Source: AGHT+IHyNvkqZ/H58qTgrC7RxZoAtdYJitsFBBvDlhUuvEFdmMnVmU2Ltz5BgywZtZV48lyMJHsZWw==
X-Received: by 2002:a17:902:fb4b:b0:26a:b9b4:8342 with SMTP id d9443c01a7336-27ed49e9308mr63284705ad.25.1758879287971;
        Fri, 26 Sep 2025 02:34:47 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1c21:566:e1d1:c082:790c:7be6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cda43sm49247475ad.25.2025.09.26.02.34.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Sep 2025 02:34:47 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	usamaarif642@gmail.com,
	gutierrez.asier@huawei-partners.com,
	willy@infradead.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	ameryhung@gmail.com,
	rientjes@google.com,
	corbet@lwn.net,
	21cnbao@gmail.com,
	shakeel.butt@linux.dev,
	tj@kernel.org,
	lance.yang@linux.dev
Cc: bpf@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v8 mm-new 07/12] bpf: mark mm->owner as __safe_rcu_or_null
Date: Fri, 26 Sep 2025 17:33:38 +0800
Message-Id: <20250926093343.1000-8-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20250926093343.1000-1-laoar.shao@gmail.com>
References: <20250926093343.1000-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_MEMCG is enabled, we can access mm->owner under RCU. The
owner can be NULL. With this change, BPF helpers can safely access
mm->owner to retrieve the associated task from the mm. We can then make
policy decision based on the task attribute.

The typical use case is as follows,

  bpf_rcu_read_lock(); // rcu lock must be held for rcu trusted field
  @owner = @mm->owner; // mm_struct::owner is rcu trusted or null
  if (!@owner)
      goto out;

  /* Do something based on the task attribute */

out:
  bpf_rcu_read_unlock();

Suggested-by: Andrii Nakryiko <andrii@kernel.org>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 kernel/bpf/verifier.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index c4f69a9e9af6..d400e18ee31e 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7123,6 +7123,9 @@ BTF_TYPE_SAFE_RCU(struct cgroup_subsys_state) {
 /* RCU trusted: these fields are trusted in RCU CS and can be NULL */
 BTF_TYPE_SAFE_RCU_OR_NULL(struct mm_struct) {
 	struct file __rcu *exe_file;
+#ifdef CONFIG_MEMCG
+	struct task_struct __rcu *owner;
+#endif
 };
 
 /* skb->sk, req->sk are not RCU protected, but we mark them as such
-- 
2.47.3

