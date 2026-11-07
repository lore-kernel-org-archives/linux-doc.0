Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030760;
	b=ZaA9WGiBITGSGk9bc4U3dYy08v+aukgPPmwyVaKWZ5b2ZGjYFOu5lJISxH5O8APUeWgr
	 tvB/6czPi8X2Cgdki9gwrELuWCRMe+XGQOSUx93ph6XMEqa8KP7evChjDsCHmS3W66jbK
	 OvvWQP0mKiOndkmdk+IemF8uBHHw9WFoxwC33ASrdbNqnjMWMgKWOt0fzZ5V1caISuXcB
	 k6n61UAJ04h0590t10HBFCg4YTm8Dl6SwUImkKJuAj3dLb3xeD8ld/VC7V9IoBXCfAg0S
	 /pge6aJ2BS+I7tKZw9XVWWrmkliQrPSl83YSueniaq17gsS5Vrxs73ggXLtUKJ0o8nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=u4nTXiGvoLBPJ6m6vBAshKxDWZY7SBPxeVPpU162HBU=;
	b=0WeQLRtgn7gZCa216flHwJatFS4qZoUjkcz2Z1xBbzHEJUq96qXqJcodbN1aPq/0oh8N
	 MIOYKPa4GJQI4ZPeSULaLR/GkYNDeyuJeqc4y5BE/7w+cXjQ2PlH42KPFvmO8QqrziRpg
	 Ev2cqcbJW1XAMqkxoDL61hfu2ruFkcgwLLDja7dkze+Re4L64Gy7R2SDQ4xnvilDqcequ
	 sFTAPs8PNgE93Kg9KN+PjgQ2SjSaw5POkjMQWu/OLvfmds7c1aiZEHPCjbDH/uJzV8rFE
	 jsCAWlU2yjSuyDn12qKttYBkvTbUpMVRJ1rpkuXP7no2qti+4XkcAB8SR7MNFYLdYyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTqb2z+O;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12E2606A32E
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 05:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B12E2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTqb2z+O
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed0b03ce3eso4874855ad.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 21:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794030759; x=1794635559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4nTXiGvoLBPJ6m6vBAshKxDWZY7SBPxeVPpU162HBU=;
        b=sTqb2z+Ot/B3iVi+LnWhL32Lbw/KBWJT8Nl/gLMpAslqtMx1sopqaITkjS/bC9tz2a
         oMmWG2xiahslalTLRYjLCx7AHb/oUXDC/7gnoI79oOqpVZF3sjaeRgvGdkERzNMWcrGg
         MZHWbGpaOJyeqiMP471einPsifL6/nuAzOdE7gBMFvq/oeQybdZ0BkjUiXk3joRvqGiT
         WGsROdgKOIoNFsdscRwWsP/CF1LJVluuJjTx2W2iIb62Cm5hQ5ZBOEp0T0Sa3dcUjlb7
         uv8eu6CoaXeF+rjFA5TEqXyzKN2I550LLOcG9BMHrss6JdP5FADjqvtZ1W0TE0YGvCbw
         XPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794030759; x=1794635559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4nTXiGvoLBPJ6m6vBAshKxDWZY7SBPxeVPpU162HBU=;
        b=IHpwFDj3TF3B1bhjzV1hZX4uz/XO2FTflDL5G1sHJZONl5RRVlur2zokesI0iheW86
         meeHbfPaDvtSpIg+s9onyEmPkiN3cEWLrT+HDcJfelOYWGyEAoamshQjAkowoIaTD3YI
         ujcN21OyI1vSfmJXy/rGvBhZJnmLOEggBGvRd05Nwk0Ap3KOTzlljAkrCpEUqQqLmFWD
         nZYDU0AbXBlUoul0zKnY95AYRNfRZUuN1r2sRQ/GYpk/BRYu5bq1ZdpAvbEH+gmsHuo6
         4v8nT3okrrUtex05a/lbp3k4uwE5dTv+UHzKMCuKyDUr8NPFFF+AMN6WFiyayD8Nv3yr
         8YoA==
X-Forwarded-Encrypted: i=1; AL+hErFVWZX3fRhWrxVXGpqs92hKofLT/oybN4mxR706uQBX4MhnHCbtFOUDUT15V0cv3aEHLeqwehmRGT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z90jJaHdp4EJ+t7E7mcAqj5SBaa/UPPfOj/cT0NxDIdeQSspsKn
	T9X7XhCWtlD6KOhU16NjV/9LQDq/QU3RUQ1Jj1bxT0NAsLHQKAkWOp0a
X-Gm-Gg: AYBFou0v3XYRdpeyWC+kyBiP4Gfbp9uAP4VBCHli5GJ3cQkM3J/q2MNVjxTAXeVcTBk
	yEz6ySK1AfX6CvsC+C6kwQt0pMAuVq5SzV+6pOrGHq3dK153OIBLqZHD9oeFZnIamo2Il/oBLmn
	G2nCu6A7GUTRDMqu7zVfYBCRp5v7BCn1QGW8y2gphebxcrA/pgBK+JOqnPYtzmfm6ZJG6Wnffwk
	fCpApxwG2Ed6npREPbpIdiSM9nRA6ngkm+c6rCQFtNKEyONhwtzFZzD4Ms0uW1q9gBzizB6xHaI
	KrqJu0lHg1PIX7JLuYyEP0Jy6dmECKPTVvnZ02OMqc/1kHScezlVUNCRGFiNOB5KmK+76ShU/4Z
	+ULFT+aXanfzWf5vZIKKVET98qV/JdQR5NkCMGLRTSIWOS1t2GrqMWvWbTJfZR1tPxi3eSbSwbs
	5PCkTts4tMO108ALZXVHzX3vgma1gtl1dyjwxFIrpl8REcsOTPTJWsSqjq9XZGv08XPl7oJ/wmA
	r7v0aMlu2tWWe5K1hX2qEtcTEFCz99baAZFXquaTuY2HHiGU3D7PJE7Ef+3TIaiGMGq5+Z/7aik
	H1OIWWQABlcBDyOjpWMsbbC72s2SPdtTTELlrFBP8G+rIqP5jjW2e/gqFtHtYxSQbFSu1g==
X-Received: by 2002:a17:903:1a30:b0:2ed:18cc:d3b3 with SMTP id d9443c01a7336-2ed405ee120mr57893445ad.6.1794030758978;
        Fri, 06 Nov 2026 21:52:38 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d8949fsm11189465ad.62.2026.11.06.21.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:52:37 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com,
	lkp@intel.com
Subject: [PATCH v8 4/5] Documentation: tracing: Document the ftrace stackmap
Date: Sat,  7 Nov 2026 13:51:38 +0800
Message-Id: <20261107055139.3138633-5-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107055139.3138633-1-lipengfei28@xiaomi.com>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pengfei Li <lipengfei28@xiaomi.com>

Describe how to use the stackmap, how reset and free behave, and how to
resolve a trace that spans resets. List the option in ftrace.rst.

Assisted-by: LLM
Signed-off-by: Pengfei Li <lipengfei28@xiaomi.com>
---
 Documentation/trace/ftrace-stackmap.rst | 192 ++++++++++++++++++++++++
 Documentation/trace/ftrace.rst          |   6 +
 Documentation/trace/index.rst           |   1 +
 3 files changed, 199 insertions(+)
 create mode 100644 Documentation/trace/ftrace-stackmap.rst

diff --git a/Documentation/trace/ftrace-stackmap.rst b/Documentation/trace/ftrace-stackmap.rst
new file mode 100644
index 000000000000..58af7c564b10
--- /dev/null
+++ b/Documentation/trace/ftrace-stackmap.rst
@@ -0,0 +1,192 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================
+Ftrace Stack Map
+======================
+
+:Author: Pengfei Li <lipengfei28@xiaomi.com>
+
+Overview
+========
+
+The ftrace stack map provides stack trace deduplication for the ftrace
+ring buffer. When enabled, instead of a full kernel stack trace event
+(typically 80-160 bytes) for each stack the map can store, ftrace writes a
+fixed-size event of 20-24 bytes, depending on the architecture, that holds
+a 64-bit cookie: the map generation in the high 32 bits and the slot index
+in the low 32. The full stacks are kept once in a separate hash table and
+exported via tracefs for userspace to resolve.
+
+It is similar to eBPF's ``BPF_MAP_TYPE_STACK_TRACE``.
+
+Configuration
+=============
+
+Enable ``CONFIG_FTRACE_STACKMAP=y`` in the kernel config.
+
+The map holds up to 16384 distinct stacks. It is allocated when the
+``stackmap`` option is first enabled; if the allocation fails, enabling
+the option fails with ``-ENOMEM``. The map stays allocated while the
+option is turned off, so a trace can still be resolved, until ``free``
+is written to ``stack_map``. On a 64-bit kernel the map takes about
+8.6 MiB.
+
+Usage
+=====
+
+Enable stack deduplication for event stacks::
+
+    echo 1 > /sys/kernel/tracing/options/stackmap
+    echo 1 > /sys/kernel/tracing/options/stacktrace
+    echo 1 > /sys/kernel/tracing/events/sched/sched_switch/enable
+
+The function tracer records stacks through its own option instead of
+``stacktrace``::
+
+    echo vfs_read > /sys/kernel/tracing/set_ftrace_filter
+    echo function > /sys/kernel/tracing/current_tracer
+    echo 1 > /sys/kernel/tracing/options/func_stack_trace
+
+The trace output will show ``<stack_id N gen G>`` instead of full stack
+traces, where N is the slot and G the map generation::
+
+    sh-1234 [006] d.h.. 123.456789: <stack_id 42 gen 1>
+
+Stacks are not always replaced. A stack deeper than 64 frames, a stack
+recorded before the map is allocated or during a reset, a stack that
+another context is inserting at the same moment, and a stack the map
+cannot store (element pool exhausted, probe limit, or ring buffer
+reservation failure) are recorded in full. A trace can therefore contain
+both ``<stack_id N gen G>`` records and full ``<stack trace>`` records.
+With the option enabled, a stack recorded where RCU is not watching is
+discarded.
+
+To view the actual stacks::
+
+    cat /sys/kernel/tracing/stack_map
+
+Output format::
+
+    stack_id 42 gen 1 ref 1337 depth 8
+     => schedule+0x48/0xc0
+     => schedule_timeout+0x1c/0x30
+     ...
+
+``ref`` is the number of times the stack was recorded as a cookie since
+the last reset. It is not decremented when events leave the ring buffer,
+and it saturates at ``INT_MAX``.
+
+To view statistics::
+
+    cat /sys/kernel/tracing/stack_map_stat
+
+Output::
+
+    generation: 1
+    entries: 2500
+    capacity: 16384
+    successes: 148923
+    fallbacks: 0
+
+``entries`` is the number of map elements reserved since the last reset;
+an insertion in progress can make it briefly exceed the number of records
+in ``stack_map``. ``successes`` is the number of stacks recorded as a
+cookie. ``fallbacks`` is the number of stacks the map could not store
+because the element pool was exhausted or the probe limit was reached;
+those are recorded in full instead. The other cases above are not
+counted. A growing
+``fallbacks`` count means the map is too small or too crowded; a reset
+makes room again. The file is empty while no map is allocated.
+
+To reset the stack map::
+
+    echo 0 > /sys/kernel/tracing/stack_map
+
+To release the map once the option is off::
+
+    echo 0 > /sys/kernel/tracing/options/stackmap
+    echo free > /sys/kernel/tracing/stack_map
+
+``free`` fails with ``-EBUSY`` while the option is enabled. A ``stack_map``
+file opened for reading before ``free`` keeps the old map. ``free`` blocks
+until all such files are closed, then releases the memory, so a process
+that has one open must close it first. If ``free`` is written through a
+file that is also open for reading, that file is not waited for: ``free``
+returns and the memory is released when that file is closed. If the writer
+is killed while it waits, the map has already been removed, and its memory
+is released when the last such file is closed.
+
+Reset clears the map without touching the trace buffer, and tracing does
+not have to be stopped. Reset and ``free`` both leave cookies in the trace
+buffer; the generation changes, so those cookies no longer match the map.
+A cookie only resolves against ``stack_map`` records of the same
+generation. The generation in a cookie is 32 bits. It only has to tell
+resets apart, and wraps after 2^32 resets and frees.
+
+To resolve a trace that spans resets, save ``stack_map`` before each
+reset. ``stack_map`` is not a snapshot of concurrent insertions: a read
+can include stacks inserted while it is in progress and can miss stacks
+inserted into slots it has already passed. A reader that spans a reset
+can get records of two generations across separate ``read()`` calls; the
+``gen`` field shows this. Stop tracing across the copy and the reset if
+every record must resolve.
+
+Boot-time activation
+====================
+
+The stackmap option can be enabled from the kernel command line::
+
+    trace_options=stackmap,stacktrace
+
+The map is then allocated when tracefs initializes. Stacks recorded before
+that are recorded in full. If the allocation fails, the option is turned
+off and a warning is printed.
+
+The stack_map files
+===================
+
+``stack_map`` (mode 0640) and ``stack_map_stat`` (mode 0440) exist when
+``CONFIG_FTRACE_STACKMAP`` is enabled, also before the map is allocated.
+While no map is allocated, both are empty. Writing ``0`` to ``stack_map``
+resets the map; writing ``free`` releases it.
+
+Design
+======
+
+The stack map is modeled after ``tracing_map.c`` (used by hist triggers):
+
+- **Lookup/Insert**: Lock-free via ``cmpxchg``, safe in NMI and IRQ context
+  where RCU is watching
+- **Memory**: Pre-allocated element pool, no allocation on the hot path
+- **Collision**: Linear probing with a 2x over-provisioned table; probe
+  length is bounded so worst-case insert/lookup is O(1)
+- **Scope**: Top level trace array only
+- **Hash**: 32-bit jhash with a per-map random seed; full ``memcmp``
+  confirms matches
+
+The map holds at most one copy of a stack per generation. When a lookup
+reaches a slot with the same hash whose element is not yet published,
+another context is inserting that stack, or another stack with the same
+hash. The lookup does not wait, because in NMI context it may have
+interrupted that insert, and it does not add a second copy; that one stack
+is recorded in full instead. A context that loses the ``cmpxchg`` for a
+free slot re-reads the slot for the same reason.
+
+Differences from ``tracing_map``
+--------------------------------
+
+The table, the element pool and the probing follow ``tracing_map``. The
+stack map differs where its callers differ:
+
+- ``tracing_map_clear()`` requires its caller to keep inserts out. The
+  stack map does this itself: new callers are kept out and admitted ones
+  are drained with RCU before the map is cleared, so a reset can be
+  written to ``stack_map`` while tracing is active.
+- An insert that meets an unpublished element of the same hash records
+  the stack in full, which loses nothing. ``tracing_map`` spins instead,
+  since a lost insert there is a lost histogram update.
+- Probing stops after 64 slots, so a slot claimed without an element can
+  stay claimed. ``tracing_map`` has no probe limit and releases such a
+  slot, so that its loop always reaches a free slot.
+- The cookie is the slot index, so it stays valid while the map is not
+  reset; ``tracing_map`` hands out element pointers.
diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index 84f06bf0da9b..f90cf7575458 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -1396,6 +1396,12 @@ Here are the available options:
 	When set, a stack trace is recorded after any trace event
 	is recorded.
 
+  stackmap
+	When set, a recorded stack trace is replaced by a cookie that
+	refers to a single copy of the stack in the stack_map file.
+	Only for the top level trace array. See
+	Documentation/trace/ftrace-stackmap.rst.
+
   branch
 	Enable branch tracing with the tracer. This enables branch
 	tracer along with the currently set tracer. Enabling this
diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
index 5d9bf4694d5d..ac8b1141c23a 100644
--- a/Documentation/trace/index.rst
+++ b/Documentation/trace/index.rst
@@ -33,6 +33,7 @@ the Linux kernel.
    ftrace
    ftrace-design
    ftrace-uses
+   ftrace-stackmap
    kprobes
    kprobetrace
    fprobetrace
-- 
2.34.1

