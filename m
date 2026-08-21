Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6218447253F
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305796; cv=none; b=XBMHnOBH1gMJhD8CyZz8z2/B2fsimFVfbNHeA3dq4Q2mitWQi94nXs3a4UmOkTS9O1M83Jwtys2eEUSQubzVJUZ+9toJE0gFjLBQbq3eYrccaCmahG/MeksIpH2S6ep5ps0gpTC9XSZsxjaZwZYZVALHeK/etXKEDcrS75tzxYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305796; c=relaxed/simple;
	bh=rTMPj/k3Q/u75BzRf3kKvE+NUom8emDrF383KCKzh/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vv2BIJz8wdgEsEdHHLTJPdXo4d1azNJMGKVuU8kpYy+tEEZIbZCGFEXAHC6HY7MQUesb6GV2YFfb/AjtsB0yvoDV1MRkWNRGJigPzjL4p/P1Y5cunTHszyKhZV2LyWMJwdUJO+pJPsB6aX9QL1vnF6T13P4FEV779Z4sJhWcCrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xPBBt1HV; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xPBBt1HV"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f84023916so659284f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 02:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305782; x=1787910582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Jf25htTTjahKWtoEfo2hIZORvEQKfVJc2fvPx9rUTY=;
        b=xPBBt1HVtSCicig+auSHVMXi1J8mXZZWwff8aEJ660lfuZBAPxM9RXgPA1dzd7PZTz
         ByE2Qo6pEGk1zMCio/8zEJfVpxG9WT+VPPbhIqXICcs2iWF+fz7vvORgymjkULYtMkpy
         r+J0r03K0f5sY8OHd2uZcQCWNbeBsV5vdIvXZWQ79OOZrew10CuvmoYlwYUjXVmdK1nz
         ocKl0pBglFrOTNZaIbS6tEKKdXMDRcKIrq7A/Lp+uH2Jykue/uJUlcv9YSwAewyuFUVj
         /UhOrZgn1zhoXejPoq9cf+6ZYRbaMQyxCNL8O+PV5zE1YY3398/GZcqhheqDCu+K82NX
         dyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305782; x=1787910582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Jf25htTTjahKWtoEfo2hIZORvEQKfVJc2fvPx9rUTY=;
        b=TBN79ZmOU+T7+QbswhzE7ssNeYjUKm+kKOrytKn58mig8ySV5OhYvdIAPTfQiJssRc
         Nf3YpVkS8NoaNCFye8vbUoAE40kziRU5vw96trlFIYHp6RYEyuwPJuav6tZKCBqyDVMR
         4U9avHZ1V32kC/mzqKQRPccskc1Y1/bftPYi7pblRxwGFz7korm+9XQQ00Xg61eLJcwE
         IKnN6CJeMkcz58AR9c4H/DOKQoNo8SlARUKWHlGNbwq8uEEFXpBh0Wxfu69OWtNhayy+
         mGpogs7xU25CeyGsDd59+DH4io7pt6HtGJG6pD+VqqEYqcOGPt0tYk2HI3lNfksM0tVd
         KenA==
X-Forwarded-Encrypted: i=1; AHgh+RpOC8ImTvG0trrV5wXZc4u1nGYJ8q1J09yqORqJVlua70TL2suSxBhjFcBiUcgM73bsOlbEgFTfVNI=@vger.kernel.org
X-Gm-Message-State: AFuF++lZMy9t7R2pnJmAXDCd/gtUkjMdWlt9FM/7eQBkl21ss9usvQsN
	1USuf2JzPcTjBvIK1Pq/D/VC1byjDBvcnNYB9ysYJXPAa1iNmycyoBdlSyd9h8IXO+I=
X-Gm-Gg: AR+sD133eJGTme5aVkA53LEBQIq/+Hrb5eG/9FnoAocQnDtz2zZUpUe+d8tZVeBj+oP
	YrvmugowgAkcEi6lbHqLq+lgU96svmjqhNMfh4eJov6jdrCBghLiYvBYr/znysnkx3BeT9cu9xk
	hqLD6rI16GN9lF/QefMV1D1vOhFD/ZhvIQE1Ufmkba239iRopZgjvgllO8S2ps+nLl+FmTs8ksZ
	a2hOgFRaKl926wZKE+RlyUwjkWYLrTIhfi4i9MncKusBZRarouIRSlSNfBfnPqKy8JzBELoJFSc
	tvGy69MOPlyowYJmAWOOoe9mtIRy5mxMyU42pG8RYjawiMM+EZrLKYZd3Sj+wfQCwGkx6x1DN8T
	I7RhT9oJfs/laHQpZNkn3uppwFGwt0ogR/XiVvhpxx5b4d6XJOQfS+Xb3FdDoxcluqqF6I2Q+x2
	Z2E2qvwp8N/CqblXKSbNyxlyTG03uVIuofXjb5iusvdOKXx7qJw5Sv4fsgHOuo0gnu
X-Received: by 2002:a05:6000:2589:b0:482:bf17:e685 with SMTP id ffacd0b85a97d-482c0b88f19mr8390069f8f.11.1787305782104;
        Fri, 21 Aug 2026 02:49:42 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:10 +0100
Subject: [PATCH v2 12/14] perf test: Allow infinite named_thread loops
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-12-00c4fd0701b4@linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

The following test will want this to run forever, so add support by
treating 0 loops as infinite.

Convert i and named_threads_work to be unsigned to avoid undefined
signed overflow behavior in infinite loop mode.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-test.txt     | 2 +-
 tools/perf/tests/workloads/named_threads.c | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/perf/Documentation/perf-test.txt b/tools/perf/Documentation/perf-test.txt
index 859df74e62ef..dca8972fec8d 100644
--- a/tools/perf/Documentation/perf-test.txt
+++ b/tools/perf/Documentation/perf-test.txt
@@ -68,7 +68,7 @@ OPTIONS
 		nrloops: brstack, context_switch_loop
 
 	'named_threads' accepts the number of threads and the number of loops to
-	do in each thread.
+	do in each thread. Use 0 for an infinite loop.
 
 	The datasym, landlock, deterministic and callchain workloads don't accept
 	any.
diff --git a/tools/perf/tests/workloads/named_threads.c b/tools/perf/tests/workloads/named_threads.c
index d051d41a3cfe..6672c2f77684 100644
--- a/tools/perf/tests/workloads/named_threads.c
+++ b/tools/perf/tests/workloads/named_threads.c
@@ -11,7 +11,7 @@
 #define MAX_THREADS 25
 
 static int iterations = 500;
-int named_threads_work = 1234;
+unsigned int named_threads_work = 1234;
 
 typedef void *(*thread_fn_t)(void *);
 
@@ -19,7 +19,8 @@ typedef void *(*thread_fn_t)(void *);
 noinline void *named_threads_thread##n(void *arg __maybe_unused)	\
 {									\
 	pthread_setname_np(pthread_self(), "thread" #n);		\
-	for (int i = 0; i < iterations; i++)				\
+	for (unsigned int i = 0;					\
+	     i < (unsigned int) iterations || iterations == 0; i++)	\
 		named_threads_work += 3;				\
 									\
 	return NULL;							\
@@ -65,7 +66,7 @@ static thread_fn_t thread_fns[MAX_THREADS] = {
 
 /*
  * Creates argv[0] threads that run a unique function named "thread[x]" which performs
- * a multiplication in a loop for argv[1] loops.
+ * a multiplication in a loop for argv[1] loops (use 0 for infinite loop).
  */
 static int named_threads(int argc, const char **argv)
 {

-- 
2.43.0

