Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1AA2BE059
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758879319; cv=none; b=WLoKPOPLxoDRZ1cBc9o1vUBbQNNl16FwmdYwGedc6Cd7jKcBPHNbZPzpneTR/SLF4rzRr+X1IGMZsnSAuQ51wknRxvCn+JiwJUjDh/ZT7drONSx2uVKGD5SyQtWb3dDP1qtdJ5eLsNdre8LU4CroTf3egws0Cp235UmPIkWuRKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758879319; c=relaxed/simple;
	bh=aHAHaqsBoprnxz9EY70FLRuOd/jhpKeP2yAc03cB17I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N5Liy23oY6aW5aytFFYgPZd5zUlYWE+oF3AuUyn3WM9iyb0tRXBAhUU904rujWV2FBklpzm0C/BIU6s9UAiQZQdoOh/x1+YoxrYmtrqy2kVOxIYGrOyhvXhgQJTJL2z5Sv4kYPKLXxZep846TOf+cWZz3ilEsZLIVuxqsv/cNNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AeGIC4dX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeGIC4dX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2570bf6058aso28217235ad.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 02:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758879317; x=1759484117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjEsZ2zZ0gswTTfZGuAqtKyUugB4UMlIc5tO04MQRtQ=;
        b=AeGIC4dXsbF8f+pw/D7Qxws7M/v3fplxR7zs5QfeS6hEfwwmkBeu68kQkHSuJCHTuo
         jOwsk7UtFOS1WiIGBXkAM5vKsVvxo4ERoyboFTqtH95hfl7WDWhrC7juwfAOLNRQPDOA
         sq4KT49lfjxBkG/7xan6SYOnxABt0vpXOx4sA5srEPnMG5zgABzPuyXZoabqIhFWJc9s
         +DvL4c5tlPiIhrMjcyzY9poC5/Ce7Fo98Ufa1kQRTz+Rz9VZFjjY9ORFw2JJIdu0YGXZ
         VOlV6gL+pQ09Qh7WoUYbXKz8pZmDIprhSmuSdSjVesM6BGfy4RK8lpd8EjxHoO4JavDm
         TzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758879317; x=1759484117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjEsZ2zZ0gswTTfZGuAqtKyUugB4UMlIc5tO04MQRtQ=;
        b=c2c94sdlH/LGcRGoacZr4kZUcRbBxnh/sgqt/aI5IkW5AxixkfAHH9Lvt9qiVdLt4A
         igVWV9WJsb71UrPLKr9kbMzj1TqEaBxGLGkjHm2PjsfQA5kTw+EtNlP6nszMGMsbgj4B
         goQorJ70H05e9QDd5FleWw2N7n6bzmhCQ9cX1+TyqwJ7iqy2EcEA9nlr776cWOfNyz+G
         tlvbj2bnbvkTcrDBLqQ7JPXEhy1EI86UREHIVCCq3WafVqgWW30IdQ3IWo9CTKGlIbNs
         bceYVFO+Gjt/SDOd0obHDj+548i2OYVsV7V0hnQni5czS+cvmy70/m4j4jyqOi/bG8NS
         fIKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8gj6OY9L3ehmsa8Q8xDlIZX+SP1+U/7BdjMDJx2fjwzmNQHA3/eBAJ97hsfIdqlL9NkjNdX+ffSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFg4ZvVJXe1Jnuj4d74B9n8Jdt+PFHwVCF7vY14O2Slw1tXuvn
	nR0pwFaTMck12k/ALOutAM513O4ekWIPO9fhWhoz3X35iWGGZ5b1Fybc
X-Gm-Gg: ASbGnctt0Cb4y0Gg7NGaFQA4fmxHnHX/ZTOVIiC/BIIOELs26gX1kyN+AwBzwohwdqw
	f9wWHKcbyVmPwbeyPqB6UMw4KJzGdj57j/VN5S+Bp3XeCp9f3BtK74VmrCuoXTZpGo/4GPcgVTb
	BllaZDaR86TQ+me/IwL1wQcbLVCUEIT6V0YKzui0rqKZdU1ITxiPTHwFUKWNmTvT/ujL/uvELZ4
	7KKa6XU9ucP35CHkFjAU3UPW50afYvLjhjXuW02pG1cYnL7GyvFXJ8jAhRXsKzFj8IE3MhAhY61
	OYMdHl0f8c3lQS5XrW2FgeJ1wvzicZpHzxuJPtlIlNX7szUBsz6g+r32Lc8OJsZ+fyOJCX1IEv2
	oGBLEjDs60oVYNkAGdvWPwkjiqWEcx1bKe6IAwud3D88DDioRJM2izwQe39ZgKLUG52/uaAfL5g
	WhGTzGNw17rB95
X-Google-Smtp-Source: AGHT+IGyv8obkrIygTqJyqvVbel1FZKkyg7zW+CRqiZxE8ebTcWIuicJPPFReDEq4JzQ2A2SZCWUTg==
X-Received: by 2002:a17:903:2847:b0:269:4741:6d33 with SMTP id d9443c01a7336-27ed49d2c35mr46947235ad.23.1758879317548;
        Fri, 26 Sep 2025 02:35:17 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1c21:566:e1d1:c082:790c:7be6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cda43sm49247475ad.25.2025.09.26.02.35.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Sep 2025 02:35:17 -0700 (PDT)
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
Subject: [PATCH v8 mm-new 11/12] selftests/bpf: add test cases for invalid thp_adjust usage
Date: Fri, 26 Sep 2025 17:33:42 +0800
Message-Id: <20250926093343.1000-12-laoar.shao@gmail.com>
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

1. The trusted vma->vm_mm pointer can be null and must be checked before
   dereferencing.
2. The trusted mm->owner pointer can be null and must be checked before
   dereferencing.
3. Sleepable programs are prohibited because the call site operates under
   RCU protection.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 .../selftests/bpf/prog_tests/thp_adjust.c     |  7 +++++
 .../bpf/progs/test_thp_adjust_sleepable.c     | 22 ++++++++++++++
 .../bpf/progs/test_thp_adjust_trusted_owner.c | 30 +++++++++++++++++++
 .../bpf/progs/test_thp_adjust_trusted_vma.c   | 27 +++++++++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/progs/test_thp_adjust_sleepable.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_thp_adjust_trusted_owner.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_thp_adjust_trusted_vma.c

diff --git a/tools/testing/selftests/bpf/prog_tests/thp_adjust.c b/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
index 72b2ec31025a..2e9864732c11 100644
--- a/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
+++ b/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
@@ -4,6 +4,9 @@
 #include <sys/mman.h>
 #include <test_progs.h>
 #include "test_thp_adjust.skel.h"
+#include "test_thp_adjust_sleepable.skel.h"
+#include "test_thp_adjust_trusted_vma.skel.h"
+#include "test_thp_adjust_trusted_owner.skel.h"
 
 #define LEN (16 * 1024 * 1024) /* 16MB */
 #define THP_ENABLED_FILE "/sys/kernel/mm/transparent_hugepage/enabled"
@@ -278,4 +281,8 @@ void test_thp_adjust(void)
 		subtest_thp_policy_update();
 
 	thp_adjust_destroy();
+
+	RUN_TESTS(test_thp_adjust_trusted_vma);
+	RUN_TESTS(test_thp_adjust_trusted_owner);
+	RUN_TESTS(test_thp_adjust_sleepable);
 }
diff --git a/tools/testing/selftests/bpf/progs/test_thp_adjust_sleepable.c b/tools/testing/selftests/bpf/progs/test_thp_adjust_sleepable.c
new file mode 100644
index 000000000000..4db78f2f0b2d
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/test_thp_adjust_sleepable.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+
+#include "bpf_misc.h"
+
+char _license[] SEC("license") = "GPL";
+
+SEC("struct_ops.s/thp_get_order")
+__failure __msg("attach to unsupported member thp_get_order of struct bpf_thp_ops")
+int BPF_PROG(thp_sleepable, struct vm_area_struct *vma, enum tva_type tva_type,
+	     unsigned long orders)
+{
+	return -1;
+}
+
+SEC(".struct_ops.link")
+struct bpf_thp_ops vma_ops = {
+	.thp_get_order = (void *)thp_sleepable,
+};
diff --git a/tools/testing/selftests/bpf/progs/test_thp_adjust_trusted_owner.c b/tools/testing/selftests/bpf/progs/test_thp_adjust_trusted_owner.c
new file mode 100644
index 000000000000..88bb09cb7cc2
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/test_thp_adjust_trusted_owner.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+
+#include "bpf_misc.h"
+
+char _license[] SEC("license") = "GPL";
+
+SEC("struct_ops/thp_get_order")
+__failure __msg("R3 pointer arithmetic on rcu_ptr_or_null_ prohibited, null-check it first")
+int BPF_PROG(thp_trusted_owner, struct vm_area_struct *vma, enum tva_type tva_type,
+	     unsigned long orders)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	struct task_struct *p;
+
+	if (!mm)
+		return 0;
+
+	p = mm->owner;
+	bpf_printk("The task name is %s\n", p->comm);
+	return -1;
+}
+
+SEC(".struct_ops.link")
+struct bpf_thp_ops vma_ops = {
+	.thp_get_order = (void *)thp_trusted_owner,
+};
diff --git a/tools/testing/selftests/bpf/progs/test_thp_adjust_trusted_vma.c b/tools/testing/selftests/bpf/progs/test_thp_adjust_trusted_vma.c
new file mode 100644
index 000000000000..df7b0c160153
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/test_thp_adjust_trusted_vma.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+
+#include "bpf_misc.h"
+
+char _license[] SEC("license") = "GPL";
+
+SEC("struct_ops/thp_get_order")
+__failure __msg("R1 invalid mem access 'trusted_ptr_or_null_'")
+int BPF_PROG(thp_trusted_vma, struct vm_area_struct *vma, enum tva_type tva_type,
+	     unsigned long orders)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	struct task_struct *p = mm->owner;
+
+	if (!p)
+		return 0;
+	return -1;
+}
+
+SEC(".struct_ops.link")
+struct bpf_thp_ops vma_ops = {
+	.thp_get_order = (void *)thp_trusted_vma,
+};
-- 
2.47.3

