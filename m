Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A1C3054F8
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 12:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758715263; cv=none; b=BV4nzA/z4peHBJjnEN26QN+xXsABWgqd15Al+Bw+x4oWlLN8dMoJCv0cXQcVabVRtQdL4vMeNSWn9z6vwhObe5r7a1Hf+ytveeIAUE86jEg8KVjBLeIi+SqXciy0A66qNa1W7MUbe8zEPTcutjP1GWEqu6S46t3gW0gimyzb0I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758715263; c=relaxed/simple;
	bh=MRrFyW+I6mT6efiU1OXLVN2gFXkBPQLJcvSrs8unkoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmvTaAs36H+CU4X5hT5mRkZ5MLQZh7hYAJRHMR9wG1vcG8FZcP0IIJtZqxQSexm+Z72sL3kQtpecz/Cn0TnQgsew1QMRPeT+yr36IsfiT6AdgSWSYW/8f1lTc72Zbzwxp4heoRnqqeHHwCC0ofyfgHSgLx1IeDGHBKVCmZ5rhUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Evky/1do; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Evky/1do"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-26f0c5455e2so33935785ad.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 05:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758715256; x=1759320056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiYrHsa7aujjpG04RUHlv+tCl0E3sN/Q3IgPp3O0OKQ=;
        b=Evky/1dovwvDe6tKQNBtoKiJdxpslBoQqCb9QlBfTPldOmqZdi4XPtqj3mF/6A76o5
         rjfTjrRoTYtTdELiypRc4B798gTjWx29nrjmivoRQlFC++NH2O+Cq9dpSFzbvXEQFGVN
         gBIRV8bBdWFknSYeBh/oiVvuu0HpFcPlDPWKjXPDFVwZ1dHBKXYbm0eu1OvoCQspeFYT
         +A2mhThOUwMj6BnRLS9frYGY9Qnl1D5lzxvjxpRjyKjBq+YmkII1GLNUGmmbZzWrYQ+u
         kzr1/WJ8LClqfBHoHYVqUI9kgmd9umgv7UKD4vjLSnHqGuHsuxiBWe7HdUyrnMI7PY6q
         7TPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758715256; x=1759320056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiYrHsa7aujjpG04RUHlv+tCl0E3sN/Q3IgPp3O0OKQ=;
        b=WUf4W7T3Fca1XCYbSpksRMmn5DUOZGMW7eLvAXXwpkAYPPeqrI+DuUqQqoPzQoMbTg
         Zvi5BJTcJIgDKyDjClfTBm1Vm9eXGk9XixlvKySC9+4e2WEdwaQHkY4I0yDzsczyB5HQ
         XDiikFeiTf9wS2o9e5tMpxmuj6BcbcFzmbQRDjSV/N/NgRIhFn2Mb7dVL3vuHXYyfeQi
         Yu5PFwlKWM9vuno1XeonTVXIGbXeMdmnhYoqQH4tfkyePKTTjVLh0JjaMgv47zbMNeuF
         n+m7EteBNBmIJqcJ6sNCPKQxKGWRU9HsYIhDLXVcCB9ehKfwzdo9rlVh941OaBvp7zw/
         CbHg==
X-Forwarded-Encrypted: i=1; AJvYcCWWXGVEb884lLwHwaGRDDwob42mcp20mYhqKaEBb3bbB9V7bkXacqhpBPeg0AUdfkKXcGHZByLQElY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh4YOqyQebDFGBVlPMAmjUwhoB/wygfjgbxAfFJT5cv5hGksjb
	MGGt7EW19etshsnX0Tz/r07NKDhAe/WbTbRMFA2S4/Uq8bkGOf//I+lB
X-Gm-Gg: ASbGncvdk7LxKLSgGTCOgoOAqEMkkum+q4imc+6ApbMpPu6+QEb9hZO2nYS0YuQZMC6
	QbSkKPCm62O9kaLFlxQFDKRd5hn2FowsCrlMbrNtcJjidpqypPBBIh4Q3TKjnouTMINqZwwNOQV
	tJEBbBO0sOPi2MeKTv3ifroje/TRsYvzxpOaa80M8WsvuPrpuuVK+0wUmvd9yB6u21mSSk6HP6Y
	AnViS90H/hvqKGv0owJgDYdwm05bVlyNMH6ToMuwp+MNeX+uQDGk83b3E7T3zfPsgybTrBj+7MF
	+KoxNaG26OB4QdvL8Kf4+HlxkbAqiCDO5e2yTGoahXF+BtlG1PdjOAQfjoomQ+eQcQwTvAyi8pz
	N/R4VuZQCZsrfDdgRF49AENk=
X-Google-Smtp-Source: AGHT+IFs+pk2K6CDamFeMFHcVYu2X9Tz8cIaHLxm9oBAZAOJoXA3qN4PilRWrqdc+4NKBFP6+zudHA==
X-Received: by 2002:a17:903:287:b0:272:1320:121f with SMTP id d9443c01a7336-27cc2d8f1dbmr76992035ad.27.1758715255830;
        Wed, 24 Sep 2025 05:00:55 -0700 (PDT)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980180bdesm188579175ad.56.2025.09.24.05.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:00:55 -0700 (PDT)
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
Subject: [PATCH v5 22/23] docs: add KStackWatch document
Date: Wed, 24 Sep 2025 19:59:28 +0800
Message-ID: <20250924115931.197077-7-wangjinchao600@gmail.com>
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

Add documentation for KStackWatch under Documentation/.

It provides an overview, main features, usage details, configuration
parameters, and example scenarios with test cases. The document also
explains how to locate function offsets and interpret logs.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 Documentation/dev-tools/index.rst       |   1 +
 Documentation/dev-tools/kstackwatch.rst | 316 ++++++++++++++++++++++++
 2 files changed, 317 insertions(+)
 create mode 100644 Documentation/dev-tools/kstackwatch.rst

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 65c54b27a60b..45eb828d9d65 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -31,6 +31,7 @@ Documentation/process/debugging/index.rst
    kcsan
    kfence
    kselftest
+   kstackwatch
    kunit/index
    ktap
    checkuapi
diff --git a/Documentation/dev-tools/kstackwatch.rst b/Documentation/dev-tools/kstackwatch.rst
new file mode 100644
index 000000000000..7a9e018ddccb
--- /dev/null
+++ b/Documentation/dev-tools/kstackwatch.rst
@@ -0,0 +1,316 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================================
+KStackWatch: Kernel Stack Watch
+=================================
+
+Overview
+========
+
+KStackWatch is a lightweight debugging tool designed to detect kernel stack
+corruption in real time. It installs a hardware breakpoint (watchpoint)
+at a function's specified offset using *kprobe.post_handler* and
+removes it in *fprobe.exit_handler*. This covers the full execution
+window and reports corruption immediately with time, location, and
+call stack.
+
+Main features:
+
+* Immediate and precise detection
+* Supports concurrent calls to the watched function
+* Lockless design, usable in any context
+* Depth filter for recursive calls
+* Minimal impact on reproducibility
+* Flexible procfs configuration with key=val syntax
+
+Usage
+=====
+
+KStackWatch is configured through */proc/kstackwatch* using a key=value
+format. Both long and short forms are supported. Writing an empty string
+disables the watch.
+
+.. code-block:: bash
+
+	# long form
+	echo func_name=? func_offset=? ... > /proc/kstackwatch
+
+	# short form
+	echo fn=? fo=? ... > /proc/kstackwatch
+
+	# disable
+	echo > /proc/kstackwatch
+
+The function name and the instruction offset where the watchpoint should
+be placed must be known. This information can be obtained from
+*objdump* or other tools.
+
+Required parameters
+--------------------
+
++--------------+--------+-----------------------------------------+
+| Parameter    | Short  | Description                             |
++==============+========+=========================================+
+| func_name    | fn     | Name of the target function             |
++--------------+--------+-----------------------------------------+
+| func_offset  | fo     | Instruction pointer offset              |
++--------------+--------+-----------------------------------------+
+
+Optional parameters
+--------------------
+
+Default 0 and can be omitted.
+Both decimal and hexadecimal are supported.
+
++--------------+--------+------------------------------------------------+
+| Parameter    | Short  | Description                                    |
++==============+========+================================================+
+| depth        | dp     | Recursion depth filter                         |
++--------------+--------+------------------------------------------------+
+| max_watch    | mw     | Maximum number of concurrent watchpoints       |
+|              |        | (default 0, capped by available hardware       |
+|              |        | breakpoints)                                   |
++--------------+--------+------------------------------------------------+
+| sp_offset    | so     | Watching addr offset from stack pointer        |
++--------------+--------+------------------------------------------------+
+| watch_len    | wl     | Watch length in bytes (1, 2, 4, 8, or 0),      |
+|              |        | 0 means automatically watch the stack canary   |
+|              |        | and ignore the ``sp_offset`` parameter         |
++--------------+--------+------------------------------------------------+
+
+Workflow Example
+================
+
+Silent corruption
+-----------------
+
+Consider *test3* in *kstackwatch_test.sh*. Run it directly:
+
+.. code-block:: bash
+
+	echo test3 >/proc/kstackwatch_test
+
+Sometimes, *test_mthread_victim()* may report as unhappy:
+
+.. code-block:: bash
+
+	[    7.807082] kstackwatch_test: victim[0][11]: unhappy buf[8]=0xabcdabcd
+
+Its source code is:
+
+.. code-block:: c
+
+	static void test_mthread_victim(int thread_id, int seq_id, u64 start_ns)
+	{
+		ulong buf[BUFFER_SIZE];
+
+		for (int j = 0; j < BUFFER_SIZE; j++)
+			buf[j] = 0xdeadbeef + seq_id;
+
+		if (start_ns)
+			silent_wait_us(start_ns, VICTIM_MINIOR_WAIT_NS);
+
+		for (int j = 0; j < BUFFER_SIZE; j++) {
+			if (buf[j] != (0xdeadbeef + seq_id)) {
+				pr_warn("victim[%d][%d]: unhappy buf[%d]=0x%lx\n",
+					thread_id, seq_id, j, buf[j]);
+				return;
+			}
+		}
+
+		pr_info("victim[%d][%d]: happy\n", thread_id, seq_id);
+	}
+
+From the source code, the report indicates buf[8] was unexpectedly modified,
+a case of silent corruption.
+
+Configuration
+-------------
+
+Since buf[8] is the corrupted variable, the following configuration shows
+how to use KStackWatch to detect its corruption.
+
+func_name
+~~~~~~~~~~~
+
+As seen, buf[8] is initialized and modified in *test_mthread_victim*(),
+which sets *func_name*.
+
+func_offset & sp_offset
+~~~~~~~~~~~~~~~~~~~~~~~~~
+The watchpoint should be set after the assignment and as close as
+possible, which sets *func_offset*.
+
+The watchpoint should be set to watch buf[8], which sets *sp_offset*.
+
+Use the objdump output to disassemble the function:
+
+.. code-block:: bash
+
+	objdump -S --disassemble=test_mthread_victim vmlinux
+
+A shortened output is:
+
+.. code-block:: text
+
+	static void test_mthread_victim(int thread_id, int seq_id, u64 start_ns)
+	{
+	ffffffff815cb4e0:       e8 5b 9b ca ff          call   ffffffff81275040 <__fentry__>
+	ffffffff815cb4e5:       55                      push   %rbp
+	ffffffff815cb4e6:       53                      push   %rbx
+	ffffffff815cb4e7:       48 81 ec 08 01 00 00    sub    $0x108,%rsp
+	ffffffff815cb4ee:       89 fd                   mov    %edi,%ebp
+	ffffffff815cb4f0:       89 f3                   mov    %esi,%ebx
+	ffffffff815cb4f2:       49 89 d0                mov    %rdx,%r8
+	ffffffff815cb4f5:       65 48 8b 05 0b cb 80    mov    %gs:0x280cb0b(%rip),%rax        # ffffffff83dd8008 <__stack_chk_guard>
+	ffffffff815cb4fc:       02
+	ffffffff815cb4fd:       48 89 84 24 00 01 00    mov    %rax,0x100(%rsp)
+	ffffffff815cb504:       00
+	ffffffff815cb505:       31 c0                   xor    %eax,%eax
+		ulong buf[BUFFER_SIZE];
+	ffffffff815cb507:       48 89 e2                mov    %rsp,%rdx
+	ffffffff815cb50a:       b9 20 00 00 00          mov    $0x20,%ecx
+	ffffffff815cb50f:       48 89 d7                mov    %rdx,%rdi
+	ffffffff815cb512:       f3 48 ab                rep stos %rax,%es:(%rdi)
+
+		for (int j = 0; j < BUFFER_SIZE; j++)
+	ffffffff815cb515:       eb 10                   jmp    ffffffff815cb527 <test_mthread_victim+0x47>
+			buf[j] = 0xdeadbeef + seq_id;
+	ffffffff815cb517:       8d 93 ef be ad de       lea    -0x21524111(%rbx),%edx
+	ffffffff815cb51d:       48 63 c8                movslq %eax,%rcx
+	ffffffff815cb520:       48 89 14 cc             mov    %rdx,(%rsp,%rcx,8)
+	ffffffff815cb524:       83 c0 01                add    $0x1,%eax
+	ffffffff815cb527:       83 f8 1f                cmp    $0x1f,%eax
+	ffffffff815cb52a:       7e eb                   jle    ffffffff815cb517 <test_mthread_victim+0x37>
+		if (start_ns)
+	ffffffff815cb52c:       4d 85 c0                test   %r8,%r8
+	ffffffff815cb52f:       75 21                   jne    ffffffff815cb552 <test_mthread_victim+0x72>
+			silent_wait_us(start_ns, VICTIM_MINIOR_WAIT_NS);
+	...
+	ffffffff815cb571:       48 8b 84 24 00 01 00    mov    0x100(%rsp),%rax
+	ffffffff815cb579:       65 48 2b 05 87 ca 80    sub    %gs:0x280ca87(%rip),%rax        # ffffffff83dd8008 <__stack_chk_guard>
+	...
+	ffffffff815cb5a1:       eb ce                   jmp    ffffffff815cb571 <test_mthread_victim+0x91>
+	}
+	ffffffff815cb5a3:       e8 d8 86 f1 00          call   ffffffff824e3c80 <__stack_chk_fail>
+
+
+func_offset
+^^^^^^^^^^^
+
+The function begins at ffffffff815cb4e0. The *buf* array is initialized in a loop.
+The instruction storing values into the array is at ffffffff815cb520, and the
+first instruction after the loop is at ffffffff815cb52c.
+
+Because KStackWatch uses *kprobe.post_handler*, the watchpoint can be
+set right after ffffffff815cb520. However, this may cause false positives
+because the watchpoint is active before buf[8] is fully assigned.
+
+An alternative is to place the watchpoint at ffffffff815cb52c, right
+after the loop. This avoids false positives but leaves a small window
+for false negatives.
+
+In this document, ffffffff815cb52c is chosen for cleaner logs. If false
+negatives are suspected, repeat the test to catch the corruption.
+
+The required offset is calculated from the function start:
+
+*func_offset* is 0x4c (ffffffff815cb52c - ffffffff815cb4e0).
+
+sp_offset
+^^^^^^^^^^^
+
+From the disassembly, the buf array is at the top of the stack,
+meaning buf == rsp. Therefore, buf[8] sits at rsp + 8 * sizeof(ulong) =
+rsp + 64. Thus, *sp_offset* is 64.
+
+Other parameters
+~~~~~~~~~~~~~~~~~~
+
+* *depth* is 0, as test_mthread_victim is not recursive
+* *max_watch* is 0 to use all available hwbps
+* *watch_len* is 8, the size of a ulong on x86_64
+
+Parameters with a value of 0 can be omitted as defaults.
+
+Configure the watch:
+
+.. code-block:: bash
+
+	echo "fn=test_mthread_victim fo=0x4c so=64 wl=8" > /proc/kstackwatch
+
+Now rerun the test:
+
+.. code-block:: bash
+
+	echo test3 >/proc/kstackwatch_test
+
+The dmesg log shows:
+
+.. code-block:: text
+
+	[    7.607074] kstackwatch: ========== KStackWatch: Caught stack corruption =======
+	[    7.607077] kstackwatch: config fn=test_mthread_victim fo=0x4c so=64 wl=8
+	[    7.607080] CPU: 2 UID: 0 PID: 347 Comm: corrupting Not tainted 6.17.0-rc7-00022-g90270f3db80a-dirty #509 PREEMPT(voluntary)
+	[    7.607083] Call Trace:
+	[    7.607084]  <#DB>
+	[    7.607085]  dump_stack_lvl+0x66/0xa0
+	[    7.607091]  ksw_watch_handler.part.0+0x2b/0x60
+	[    7.607094]  ksw_watch_handler+0xba/0xd0
+	[    7.607095]  ? test_mthread_corrupting+0x48/0xd0
+	[    7.607097]  ? kthread+0x10d/0x210
+	[    7.607099]  ? ret_from_fork+0x187/0x1e0
+	[    7.607102]  ? ret_from_fork_asm+0x1a/0x30
+	[    7.607105]  __perf_event_overflow+0x154/0x570
+	[    7.607108]  perf_bp_event+0xb4/0xc0
+	[    7.607112]  ? look_up_lock_class+0x59/0x150
+	[    7.607115]  hw_breakpoint_exceptions_notify+0xf7/0x110
+	[    7.607117]  notifier_call_chain+0x44/0x110
+	[    7.607119]  atomic_notifier_call_chain+0x5f/0x110
+	[    7.607121]  notify_die+0x4c/0xb0
+	[    7.607123]  exc_debug_kernel+0xaf/0x170
+	[    7.607126]  asm_exc_debug+0x1e/0x40
+	[    7.607127] RIP: 0010:test_mthread_corrupting+0x48/0xd0
+	[    7.607129] Code: c7 80 0a 24 83 e8 48 f1 f1 00 48 85 c0 74 dd eb 30 bb 00 00 00 00 eb 59 48 63 c2 48 c1 e0 03 48 03 03 be cd ab cd ab 48 89 30 <83> c2 01 b8 20 00 00 00 29 c8 39 d0 7f e0 48 8d 7b 10 e8 d1 86 d4
+	[    7.607130] RSP: 0018:ffffc90000acfee0 EFLAGS: 00000286
+	[    7.607132] RAX: ffffc90000a13de8 RBX: ffff888102d57580 RCX: 0000000000000008
+	[    7.607132] RDX: 0000000000000008 RSI: 00000000abcdabcd RDI: ffffc90000acfe00
+	[    7.607133] RBP: ffff8881085bc800 R08: 0000000000000001 R09: 0000000000000000
+	[    7.607133] R10: 0000000000000001 R11: 0000000000000000 R12: ffff888105398000
+	[    7.607134] R13: ffff8881085bc800 R14: ffffffff815cb660 R15: 0000000000000000
+	[    7.607134]  ? __pfx_test_mthread_corrupting+0x10/0x10
+	[    7.607137]  </#DB>
+	[    7.607138]  <TASK>
+	[    7.607138]  kthread+0x10d/0x210
+	[    7.607140]  ? __pfx_kthread+0x10/0x10
+	[    7.607141]  ret_from_fork+0x187/0x1e0
+	[    7.607143]  ? __pfx_kthread+0x10/0x10
+	[    7.607144]  ret_from_fork_asm+0x1a/0x30
+	[    7.607147]  </TASK>
+	[    7.607147] kstackwatch: =================== KStackWatch End ===================
+	[    7.807082] kstackwatch_test: victim[0][11]: unhappy buf[8]=0xabcdabcd
+
+The line ``RIP: 0010:test_mthread_corrupting+0x48/0xd0`` shows the exact
+location where the corruption occurred. Now that the ``corrupting()`` function has
+been identified, it is straightforward to trace back to ``buggy()`` and fix the bug.
+
+
+More usage examples and corruption scenarios are provided in
+``kstackwatch_test.sh`` and ``mm/kstackwatch/test.c``.
+
+Limitations
+===========
+
+* Limited by available hardware breakpoints
+* Only one function can be watched at a time
+* Canary search limited to 128 * sizeof(ulong) from the current stack
+  pointer. This is sufficient for most cases, but has three limitations:
+
+  - If the stack frame is larger, the search may fail.
+  - If the function does not have a canary, the search may fail.
+  - If stack memory occasionally contains the same value as the canary,
+    it may be incorrectly matched.
+
+  In these cases, the user can provide the canary location using
+  ``sp_offset``, or treat any memory in the function prologue
+  as the canary.
-- 
2.43.0

