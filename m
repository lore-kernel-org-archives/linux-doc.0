Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF682DEA73
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007437; cv=none; b=GuMy6wNGRiTmLL6SOt+/Sq/HfbWJtKL32+hRqkkDkSxHrwKivH3aostmCoztLBbisNktV1IxhC9HNPkhdqv2tgwaMetUfp7ls3RCrWNczcK/uZdEZfusCg7Tq+BQrM8V1T1QuH6SrmWjrbYN6+CbAU7fPnJGkkLhZsPOwpBEyDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007437; c=relaxed/simple;
	bh=ZEq5LCeeZxdZtY+a+kvZMIoWs2Mzj+sOmq7f1LtT1gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M5mxwy7FhG7zvDfLHJh3BUHSRs1IO5t/uDa221Xuoce+TJU5jL+UOrG6KY3UfGSEMeAvkZPBu0l8GeDYsPK61WKz8xOFlGa+oR8er+nLA0Lx1ynUUnHYlfCnAUf6oPi+RZ9Z6OEBfo7Xg5AsmvDmKXsw7CVp5PT96g3J5ugQyt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4Pp6a8s; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4Pp6a8s"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b5579235200so481189a12.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 03:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007435; x=1760612235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd/jIJYyk1G6SYf0mNQVLBMDX4oiGoErfqkyMXn4+LQ=;
        b=b4Pp6a8sJa2n2qbeytpIz5f3NA41jueaqkOCK4dO/3SkRa/mkKIrszTCewtb9m1VLb
         nQ1TaaSOh9Ur23oJyv8NPwu2GvohB63qYmrD/tBwJDqKPNTURSvtPigdYglPHpchnuXR
         ggVIquQ78qxY6UziF6il6ugvescs6JyhxQFGS+xktMD1GSOksGVSpNntyv8YLNfgdT0h
         7idHSXMxt+oTelQbZbnOGwt5BH4Qdn+PDksw1YDErDcZlJiuIUbuM7hNRU7L/QkmTovZ
         ZnV38Aiatc12psZ0egrAHK54zUtPOfExPWXeKE7rZnuoWpWFp3kZXXEdD69UhOY1C5Ic
         9BCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007435; x=1760612235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bd/jIJYyk1G6SYf0mNQVLBMDX4oiGoErfqkyMXn4+LQ=;
        b=qqyXXERmhh1QxhnzVVVw57fuEvLahVRcZhlxwswHzgvqP8kMP5p3cQi8EOpISKnTU5
         XBFeRYiM5NDsYtAEg+Y2rd2MUcm3PizSLicD2VR6W8pTrSXqBTLVk41FgVmLeZ+657yQ
         TKy15ObqOgtAxtdhV2R8dn0usVyMGM6n7bzGbySScNhhlAsGlqmrlD7YdbgTjUBipjbZ
         l+K6UmpjJJSGwK9c0AH9vb9ZT2YRsZ4RpZy4THPVwYgQBDAQhtwaAsGRkGPmM4epOJKy
         aAY6MFrpxQggbWpQhubyO3MFjcPRrI0v4SI9GaU2cuPKlW+GXYMmT9MEruBvZk4FmyJM
         iisw==
X-Forwarded-Encrypted: i=1; AJvYcCU8fcxS+2jlJpZnqDCIsmacS00YSGf4dL87qaG4zOQuYC/YVdRkwEE7LgI6ttvWovdxGcbbeuQg83k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3pEFoaWvxDILY5SqJJcA/Wns5Wxumm2ppY2b+ldHSW3L+7IF7
	5MpRayxn5pezBr8Jtc97VCKHsE/fCD03zA1VEollMVsee8GQTgejT0hA
X-Gm-Gg: ASbGnctt6ZoRXOFj6lSbxOfTaBjx3i4H6TI8s3rwCO7sHuwQSHhgxBD5gHdHH9e2qO+
	H4A76ogZ0q0S87XirA4tKeVakVsOeSw3yu6gzlyBJpqqVKkuJi3LBmsKrAxit5JfygLSAbuZtnN
	4feRBPkZxf1k0B/W2zIzpsx41GwkZEQ4zJwUnKtUbLoMrb0PhPtUJUP8eKt+f2B6MpYesi3pAS3
	iFwOZTUE8Kh6ayJCqMh6CRDnpYU76hIjIiEPjJtO8M1peLSx6vTiva0hsZg/S8NwNvJm5XwkTJV
	LIOHAK4fVTNbFCF1p6UY6vn9OvkA6oKYG9GFysqy1XBXi+RD0OLHDzcpSRHocOfVYu+Eip7sHXD
	Qh+c1aHBmFvOXDBqktgKXMH+dMK6k/mEJj6QkC/bim63TD27gnpOT30YU/ifn
X-Google-Smtp-Source: AGHT+IEE3niJRONXV0Bm+xhadUZIixrOrMgOG5awbVzvEtTxP46vMAiWCgHmPSj8i4UN21ZLnxO2Nw==
X-Received: by 2002:a17:903:2c06:b0:27e:dc53:d239 with SMTP id d9443c01a7336-290272b547bmr83465905ad.35.1760007434817;
        Thu, 09 Oct 2025 03:57:14 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de9febsm25266445ad.7.2025.10.09.03.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:57:14 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
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
Subject: [PATCH v7 02/23] x86/hw_breakpoint: Add arch_reinstall_hw_breakpoint
Date: Thu,  9 Oct 2025 18:55:38 +0800
Message-ID: <20251009105650.168917-3-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009105650.168917-1-wangjinchao600@gmail.com>
References: <20251009105650.168917-1-wangjinchao600@gmail.com>
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

