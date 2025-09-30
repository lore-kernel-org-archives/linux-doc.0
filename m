Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E51283682
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 06:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759212032; cv=none; b=mrOushw9+XLEIE2R+fFDjTTai7LHq5hcJf9PPlMYIFPXZrFMfQL3eD5lsdwWsv9enZ0OwJkjmTI6KSVsEy6bXDwfzbGBJWpYRIte2Ow6Gytt5TCOCqTGDe9g3TyzzB8ZJthGiZVcmT8aFToFONLppSDQ4/GrxKQJWe7TGXmBQMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759212032; c=relaxed/simple;
	bh=megoui3FrcgMHtvlQs49ApxPOBMbnJrOEUpVHigRQTk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BJIROqTxjmm1EFmS9ydYx3Uyqz6qYXkDfVBL0ct771rVM7+UE73tKT5uHv0JEYoMwGriJR/GdPsC1tYf5Kz+eRXaJl6YPuNoPPk8AXP4KFNYweT3MlmuA+thXTLOrHvPtOWJCUea3Dg+Veuly5HtY1uhMMp+u9dkx1n8nAu865w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAb3/aFp; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAb3/aFp"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b5507d3ccd8so4765488a12.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 23:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759212030; x=1759816830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+baDWNJ3e+prJbakC2u9YwdVipZEa6rsDQvMsjkRx4g=;
        b=hAb3/aFpORT/46qcoQWs5kuerB9oeCvhla6UvwCaSVxVPFIep5JHTBm9129Uc3yY2e
         0gO0WCQ1pibTjPSwTnf+XtC0C0B94gWQ/lzAI3lklHFWGDGHcQq6rFVr4sb+yn9lxbLu
         Cdrfp527Bv3+CBXWX5pj5L4NY/h9Jq4lP+GeRozDkvwfcfZt7LD7VllvxsIb47ncBnrO
         WsfxTQ+lrDh1RlzkUjpEHOz1pd2DMXguwzHNA5ToDtbSKlnRGQkOW4O9uA0yXBY/mxlR
         ko3vnrYlhzvgghpw5dFrPCBw4/O1qtbK+XyxGhTxod7+k/93QI4nOIOzAPLOgfhoC+bK
         R0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759212030; x=1759816830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+baDWNJ3e+prJbakC2u9YwdVipZEa6rsDQvMsjkRx4g=;
        b=DAZXzjywxEDk2ToqUhw7zbTITZIltEKEIRfqCY+zRxJ1R44xKfoSN5vVL7AhhRQvot
         zbQL0ZGlxYVhsZ70Qq3P8EHO1vNPNrXtw3v/h4lo2Z9RqcmiAh1KMUGAk6prmcNa97nN
         laFYPg0nSasa7MW+6PuB/EodUcVLdvarA+vX05KBDA6TmD6jwAltLoaII+VaWklqAjt9
         JxWEs38NQRrPd9GBkByUgiC4MCUbEQXKImfsegpZfVbVnu4E+FMgcNWFI3Q5OlkyQrkP
         5HbEO1wOPmHq2CbDQ6JzMHUKOkQkZ9wRvqnkYdpe4f/NYP4jyYFCBfUj3QfQTRy4z+I1
         4A3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzepNkIwmaYcRwnRPx+QYO7z9BbsjxH5CBAiB6xon0Y/B5ioXa/NEx7LAtwA07Qkdc0UZb0tdJaEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwohpdhvR8JvFE5MRRJTacubOmllCgHZ8hHfTkxeMsAgCKFB6yL
	1CEIVU5VUn0688fjtJB3P18s4K4qwUSCBqXN2nHkrIGPBX+zlnfIvFgY
X-Gm-Gg: ASbGncvtLDhNoiQj2sm9QX3HTCNSV4rXP/hA5fjoassdQY3r7zPppaofP7uxGW0koQq
	BFjPbG7NzUKHwj5uVjdOBcl31MAaB8RxYnnEmRzkN2f8+VnieGbzJNYyYpf+//Uz+UBx/y0RIEe
	LKByQ9jRbV8xgDHtE/9mpvOCvUo1VKV08e+K4tTWM2OLbdw43MBj9PIJfb/EQdkPoQHhjyQQl+G
	ntoYb48EYVxMJDJ/JTJgvpDMsRqqNpeiTQmKVjJCNGw7KzyA97s/+8Ryct+LCQ2oXsremp812/z
	Wz4w7ZaFsw6Lc9F9ctUVtzm/fLdtDJVw3iK8dPEckxfn2XK2JsqMN0a94bNExxLJh7fFwFcAhp/
	y3HTxHjjbVF7zmoQ+vmIJIL3QqbCp/G2RNMvCM4JFMLuZV8p7CDQZAAATnr8CjH+a7MtEgqvF5F
	QfjjiSqkcKy2FJ63eCU1fNtO2GhT0=
X-Google-Smtp-Source: AGHT+IF3u3CwEhxn4obFOsd5k7ipKHjSB6CIP+P0m/CZ4RrSdU6mgZTJEKlhFteu0bsxBMQFdSQa/A==
X-Received: by 2002:a17:902:db04:b0:265:9878:4852 with SMTP id d9443c01a7336-27ed49ddab3mr250832865ad.15.1759212030159;
        Mon, 29 Sep 2025 23:00:30 -0700 (PDT)
Received: from localhost.localdomain ([61.171.228.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d43b8sm148834065ad.9.2025.09.29.23.00.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Sep 2025 23:00:29 -0700 (PDT)
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
Subject: [PATCH v9 mm-new 10/11] selftests/bpf: add test cases for invalid thp_adjust usage
Date: Tue, 30 Sep 2025 13:58:25 +0800
Message-Id: <20250930055826.9810-11-laoar.shao@gmail.com>
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
index 409ffe9e18f2..90af0322f775 100644
--- a/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
+++ b/tools/testing/selftests/bpf/prog_tests/thp_adjust.c
@@ -3,6 +3,9 @@
 #include <sys/mman.h>
 #include <test_progs.h>
 #include "test_thp_adjust.skel.h"
+#include "test_thp_adjust_sleepable.skel.h"
+#include "test_thp_adjust_trusted_vma.skel.h"
+#include "test_thp_adjust_trusted_owner.skel.h"
 
 #define LEN (16 * 1024 * 1024) /* 16MB */
 #define THP_ENABLED_FILE "/sys/kernel/mm/transparent_hugepage/enabled"
@@ -277,4 +280,8 @@ void test_thp_adjust(void)
 		subtest_thp_policy_update();
 
 	thp_adjust_destroy();
+
+	RUN_TESTS(test_thp_adjust_trusted_vma);
+	RUN_TESTS(test_thp_adjust_trusted_owner);
+	RUN_TESTS(test_thp_adjust_sleepable);
 }
diff --git a/tools/testing/selftests/bpf/progs/test_thp_adjust_sleepable.c b/tools/testing/selftests/bpf/progs/test_thp_adjust_sleepable.c
new file mode 100644
index 000000000000..e3d70f258d84
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
+int BPF_PROG(thp_sleepable, struct vm_area_struct *vma, enum tva_type type,
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

