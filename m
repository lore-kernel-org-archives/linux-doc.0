Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794008755;
	b=MXDD73iJvAZFNEu06PeR48yh+Kfs96vHfbI40ALleM2XzA9re58rWnGOE8uLXb9OoEWh
	 gshZwWcjRK9S21ZjFOCOIPTf2LAisXB63TdJnHxhgA3Zvx/zOZleYYkjL+Y04RlMi6zPr
	 bnl9quPdHJu60OYlZLe7m1SymdBu1NKW7bZYd1WP83QGmh3CSczmSL8TpheNYxpg9k4re
	 X39YvAP9kmovvYH3WphCDIECiobqrJf89WtUtwQoGj/j6xIekDqhVwNQzLJ8KeYfXJiFb
	 BC3HT/tINiMIo1xm3u7WQhS7DbKeH86l1a+XyUCi2EGvbCFGz0HsN32BE0/43njuGbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794008755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MhHGkTaEbydCxyY9SDqSj3oHzv+5SX+XHoiBwpfap0o=;
	b=I3rYlo7ZFFgvzaaYnK+SSpHYV6iohHZa/oUUVHxQtuS63mrx/sXwqxkzTNmBgf/HZ+/i
	 HDLvu8MiMIDDLFeZN9mzNzWso7LOlPlDHYZP8Z+wZGAEvKugeOU6ZCdB2HvANJDsx49Na
	 qTAFue6hVKXVKGLksbE8qmAuN4jao5wNdDzYh9o5HEUQmEOzLGI5caUKUqhI3g6g41WBe
	 SZCQqljG6ampJp3SoZUfeyF3jU2xKFCxLZtrJlsfZ3ez2F6ZQW3wpFyL2Cd4je7HMYS+u
	 Rbzf6m6fQ3zgcf5c3u90+GV1rOE0qTjj30zF3wEFKnIRjEj4KFDL5scNvsShbSU2IzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgmCNSc0;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481CC606A326
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 23:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 481CC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgmCNSc0
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ea7987517aso6823025ad.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 15:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794008755; x=1794613555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MhHGkTaEbydCxyY9SDqSj3oHzv+5SX+XHoiBwpfap0o=;
        b=LgmCNSc0ZP7OCBFSx1oQ7UrzGDI/kgVRawRPNOAcNFCk2o1h9JTdAiwth7Ae/vJDRR
         ZQ3Hgzw92KMNVOWX2hNDXisE3FWQkxo6hx8x9GuL86uOXuIHc1BKOKEqWg0j1OvmVKUn
         elW5r6p0bo93EGTZnZtC4eMQ1P40c+EKh0Z25lVytxMdvQ78Bm5yDW2XOoZxkvnYLe88
         oCztE+GYfpoAVd2y4imyuV8j7ilNO6KarcGGW4Cq1+qOKZ+z/TFydemQgvyI3gCDRkoz
         isPj2dHoP3eALDL/S3XGyUsit3Itexrww8et+k/uAWx4KXAkLXXTbLUIZFTGAEfMHVWJ
         2bKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008755; x=1794613555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MhHGkTaEbydCxyY9SDqSj3oHzv+5SX+XHoiBwpfap0o=;
        b=cG9gPvuIzH8tLW9EClRSr5k/VFFnJ56Wa2sJY5LbPFl2aV3NhwjTCoX3aNJtzUbCWC
         +Xs8ue16eWvmE3hjuOqNxGof1N7ZMJ32fB+c+L+LhJ/KUy/2KJhjU7ABSfbUbWTJI5qi
         UEFTWK5Y4eSZDO900B8yBe+rvRna7N4WcE1YUe4hm2SCqjBHNTz4i45Hji/+wjawC+l3
         PCfveNdhrLj+hDaU8bB8DEw3pBqwwaNC3f2fA5G67QDK6diCoscihBNMvV0mI9+ux/X+
         gDmGuIuYDuRyap9rkH1mFILXWlKHowz/yds0LIir1mYpRerj/w5DJdyJXOX9BgQ0iKnm
         mmbQ==
X-Forwarded-Encrypted: i=1; AL+hErFNdnY+/CT3k15PxwvJg03EJLJQd5ciQy8pgCI2rs2Jb0mLCWF/gAyk7IIBarB2aTcsAGrDF0qus+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uQt8aSg1BoylIPTrX5cMFsGajOvnLi5WlbLgGQtC7oqO4lzV7
	6WSIXV4ltUiwKyOrufBLJtywy3mclnsekmZd7WF6rxZ9gYZ++gA68K2I
X-Gm-Gg: AYBFou1PIir75CvqCMXaTNrkKjRSi0UBNxgUndA89THLDAef05KfhiG19wzTiNuNpEB
	CmoB32Mhwhx5tunixaNpXumeg/DftYK7m6M/iea9CRaPF0dVjChlmAcN0K7gte9KpSqVAbvKrki
	tG7oLRkrmtWH38b+0wkDTCvV9ouVwyBLts4viruFfpILDu85dVv+d0RxIu4nk3XtPRCyWuXabUG
	TD+iTUKeE4xsuV1FWpQU9OaiCsvpnO+E4+DdscHWYtQHjDIfPrnCbEJAm6CmupP8s8PDTJek/MS
	3wcnd1YqDjJdvEdtbSzEEgTaqsNRy0qSHxUtAQjQt7/IfCebDjG66a8iRDEqLCk8cAK6wZtUi9B
	wql+BIkdPBRAAZKUuWkjZJ4Mu0JlqVZxl+7UFQVbnjuYw882wfYhwMOYWn+ujSXrLqtgFbpkYV1
	53pWvJFkbnL/5zLBaTNEcXLM38eWH9wPnnU3oydI/JOt01Txc8loVo8B4iGE9sEZELA8TKIVNew
	+PdwDw/wt6+MkkK81nm3zEbyIxfKNA7QQ4+jcYIss7Ki+zQOkFKl+8fBdYEszg1nhJtgyRA7syp
	IAxLLUybDnmf4j/MRFokg2L9K+g18rpVblsULyKLMw==
X-Received: by 2002:a17:90a:e708:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b0db6d3fc1mr3846365a91.27.1794008754637;
        Fri, 06 Nov 2026 15:45:54 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c3db1sm796145a91.4.2026.11.06.15.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:45:54 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] arm64: perf: Fix the userspace counter example link
Date: Fri,  6 Nov 2026 23:45:51 +0000
Message-ID: <20261106234551.1474417-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Documentation/arch/arm64/perf.rst points at
tools/perf/arch/arm64/tests/user-events.c, in the text and in the link
target, but the file does not exist: no file of that name is in
tools/perf/arch/arm64/tests/, and no commit in the history leading to
this base has added one.

The userspace register access described in this section is covered by
the "User space counter reading of instructions" and "User space
counter reading of cycles" cases in tools/perf/tests/mmap-basic.c.
That file is the only in-tree userspace test that walks the core PMUs,
pins the test task to each PMU's CPUs, and selects the PMU by its type
number when the kernel accepts the extended type.

perf test -v user runs the four cases in that file; the two reading
cases ask for user access through config1.

Point the text and the link target at that file.

make htmldocs does not fetch external links, so a plain documentation
build does not report it, but make linkcheckdocs does.  I checked that
the old link target returns 404 and the new one returns 200.  No kernel
was built.

The edit and this changelog were written with the help of an LLM
assistant (Hermes Agent).  I reviewed the diff and the reasoning, and I
am responsible for the submission.

Fixes: aa1005d15d2a ("Documentation: arm64: Document PMU counters access from userspace")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/perf.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/arm64/perf.rst b/Documentation/arch/arm64/perf.rst
index 997fd716b82f..236cb5da425a 100644
--- a/Documentation/arch/arm64/perf.rst
+++ b/Documentation/arch/arm64/perf.rst
@@ -140,9 +140,9 @@ only be enabled when the tasks are pinned to a homogeneous subset of cores and
 the corresponding PMU instance is opened by specifying the 'type' attribute.
 The use of generic event types is not supported in this case.
 
-Have a look at `tools/perf/arch/arm64/tests/user-events.c`_ for an example. It
-can be run using the perf tool to check that the access to the registers works
-correctly from userspace:
+Have a look at `tools/perf/tests/mmap-basic.c`_ for an example. The two
+'User space counter reading' tests in it can be run using the perf tool to
+check that the access to the registers works correctly from userspace:
 
 .. code-block:: sh
 
@@ -160,8 +160,8 @@ userspace must treat the upper 32-bits read from the counter as UNKNOWN. The
 and should be used to mask the upper bits as needed.
 
 .. Links
-.. _tools/perf/arch/arm64/tests/user-events.c:
-   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm64/tests/user-events.c
+.. _tools/perf/tests/mmap-basic.c:
+   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/tests/mmap-basic.c
 .. _tools/lib/perf/tests/test-evsel.c:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/tests/test-evsel.c
 

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0

