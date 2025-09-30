Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA41526F478
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 02:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200366; cv=none; b=SrdH07bOXfldFgId0mbYZWnftkzIGESHYhlOMdRz0Hw89QGZbXvIe9dt/861sl/kobOJCPQyUM5f3o16Bgxk3NCUWyZ+uzDYQIjWoNidX6eyaAOLUEhxOGMv9U99Q0MwIGKnVzAiDYMsuHBcjZu8oUAvxdgVv/703OrAhGf5E8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200366; c=relaxed/simple;
	bh=fx5MM9mgeadn4AlECL2EeIytilVmfLOb03DEtE9qwqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1fcxQfVh2LsDWKtzT1jpd5lDsey5aS/k0yZLz5/F+/Ohb7WOJqS710Mz1hg8c0JnOxf7QqAMlGnXl1OcSLT0CqJZPPzQuhzjwj6iCOXhOgqXIv1uzxpnP3wjB7l+p9+uc4C9K4fy3Cb1ADsDvRxPmTitl2mnW0Hetz+bA920eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8FTpfIJ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8FTpfIJ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3305c08d9f6so4086222a91.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 19:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200363; x=1759805163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PODRMG2Z8bUUhx/yC1VRhywhZMIHoJSOmQZCJHqYhJ8=;
        b=O8FTpfIJF77/+l/7172sGlDYO/DOMo5RG88uwraCu875hTHNE0bM7ArPzbklo6ytFE
         zR9NVP40FJh3zKFPFukefT+P1Qdtkc6LZ1jvPjnjNMtj68m/urRKS5AlZCw/QBkqicul
         D1JcBQthKczeqPZs8T7bKuY211BpQIOnlX68p15YmiOWl8FsCvLqSznWkZ4df2PJ8Bzr
         wW+FN4iUeEV4mhIq+5aooFEYaK9kqrRcqLQFJ+dA5psUojE/v6IZKWCcKdyqvq6yG7Bb
         iWS1bGl4KItp8lQYgNeNyAzVuEsASVTJDn2AeYwaqo8md2Xb8YUbmi2/2TIB+w9Y2Mec
         P9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200363; x=1759805163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PODRMG2Z8bUUhx/yC1VRhywhZMIHoJSOmQZCJHqYhJ8=;
        b=HZUzQ7zixTkHyjFWW5Awttzs3nn7UdhsgP6c3tF1nSEsAGOi1ZqtXOgFZo0uLyX5MJ
         xzPri9d+5lapaXxrZKlPCXTMgFa01FSLayLUvJzvDtrnone04RVgLWiA7XUi/pufVlmc
         5AI7RYIKkpInjP6+QYcuVJMjnlAe5dLNKtZDzJWNVWc4FpsVz0SZNHTp3Q0FCRX7GTU+
         Nf6ZyEBUbHqi6jmz7NggbfpMw2LnsmfyAyss1vaeayE+vMeVZbNLv1FANKtoDDVL7vsp
         3weS+LZqQVGOcCG81nHVO6CslGZgym+YbRIoVZHByI6rhNx0Ga+6acNjL4kN/UKIX35y
         WqZg==
X-Forwarded-Encrypted: i=1; AJvYcCVxZZBPeU3zVengn0D6vbIzbt2GFqBtWZ/TERLkZrVUKkLCbELxoWuEZhz/Ilzg3x2L6hF0/JshO5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwTW+QhbvXxGlk1oDEl9t5mKAcaLS5DpcKpbZ20yPd+B5Wq1yF
	rRs15fdsK4O2rMAJ25asQhdSjV9ceDW4lFvXIeFdWPMrEHyWcaVlbmz8
X-Gm-Gg: ASbGncuxEDl85beTMx7FOL98/B4Lt5wHJDwddjBG2YmvYQIG6VLE5x9fpJqW22grIyo
	wa2sYNBeDrVS45cXcT9cSgfM9/WoqxuJ1r9qNHX6GJwXJUUnILR7fHQwMu4J9E5SWK2LpvCa4Dd
	q/tXAvhzYkaNSq4DX+CQhUlBt4QWU/ZxfrE334lzq7+XU7jUNZBLfDkM2VzK2BipETdXKdsp+3D
	1gUrLcmnrjzC4Fko5bkqjHYoKztaKGni1fmRSIs3IlbkCDUuZRz/XROlZvKGvtxEY76IhnBTfqI
	HIpEEj28ETllV/vqunleSsIFd6E1YEewEKV8wvWL0TvIkGuf0p2k87HlmlUVYtO8jmCtqKo9i+a
	IXYCLN8xjCBzH+qTVJbGsvEMmY3LC8ID7hkceereKpToSJ6jIGWGEAFN8TBizRAIFMit4AZFW1j
	Nd
X-Google-Smtp-Source: AGHT+IHP7Td3KbhlqylvVUhjonZ8jqxOR18BBallTWQed6L2+fSp22hmPw3ChS33nbn+ktPyuhPsHw==
X-Received: by 2002:a17:90b:264a:b0:32e:64ed:c20a with SMTP id 98e67ed59e1d1-3383aa8b143mr3140082a91.0.1759200362962;
        Mon, 29 Sep 2025 19:46:02 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-338387099d6sm2786368a91.10.2025.09.29.19.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:46:02 -0700 (PDT)
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
Subject: [PATCH v6 21/23] tools/ksw: add test script
Date: Tue, 30 Sep 2025 10:43:42 +0800
Message-ID: <20250930024402.1043776-22-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930024402.1043776-1-wangjinchao600@gmail.com>
References: <20250930024402.1043776-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a shell script to trigger test cases.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 tools/kstackwatch/kstackwatch_test.sh | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100755 tools/kstackwatch/kstackwatch_test.sh

diff --git a/tools/kstackwatch/kstackwatch_test.sh b/tools/kstackwatch/kstackwatch_test.sh
new file mode 100755
index 000000000000..35cad036ecee
--- /dev/null
+++ b/tools/kstackwatch/kstackwatch_test.sh
@@ -0,0 +1,52 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+echo "IMPORTANT: Before running, make sure you have updated the config values!"
+
+usage() {
+	echo "Usage: $0 [0-5]"
+	echo "  0  - test watch fire"
+	echo "  1  - test canary overflow"
+	echo "  2  - test recursive depth"
+	echo "  3  - test silent corruption"
+	echo "  4  - test multi-threaded silent corruption"
+	echo "  5  - test multi-threaded overflow"
+}
+
+run_test() {
+	local test_num=$1
+	case "$test_num" in
+	0) echo fn=test_watch_fire fo=0x29 wl=8 >/sys/kernel/debug/kstackwatch/config
+	   echo test0 > /sys/kernel/debug/kstackwatch/test
+	   ;;
+	1) echo fn=test_canary_overflow fo=0x14 >/sys/kernel/debug/kstackwatch/config
+	   echo test1 >/sys/kernel/debug/kstackwatch/test
+	   ;;
+	2) echo fn=test_recursive_depth fo=0x2f dp=3 wl=8 so=0 >/sys/kernel/debug/kstackwatch/config
+	   echo test2 >/sys/kernel/debug/kstackwatch/test
+	   ;;
+	3) echo fn=test_mthread_victim fo=0x4c so=64 wl=8 >/sys/kernel/debug/kstackwatch/config
+	   echo test3 >/sys/kernel/debug/kstackwatch/test
+	   ;;
+	4) echo fn=test_mthread_victim fo=0x4c so=64 wl=8 >/sys/kernel/debug/kstackwatch/config
+	   echo test4 >/sys/kernel/debug/kstackwatch/test
+	   ;;
+	5) echo fn=test_mthread_buggy fo=0x16 so=0x100 wl=8 >/sys/kernel/debug/kstackwatch/config
+	   echo test5 >/sys/kernel/debug/kstackwatch/test
+	   ;;
+	*) usage
+	   exit 1 ;;
+	esac
+	# Reset watch after test
+	echo >/sys/kernel/debug/kstackwatch/config
+}
+
+# Check root and module
+[ "$EUID" -ne 0 ] && echo "Run as root" && exit 1
+for f in /sys/kernel/debug/kstackwatch/config /sys/kernel/debug/kstackwatch/test; do
+	[ ! -f "$f" ] && echo "$f not found" && exit 1
+done
+
+# Run
+[ -z "$1" ] && { usage; exit 0; }
+run_test "$1"
-- 
2.43.0

