Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621766;
	b=ZLmWpwLWgL+0v7aii/lU2dsUnyMgrp4Bod1qk5Xx2YXtU8KRyC0FBrXP+9lV17Ne2Vsf
	 qnO7hKB6qnOxRbegagN4Pw3wiI1NqtNjvmK6cbbaKQXI2Ek/RVxskH9XA/hfTQ1tV8k5A
	 1MEtoYcqrkdtDXwzK+iys5GZhSWk+j9j65FuHQ3g8QE0dPxHlk6Q/62bk9Fl52c3FKeUO
	 5N34PQXHh9UMeax3vUNxEy89Rs1P1pNRyPRMDskmVpccNqKKTs5LWLpee7Vm2fUN37gzV
	 /6UZP1KFuLLCk5xI6xg4rq9szlLwwU/Lb/h2cH/l64cNp4ipvx7YTRFqBVUeMlAQDlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=a05nv5fincC2k/bvjU+c6gmqxIBRW8o0fYRmcOAk9I0=;
	b=Hx43/Si3UKT3QnJkBLKj5aNzvZgbNhI0IbVPF7i0c9qrBO6b+/F92Q75OVzS3t8U4vrj
	 wabrQHBGjjkjKcespaPrVePbDqvzqAm+5XOW2D+sG7HnG6YdCJmR1FiB8pHV6tTTjtsrD
	 Od/jC27JqKSMd+XOUPGnnMWga/CCEnHfy0veIwWDT0Ei0xyH25xniZp3dfYI+dTJnADbG
	 cqqTpe8zrhpOPV0Epy2b4kKMD52vxWB7/gNPJLTtfsl4zMq/I4rg2SQBBq5W7XsnCx1Fa
	 rAK6QLXlcA1h4Xb4No0T0Rs8huCSLY65oUOEuMO53lXRNh8mLEkzl73pSyULHazXTNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vcm9YzIQ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F89606A87B
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F89606A87B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vcm9YzIQ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so18393265e9.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621764; x=1794226564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a05nv5fincC2k/bvjU+c6gmqxIBRW8o0fYRmcOAk9I0=;
        b=vcm9YzIQOFVHOXv+tT+vOKl0R2mPxx8MLFjVxWEBW/qSxGg78kivt1ysTRtPc6Z8LF
         jcpQbBE77ezkl54ZlRTHRCvhwv2dsoFOVYfrT3hTypMDAENM3G2vhyxmsGj9t2n6NWUs
         qltuf2tIA+0frHoDJ2UI3nosIEZy3c+xl2IWtYw5OE6ECby0UbCZ7phcvlBq+WMFJuxA
         4Vj5TNwIRJ2uzKiiyruJeGmAWwvHAhrxjIWi53TZaDzE9krITT19127f2Fx5ECyWbZJZ
         7nvUsnFWo111AmPSMYiRw5BI39iONoRWzzN3aGKMjyc5koluLWGAhysnvqzRDS4e5w/3
         xyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621764; x=1794226564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a05nv5fincC2k/bvjU+c6gmqxIBRW8o0fYRmcOAk9I0=;
        b=N2CqzLs88EntN0T+VdJ2raBGHCFAxmR2WMPaQ8qKPYc4tnjaKZQHJJQuUqYIWjHggK
         FThMmtn85x20rhxe0ggCno/KiObDiqgOStBvpH7anZ1aycHzbMgbbKHcb6JF/fbfESRe
         OL6WnXfH19fzJuLNvECGo1/9WP8n6WvPADZJ2KK97eJY96wAjuNw8gsg2NMwxCzGT0cV
         OdmJlKkdoPtHJOZk8EaUoFXMEcVWvPZ+dN+I9zK41WsLErm442Uu2zEiFN3LNIvkR9CO
         ZkMVfLDHUs6L3VglMPLR1MuFf1T1rRU70IXm+xjjUqNgEiVPqP2osfuxoRsyHD1OPjE6
         xuXw==
X-Forwarded-Encrypted: i=1; AKwUvBzHt3qgEjCsONIv7whO311T5RcoXerlP8kl4Or98FHWuZeg35uk4ku/CsylBypEoAlEDOFxiYDtBFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzIQqpgpvt3maSWFYDh9DqwFPFU/+S+UMNvp2MqU04Rq2gKEFe
	sEWKvfYgjes98aBLLXuKj47DaLSzfwd6UMNzxD2SzzrH97TEhvM1oaI+F9c3YHHdNG8=
X-Gm-Gg: AYBFou092dTjL0DCD+Gpgfou0a3uB4eFUByzwzGyULI9saxOa4bfgZv8XdQ1VSG0/I5
	unEbmfFWQKhs2GO78jP42SOWsvGIxFo44MFkHawWyPvPgF9oyC2ULK0APTC9D1H/or9TBVYFBBK
	2muwCHB9cJstwsb9E0PeS+Lm+2H8d1rZXi7lXzyIKhAI7qv0xaPwjIa9RJVLBPxBCKCkliR5sB1
	wbAZJ++IQKz87d3+Hh6Px9XS+5xw86KpHcNd5pxQWPiwMzNk83R62RuT1Rd25Oe8QEody23aPQe
	cYad7U2lAwG6CFhE/WJSpPBvdcguONRcLuFohQXvtafiHXT9x4dABZ34t91ir5os3Nq8NpmK0aO
	ta0O4arJiLD27CS4rjedfT7UW2nu/CJQBP35kn8QZyEuqvUP5LblQPWUkZPuwKOZAi5m5Pb0+Do
	+1OPqOULltXEAlNsPJqRIF7k69WwzzldEGqs2LDoEsJL3+oxcgTB2xpuWfov+NGhJgdlMPB+ksz
	IeFvHwH+Cn5MbQcoBPcq4lT+3XuRU8XAf7tXp8vFQPHkoyYpI/W9n1KDPDluj65ObWFHzkstdQS
	z5ukmIRn2IQXc6cHagVdDUIskKk7vQToRlstWe2smsVQBlL3WKy/MVQ=
X-Received: by 2002:a05:600c:3b88:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ac187a6ffcmr237933795e9.29.1793621764239;
        Mon, 02 Nov 2026 04:16:04 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:16:03 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:30 +0000
Subject: [PATCH v3 16/18] perf test: Allow infinite named_thread loops
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-16-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
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
index f66ccd77bfe7..9fbfe7819a61 100644
--- a/tools/perf/Documentation/perf-test.txt
+++ b/tools/perf/Documentation/perf-test.txt
@@ -98,7 +98,7 @@ OPTIONS
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

