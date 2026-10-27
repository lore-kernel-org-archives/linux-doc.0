Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082988;
	b=Ix0Ejo7cTeLw4kEdlIHPQPKZygUCiVlLXKli20AxQ5BpTLmiq2O3F0KrEu9jOAI02Mrr
	 ICwBd05s376hbn6KFFpiwFpY653bQoaN7F5KPl6DGbzzFKqqML5qXJC3/ArKRL0TwGlLu
	 8C/XHg0KKrQMjDCSkC9l7JBN666jrc5Woscjh/jTcbigXvHRQkXE3Dh75V6mARGg8Nk0A
	 9xDZtRKxYyipFdlVFnQhjfsrwxG7pHLH1vP+LWeIdRkUCHvbCfJ/Rx6gx/iykoWKbI9aW
	 RW05Ihygy6m6nSeLo20wVCYyZTW6zO+2OO7UN3rJCiPX+3z3rofdJxQazIAOsln8NMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=jw0B9wUqj1NgmgC61ADFFOy+zq/xWh/Ds6uCN7rNkRA=;
	b=4JqRKKLCB4ZfufFK4kHPD4aQ26OFh79vL+UfRMMpXZqfVLGkdFTH6KXBgA2NWbG//ab2
	 DoVo1LN0LvgEf8pPHXfCVnNq4n92SpOBSQ+GmfMzAn9EgxPUEJa15F4zHPnBLx4zWSe7i
	 wDPDp4/OJhNU15yDiZNXxSlzizBJn/drHRCZqJYg25+39Qx1QoS+VhUCA/T3I/M4hIMN8
	 AWDM8vVsBEnPRqm9lnmT5AFCxscAtrdjuidwU2Um3tobYpQb2Bc4gDTCcYfUmRfaONVYN
	 1YrF4fytq5+oaguMCLKp1l83cFVbknoRlvhHpy/v05eFIoKI8FmMRute73Z6netA8tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=A18XSYRR;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741B9606A31D
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 741B9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=A18XSYRR
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ea94541adbso12109215ad.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 23:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082987; x=1793687787; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jw0B9wUqj1NgmgC61ADFFOy+zq/xWh/Ds6uCN7rNkRA=;
        b=A18XSYRRAxSuAWoSFewKd3fToOwP31OZQcX8t96ooeQ0af1YK4YGm0a0Mh+VR4Ds3o
         KKXgJL7g9xHxAyYHn75yn3/px3xvE1TgYAHBlEqBP5CKh3xWxNqIP6X9Lo4mtgJNKz2j
         ka1lAlUYD/xQECFuOO9WSinqPf3RjRE1sqS5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082987; x=1793687787;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jw0B9wUqj1NgmgC61ADFFOy+zq/xWh/Ds6uCN7rNkRA=;
        b=HAL813GRRTkK1yu6rwyXDfeMtdYPEQtRsxV1PWgMMjBZ6k+M2/FajLwHm4peJFO4JZ
         OEf9FQRAPFJWi8lbwiHDcvwjGfGEG6CuJvA0zcIWEY7tBrWT+1oUQl5j+2rxhVeEHvkv
         EfXXHvXrrmVDdQ+A7vyk5k9rX4ApvNL03qZxXBuCcki1LWQIGzrnfzLBl5Yr2txEnoK0
         GF4v4D+9o4TJHCxaE7E8+f7M7fkqzyJNS5TXB+MmFInCOtVOE7DJ2HtoP5KoCjJQlfOH
         E2YfB304K2S8MRrSABLL991i9sZPbp5GSMkF+kT7cjVX0EkVDR85ifZKuD5g3yVIQdPH
         l3iQ==
X-Forwarded-Encrypted: i=1; AKwUvByU5Op4OeOrrYp1TkVfsphmz4l/L9cKN65fsV9C0JrpBpe/F4vFiGvd3EnBN6H9h+lOvau2jWSzd/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPMaoXXJpffLJ7tt0PjfJ1O6UDgEptWCi2mJAsAoOhICdEXUna
	uU8sePZQDwP07lWm43k5Kodk9cykYdpGLwKbPU19zG03pUBcM+b5ZrOmw8SEgu/PAYU=
X-Gm-Gg: AYBFou11EzxRGqMStq5CZm/2glU71+hp8B/YAtHooLk66O0YUWQQ8IZCH1xLmxDZCiH
	+0RKUrKTZN3HN6P6xq/8Y8btAfesq8/YMjYe/9LsZB4dRQcqSky2fY9Tik6wycQQhHwUUE875Cf
	Zo1dn5PXmU5nJnOzHklAHzdtZEpIvmRehLaJXjdDuCvQDrNdCCdLe2CbOJ+iz2qNs44h4zDjIXh
	Wvfot4WfCDebxcqlqCKcDWbJwoihv2G/Pa7tBxBrscD5s5bWgPOlLa4dE4mHYU03p2WNFjIZJBZ
	vZs8/sP0L7joY0rOtbVyHObYwXyapS8G36D2KHPkTbfcc/1wTuACPngYPzHMekueFuy3pFsztFu
	6Fjo4iuSGvtWUJs9sgGVWMCV8TqzCpaNrYQf1167aSzdG8V9FBfhy5exivnYx8Cs4dAk0mUplaY
	jda8g5M/vgIP8AyqQ8YsUmYIiFYy1cle89LaK7lmxszi9qa4mQdwSx2M8p67h3g1u+AyCkCJEzW
	t0P7o6j5lWqL4SUTMPz/vOalh6Co3WkcMpqB0g9N30AeGx2vP9FBA8Fe4BwhJpyv+lRL1jhpiyI
	lkkURimzPhIVN0XHks9PSZXNVTGrWGUmZ2025oxX6Afeug6kbSxfMKAQ//9dinlO/ToZWHgW5XG
	k6/AMhgfE7qRRbKXIpnyzTPA0uBEyIqTLj/50tOPIHEK9HOuiZrQXeqxX1WCCAJviwMFwn1mi
X-Received: by 2002:a17:903:3806:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2ea9c0f388fmr74433055ad.1.1793082986640;
        Mon, 26 Oct 2026 23:36:26 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b768ffsm4180085ad.24.2026.10.26.23.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:25 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:21 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
Message-ID: <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name>
References: <cover.1793082868.git.chris@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793082868.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

CONFIG_SCHED_STACK_END_CHECK makes schedule_debug() check the magic at
the end of the outgoing task's stack and panic if it has been
overwritten.

Right now this can only be configured by setting the Kconfig option at
build time. At Meta we have it on for some hosts and off for others,
since it is helpful but adds cost on context switching. That means today
we have to build separate kernels for each, which is less than ideal.

So let's make this configurable at boot time. In benchmarking sched pipe
and sched messaging performance is unaffected.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  8 +++++
 kernel/sched/core.c                           | 33 +++++++++++++++----
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fbee7b544903..95911d33c0fe 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6811,6 +6811,14 @@ Kernel parameters
 			core priority to both SMT siblings, so this option
 			does not favor either sibling.
 
+	sched_stack_end_check= [KNL]
+			Format: <bool>
+			Check the magic value at the end of the outgoing
+			task's stack (and its shadow call stack, if any) on
+			every call to schedule(), and panic if it has been
+			overwritten.
+			Default set by CONFIG_SCHED_STACK_END_CHECK.
+
 	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
 
 	schedstats=	[KNL,X86] Enable or disable scheduled statistics.
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index fc269fd10192..c1fb86b813bb 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6143,18 +6143,39 @@ static noinline void __schedule_bug(struct task_struct *prev)
 	add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
 }
 
+static DEFINE_STATIC_KEY_MAYBE_RO(CONFIG_SCHED_STACK_END_CHECK, sched_stack_end_check);
+
+static int __init setup_sched_stack_end_check(char *str)
+{
+	bool enable;
+
+	if (kstrtobool(str, &enable)) {
+		pr_warn("Unable to parse sched_stack_end_check=\n");
+		return 0;
+	}
+
+	if (enable)
+		static_branch_enable(&sched_stack_end_check);
+	else
+		static_branch_disable(&sched_stack_end_check);
+
+	return 1;
+}
+__setup("sched_stack_end_check=", setup_sched_stack_end_check);
+
 /*
  * Various schedule()-time debugging checks and statistics:
  */
 static inline void schedule_debug(struct task_struct *prev, bool preempt)
 {
-#ifdef CONFIG_SCHED_STACK_END_CHECK
-	if (task_stack_end_corrupted(prev))
-		panic("corrupted stack end detected inside scheduler\n");
+	if (static_branch_maybe(CONFIG_SCHED_STACK_END_CHECK,
+				&sched_stack_end_check)) {
+		if (task_stack_end_corrupted(prev))
+			panic("corrupted stack end detected inside scheduler\n");
 
-	if (scs_is_enabled() && task_scs_end_corrupted(prev))
-		panic("corrupted shadow stack detected inside scheduler\n");
-#endif
+		if (scs_is_enabled() && task_scs_end_corrupted(prev))
+			panic("corrupted shadow stack detected inside scheduler\n");
+	}
 
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 	if (!preempt && READ_ONCE(prev->__state) && prev->non_block_count) {
-- 
2.54.0

