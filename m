Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879149;
	b=DHiIYlIye1kwDalNpBVvLpCVnMt/GZ4IUEsSCRgR/DgbXXqvshEzdXECTOTLLovfGZ2/
	 21St9bpr8Qvj28FTwjBGxgfTf0nXD97SpeuVfse6zzty7i9A6kQySDbkFVZyhkr/j7Rnf
	 4VjxNttoh/nfQ89YdSRYO0Y7lTm1r5OxlYhe45kWQsMxXE50X1W/c+F7Te/KsGtXcO/WB
	 7Apf5utTx+xQHiQzWQa/KW4nkpycKiqoJtccQ8+obdeLmFOh1QtY1zFbkMka9TE4WsRFW
	 t47KpGDHZHuCjScSUPgDZkRaU78xJs9HXMT8IRbpbnoQ0Yz8VPt95der7ESa9I0vBFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YBXbNjgUg+UURoPn7/k5hFGZ3UtlzmwcEk29veboZWk=;
	b=0DZ0JLX05wbPYkBr6j2qaZ92PqMzgg70pfWseRya+Wq3NbKP5Seuyh36J2vwgka4hfTF
	 osqgrN5NQoHJ75w+f5L2zmoSRbcJmVVipHsJ7qtqQFS7T0bMdxvJAt/L0OscXVQUQl4uF
	 t/NSh593cQxg6a67yYK9bntKZBWWpRTKY7jL3PrvGUk3Wr87F1WdeHYn4JAyNY+2HW1vM
	 z403MOiqTnEGTntbwDjRY2xDxCUDDuf16Lrxz/q1OsevriMcmInxZdw4gPmZ2CylyppSA
	 xO5wDIHmtHncSODF49rc3GR+METJhi8Q5K+KZmNhibep0QgQ0rB9cNdmjfjQDRKkPvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QXZjlZBR;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809B1606A914
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809B1606A914
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QXZjlZBR
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a210470b49so13106515e9.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879148; x=1794483948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBXbNjgUg+UURoPn7/k5hFGZ3UtlzmwcEk29veboZWk=;
        b=QXZjlZBRLrL4zh6jqKcmVEsLXNyTo1+0+eFVMO5jjFDWMyoTCuXeg2YbleOVXmuedc
         0YDKZMEZ0/41MTeg8DsKjGRUnmFzCEhz27eTOGL+4+SYfHJANycEzMbBVGo1xL105Oe3
         jRoZHaRA7MrdqLELwa2XQAKQxArMWfHILAD0GVJH6LOVGB0kRfXE1QKPxK104UdfphCl
         GdFDU8Xs7sOWNZT3CGJmcFMeVhvbjb+nxanx8HTWhdYqsLcq3BNNSKt3w3kS1Q0km+6J
         ddyrtRiNJQI0BM85ZDRy8WAea9Nqb7187cm56s1EKRK6hC6We4bnMtXiXNxr6o8i9oBH
         4VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879148; x=1794483948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBXbNjgUg+UURoPn7/k5hFGZ3UtlzmwcEk29veboZWk=;
        b=lHDs9cBUrHwXmqTbJAk6KqK+Qe1IeFLs8iw4bBqmZnXum86XaovBEuoQy+sZ1dXDy3
         3FOVtwVXMlpsarWIMZSjcIY1+KmfFX7w0dTFiZYYfqXRi3Nd/FwCOUuUjFC+UJl95uht
         PHXYSFhDsjaxcXREbBsti8L1QOyCfYPfmfrZpQJEkiHhMx9li8nSaUHvBnCASQRtFa32
         6R6EAq8seUeeMXcRWYQC+BvKR/PaFFAJCthOz78fvZPTkpwzB7lMA88bp8xbW/SmiRAb
         XZ2bkDwT7pKdt0xEHu9aGwJ7wKXBiXEYliELOjLheIQlyzfQ74YeZMVU+jbGh7zpG0t4
         brNg==
X-Forwarded-Encrypted: i=1; AKwUvByYxE3p55m0xGzwpcUKcHOqI6W/5bf/mKsShyMI96rEnsGOMlPFWGsuI3l5AZeLu5Ffyx9y/IfGhiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Td1YVzjE9A7MYpAKpZBvdQKEpcsZcBA8WKHpX0l3EnUvZ+fYj
	c08njGSPzsJqCXlFbuE7WIVLRx7ooDKNuaQlK4NALAKba5BqyiHXhOdo5zlWWYbjEhw=
X-Gm-Gg: AYBFou1C4y3DgviOzOVZGx+SkzrwznH/ROZvp5Om8/zonMnR1CjJ1GELNlRvHKF6IJT
	pEtb3NoLKx+DflITPZTYJQhVS+/L6JOuWCR6PcJAhFsfSqY6LZxspyR6xT81LV0pLrAVIfIHZYj
	WNrBRwjUpMqChclLV2dzb4uQT4kRCaVPqNOE9uDcP95lbYggtv5w895nBm3sM2Cin8+DWNXgrWC
	dhnthFF1Hsa9nRNuFwheqC73kqsTzno5NDNHtJbacn8E5IjhyQBnC65v3w6VdetSD8U3ixyk9ZM
	i/3IMbMuq90jQo/XIBxIM5BMuA0Zk+e0TaHBbSW1vr3VodmjGXUTrOXBQp/NWh1gdgEerdQLF1/
	jo1f0o5gpfUHXoKXTVpi1YGIx1dweRFYM22p1RNWR+SMjJaIvLBGRVgxNs+5bKnjIGNG3SwMgEO
	qjdeIA2FlxdJFkdQx7o6viWznbCrVSr5vUNs0N/aYSJVQw3EviCbQ883wbHOXwYIwBqWeXjtqle
	7UaRrZ6c/oFbncqVEQWLADAn3PK4nM9tmbwplFdjVuacBH6WczQP0R0F8N64uJq6WRRvZgakS1B
	PC8dAee/nXx+X71lA+fnpNxk/lBhwbAk
X-Received: by 2002:a05:600c:348d:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4ac19234acbmr385559145e9.33.1793879143001;
        Thu, 05 Nov 2026 03:45:43 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:42 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:04 +0000
Subject: [PATCH v4 16/19] perf test: Allow infinite named_thread loops
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-16-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
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

Tested-by: Leo Yan <leo.yan@arm.com>
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

