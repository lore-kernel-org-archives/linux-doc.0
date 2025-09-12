Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A42F1FD3
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672007; cv=none; b=mDqqddW6k65SXWJfr4e4oH8jfUBCrI7rvsJ2iHTsk2nwRn2GJ5gGS9gwbN80B5KCUAHX6X4VYoZ+iLgKszTZUFdlr84bxq2tDF3AUW6txOQXI8YTmXjMDf4xToHtP0XzUnXAIQh/gi5PNXmRpLwhhxgxAyu0rIkUQoAeW9jb4tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672007; c=relaxed/simple;
	bh=xBysK8gV2dBvim56r1xsBo0HiYvpD2t6feorIo85ANY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dkUXr2g9Tc/QhbQsBNySFzjslvKn+mUjuZqKG2nRSOTIj7dLVZib3qTGSdwTaYcSIaq2LCAqm8zxNZUGRbpxT47NDp9+oXSqqXUW6aCcEK3a9EzID5HTvuBlK869BcCQPrIQAIPwZbN/6k4PXUYx8vQpRzwvqP2cF8VZzhUYkSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRey67IO; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRey67IO"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-32b863ed6b6so1502216a91.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757672003; x=1758276803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbQZ2RA/ceP/Xd/vXrNH7xFxG1mfw2BEk3J2LPmN1HA=;
        b=dRey67IOHZ/2rMxXC5cSne2seOyJbyfXHa/e77+0PEVEfo1XnT7TskSsVG3VSUULQT
         zLMjmUsl/gBqlrPWc4C8YXxJD8MD9t/7disQwBMZFEwieOj6ZGVinY6CqpvpqJLYfKiK
         Z4ZA6sgVntr/qLxtUuBq2FmtuK6cH7oxHSF3GIBzYy8CDk+1ZxFnAHJ2d+0V1i3AgJjo
         I+drPd7KjNyOS7wcJCxkmBdiEpC/ERH0DnXNr7Di4JhLjsqNq2sVj5cg63QHUmnaM3Dp
         j/oBZxWdcckvaS4k7Ln2C9uEqqH3jXTsD8o+LZVQDuT3pl/Qda3k1KbqPF22cs+Q0ij2
         5ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672003; x=1758276803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbQZ2RA/ceP/Xd/vXrNH7xFxG1mfw2BEk3J2LPmN1HA=;
        b=fWwtXqLOJaZXXmBtmgwPzbHaoXUd7sCB0UuOrSOFFa1imjq3mTPBjmakCWRgFyRqzJ
         7AEzZw2+L5i//h0j0Pb8RfrFhgvB8S+hYf1VPJ4BuQ+1RNDWdqVDeF39+U0Pee+t1qZO
         s033YYYEA1/D5317whFx66zvGOSd/Hu5gMSRbmOnOiyyWSkildpkFfTtAIL0gtrM2yj5
         sEMizkrS1i27diwu0W/u5nA7vdtt2YH+xwxyzQsdpbScBwLZ8eHEosZSp9hdGzVdNcfo
         ptYnWaZaL/2vM2JfOSvDKoJTb9bXV5fpxxBwqvQsQheuhctWCs1JwDIlqjUzeghcEcTf
         ZBqg==
X-Forwarded-Encrypted: i=1; AJvYcCVVkHyTGFsFNSfneTS+WBsJ/1Pmtm5DCSKH6HTp1YV938SGIDV6QdWjXLeXPtgCI34JBhrYBHMWzPA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy166ANkhZoPhOOxAKX/+zrB9WbxSRh+ZRMgV57TuBvE6jbNzsh
	sZIxMuAxIi6BLaKkiovcyE5eAYkCjIT7jFen5a80JvTP10XRe5ngDwPi
X-Gm-Gg: ASbGncta8GRNkSHfILodIlFmNiOW8YQgHZdhAbf7PRiHCEQVMXdr7v0sz8P7k5nPYhs
	TLAcvigOqlS6revXHD9mG21ZV8PESWp4ZWWA8c9UeuCEW15g3FXc0G2uMwwVhoOHScGxxUTeVxG
	xoQWq2tPeEv2Rb/6yCUh3OMGGyOPVc3Pc5DH1hId5e9nMTBcs84NlhY1wT4gAu5q+mpdW71uK5d
	tvjQhMD2ffFkgJpTePejKTyFrRPHlHJMX2EfRDgOmGsYMYYvm5Q80nXpCPkkdhBvis/ydZ+gGI1
	er5QeDNbpeOTHkl3I4izH1Y/HD0rFrbDqnz7+dDBklDUjz2nGwhND8LYJqX1B4+vcE0HohWsS1B
	YyqekPQCcQG2LO3/9B5spLHDzZTToCtbXmY0=
X-Google-Smtp-Source: AGHT+IF25l3C1E8p5GHeNvlIVkbp0kOIYt1wPzTaRq0s8H1fBwmcnKLuf8G6T/dCuiyhKBgfSsTJeA==
X-Received: by 2002:a17:90b:2b46:b0:32d:7093:7f6b with SMTP id 98e67ed59e1d1-32de4f96188mr2888054a91.30.1757672003490;
        Fri, 12 Sep 2025 03:13:23 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd98b3ea0sm5091462a91.18.2025.09.12.03.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:13:22 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
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
Subject: [PATCH v4 17/21] mm/ksw: add silent corruption test case
Date: Fri, 12 Sep 2025 18:11:27 +0800
Message-ID: <20250912101145.465708-18-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912101145.465708-1-wangjinchao600@gmail.com>
References: <20250912101145.465708-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new test scenario to simulate silent stack corruption:

- silent_corruption_buggy():
  exposes a local variable address globally without resetting it.
- silent_corruption_unwitting():
  reads the exposed pointer and modifies the memory, simulating a routine
  that unknowingly writes to another stack frame.
- silent_corruption_victim():
  demonstrates the effect of silent corruption on unrelated local variables.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/test.c | 96 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
index ab1a3f92b5e8..2b196f72ffd7 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -20,6 +20,9 @@ static struct proc_dir_entry *test_proc;
 #define BUFFER_SIZE 4
 #define MAX_DEPTH 6
 
+/* global variables for Silent corruption test */
+static u64 *g_corrupt_ptr;
+
 /*
  * Test Case 0: Write to the canary position directly (Canary Test)
  * use a u64 buffer array to ensure the canary will be placed
@@ -61,6 +64,92 @@ static void canary_test_overflow(void)
 	pr_info("canary overflow test completed\n");
 }
 
+static void do_something(int min_ms, int max_ms)
+{
+	u32 rand;
+
+	get_random_bytes(&rand, sizeof(rand));
+	rand = min_ms + rand % (max_ms - min_ms + 1);
+	msleep(rand);
+}
+
+static void silent_corruption_buggy(int i)
+{
+	u64 local_var;
+
+	pr_info("starting %s\n", __func__);
+
+	pr_info("%s %d local_var addr: 0x%lx\n", __func__, i,
+		(unsigned long)&local_var);
+	WRITE_ONCE(g_corrupt_ptr, &local_var);
+
+	do_something(50, 150);
+	//buggy: return without resetting g_corrupt_ptr
+}
+
+static void silent_corruption_victim(int i)
+{
+	u64 local_var;
+
+	local_var = 0xdeadbeef;
+	pr_info("starting %s %dth\n", __func__, i);
+	pr_info("%s local_var addr: 0x%lx\n", __func__,
+		(unsigned long)&local_var);
+
+	do_something(50, 150);
+
+	if (local_var != 0)
+		pr_info("%s %d happy with 0x%llx\n", __func__, i, local_var);
+	else
+		pr_info("%s %d unhappy with 0x%llx\n", __func__, i, local_var);
+}
+
+static int silent_corruption_unwitting(void *data)
+{
+	u64 *local_ptr;
+
+	pr_info("starting %s\n", __func__);
+
+	do {
+		local_ptr = READ_ONCE(g_corrupt_ptr);
+		do_something(500, 1000);
+	} while (!local_ptr);
+
+	local_ptr[0] = 0;
+
+	return 0;
+}
+
+/*
+ * Test Case 2: Silent Corruption
+ * buggy() does not protect its local var correctly
+ * unwitting() simply does its intended work
+ * victim() is unaware know what happened
+ */
+static void silent_corruption_test(void)
+{
+	struct task_struct *unwitting;
+
+	pr_info("starting %s\n", __func__);
+	WRITE_ONCE(g_corrupt_ptr, NULL);
+
+	unwitting = kthread_run(silent_corruption_unwitting, NULL, "unwitting");
+	if (IS_ERR(unwitting)) {
+		pr_err("failed to create thread2\n");
+		return;
+	}
+
+	silent_corruption_buggy(0);
+
+	/*
+	 * An iteration-based bug: The unwitting thread corrupts the victim's
+	 * stack. In a twist of fate, the victim's subsequent repetitions ensure
+	 * the corruption is contained, protecting the caller's stack.
+	 */
+	for (int i = 0; i < 20; i++)
+		silent_corruption_victim(i);
+}
+
 static ssize_t test_proc_write(struct file *file, const char __user *buffer,
 			       size_t count, loff_t *pos)
 {
@@ -88,6 +177,10 @@ static ssize_t test_proc_write(struct file *file, const char __user *buffer,
 			pr_info("triggering canary overflow test\n");
 			canary_test_overflow();
 			break;
+		case 2:
+			pr_info("triggering silent corruption test\n");
+			silent_corruption_test();
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -108,7 +201,8 @@ static ssize_t test_proc_read(struct file *file, char __user *buffer,
 		"==================================\n"
 		"Usage:\n"
 		"  echo 'test0' > /proc/kstackwatch_test  - Canary write test\n"
-		"  echo 'test1' > /proc/kstackwatch_test  - Canary overflow test\n";
+		"  echo 'test1' > /proc/kstackwatch_test  - Canary overflow test\n"
+		"  echo 'test2' > /proc/kstackwatch_test  - Silent corruption test\n";
 
 	return simple_read_from_buffer(buffer, count, pos, usage,
 				       strlen(usage));
-- 
2.43.0

