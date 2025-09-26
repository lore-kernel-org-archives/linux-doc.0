Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCB329CB4D
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758879312; cv=none; b=VNff40UGQ4ONcuzDdGPc68M6Wbx+6d3uHPnkmW5O6LTzpHViuqcE4Xk+gMyxfo9V5Ik/1TFrBWXYKRC/6Cs2Xr57tjwwKwuFKh5ONCCD7N3MHMXb47DF/ndDl6F50f+e8z6WdtzY8xSrtFv2cZbx3uwUsVuPQNB72pDqezekZiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758879312; c=relaxed/simple;
	bh=zrlWjexRS+e6cnuSCMRZ3/yt6yu9oHpAebCTZ9vSuDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=itXIeGfdo7/zsAFDWe2m4Vbu//WovJuDMfuShB4hA6h94EzfltEv+ieo1J+3hXFso2zum4otMVamWpOlkRTHFHFvwapAeRUacoNpbENqqzf4bYpSXidCNW4pbOZslMBARETsrmGKlzn6ssfSNJK1fgWkrOvoOXYPuJQlbAaVq70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVora+UU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVora+UU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2570bf605b1so21091905ad.2
        for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758879310; x=1759484110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rw7WNnQLHMUa0Yn2DLPfVIa+t6BCCpmxXRHnFLCbq0M=;
        b=NVora+UUFXjQA9a6jq4f8i1ID4HKYlAjXIzCMjvNJ8PkLP//n0Iu0L9CK352sg9XbS
         Z8D4pBWGZKt1Kjhb9O6fBiBDHp0O/SYsRs6gdxO6R02mRnQ5m0lG5pDM4UChnH1+jUJw
         bzX5V9YiFycDZGiXZLyQG9KyPUERRKqDApjBr7kzmaAKVm9IPDTjxagBvV3nXRJW0k7t
         PTGCv5Bakkx1iG5DFsN8dKD8Bx144kY7iZf5VgOyShNTKYDJROav6usuYe3b/bQOnrmc
         b3TIsz0fsXFBsDjPaZzjV6Rw64+N+wgWNGo+n+gnBBDxAaeOgEga9bWJmKvfapWSzT/H
         HVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758879310; x=1759484110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rw7WNnQLHMUa0Yn2DLPfVIa+t6BCCpmxXRHnFLCbq0M=;
        b=PQjV74/asyRLpwOIZrJ1YRLaJXB1Z/kyOUzHt+CNhH//JNsV4CWTFlCIIHBFdjMilY
         Rk4xh2+LikzHYbyVedxejRtvOcwTK/9Oo/xjaMhBq0pFGaIEmwhaFKpbbsMmon/MFl1R
         rMARb3R/FdYUecjrB1BK3sw2YODQf4/WZ2N4LJYG0ktc0pDizV2w4H+QSO0S7FozChHE
         vM8QkvSbbsbGWf9mToVGsb9ynupBJQWb15oM/1WctIkG3THoD1BOrwmsND8xkwRkutAI
         6tqR/kHRynDi4AkemeNxCB3E5E3nVRg2CTXCvbjGLunT2XwYd8onCt5XC9OupEpl5zAQ
         2SHA==
X-Forwarded-Encrypted: i=1; AJvYcCWJeK/J9ECsjlBt4lcSZO8vYDskQIfji8ALj8wXG9YYlGQBZ3GwQSYhd7MoZc07N8l/Y+ztPqww6QE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSoPH+rrcW3mcWULvxDoh0olgDJHFZzSwqaVKcjWjMjTJZbSbB
	jxUkIrwrK5dguMLPBj/ix/1mdfr7dVj0i5wWkmhn0gN3qwvp0B4YomK9
X-Gm-Gg: ASbGnctxXK5oLbOEF0SyxPcgI3hPNV+uXDZDuwl/u5NxfZqoaD/9JZiw1chAJveu2Ns
	Ja1ezDCSXm/jVcjo0jAnJrZP/IOzIa3bXl6VpKx1LdhKoErwjM/ap5ZV2PMmaEtOqQlADbFYkbr
	beXvM91uKGXA0C2pbCcGyC0V6D9jDLvw/gKz0Z4RqdWY2foZx7g2G7AVhbPFnpD9FhEb5Xy59A7
	oklWBUFSkpAbKWr11uKHetC6PvyVnqqQhOaXvo/xFuoOU6HOUYfvNY7cY9cB7nbKnyVD7RByfVK
	kjHZs6KuxXw0SKVuu+CPTyDY44q0iM1WPlEkTffIXYeuLF/ZPOctuDtOtkqJ3MVXDDVZClCnpOc
	Gf9T9rwtTlaisStL11WXgrmvMNcGConfHCla1dqrW3sln3lMC3av15PlWL8jDeB2iVCAok8QvS3
	e/Sjh8goPpotHD
X-Google-Smtp-Source: AGHT+IEEuMzIy4jcfzpCO06+83GzrwWygKfi3d1uaHoYRS3Fbpuh2MpzvVbrFawoF8VwJAU/udjvNw==
X-Received: by 2002:a17:903:37ce:b0:278:f46b:d496 with SMTP id d9443c01a7336-27ed4a6085amr60657335ad.55.1758879310067;
        Fri, 26 Sep 2025 02:35:10 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1c21:566:e1d1:c082:790c:7be6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cda43sm49247475ad.25.2025.09.26.02.35.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Sep 2025 02:35:09 -0700 (PDT)
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
Subject: [PATCH v8 mm-new 10/12] selftests/bpf: add test case to update THP policy
Date: Fri, 26 Sep 2025 17:33:41 +0800
Message-Id: <20250926093343.1000-11-laoar.shao@gmail.com>
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

This test case exercises the BPF THP update mechanism by modifying an
existing policy. The behavior confirms that:
- EBUSY error occurs when attempting to install a new BPF program while
  another is active
- Updates to currently running programs are successfully processed

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 .../selftests/bpf/prog_tests/thp_adjust.c     | 23 +++++++++++++++++++
 .../selftests/bpf/progs/test_thp_adjust.c     | 14 +++++++++++
 2 files changed, 37 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/thp_adjust.c b/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
index b14f57040654..72b2ec31025a 100644
--- a/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
+++ b/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
@@ -208,6 +208,27 @@ static void subtest_thp_eligible(void)
 	bpf_link__destroy(ops_link);
 }
 
+static void subtest_thp_policy_update(void)
+{
+	struct bpf_link *old_link, *new_link;
+	int err;
+
+	old_link = bpf_map__attach_struct_ops(skel->maps.swap_ops);
+	if (!ASSERT_OK_PTR(old_link, "attach_old_link"))
+		return;
+
+	new_link = bpf_map__attach_struct_ops(skel->maps.thp_eligible_ops);
+	if (!ASSERT_NULL(new_link, "attach_new_link"))
+		goto destory_old;
+	ASSERT_EQ(errno, EBUSY, "attach_new_link");
+
+	err = bpf_link__update_map(old_link, skel->maps.thp_eligible_ops);
+	ASSERT_EQ(err, 0, "update_old_link");
+
+destory_old:
+	bpf_link__destroy(old_link);
+}
+
 static int thp_adjust_setup(void)
 {
 	int err = -1, pmd_order;
@@ -253,6 +274,8 @@ void test_thp_adjust(void)
 
 	if (test__start_subtest("thp_eligible"))
 		subtest_thp_eligible();
+	if (test__start_subtest("policy_update"))
+		subtest_thp_policy_update();
 
 	thp_adjust_destroy();
 }
diff --git a/tools/testing/selftests/bpf/progs/test_thp_adjust.c b/tools/testing/selftests/bpf/progs/test_thp_adjust.c
index ed8c510693a0..8f3bc4768edc 100644
--- a/tools/testing/selftests/bpf/progs/test_thp_adjust.c
+++ b/tools/testing/selftests/bpf/progs/test_thp_adjust.c
@@ -39,3 +39,17 @@ SEC(".struct_ops.link")
 struct bpf_thp_ops thp_eligible_ops = {
 	.thp_get_order = (void *)thp_eligible,
 };
+
+SEC("struct_ops/thp_get_order")
+int BPF_PROG(alloc_not_in_swap, struct vm_area_struct *vma, enum tva_type tva_type,
+	     unsigned long orders)
+{
+	if (tva_type == TVA_SWAP_PAGEFAULT)
+		return 0;
+	return -1;
+}
+
+SEC(".struct_ops.link")
+struct bpf_thp_ops swap_ops = {
+	.thp_get_order = (void *)alloc_not_in_swap,
+};
-- 
2.47.3

