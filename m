Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8498374A0A
	for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2026 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184002; cv=none; b=tjIw/gO258KAyds3VsFCzUHzv58T+bqTdxChYixvWYT1FI6IQ/DEy9VfbVGCDosWWbka+qU8dwzOBtCvLeua/CusecGqoTWIo6WvbAfGECKNve9Y5u49A6oucOvdbjnbO5pcoz5Y6ftnXUGVlMqLmRUqGe/30t+XVLgCbbNiOyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184002; c=relaxed/simple;
	bh=G4IEzobgfsKNObG/Hy6E+npwMk0v9FtMQFSITgNTZ6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AeuEapVNL0YBmI093tCO8ATjqCetDh+O+xuFWxLGkBFMuIK9fMJPZOYI0G4hVrH29G/qlspbyxYdsi/t1+36R0LjmDh8gHEqq3mDv/JTq7tW6SOpuhJYmuIpFNp24/WlXFKyM48CGlqNnT91BHbWV471nL90fnbylvsGPAS6FvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwzWLpiO; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwzWLpiO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so8229515e9.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 00:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791183998; x=1791788798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xfZ3u+8kppu334roBh57uG8qfuX2GjTQB+h2l+yzJBo=;
        b=VwzWLpiOfztIUc1wRTElHPs1dVYNdJsHKJ0SapWDzpi400QVhdHFVOAef7WnUg9OHo
         5XXmmGLIRYjHoLcohVJfkTjGAVCjyXYJQYz3bP5/n/6hSpISDNySm1XM8dbIa+RlOF56
         qMkZbaTFR4JkzosFUm6d7RegIdB/oDLIcro23jzinxLVRqwN8AUYmXL7A0P0Q4GN1kgi
         vcatDzoisvl4fViwpYPG9XpNyLS99hH78RWLf1Zk/pE8moFMJVP1vamkSHn3P1Lf7qdy
         FdNy89BbcTyad7klBCZ717/kRfb81eIWL26zJJedQVmkPrNIvDON3OsoPPxl9m8243LW
         Y/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183998; x=1791788798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xfZ3u+8kppu334roBh57uG8qfuX2GjTQB+h2l+yzJBo=;
        b=d6xnoydbLsDxcUWF5fC+UekIegWRGdIxb1b40jpW+nBkFvlHW+fdGDVl7ZHmku46yE
         sn0deLQj1NkathYDtlgi9WKbqmsizNKlckgiHSJYpLQLWkU1d2xrj85l2Ck93Y47MwGm
         I5MCM9HojzyCysKLSgh8fuYBn51qrym3P0NJe170BNmhqJdMURsEZnllu8jq8hFV8SzS
         DUqwiZCrs8RB1zfQdIaJWwBSeNfhzw2VzvCty17oM8v8J5dB0M1N/M0uotxsY78hxUGf
         pqHVjl91B7MH0FMarV+n+JjIu0v+3Ymw9XnOwuaECWCikbGVl+l3+YdZ/OddrPa3wkqY
         XO8g==
X-Forwarded-Encrypted: i=1; AKwUvBxTh+dikGUgASoWokRbopvgpq0VBVDZt68LZ+HuyEG6UfsObiwgpoLD7GMlspjs0uWx3tgDo2faDt4=@vger.kernel.org
X-Gm-Message-State: AFuF++nRDepZnEvjbiy2yHhQX95l5RJas4e4lg6+A5vKtsmrZGaZOgxs
	MX5VeubQ3/Ei7tm6Cv48wrqAss1x53AGU2zlfbetfN86fFCP7OsfsmLe
X-Gm-Gg: AYBFou0qZjLZ0Hwz/bnkWNrs/zZXFi8AU7A7MPuR2yb2PKoOaM9wy6aABD7o3sB9t3l
	NnfQ5as/rsMWLDHodInz6Z0KGSsLZHLkwAPz5Tzfj73+eJzb+hmw3pII3ziWUaaSQq1smhCPK/A
	nZ6bd8zourrUfwRhbbOrX9tu5GDqAA7YFkyZ+3UQRUKxbGRkvVqvqHQMCto7P9vhg0V/7psnfAQ
	BS8spZmvXCi8lkZnNPh4cJkFvURG+d/9M9YgcYORv48LRCEYRhW1Tf1jiM5DRn7yHqX/vtNSlbQ
	0m5fExgDg1Uag9hFtPN/SLbWNcX7OTr8DkmHmOLPOaJD/AebluOzDZ5BfpX+iD4sA8RSkxNIv1P
	/YVLrl8pEism38KXPL3WHkH+Yz6rA/FbFRZpS5eQ7PZQWUBBzghmUvWmaXamspAURpBNGY34nMV
	kg76rqNYDkbC1nuU5+ZoOp4rAmjtbhKANUErwSWPZe5cO5bnVzk28QD48JjOCX7C+YMCe9SWfeR
	k87YYYNNbBud3VgRQlViQ7r2j378L+SLHYXsLidWCRGysm7GSOvhpw+MI+nbBnxLwbmgkQa6FEN
	yJRQgoQChxTepPJRa15+6sMfuPFq725x1Icltp/+DbxuVfgtXcCy6+M4LJJTcCjbZrOjFYE/I7m
	rQQ==
X-Received: by 2002:a05:600c:46cc:b0:4a0:258a:8de4 with SMTP id 5b1f17b1804b1-4a0274e9c3dmr145299735e9.4.1791183998159;
        Mon, 05 Oct 2026 00:06:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16bcb9a21sm283461465e9.10.2026.10.05.00.06.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 00:06:37 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Stevens <stevensd@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Amery Hung <ameryhung@gmail.com>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [RFC PATCH v2 3/3] selftests/bpf: exercise task storage from hrtimer_start
Date: Mon,  5 Oct 2026 09:06:25 +0200
Message-Id: <20261005070625.8871-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261005070625.8871-1-kmehltretter@gmail.com>
References: <20261005070625.8871-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No BPF selftest creates task-local storage from a tracepoint which runs
while an hrtimer base raw lock is held.  On PREEMPT_RT, this can exercise
allocator rtmutexes inside a raw-lock section.

Attach a program to tp_btf/hrtimer_start for the test process.  Create and
delete task storage on every event and trigger 1,000 events with
timerfd_settime().  Detach the program before reading its counters, then
require at least one successful allocation and balanced attempt and
outcome counters.  Allocation failure remains valid for the best-effort
no-lock API.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 .../bpf/prog_tests/task_storage_hrtimer.c     | 50 +++++++++++++++++++
 .../bpf/progs/task_storage_hrtimer.c          | 48 ++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/task_storage_hrtimer.c
 create mode 100644 tools/testing/selftests/bpf/progs/task_storage_hrtimer.c

diff --git a/tools/testing/selftests/bpf/prog_tests/task_storage_hrtimer.c b/tools/testing/selftests/bpf/prog_tests/task_storage_hrtimer.c
new file mode 100644
index 000000000000..216e66263bf6
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/task_storage_hrtimer.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <sys/timerfd.h>
+#include <unistd.h>
+
+#include <test_progs.h>
+#include "task_storage_hrtimer.skel.h"
+
+#define TRIGGER_COUNT 1000
+
+void test_task_storage_hrtimer(void)
+{
+	struct itimerspec timer = {
+		.it_value.tv_nsec = 1000000,
+	};
+	struct task_storage_hrtimer *skel;
+	int err, fd = -1, i;
+
+	skel = task_storage_hrtimer__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "skel_open_and_load"))
+		return;
+
+	skel->bss->target_tgid = getpid();
+	err = task_storage_hrtimer__attach(skel);
+	if (!ASSERT_OK(err, "skel_attach"))
+		goto cleanup;
+
+	fd = timerfd_create(CLOCK_MONOTONIC, TFD_CLOEXEC);
+	if (!ASSERT_GE(fd, 0, "timerfd_create"))
+		goto cleanup;
+
+	for (i = 0; i < TRIGGER_COUNT; i++) {
+		err = timerfd_settime(fd, 0, &timer, NULL);
+		if (!ASSERT_OK(err, "timerfd_settime"))
+			goto cleanup;
+	}
+
+	task_storage_hrtimer__detach(skel);
+
+	ASSERT_GE(skel->bss->seen, TRIGGER_COUNT, "seen");
+	ASSERT_EQ(skel->bss->attempted, skel->bss->seen, "attempted");
+	ASSERT_GT(skel->bss->succeeded, 0, "succeeded");
+	ASSERT_EQ(skel->bss->delete_errors, 0, "delete_errors");
+	ASSERT_EQ(skel->bss->attempted,
+		  skel->bss->succeeded + skel->bss->failed, "attempts");
+
+cleanup:
+	if (fd >= 0)
+		close(fd);
+	task_storage_hrtimer__destroy(skel);
+}
diff --git a/tools/testing/selftests/bpf/progs/task_storage_hrtimer.c b/tools/testing/selftests/bpf/progs/task_storage_hrtimer.c
new file mode 100644
index 000000000000..a53c966f15b5
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/task_storage_hrtimer.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+
+char _license[] SEC("license") = "GPL";
+
+struct {
+	__uint(type, BPF_MAP_TYPE_TASK_STORAGE);
+	__uint(map_flags, BPF_F_NO_PREALLOC);
+	__type(key, int);
+	__type(value, long);
+} task_storage SEC(".maps");
+
+u32 target_tgid;
+u64 seen;
+u64 attempted;
+u64 succeeded;
+u64 failed;
+u64 delete_errors;
+
+SEC("tp_btf/hrtimer_start")
+int BPF_PROG(on_hrtimer_start, struct hrtimer *timer,
+	     enum hrtimer_mode mode, bool was_armed)
+{
+	struct task_struct *task;
+	long *storage;
+
+	if (bpf_get_current_pid_tgid() >> 32 != target_tgid)
+		return 0;
+
+	seen++;
+	attempted++;
+	task = bpf_get_current_task_btf();
+	storage = bpf_task_storage_get(&task_storage, task, NULL,
+				       BPF_LOCAL_STORAGE_GET_F_CREATE);
+	if (!storage) {
+		failed++;
+		return 0;
+	}
+
+	if (bpf_task_storage_delete(&task_storage, task))
+		delete_errors++;
+	else
+		succeeded++;
+
+	return 0;
+}
-- 
2.53.0

