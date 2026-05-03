Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1142D8364
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777803368; cv=none; b=sCHqZNEjns7QV304nl4IaN7Oc6khN0T90Zl41v3qwW/Yy+VVRtvYsgW1d+2tv/7KdVBoDzbuBzXMXhvH8mYME3LsNV/KhWxmgLJplPaMvNgzM/AnB8+FchqTZi0YIaFM+yag6gnL81+H+RCn2XyDd2l0fr+D2sl7Sa5xX9ovXAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777803368; c=relaxed/simple;
	bh=/sxu5CvfKPXFXux+hejCCTZxZSIi+ftDnW9cLquSvuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CfV8ylWBNsYyI1/nVKF0s6TXQpcyRXEj00NNeBfL8G6kVyEWkfGJHEM2u/F/JzCRPrwOx8ZnWnzCtlBGTePi4OFHXCroZ2NTg+xW4kthnlEyobDrzswdT7b+Jxv/iHVZg3Jvzrz6n5LwtJOw8T+M6U4Mvn9UTuSNUl0q0DtGPGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYWdWSSl; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYWdWSSl"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ad9516a653so14418795ad.0
        for <linux-doc@vger.kernel.org>; Sun, 03 May 2026 03:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777803367; x=1778408167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbjMdqiCjFlkGqVQVI9QTUqfUWAzRgH3Vd+pPoavZZc=;
        b=NYWdWSSlsTMeYJMIaUmvG1Dhdov+/UjFH9C8K2XI5iQoudqBz2FdMgtrFOxiTOYhfY
         28hfaiLAKj8QiwYJA5ztzDG6A3j2iHHK6QvYEQxrdRommI36W0EnIJ2isrCe+2sZfbCt
         ORo2MeD4uZewFyDjsr0uGKeqBvhGOLwFolmr0V54fBfW7KPRCxfMbdLCDibXcbA+SYtC
         2uRfPY6S//AF0rwMurl0QQrCTSQ47B40h/x/SepZQ7elglsIXBpd1VEX96+RD8lHkrW6
         rACrcO/FpnJaNaFLFeFzJ597J4F5knk1Sr8a39Rjrcl4rr2WJ7wV5rjGw2NNxuZ2478z
         tkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777803367; x=1778408167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LbjMdqiCjFlkGqVQVI9QTUqfUWAzRgH3Vd+pPoavZZc=;
        b=iBAfA8UTxEkZUTjGo/5UwP5d66E5XTd1V24IKBpaKm16frkvDu0Tyy0JRJz+tDgcJP
         zK6mkMAJXMr9zzSbBtqPv23lk/YZvOgLU+g6fumMLd9A2jNDK5OTMtTmS8wMQWJSpBey
         Lq1r4mr4Y9iNzwroH0NjkUFaQBzkUoy9ZmmM0xz6r4H/HwpBEAfjuF0UuF4C8cj2vg7d
         T4TSq2ZZIwBN6jvH8n7nb/OC5V6KiHpPV3dtYCIoqvVKviHvtZ/4HwWRzuN4YDqxezat
         NN+uGF+6WzD6RWQ6rLPqM8T4iImY6DwvwPckVLfd06ECexIbAVBvWKdCjGHaeZuuhFF0
         Qcwg==
X-Forwarded-Encrypted: i=1; AFNElJ9WU0IJc5FIxQ4H61Xdb1+rv0ugdUHsKGiTH+V+KdXib1LjT+KPmrfMik8sdWqXfgn0l/qLQCoDgxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ibksDXTL51M4k5xUSo/XEWs28wKVU4Ol7Y+bT+wByuZ4gy4c
	cND2TSqvhcJJLkaRjdG2Du3a+A6BpFm+50wPUIEy7OlnMKKcbWzG6jaB
X-Gm-Gg: AeBDiesQvbq6BfrYnuGbCqzO9lnfTYqBwXAwFbDgnL+xp6RSghrNpCoIdj6BxIqRZBj
	G5ONupLk93cPHy2NgtNQvW6SBVykaWC1BCbEI8uwOwTi6hjDDMJdCoLP3niuWE6QuB1oQTdVgIo
	LjQQKiCjhAGA8LPxRTwpBV96/jF+eS5raB73pAqyhzrAq0sVvSEtaMjPqpp4PlMMUuqGpAReRqv
	ys+B2WYTWCALcb9aNJ5UgpkKSzIvETFmQnOxoDR9ECUEWdNj17mIyHibhPSbbv0UQbl+pUZTmkf
	gnJ2BDXaAPBsp9Sa6gJLC5YQWNEHCXbPOa8dXcMxv6xGkaYGroCz2paMoch+ze4jQA2VFf7r9Vh
	5eM+G1XfN9RTpC7sx2r5BdwvFkMqxNB8ebt2bVl9etM6NoVThvwerBFF3bjSFOUu3ueJ33EVILI
	xCCvk8kPax0FzuSQZ1n9uXXvyTGA==
X-Received: by 2002:a17:903:1b0b:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2b9f258971fmr50427385ad.18.1777803366918;
        Sun, 03 May 2026 03:16:06 -0700 (PDT)
Received: from apt ([140.123.97.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caad2bd7sm81073455ad.36.2026.05.03.03.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 03:16:06 -0700 (PDT)
From: Cheng-Han Wu <hank20010209@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheng-Han Wu <hank20010209@gmail.com>
Subject: [PATCH 3/4] docs: admin-guide: clarify perf bench all behavior
Date: Sun,  3 May 2026 18:14:28 +0800
Message-ID: <20260503101429.254394-4-hank20010209@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260503101429.254394-1-hank20010209@gmail.com>
References: <20260503101429.254394-1-hank20010209@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The workload tracing guide lists a fixed set of benchmarks for
"perf bench all". This list is stale and can become outdated when
perf adds, removes, or renames benchmark collections or individual
benchmarks.

Describe "perf bench all" as running all available benchmarks in the perf
bench framework instead. Also document how to list the collections and
benchmarks available on a given system.

Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
---
 .../admin-guide/workload-tracing.rst          | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
index 43a3c8098654..c49c2a00a8b8 100644
--- a/Documentation/admin-guide/workload-tracing.rst
+++ b/Documentation/admin-guide/workload-tracing.rst
@@ -243,13 +243,21 @@ which can help mitigate performance regressions. It also acts as a common
 benchmarking framework, enabling developers to easily create test cases,
 integrate transparently, and use performance-rich tooling.
 
-"perf bench all" command runs the following benchmarks:
+"perf bench all" runs all available benchmarks in the perf bench
+framework. The exact set of benchmarks depends on the perf version and on
+the features enabled when perf was built.
 
- * sched/messaging
- * sched/pipe
- * syscall/basic
- * mem/memcpy
- * mem/memset
+To list the benchmark collections available on the current system, run::
+
+  perf bench
+
+To list benchmarks in a collection, run::
+
+  perf bench <collection>
+
+For example, to list the benchmarks in the mem collection, run::
+
+  perf bench mem
 
 What is stress-ng and how do we use it?
 =======================================
-- 
2.52.0

