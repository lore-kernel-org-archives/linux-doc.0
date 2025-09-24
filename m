Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB902301015
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758715226; cv=none; b=mYzhxAWhHv+omyQkPE5KkLrmlrhJrllfpvMKazBt8yiCMAICQRPemvtzD8umi/XM1g/u0j86DJrhaNg5ew3+NHShVpODOpA2yvh8xGhS0pIh1nXeEpbsD5BcBhGZQvZR3bo0vOIIcunQiTeOidecaWyYk0HxmJN/I0zdr1nwTjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758715226; c=relaxed/simple;
	bh=eQOJ1NdpQxIiNbCHg8T5EsVl18gH29QLGTs5mtZDgmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEiLCtkgk+h5KDIuB0Nj3c8w7bYytXDP07bmCX9Y5ern4H0plqZHasZbBOvZ1bCmWbl23extH5R66YDiySMpLDd0scLd1qE4d8Ygv7amI6eDwCGqmFv6StU4ZSbQ2qUBKagbM6aE+JL5clWlP0No4aMCY+E0Dx0AdIskw0jNc4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRYOeVqB; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRYOeVqB"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77f2c7ba550so3485628b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 05:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758715222; x=1759320022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h46VjKRHdkcMiEZAqaWzAvZEGNArMuVfKDzvSU/d6uw=;
        b=GRYOeVqBdC56yBn5K4hk+iSlMA8nLf3TevWQrLcb6nSg5+f8D/pcUnNlpZtZXAzfmW
         I4sVyor/U1Nhp9Y3wY24q9MNwJcRG6/aL0lMZhI2yFpfIj84+ICayLrA2AnGC23Be8ii
         FsnpEO2/8i+vd67W2zVdaa6AE646su44Zb1ZmYVQONkIcbRoABkZTCP7Aj7++eCvNLD4
         XnyhQnOz4olLBb9+EpjiuxG4T8VyvbBGnYVMHkQ8OARP3gH3sbDSwxbt9vgtHUD9j24o
         +08ILI0ngVpYvEZUTi4tKyvoy1A011VQGhP8CG6eXwoQF6kOjWu9enrPDqDniiB7Bfn0
         /R/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758715222; x=1759320022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h46VjKRHdkcMiEZAqaWzAvZEGNArMuVfKDzvSU/d6uw=;
        b=oX6G3hVwsFX42jXRyqDPIjcVqJsHkyDQLVpjzqcxOOH9rPK4H/Q+5++r6xmU6LGB5e
         8Gn2vqXS4VcZf7No02miGsH144lfjBw1GALgENaaV/wyoq4LXAFtnWGt6CbniXzvjrlA
         wY5SzpIuycsgq4+VzcB9+71Rfph4qRiH75Q3N/PH+49dpojL+bz84BgiClXr31vYOMas
         ao0eTE+BNu5utWQKVgqKhejtLh5tpowhKAsVhEoji16K6UKKg6v+EPDkR9bmxHdcdSgr
         b0Ay366G0k4o2QxdXhsoENZ/ssabLhho/JHMaN+Bok+YTLnN1LN5HItWbxR27owYkS2Z
         Bdeg==
X-Forwarded-Encrypted: i=1; AJvYcCWMdWn1d9oLpFhldytsLWP2sNo8G9Dp1RgOtjqbSiZ9EAk5+c6Yk8uLixfS7zMgvWVueECQyNkvhOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTqT6RBX1DMaoS04ZjB16PaRo0ZgSMqrpo09r6w+zv1xTgaKgG
	R7kwhkrUcGrviHwE0N/7AqLHtkEfdi9WJgJKSR8ZZS1n9eCB8tdJDzCM
X-Gm-Gg: ASbGncu/zixdRxvbPGPEGjOCKhNNt+YjkvJDw63C5jXj2VqnfraJJq0CqIzNY1mJAyZ
	7AIa4/yYZLxzTx5COZyE2owKvPbJPJ+UtsSULSbQM8T10tlsTB3Yb6GKiLWNNGA3Vw8qoz3XGVu
	ZMXPzCl3lveBUURBS4hJzhssI4cZSwvb5gB+zRpxhjDscjI2QwZoW5wV0wSKLL4g3oq1nI8PD1D
	1dZwpbp6ehH+CluC1Q4yciT/5EJZ5//uDdvbq8N3ewZ0ZksxJfhwL5gfZChj2t48iUUOr3OD1ty
	4eIbrmxpDk072jX80h7RXj4K3vLp2r7iR7Y1kHyyiGd2Nb6tCJcNoPIx8+P9NsQAwtb9xKSCz23
	cnZ6LpodYAdrycUEib2DhS9w=
X-Google-Smtp-Source: AGHT+IE6fNdjuLZN8PpezUYZCjv0+nCNqLy4/cUMk8Ck5LuFvTMHEe5sGc7ej/DiBYiLC24FQ7Snbw==
X-Received: by 2002:a05:6a20:12ca:b0:24e:c235:d7ea with SMTP id adf61e73a8af0-2cffdb6b8a3mr8370045637.47.1758715221706;
        Wed, 24 Sep 2025 05:00:21 -0700 (PDT)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f335995cbsm9451657b3a.63.2025.09.24.05.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:00:21 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Rong Xu <xur@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	David Kaplan <david.kaplan@amd.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Nam Cao <namcao@linutronix.de>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	"David S. Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Cc: Jinchao Wang <wangjinchao600@gmail.com>
Subject: [PATCH v5 17/23] mm/ksw: add test module
Date: Wed, 24 Sep 2025 19:59:23 +0800
Message-ID: <20250924115931.197077-2-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924115931.197077-1-wangjinchao600@gmail.com>
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
 <20250924115931.197077-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a separate test module to validate functionality in controlled
scenarios.

The module provides a proc interface (/proc/kstackwatch_test) that allows
triggering specific test cases via simple commands:

  echo test0 > /proc/kstackwatch_test

Test module is built with optimizations disabled to ensure predictable
behavior.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/Kconfig.debug        |  10 ++++
 mm/kstackwatch/Makefile |   6 ++
 mm/kstackwatch/test.c   | 122 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100644 mm/kstackwatch/test.c

diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 89be351c0be5..291dd8a78b98 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -317,3 +317,13 @@ config KSTACK_WATCH
 	  A lightweight real-time debugging tool to detect stack corrupting.
 
 	  If unsure, say N.
+
+config KSTACK_WATCH_TEST
+	tristate "KStackWatch Test Module"
+	depends on KSTACK_WATCH
+	help
+	  This module provides controlled stack corruption scenarios to verify
+	  the functionality of KStackWatch. It is useful for development and
+	  validation of KStackWatch mechanism.
+
+	  If unsure, say N.
diff --git a/mm/kstackwatch/Makefile b/mm/kstackwatch/Makefile
index 84a46cb9a766..d007b8dcd1c6 100644
--- a/mm/kstackwatch/Makefile
+++ b/mm/kstackwatch/Makefile
@@ -1,2 +1,8 @@
 obj-$(CONFIG_KSTACK_WATCH)	+= kstackwatch.o
 kstackwatch-y := kernel.o stack.o watch.o
+
+obj-$(CONFIG_KSTACK_WATCH_TEST)	+= kstackwatch_test.o
+kstackwatch_test-y := test.o
+CFLAGS_test.o := -fno-inline \
+		-fno-optimize-sibling-calls \
+		-fno-pic -fno-pie -O0 -Og
diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
new file mode 100644
index 000000000000..1ed98931cc51
--- /dev/null
+++ b/mm/kstackwatch/test.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/delay.h>
+#include <linux/kthread.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/prandom.h>
+#include <linux/printk.h>
+#include <linux/proc_fs.h>
+#include <linux/random.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/uaccess.h>
+
+#include "kstackwatch.h"
+
+static struct proc_dir_entry *test_proc;
+
+#define BUFFER_SIZE 16
+#define MAX_DEPTH 6
+
+struct work_node {
+	ulong *ptr;
+	struct completion done;
+	struct list_head list;
+};
+
+static DECLARE_COMPLETION(work_res);
+static DEFINE_MUTEX(work_mutex);
+static LIST_HEAD(work_list);
+
+static void test_watch_fire(void)
+{
+	u64 buffer[BUFFER_SIZE] = { 0 };
+
+	pr_info("entry of %s\n", __func__);
+	ksw_watch_show();
+	ksw_watch_fire();
+	pr_info("buf[0]:%lld\n", buffer[0]);
+
+	barrier_data(buffer);
+	pr_info("exit of %s\n", __func__);
+}
+
+
+static ssize_t test_proc_write(struct file *file, const char __user *buffer,
+			       size_t count, loff_t *pos)
+{
+	char cmd[256];
+	int test_num;
+
+	if (count >= sizeof(cmd))
+		return -EINVAL;
+
+	if (copy_from_user(cmd, buffer, count))
+		return -EFAULT;
+
+	cmd[count] = '\0';
+	strim(cmd);
+
+	pr_info("received command: %s\n", cmd);
+
+	if (sscanf(cmd, "test%d", &test_num) == 1) {
+		switch (test_num) {
+		case 0:
+			test_watch_fire();
+			break;
+		default:
+			pr_err("Unknown test number %d\n", test_num);
+			return -EINVAL;
+		}
+	} else {
+		pr_err("invalid command format. Use 'testN'.\n");
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static ssize_t test_proc_read(struct file *file, char __user *buffer,
+			      size_t count, loff_t *pos)
+{
+	static const char usage[] = "KStackWatch Simplified Test Module\n"
+				    "============ usage ==============\n"
+				    "Usage:\n"
+				    "echo test{i} > /proc/kstackwatch_test\n"
+				    " test0 - test watch fire\n";
+
+	return simple_read_from_buffer(buffer, count, pos, usage,
+				       strlen(usage));
+}
+
+static const struct proc_ops test_proc_ops = {
+	.proc_read = test_proc_read,
+	.proc_write = test_proc_write,
+};
+
+static int __init kstackwatch_test_init(void)
+{
+	test_proc = proc_create("kstackwatch_test", 0600, NULL, &test_proc_ops);
+	if (!test_proc) {
+		pr_err("Failed to create proc entry\n");
+		return -ENOMEM;
+	}
+	pr_info("module loaded\n");
+	return 0;
+}
+
+static void __exit kstackwatch_test_exit(void)
+{
+	if (test_proc)
+		remove_proc_entry("kstackwatch_test", NULL);
+	pr_info("module unloaded\n");
+}
+
+module_init(kstackwatch_test_init);
+module_exit(kstackwatch_test_exit);
+
+MODULE_AUTHOR("Jinchao Wang");
+MODULE_DESCRIPTION("Simple KStackWatch Test Module");
+MODULE_LICENSE("GPL");
-- 
2.43.0

