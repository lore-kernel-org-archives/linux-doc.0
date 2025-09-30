Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD4D136658
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 06:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759212021; cv=none; b=ko8FASBXeyZFlBl2xg3g0o++GhvdYRfuwpsoQBAGtW3e6kxboU0YTaF8fD6rM/psGnH5VGyijkgTjoJFJANmUGgs8GCsbR1qwzhe8i5Klm2vE3cBR8fuQGD6u2VEtQhVNQhSuG8zSanH2w02DwWS9oqXoZdAiDrXsRqmqDXVl9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759212021; c=relaxed/simple;
	bh=R5zbW5h2mVTkZ695ePmIiAB1l/JHUe56ilvlBhyPTSI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vua3H73PZ6Y8QrkLubpEoqeQ4LnjYwDCepr9QgxuyLVkYT4Vjd0mYwWitAM3xFjC38UsCFnFqmoFlmiVtv2T7C8CggqcHJyWIrrY2ifdLHOOfkRAyC21KzarbyE06/cHsuZ/VPrRK2llhl+egy9BDGoEjWUdHW03Elg8opPB2Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=io7zauPe; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="io7zauPe"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27c369f898fso60025885ad.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 23:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759212019; x=1759816819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIx6JtRigPCSTkRZZksmLfb/7I11NxpDSXp1+H8RPCU=;
        b=io7zauPe92j8Iab3UKDNWGr9ECNd6z3ovZSzeGNv3OienplqWGBhPqRAaX+G2FbOBM
         7jKrM0acttAamBgZo7rX/m/seCs4z5XmxihPDTvlOpFHTS3KBdK5U3aEdzOYoOTQ0xHC
         8nSZOO8KzqD8GsolLJvXu+ZmK3oh7qKiLHv5aGQxPjI4zYtavJ0uw6e0fpub35EPzt9X
         akRqBnPHWB6XPn+PW7UZIEKeZLp5TkNXgeh3GSNjbCWb09LXvGGBG5KSgmpIIz0sAp29
         JTrhaEdY28DO3hAej/7l494SwIR5UAVfI0NvOcS0s5Kx52PJ1DoOTrmjgFhmYOk//hyd
         QdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759212019; x=1759816819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIx6JtRigPCSTkRZZksmLfb/7I11NxpDSXp1+H8RPCU=;
        b=MQoZMer3pGJr/kqI6wf6aLWaYw1P2NcZOIev3bRVlews4/PjUxXooU9+7EkYu7mRpO
         g/b1DPI5E+DH8Ww3U0BS6bJ50MGMnp41ZcaivgBX4ncwOYh8vIf40+qY/l7wP7XJ+CfG
         gf+5jm+C1i6Ss5qQa4PWRZsPNEVsES3+SICqOjWAzHaoDx5IXCmLRbp4AzKG981zdK7H
         K3GIXQRzKj9LsI2yCbkUbKlRrOXYL/TYANyQAMBFgvZJsvJfF6YaJOyXk2U6XqdQ8lfJ
         x9M5siO9iBUm0bv2KrUPQ0soFRh0mC2i0c9G230IUltRYuordBvUe2L3SFnUOm2aBkQW
         Umpg==
X-Forwarded-Encrypted: i=1; AJvYcCVF9xksxtYn511/rf+06Cz7UJ2QqnfevpVV+NqUbZw0HMwER/6J2GgioPA2XQ1udLZZTTIf835vv/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8RTM2tH0cW6AE8meQglCFHEOeI19wnxuv5pixzgHEY+DEfdqX
	ZFyqqR3Otldyesh+zuJd4/XEnXgfeO7lcKgZHB07gfwPxinF08uSf6v0
X-Gm-Gg: ASbGncsnoH1ngVjG9kH4bV2kojVq0QBtsUNTof/ETzTGe/Thf7DbG2kdceR5GsTMylj
	ogBIdRazuxGuoPdF0EdSuHODnrj2HUEyZOLaZn03PDHNVNcvhqtsrdpIMKYMHOBBdw+tHjlqfeX
	+WI5rUV1tK1jAbnCOL1WLDezK7qFRL9j6R+nc9RNX6PnmT8KDmNOcoDAc7ebXoSfCtK+Ty/1d8c
	6GIyq6FJ1dM1V176cuK4KvspyCchaFgTScQWx7Ul2BD36AFYHuphNLAdaLOlOlS6i/TCB8eEjHK
	sBNmT/yXF7kvbPDu5f/yVdTlUYdnwfzGAPbYX/cmXF6RYgK2l8MJwKXJnfQRg0L/LRHIXmtYsT8
	BNaP7DNvJFZ3trX/cmmcGrVN5Nr+CcsybXgDOmc01YEDnSe263TU9mGkgwbsNLpKqyq7scGsWBV
	Gv7cIKlwMM+oXLb5SJD45UNzv4SnoAEsTxXSqhLQ==
X-Google-Smtp-Source: AGHT+IFMF0W1qCu4x4cjpNrUn5ZcQpDe9+QCy8Fcn/EjOKLeyug2Wicq+5aDDzqbHXeIKGe4nnQ0RQ==
X-Received: by 2002:a17:903:244a:b0:25c:d4b6:f117 with SMTP id d9443c01a7336-27ed4a3de3cmr218087635ad.35.1759212019034;
        Mon, 29 Sep 2025 23:00:19 -0700 (PDT)
Received: from localhost.localdomain ([61.171.228.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d43b8sm148834065ad.9.2025.09.29.23.00.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Sep 2025 23:00:18 -0700 (PDT)
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
	lance.yang@linux.dev,
	rdunlap@infradead.org
Cc: bpf@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v9 mm-new 09/11] selftests/bpf: add test case to update THP policy
Date: Tue, 30 Sep 2025 13:58:24 +0800
Message-Id: <20250930055826.9810-10-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20250930055826.9810-1-laoar.shao@gmail.com>
References: <20250930055826.9810-1-laoar.shao@gmail.com>
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
index 0a5a43416f2f..409ffe9e18f2 100644
--- a/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
+++ b/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
@@ -207,6 +207,27 @@ static void subtest_thp_eligible(void)
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
@@ -252,6 +273,8 @@ void test_thp_adjust(void)
 
 	if (test__start_subtest("thp_eligible"))
 		subtest_thp_eligible();
+	if (test__start_subtest("policy_update"))
+		subtest_thp_policy_update();
 
 	thp_adjust_destroy();
 }
diff --git a/tools/testing/selftests/bpf/progs/test_thp_adjust.c b/tools/testing/selftests/bpf/progs/test_thp_adjust.c
index 74ad70c837ba..fc62f0c6f891 100644
--- a/tools/testing/selftests/bpf/progs/test_thp_adjust.c
+++ b/tools/testing/selftests/bpf/progs/test_thp_adjust.c
@@ -39,3 +39,17 @@ SEC(".struct_ops.link")
 struct bpf_thp_ops thp_eligible_ops = {
 	.thp_get_order = (void *)thp_eligible,
 };
+
+SEC("struct_ops/thp_get_order")
+int BPF_PROG(alloc_not_in_swap, struct vm_area_struct *vma, enum tva_type type,
+	     unsigned long orders)
+{
+	if (type == TVA_SWAP_PAGEFAULT)
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

