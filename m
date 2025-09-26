Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989B529DB61
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 09:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758879327; cv=none; b=r84RsR7ZjMgF/h7TBKNPtafadzxUcGili9pIbVgaBllX1jXi/6yUl90fk1sBuo+IewL/9Gf7bVZK/k6f3rF9mvmYhp/flyhrcOMlxvxXAhZdWNK95rSxLi9m/EIeV84iyRe2uO9mc5faR6FO6dKf+QYYu8cNGpZ4OdqVH71SRE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758879327; c=relaxed/simple;
	bh=UBiranDCCKyEzq2tHLJoYwbpNJseAjiAQrhPN7Tvoyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XI1iaoNJLwZBoLrlXMRe0syw0TfOi3IYAOfcY7AefiPSv9iTrrQnOrmz4SdKuciB7SdalHtN5WIdeiN2MCBbO1sq86u90upkqiDo8tHfm659STtGizyWDZjZe5jHimRSsNmc04+OrzKZiQxJIDtjoEUBMNDS9qnDQgeOO+p9YJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZTZNqqX; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZTZNqqX"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-267facf9b58so14967205ad.2
        for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 02:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758879325; x=1759484125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huK0MPI+64vH11fsWziyabmXxqecdshCDlVy93FTD7M=;
        b=TZTZNqqXH+AfeJ44oI7xZfdHiyZfUVc36Sbzn8bU6P3ojXxKXwPchN/xSYUw+Q0zKy
         R2EdxBuB6bCnR/VCKuteb6e3Drc+ulJehOIy3mL7CEvYPjoQv0vX4o5eQXCD0boZ9/jh
         0U5plxSxr5g7+k4zk+A0aAhpLG+p0SpDn/NNfzGn37ujpQaKHHYmtEOqcUqxICfuAZIA
         VhBnbTStPdJueLt+6J1ePe7jKDnSiVutxHXQD5u+JL0TEBnxtvIfKnFojzyMl9yhLaxj
         HyRNHwCvpDpzSUXizriFjI0x8Sb1hay8fwKZrmXySw+6hBpdlCsJCWU7QBivdGBbd5nZ
         bJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758879325; x=1759484125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huK0MPI+64vH11fsWziyabmXxqecdshCDlVy93FTD7M=;
        b=KDDPeQc3eAU/UvO6vatzItGnr0AZrAxmINswWa32HLxlfQb/INwhEnX2KprBwvjIqX
         WmzXKOdQCgTsidueodtsv+pROypcNX797yZ7MXe8UVgzqn1CzAzwmlHaPs35jOdwHTQL
         GU5arNRMuIWclzBmus6kWSFetPL2n5/FLvxw2w6jzE1+esstia9S4TOk9vP+69YdgQLc
         4jBJbyogwziHjuvpHh1RmTr+yR3/6IKpmvom6c0dhzVTbzmshDYwuUrJMr1iqietckpo
         zMoAANqbjhQsMNe3vdASm9UuWfb/dKpkbkhkIH5SQ9tkJxvWJtV7ihi0/ny9y809UH4X
         1ssg==
X-Forwarded-Encrypted: i=1; AJvYcCVgHHmQ21g6htnidgspFXOybrMZS482usRfU0ohX+lP1bZr2TBWOTqJ2Bxhu3b7qvtVKuZLlWWk2yc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOejA8pG/CXHZ+gS9et3jf8wM7K1Q0+J6rIE/jW65lmqhnTdOM
	3qXlIh60ZQzjHjrnIpqeFhKAdJVg1zF3pT+Uj0gDXFjJhNlWNM4Xi6qx
X-Gm-Gg: ASbGncsRyk70wBqBHgs2gQakvYkJ1PH5oRl9h+i+1jR95NMctPcIlthh7PDT+QRpZzY
	SHNwM4yCPKKVzjA5sdMWFxyfcGxI1zuAehnLVAGt6HiyxyGr/HjsvlV40Sq64hMGALgYgRV+ClO
	IAVZZSfTjk9IFoEspl11LB0fXrB+1lNzEfsIWWzZHoB4Mnhhky26blV/alZT3CW75Bfvm4iCt1o
	keIKguj6ZH2VfLhoWghOuz6z70zT5cSOW5WMZUQkj+CRPedeNU9aRLDhUeoaAF7NPpkMk/enSPH
	4rDc/NFj0ZAz/SS0zfSvLqbOFNr+lYSoDKOgEzEsmR0DM6Rs3bI6gmMvy08k6dyXjpSKUGrCwDW
	GR3zgswXbKRBPW1iw30tZAVqMhaUvgu3LwoWyu7FnbIlS+VCGZ3xLtmN2W7EHrBMa7yYBLk30/D
	j7gySibdG3lDmQ
X-Google-Smtp-Source: AGHT+IGaBFISMjqZ56jhqOkqG6YgWjBFJGtoPxP49Jy/1yngaLT4ocjmKacYDQWcrmZR3MpcJrfLmA==
X-Received: by 2002:a17:903:1c2:b0:26b:5346:5857 with SMTP id d9443c01a7336-27ed4a3719bmr75144915ad.24.1758879324875;
        Fri, 26 Sep 2025 02:35:24 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1c21:566:e1d1:c082:790c:7be6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cda43sm49247475ad.25.2025.09.26.02.35.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Sep 2025 02:35:24 -0700 (PDT)
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
Subject: [PATCH v8 mm-new 12/12] Documentation: add BPF-based THP policy management
Date: Fri, 26 Sep 2025 17:33:43 +0800
Message-Id: <20250926093343.1000-13-laoar.shao@gmail.com>
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

Add the documentation.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 Documentation/admin-guide/mm/transhuge.rst | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index 1654211cc6cf..fa03bcdb8854 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -738,3 +738,42 @@ support enabled just fine as always. No difference can be noted in
 hugetlbfs other than there will be less overall fragmentation. All
 usual features belonging to hugetlbfs are preserved and
 unaffected. libhugetlbfs will also work fine as usual.
+
+BPF-based THP adjustment
+========================
+
+Overview
+--------
+
+When the system is configured with "always" or "madvise" THP mode, a BPF program
+can be used to adjust THP allocation policies dynamically. This enables
+fine-grained control over THP decisions based on various factors including
+workload identity, allocation context, and system memory pressure.
+
+Program Interface
+-----------------
+
+This feature implements a struct_ops BPF program with the following interface::
+
+  int thp_get_order(struct vm_area_struct *vma,
+                    enum tva_type type,
+                    unsigned long orders);
+
+Parameters::
+
+  @vma: vm_area_struct associated with the THP allocation
+  @type: TVA type for current @vma
+  @orders: Bitmask of available THP orders for this allocation
+
+Return value::
+
+  The suggested THP order for allocation from the BPF program. Must be
+  a valid, available order.
+
+Implementation Notes
+--------------------
+
+This is currently an experimental feature.
+CONFIG_BPF_THP_GET_ORDER_EXPERIMENTAL must be enabled to use it.
+Only one BPF program can be attached at a time, but the program can be updated
+dynamically to adjust policies without requiring affected tasks to be restarted.
-- 
2.47.3

