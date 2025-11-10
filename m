Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7716284896
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 16:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792613; cv=none; b=Mj07DrBWoiXswB6ABfXOmR0pCQgV+W+GHnCyQ6Q6ll0vy6BhtLKwh4rBb6cuAPw2p07xSGjgrIyoOiGzZbznX4vdC2vqom2Cmo+QW/h51z+sgoWDDsgRLUCQrXXnItq/fCRUD92xI//fqPMeaqYRAKmrCNFMaApcdHnbsSwojrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792613; c=relaxed/simple;
	bh=ZEq5LCeeZxdZtY+a+kvZMIoWs2Mzj+sOmq7f1LtT1gE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CVzzZt3rw2Q1wpqjiumsrY3o4ndiBJXWNcj2mZNopyxNnBpPZ/23rYLQ/S0D+1wSUPRDoWnI8ggCljQ3/Jt4D7O5t1N+u3iGx2ZWnvJAZgMzkN3r34wljnu1bCU4Scm7smqvcNxBedtXKWWXI3wISFCP+Co4tmmDzkAveerEUWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRabdu46; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRabdu46"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3438231df5fso1781383a91.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 08:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792610; x=1763397410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bd/jIJYyk1G6SYf0mNQVLBMDX4oiGoErfqkyMXn4+LQ=;
        b=jRabdu46VsVuOHR63vEIRW4bFJWrUyUPWRGPfiFdsRr56n1/hyTUrG+utaSuwDnNSg
         dh8h3wgEkVWPMh82JArPRV9IvCttNB7kRZBpzMV2PdugyV/V6dipUVX1gjBuYk/Ehskx
         GJvmuwlqS0+G5X1krRIgPjL9F5ksQm+BwQEsVL8p/G8GFnO3s9K+xBMLg6UfzhNBpNym
         eNednzosnU7icEqs6IJhLw111u/Vnwe13TwOm5jbP01keq8CL4muYrVp1NNo8Wn3k1Q6
         2zn4b6FDMVmhayhu9RwNoNLkHQ4BdO8w55/KHEVA+xFAnCcg9JkgIwnnp2nIkQAQNF7K
         frIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792610; x=1763397410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bd/jIJYyk1G6SYf0mNQVLBMDX4oiGoErfqkyMXn4+LQ=;
        b=X91qN1C2drYt2K3YVXD4xzNmJvEeUrDIpH9wf5FCO16LgYFUnDPomf1WnXg9xYobTQ
         lIWVNIcIKup8VPnAFgyanNw+d7Z6SmfgULtxOo+kxwFGOqB6M64INpHj9x1D47KS76iV
         GHEvptqLzRaWFQrQtEBQVUdlhQpj49lsFwYB/TIoNdLGVXpoWvpea8O3piQ30ChoKT4Z
         kZKJZTk28byB8PDUyrk06wLWmZVMGXihU0Rc9MhhBiLrq+CjE2lZ3fUfb9d4fsoHOErR
         Rzp5kqRsKDmFjrPSWZi2q4BcagbHW+mqeyHXjyAvzoUP8nSahr/icGHmbnEBTknSCCgf
         T1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXqmT99/cPzvGU87dilecuL+9p8sDT9YqHS9mFKIVpgvsbelbDeEoBhek+cMiKQY0yf0mf21t0Uz8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvWQI/grbalDp7CHo5isAUd/dlrkrrjNzuowxs4KC5VbpwZyWx
	MyoVs871Nrn3pa1VhS5tUda0cHgdUJzGZXJvbUsy0O3Qs0PczwDHtCEe
X-Gm-Gg: ASbGncsT+KavPYwqbg7A7JmUzIaZtvP6AIaS8nCIS/yw0buKhfpCF/1e/69W+MwPFNu
	oy5RJS3Y0bSF/44pfNKW9vDLrDLSOCVpEEOCWaUShIp7dtAeKweDHxR+X3iNTg7ONa0nrT7lQkO
	pjx0RUt+Tdr10yJEi8mn0gBtCcnWicVUGT7nUdduDUJjjx/xNXXJRXzlZxhWYdTw44Tk1Fsrhf3
	ftJG9DEU1qF02Cs9Ej49Xyh8HEv93fXACGdYeuAX0+R58ZogfDu0RHAHU92WNBue9NJAFraIQTo
	BjqnYCg6jPo8Jqkgat/6GUDiRlSaHLv7eMad62jPOPsid3RjsbY9bCNP99i3X00J/eJjeizl6xm
	R0Vi1w6CdXI36esk7AXcXr/CxLdAFibKY7tBA+Zs7dVway2KyYOT01N62MsMLmI35aIWdYrDqE3
	mgpZYrSOjW7Mh4utarqUHlJQ==
X-Google-Smtp-Source: AGHT+IHC7aPoZ6nrAIOpkNf/Po8HO2SSr/NWVgq/h5VzJS+qKaFGcmt1davBTXDotW4c33fFW6QGWA==
X-Received: by 2002:a17:903:2f86:b0:295:1626:6be5 with SMTP id d9443c01a7336-297e57090dcmr104835365ad.44.1762792609610;
        Mon, 10 Nov 2025 08:36:49 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5d0c1sm150508695ad.27.2025.11.10.08.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:36:49 -0800 (PST)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	David Kaplan <david.kaplan@amd.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	Kees Cook <kees@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	"Liang Kan" <kan.liang@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Rong Xu <xur@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	workflows@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v8 02/27] x86/hw_breakpoint: Add arch_reinstall_hw_breakpoint
Date: Tue, 11 Nov 2025 00:35:57 +0800
Message-ID: <20251110163634.3686676-3-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110163634.3686676-1-wangjinchao600@gmail.com>
References: <20251110163634.3686676-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new arch_reinstall_hw_breakpoint() function can be used in an
atomic context, unlike the more expensive free and re-allocation path.
This allows callers to efficiently re-establish an existing breakpoint.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/x86/include/asm/hw_breakpoint.h | 2 ++
 arch/x86/kernel/hw_breakpoint.c      | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/x86/include/asm/hw_breakpoint.h b/arch/x86/include/asm/hw_breakpoint.h
index aa6adac6c3a2..c22cc4e87fc5 100644
--- a/arch/x86/include/asm/hw_breakpoint.h
+++ b/arch/x86/include/asm/hw_breakpoint.h
@@ -21,6 +21,7 @@ struct arch_hw_breakpoint {
 
 enum bp_slot_action {
 	BP_SLOT_ACTION_INSTALL,
+	BP_SLOT_ACTION_REINSTALL,
 	BP_SLOT_ACTION_UNINSTALL,
 };
 
@@ -65,6 +66,7 @@ extern int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
 
 
 int arch_install_hw_breakpoint(struct perf_event *bp);
+int arch_reinstall_hw_breakpoint(struct perf_event *bp);
 void arch_uninstall_hw_breakpoint(struct perf_event *bp);
 void hw_breakpoint_pmu_read(struct perf_event *bp);
 void hw_breakpoint_pmu_unthrottle(struct perf_event *bp);
diff --git a/arch/x86/kernel/hw_breakpoint.c b/arch/x86/kernel/hw_breakpoint.c
index 3658ace4bd8d..29c9369264d4 100644
--- a/arch/x86/kernel/hw_breakpoint.c
+++ b/arch/x86/kernel/hw_breakpoint.c
@@ -99,6 +99,10 @@ static int manage_bp_slot(struct perf_event *bp, enum bp_slot_action action)
 		old_bp = NULL;
 		new_bp = bp;
 		break;
+	case BP_SLOT_ACTION_REINSTALL:
+		old_bp = bp;
+		new_bp = bp;
+		break;
 	case BP_SLOT_ACTION_UNINSTALL:
 		old_bp = bp;
 		new_bp = NULL;
@@ -187,6 +191,11 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
 	return arch_manage_bp(bp, BP_SLOT_ACTION_INSTALL);
 }
 
+int arch_reinstall_hw_breakpoint(struct perf_event *bp)
+{
+	return arch_manage_bp(bp, BP_SLOT_ACTION_REINSTALL);
+}
+
 void arch_uninstall_hw_breakpoint(struct perf_event *bp)
 {
 	arch_manage_bp(bp, BP_SLOT_ACTION_UNINSTALL);
-- 
2.43.0

