Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EA12BD030
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 03:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760930269; cv=none; b=lpQjQsTUbtst9xIw+jz3BXEOfJ9CRDKpiUeGhvuBT6+8TsW8Ac1TNAc0D7tGPK9h4REDnbWrte2iyAyyRDSNeb4lPI0wj0L+1CBZCV9HXNuOYA1jMP/Z1VDEDvvLoojBoz8jeSTKR4TPMrfINOe6Rb8e1IC9i+Eu1pJM6Ce42aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760930269; c=relaxed/simple;
	bh=AZhf0bN3dMzYRxemSSdBnaN8exURAvP50px9ndo8GmA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j+YmgMZylpo0xEewJ5KRk3yXNdN1JYyk+DzrGwwKE9aHUQPlO9apIxDzocNHhgp2ROVO6QCv1pvSp548cOaKOywQULpg1MiwxwTR3aaBfAYRRw36sxuRqwbnDvPbQsTRInMlAsjPrz11X3S7Q7xaC2J2QBcF7i4MA58lPs1sYi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlnxuMI3; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlnxuMI3"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b6271ea39f4so2616922a12.3
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 20:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760930266; x=1761535066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4o89aqQquJfXg8DHNFFwhPZpHBrXkamiWZUkDvNw/U=;
        b=UlnxuMI3d3iZ0GlV6bQ/ncwcLi9A9eCBlo8bLl8h2i1Aur53Zj3Klknj7M0BLdvGWW
         rjY7cblE53XBIdVqIoDPUaaokLmwlsIlzO/jGBfay1lCz41Yk/x7VhNJPDzEW1u9iFvZ
         Cl9rpWXyqrBFtFTA8+dL1goIqqVynqpIHKnuY0al2SnnvIKRPP0rVg9JMyBxneUDAu7I
         Z2rOj2xV+5gl181vIu46EIg3yocldwnV/yl+d4X9oaFbrQYAuLm5+hbjH//BC/ain4cO
         YFJz40zsb+pgrfnZcjb2X3/apPb4lN0tJejh6U4zlQ56HqRW8VzGPLPagkk9c3UzOzOy
         zbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760930266; x=1761535066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4o89aqQquJfXg8DHNFFwhPZpHBrXkamiWZUkDvNw/U=;
        b=sTX8sPffIvQqdYips6zaxWAkZaWyRY5tSkGbVw0BvRdQ61V4Os+TQL3uPRVg6yGuXp
         o1JBsaa49/SU+Rb5fyDq5lrKtYZoCr5MU7knZlQSERY3vhZWGwFd9fC5M/VsPUm2Gs1A
         K4AGj1NIYsId+ifRen1MsVScmcz6DFEdk9jKgwl74JL8RaJj2cWK50BGNclm3t8CBj2X
         VusAQGlS4cZV5VrKTWKIiyekC4X0KDCujcobihIqI0R/xYfd3XcsINCaXEwOkG5/AoZO
         Z2296IiMg0XUY7QJhrWoXfjxiHgsZw8lIQ+U15QSPh7WM0ZMQq8EKseh4Be8bwqD5CRN
         Ujfw==
X-Forwarded-Encrypted: i=1; AJvYcCVRjYN/qU500Xu7fbuyRCDlO9dm5SPQz1jsE12TD6fydJbcxprSxObe6OuOtARgM3bngrow37OkCVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgsrTPU7iXeSpY/Z1w8IVKEAfF+Y3VbvIC1DXfjTl0Rc1V0foW
	M9fA9HLjt135/ECyRIbEJJyAoml/+SzbCgrTnrvg+XgMt7sXsyRNdR3o
X-Gm-Gg: ASbGnctsDrsC7jnxTtdewOjNT77av9xEoPdEk0msaTTbS40GYkVgMm8jNUIpho7/Nri
	133TUTGaO5odSUF3sx//IHgfvMUTvE5q2Acjgj3+J1RdTb18LL5/Jn0FQaVVvW2iS2VGgF+3Yp4
	ZN1jl2O12NpEihhEBlH+U+0eMV4FEUSrASXGPl38oNmiJvagGN6oq5R35n/0eF7ftr3sDmnPHLB
	r9j78dD7lZcUrGk0jVp2rwO2y89r2rCpugRwn9yVfB13yhn0ORf+e/BebY5RQ0F/fYsvGQn4O6J
	TGNqvRHcZtWrYLaii3oUquiUyIvKvDq/EaMTJWESMwQHlLEvyWwp2sAHJXF2rlxi7wtgpQjwemN
	zgspWvOdld5aisOGaeytkSC+8uJx35sUie3Y6IM24QcA6rU/b5+JOyrBh4FkBknSv4w6VwK+Gfo
	6t9Tew1a/ZevZ7eB1Jt7a+dfcVmxnZoyo6joS314on3DxsrA==
X-Google-Smtp-Source: AGHT+IGalCyWkc7C8LmPCGO9urIs1Pwdm8eNflQX/0Ho3b+S9hSSF1w5msjDxjkD1RQDifOCduychw==
X-Received: by 2002:a17:902:d50f:b0:27d:69cc:990 with SMTP id d9443c01a7336-290cb27e0bfmr152822005ad.49.1760930266552;
        Sun, 19 Oct 2025 20:17:46 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1da1:a41d:3815:5989:6e28:9b6d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fddfesm66373435ad.88.2025.10.19.20.17.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 20:17:46 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	david@redhat.com,
	ziy@nvidia.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	usamaarif642@gmail.com,
	gutierrez.asier@huawei-partners.com,
	willy@infradead.org,
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
Subject: [PATCH v11 mm-new 09/10] selftests/bpf: add test case to update THP policy
Date: Mon, 20 Oct 2025 11:16:54 +0800
Message-Id: <20251020031655.1093-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20251020031655.1093-1-laoar.shao@gmail.com>
References: <20251020031655.1093-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This test case exercises the BPF THP update mechanism by modifying an
existing policy. The behavior confirms that:
- EBUSY error occurs when attempting to install a BPF program on a process
  that already has an active BPF program
- Updates to currently running programs are successfully processed
- Local prog can't be updated by a global prog
- Global prog can't be updated by a local prog
- Global prog can be attached even if there's a local prog
- Local prog can't be attached if there's a global prog

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 .../selftests/bpf/prog_tests/thp_adjust.c     | 79 +++++++++++++++++++
 .../selftests/bpf/progs/test_thp_adjust.c     | 29 +++++++
 2 files changed, 108 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/thp_adjust.c b/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
index 2b23e2d08092..0d570cee9006 100644
--- a/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
+++ b/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
@@ -194,6 +194,79 @@ static void subtest_thp_eligible(void)
 	bpf_link__destroy(ops_link);
 }
 
+static void subtest_thp_policy_update(void)
+{
+	struct bpf_link *old_link, *new_link;
+	int elighble, err, pid;
+	char *ptr;
+
+	pid = getpid();
+	ptr = thp_alloc();
+
+	old_link = bpf_map__attach_struct_ops(skel->maps.thp_eligible_ops);
+	if (!ASSERT_OK_PTR(old_link, "attach_old_link"))
+		goto free;
+
+	elighble = get_thp_eligible(pid, (unsigned long)ptr);
+	ASSERT_EQ(elighble, 0, "THPeligible");
+
+	/* Attach multi BPF-THP to a single process is rejected. */
+	new_link = bpf_map__attach_struct_ops(skel->maps.thp_eligible_ops2);
+	if (!ASSERT_NULL(new_link, "attach_new_link"))
+		goto destory_old;
+	ASSERT_EQ(errno, EBUSY, "attach_new_link");
+
+	elighble = get_thp_eligible(pid, (unsigned long)ptr);
+	ASSERT_EQ(elighble, 0, "THPeligible");
+
+	err = bpf_link__update_map(old_link, skel->maps.thp_eligible_ops2);
+	ASSERT_EQ(err, 0, "update_old_link");
+
+	elighble = get_thp_eligible(pid, (unsigned long)ptr);
+	ASSERT_EQ(elighble, 1, "THPeligible");
+
+	/* Per process prog can't be update by a global prog */
+	err = bpf_link__update_map(old_link, skel->maps.swap_ops);
+	ASSERT_EQ(err, -EINVAL, "update_old_link");
+
+destory_old:
+	bpf_link__destroy(old_link);
+free:
+	thp_free(ptr);
+}
+
+static void subtest_thp_global_policy(void)
+{
+	struct bpf_link *local_link, *global_link;
+	int err;
+
+	local_link = bpf_map__attach_struct_ops(skel->maps.thp_eligible_ops);
+	if (!ASSERT_OK_PTR(local_link, "attach_local_link"))
+		return;
+
+	/* global prog can be attached even if there is a local prog */
+	global_link = bpf_map__attach_struct_ops(skel->maps.swap_ops);
+	if (!ASSERT_OK_PTR(global_link, "attach_global_link")) {
+		bpf_link__destroy(local_link);
+		return;
+	}
+
+	bpf_link__destroy(local_link);
+
+	/* local prog can't be attaached if there is a global prog */
+	local_link = bpf_map__attach_struct_ops(skel->maps.thp_eligible_ops);
+	if (!ASSERT_NULL(local_link, "attach_new_link"))
+		goto destory_global;
+	ASSERT_EQ(errno, EBUSY, "attach_new_link");
+
+	/* global prog can't be updated by a local prog */
+	err = bpf_link__update_map(global_link, skel->maps.thp_eligible_ops);
+	ASSERT_EQ(err, -EINVAL, "update_old_link");
+
+destory_global:
+	bpf_link__destroy(global_link);
+}
+
 static int thp_adjust_setup(void)
 {
 	int err = -1, pmd_order;
@@ -214,6 +287,8 @@ static int thp_adjust_setup(void)
 
 	skel->bss->pmd_order = pmd_order;
 	skel->struct_ops.thp_eligible_ops->pid = getpid();
+	skel->struct_ops.thp_eligible_ops2->pid = getpid();
+	/* swap_ops is a global prog since its pid is not set. */
 
 	err = test_thp_adjust__load(skel);
 	if (!ASSERT_OK(err, "load"))
@@ -240,6 +315,10 @@ void test_thp_adjust(void)
 
 	if (test__start_subtest("thp_eligible"))
 		subtest_thp_eligible();
+	if (test__start_subtest("policy_update"))
+		subtest_thp_policy_update();
+	if (test__start_subtest("global_policy"))
+		subtest_thp_global_policy();
 
 	thp_adjust_destroy();
 }
diff --git a/tools/testing/selftests/bpf/progs/test_thp_adjust.c b/tools/testing/selftests/bpf/progs/test_thp_adjust.c
index b180a7f9b923..44648326819a 100644
--- a/tools/testing/selftests/bpf/progs/test_thp_adjust.c
+++ b/tools/testing/selftests/bpf/progs/test_thp_adjust.c
@@ -22,3 +22,32 @@ SEC(".struct_ops.link")
 struct bpf_thp_ops thp_eligible_ops = {
 	.thp_get_order = (void *)thp_not_eligible,
 };
+
+SEC("struct_ops/thp_get_order")
+int BPF_PROG(thp_eligible, struct vm_area_struct *vma, enum tva_type type,
+	     unsigned long orders)
+{
+	/* THPeligible in /proc/pid/smaps is 1 */
+	if (type == TVA_SMAPS)
+		return pmd_order;
+	return pmd_order;
+}
+
+SEC(".struct_ops.link")
+struct bpf_thp_ops thp_eligible_ops2 = {
+	.thp_get_order = (void *)thp_eligible,
+};
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

