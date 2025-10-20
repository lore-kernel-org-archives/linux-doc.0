Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B616529B77E
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 03:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760930462; cv=none; b=fxXCSQCjN1+tKgLGyEALXJCEygBiYWIp0KoWhF75hliriGhZtktH6xWrwmCtV6oom1N3sNwZPj2EX9oi9j7wqgChVQPbhnwSJmS0zhrePP7YPiS4pO0PrYS9UY0HNQO9R8VCd8UCEQ9hfGKBivk+3K43FFmmiAgVlvXTei9ggzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760930462; c=relaxed/simple;
	bh=02mAjRZzX3qpNXnaQskN3odGP+YQFzrvZyi8liAZWxM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Cq5vEsBqfYJAWKBWzm0yywURlgqnXsgILLQ+Bd8fgAkSSlsD9WuVSOYcAznZ1IzDkeoZCACcDVVG9iBddvFBopnIvqBGMW3aiYcu2ViEtV7cgI9aRw5mL6HQ3c2wZW1hWJbfX6ynu/Q9B0DY5NIi4bL39MwSEihroqn/Z6hU+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7O/m3tk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7O/m3tk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7833765433cso4930718b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 20:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760930460; x=1761535260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wHI9VYRgU9NCjspHIFvlmxvN8Co/N4RqDwPEZAFmUys=;
        b=B7O/m3tkwTzMXZTuxvCcVEsJLu3ocq/9OuDuNuiEMbxZWt0y525dTaN4W1NNOaaPTM
         1U5O2skVyIkFCXI3J1Jdi3udwccbdPOPRA3pgb2KNRsfOVsN1IRi7JDtg0PC+jIegKbC
         5H5xvxm4y/HSiIkiVRvhVkyF/lPxxyPtw65hu8av+rZd5Jxu78l96ox+FgUwmIS2v0j4
         u2gmQao3MybBxWMXWyVle3Mmg1PhP7ppPqUzpwqXGHLPjFpx6K2QRWApSuYJwggaUqnc
         fQYj0/dCP4d3pJDRNRfFzy/oDMgVQrzxUntAbBmEJsgKoy/3JSFKEs3Ib00c7YbeEpcq
         k/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760930460; x=1761535260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHI9VYRgU9NCjspHIFvlmxvN8Co/N4RqDwPEZAFmUys=;
        b=Vb+Gc6uMdys96vtlBbd9Sz9R/Lz5g3gycJzsc0M9HFajuLHrZyRsWa2KPyGTov925M
         pQmS0zvFffHSHI2XBwxv7LLOK1PXfOy2Z7daSolVbI2XO64Nm73kBlJXwDpJa4C28T6T
         pmVaRfu+FzDVqo4AuHp6IovI6fl7MWS1IVxud+B8orvA9vz5kppuL0zxFpUX/b+KMddp
         Lj2jdyuXVz3snlcVFTDAJWqQwhlUThCrMWRNhPMU6F/Wj7HFEgH5WGy1essNDgUp812z
         v+gp3d6ONLSIv/AZrRUSntH0Hk9jVSnI3bOPMJ/nsKYYddLYT673oZhENx2ldaDmq3I+
         pX/A==
X-Forwarded-Encrypted: i=1; AJvYcCVaF/FLLj50M4xxJoO5GXJTNkTi2+SCFIbhR0olorW+oDJvVShkoIS0RgmEDUor4lYGkmVI3e5opUc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfm7B9u0gi2DexL6/QdIipj7vsDsYkkedZawIf7Lh77ygm6rHj
	97oQynsgGwlJ4SseKbtptn3VJi5L7FOwapG1DDWehgLYkmfKLroeZAGi
X-Gm-Gg: ASbGncvX5ohVDqY2V5gAdRCetbIzptHfyTN24VzMJk6fjAeb2JV1lYvTUQucp8jrzFn
	es2ISEFLDZIV3qrxAOOAdXcqORG2t6Nppy24bPj//zBVV38GyYpxP/T/3kcTb6dn8jpaAGC4TbO
	934Pd/Rk5ctp3x/865rp3zxLwhTB6hhjpe3/saGoq0SA0Yfz9S/tNIimYsde2NL+gMVL5TS13UH
	kKoYNhu/nFDROUz5m5Qnh8Et5xBGWuUOsKiaixJPaCKA1Qmch9LFVeMNYIBXe4egqzEfYuFy9yj
	yaWflO1zMyLx+w7yxucEs5CjlUJn8RpCrz0Aay/vFgAPrw6ACIHPur3QMrNh5yef3pqgGJt9ZjV
	o4qtVs2GSCGmvqCaYJpdUzrLMoereY5NxrWeuZ90+dIXIXbVKBtbjkMa0tVztbDv+ZqDc0xwOQb
	DGxkD39IpTcVytAxPylMrgZxte3IzYW4Xd41UGrgJx7miqNg==
X-Google-Smtp-Source: AGHT+IHTS7P4RInRCl/RZbmpnrgZ1U3ouz5pEHqmpv7QdSk7Vr1Brl+6pmiWgq6O7vs34OVAviH41g==
X-Received: by 2002:a05:6a00:2e1f:b0:781:24ec:c8fa with SMTP id d2e1a72fcca58-7a220b2af8amr12763024b3a.27.1760930460008;
        Sun, 19 Oct 2025 20:21:00 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1da1:a41d:3815:5989:6e28:9b6d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff39437sm6770459b3a.27.2025.10.19.20.20.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 20:20:59 -0700 (PDT)
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
Subject: [PATCH v11 mm-new 10/10] selftests/bpf: add test case for BPF-THP inheritance across fork
Date: Mon, 20 Oct 2025 11:20:32 +0800
Message-Id: <20251020032032.3393-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify that child processes correctly inherit BPF-THP policy from their
parent during fork() operations.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 .../selftests/bpf/prog_tests/thp_adjust.c     | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/thp_adjust.c b/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
index 0d570cee9006..f585e60882e8 100644
--- a/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
+++ b/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
@@ -267,6 +267,37 @@ static void subtest_thp_global_policy(void)
 	bpf_link__destroy(global_link);
 }
 
+static void subtest_thp_fork(void)
+{
+	int elighble, child, pid, status;
+	struct bpf_link *ops_link;
+	char *ptr;
+
+	ops_link = bpf_map__attach_struct_ops(skel->maps.thp_eligible_ops);
+	if (!ASSERT_OK_PTR(ops_link, "attach struct_ops"))
+		return;
+
+	child = fork();
+	if (!ASSERT_GE(child, 0, "fork"))
+		goto destroy;
+
+	if (child == 0) {
+		ptr = thp_alloc();
+		elighble = get_thp_eligible(getpid(), (unsigned long)ptr);
+		ASSERT_EQ(elighble, 0, "THPeligible");
+		thp_free(ptr);
+
+		exit(EXIT_SUCCESS);
+	}
+
+	pid = waitpid(child, &status, 0);
+	ASSERT_EQ(pid, child, "waitpid");
+
+destroy:
+	bpf_link__destroy(ops_link);
+
+}
+
 static int thp_adjust_setup(void)
 {
 	int err = -1, pmd_order;
@@ -319,6 +350,8 @@ void test_thp_adjust(void)
 		subtest_thp_policy_update();
 	if (test__start_subtest("global_policy"))
 		subtest_thp_global_policy();
+	if (test__start_subtest("thp_fork"))
+		subtest_thp_fork();
 
 	thp_adjust_destroy();
 }
-- 
2.47.3

