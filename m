Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A3E326D6E
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792707; cv=none; b=Z6nq5a/vKitbln9T21aRjOCDeQKkTsqe7VjTf/EhuH1F3vbT2FZH4+1RQp4mhhMxSCDYFyxMACGgHiNSr3vR8BQm5403kTjWbyUjC7eynY8ZUTkDOEduksp91uBdVt14Yd06bd9gfO7yAKwwq9ZmLTKPkCFJOQ+h3lZX9RfxUPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792707; c=relaxed/simple;
	bh=ARZpIKOlBzKXjre3Q9k7I/0rPX2+0FVqcnLvQ0SL+xQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=szGioHh417LaD0TWFT8qgEFvZ1+KSfUWT0nXZtLyU5TSALi0FGXyzT6RM2xstq5iaEuh+U5qT8feU1easXzUMkYDO6rCFkpUmXpz/BTn6fEqoAKbT9mEDigKJecolLcaC8Sg+QTgPoe8AVwF/aUo8bHqsAlMj1OK1SbjESPWxJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMhFpo0+; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMhFpo0+"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7ade456b6abso2702877b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 08:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792705; x=1763397505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OV6BMzpvIqPwW8tqyoqDeqegoFqswySAQs38qdvsWjQ=;
        b=WMhFpo0+fc8I2XzRVcLvXDPxY/9K/seUdY+dwPTE0soi/EN2G99WavgUEwqrtWzsQh
         H16pZs+dvOpD57zlEbs6T9nDQT51Yh0it26FDyGgkRHXtBPqtu6m5WarXEM8E3FyA/f1
         ehejOCnc+YIWV+k1QUgPfNASuMDAeL5IGzc717BoKU910zVkXgacjmhI88IcnoPGotjE
         IY1OWi3zKqgZw+wRXSHc1ord3WryIVf/7PtG0Hj8Ma2oHzZlcQmKKYMcekmMxROd2hK9
         lVnkHdNghicMP9pKYSQ/R9d04FQlvEbqV28hsNO2NYuNiziX0ONaSc6BqTkH822yqtXY
         0YfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792705; x=1763397505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OV6BMzpvIqPwW8tqyoqDeqegoFqswySAQs38qdvsWjQ=;
        b=i4lHL8VhsBqRYEFSnMVfsSzy8WtpqQGcJpI7yNrm7lnB+oPm71kwS4AYnv9anul4sX
         2pPCD6ae+A9r1SPf9xyQGN0alev/zntY3bJ+l0hAOHWBkwvhtvCloDfsNWHG3D6j5PbP
         7g4JyEQKiwwhuyyTaTucnoby72/FCnJ8xhIsglV0qpZokh7Mf4rNYJJRnEuGPm4ovIQb
         bwtBrYdGDJNp4iFt7ALngH34zN/P6gUGZk+MahEHvfkESP5kLuIwsua2sOTswekFcSgf
         3BQXuDxEq6lEvwh2Hvt0YyC/h2tJBcBJHF9s1m1VaIkqVkXWTwMPMnaA7XVOaNrFct7i
         6oMA==
X-Forwarded-Encrypted: i=1; AJvYcCXCPjxSL0UCjx9gcXzjwO5GYeZe++R/Q46Y9WAmIJLLmHmNLfDP/Rv4q7/diAxZhqy8XFg7LMWQmuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDnZ4xtcZjXdDOzrym3xL2lTJztNUVIqzoqxZRYEVaexacszVw
	CSfza8ahnJFn83SiaRvcVgXZhBDh8dr37f5MHrjI6qzrtjRMN+kO5lyp
X-Gm-Gg: ASbGncuj3XGZGDHWSn53p+MkOMXIBEblG2MtyHtBiO2I1EwvlYEc+fI0eu68xeUaAjG
	uew0bO+ve0KbuAw4eaUG7sUTMj8XuAb9GRGyjt9ki39nVtO6VDrTTofiHavC3y0P3XjBOHa2jvb
	p7F7o3ida+rS6WgAb2Xitp1JEBxiA/UPuGV/6cLpTCC4kZ2YrlzqB2rbeX5Jq+ASVNEz5dxeOFI
	oBgC5hpq6+mFm8atYFPc7cY0CtQZYsYHFIkGc8Y8XkuCPCYUKa1aZJ7rRSlqeYTssp1uiRsrg5D
	WnvuG4WYWBKpkDw70UnLlQLX0fJarkuD/dThJYHPNDBL2wwk8hNd+HW+hE8MU4ZP2nGMQ+KDfnA
	MHh13Z3BIxAzKE9IWbBfjEmyqIl0jNmMlv8NVrA9iwzgM1zaRs5u4B8rn+9jOkUSefYQvSNgcxZ
	9M7S9gKf9ea5ePEbStgQaOfQ==
X-Google-Smtp-Source: AGHT+IFPqCK5s7mZ0bMPwZdYahUYIC+qd++YwSpdh6nmmJ2pTVRZoEYmMMiGsvaFI6blh1/WMmJ4hA==
X-Received: by 2002:a05:6a00:883:b0:772:4319:e7ed with SMTP id d2e1a72fcca58-7b2277caeecmr11401444b3a.29.1762792705147;
        Mon, 10 Nov 2025 08:38:25 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccb5a31esm12324547b3a.63.2025.11.10.08.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:24 -0800 (PST)
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
Subject: [PATCH v8 23/27] mm/ksw: add recursive depth test
Date: Tue, 11 Nov 2025 00:36:18 +0800
Message-ID: <20251110163634.3686676-24-wangjinchao600@gmail.com>
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

Introduce a test that performs stack writes in recursive calls to exercise
stack watch at a specific recursion depth.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/test.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
index b3f363d9e1e8..1d196f72faba 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -17,6 +17,7 @@
 static struct dentry *test_file;
 
 #define BUFFER_SIZE 32
+#define MAX_DEPTH 6
 
 static void test_watch_fire(void)
 {
@@ -48,6 +49,21 @@ static void test_canary_overflow(void)
 	pr_info("exit of %s\n", __func__);
 }
 
+static void test_recursive_depth(int depth)
+{
+	u64 buffer[BUFFER_SIZE];
+
+	pr_info("entry of %s depth:%d\n", __func__, depth);
+
+	if (depth < MAX_DEPTH)
+		test_recursive_depth(depth + 1);
+
+	buffer[0] = depth;
+	barrier_data(buffer);
+
+	pr_info("exit of %s depth:%d\n", __func__, depth);
+}
+
 static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 				size_t count, loff_t *pos)
 {
@@ -73,6 +89,9 @@ static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 		case 1:
 			test_canary_overflow();
 			break;
+		case 2:
+			test_recursive_depth(0);
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -94,7 +113,8 @@ static ssize_t test_dbgfs_read(struct file *file, char __user *buffer,
 		"Usage:\n"
 		"echo test{i} > /sys/kernel/debug/kstackwatch/test\n"
 		" test0 - test watch fire\n"
-		" test1 - test canary overflow\n";
+		" test1 - test canary overflow\n"
+		" test2 - test recursive func\n";
 
 	return simple_read_from_buffer(buffer, count, ppos, usage,
 				       strlen(usage));
-- 
2.43.0

