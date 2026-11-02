Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621748;
	b=ug0nL0cDUJLRVmOcb+jZx6hi4G2i7+w/Q0JEcZy+BoM9Jrwpig8xP1cPQeX2tKIzLeRh
	 9ddKJ2y7EYXh1XASslEhonUDDfqSeTejWaAF0RpmMj4j95KJHgMwHI7VtExiSUPG4LFDB
	 gjl0s4g4rH3ip5Xvni0hvo6Uq8FIJPC/4n2J3FIjj/rhZoNSdE7FvfFGQvmN2lTjMAzxE
	 lBRdWXkEI5njtpdyoSxZ5oRB3vK9NPVvF2asdRtyYJV5xJbOgEXYaMtfb7NG9vTGD2DmC
	 AeKaD/EmOSHgewT+zXfcCH6QCdoL2rAc4vu3/C/iWd4i6DHysCzhroeKsfSuoW8EGMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=L2B9ns5uTBuNRhpXpJp6nynxxt5/vvxu22eFQQ/6ykM=;
	b=alwGHeDoKWKG230HvgG2vcf7/Gp/m7ePogGUMyp6fackUSD63LCN29I5KdQlIzumWzZA
	 rAIl56Lmq9XHhHm7BjQDP+nwx1WXms5ap0uZ6gqMSte7yaobRBmZQwbfTZ8M+5RCpnKOS
	 +ljyHNEjJoNBM3jfDQbf7WYUdSZEJM5R4LISPa2W4lw0p0mrIEz4p9QUf08DOTJyFjlkQ
	 VUhAWBHqirhnqkilPUhVIILK+c2PZjBsCH6XD/pUhOvJX0h3WMMPN1bFYt8q1L+Istcgk
	 5JgJ5lRh2vjUVtbBUfstC71B3MFarXfGnlOyibqNVpOa38z3u6aWsmYCnYeaHV4n5mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=npdaxsTp;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D339760A2626
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D339760A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=npdaxsTp
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so2308863f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621746; x=1794226546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2B9ns5uTBuNRhpXpJp6nynxxt5/vvxu22eFQQ/6ykM=;
        b=npdaxsTptWNzh369WTt8pLs6s6TkKz+NhpSVCw77vsiC4AkCuJKFFckkZfUWRtY8LZ
         sa+Is7oX/Sc/unqlV8wGmYKDCntNnqqc/qmv3rWhafzV0ZsIqlqsmAZokUjhrCJT3jqn
         1kIAYAfkMTKr1/+/GCiBzfRkBBVQUNn2M1SjU9B5a/D4uQDgievMrTiIqHmszxQ+GhMZ
         3zqZSC4IXVijBxmG1f126ePlb8mgfnw+iNCc+g19wbnLZJ2wLrtuqq1c7Z5YF5QpQtT/
         dv6YwrOSciQ1hTfWe7Lt/yEKogwJTIsUCxaR6nL5bqEcnnCOkLNraHygqxVX6sPGwX+O
         i4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621746; x=1794226546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2B9ns5uTBuNRhpXpJp6nynxxt5/vvxu22eFQQ/6ykM=;
        b=GxPN2aJypDZUYJaORCUTi3W/eF8zoAuZv0xf65Jf0cyPx8V3CLNTRsWzKgi2CEdvCW
         brNil7jg/h22A/lmMIYM/FJAZVOseYL8pelVuS9iJJgKlI9G4WX7m6Rr9fJDPOJ3Lhfx
         /TjlPZGrgFA4MVoSKiJgydlszQJ0NJlXtkbQUV6Zw60oD/0e1NoZEGi+iGSFagWH3AvZ
         H4ViQrBnBLU5pnvC09cTN3p6DyO+DXE/7wI7md0mXWKtXrdkP7XUd5aXs+4KNrwa2rdX
         JJMChPu8CWm2phqYtqlzfzozvqw32gqmLJgy44ZNNxIMWUqwcwzSXh6thAjpsQIt6Zw4
         /QCA==
X-Forwarded-Encrypted: i=1; AKwUvByoeGEw4W81bAyB7J9HlvU6PEsFwXcUtOG3nP+Uv82JSXQU5p7ai8B0K/j99WNA+F/wE9FoHwZqqGs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9Amus3IRrEdLm6/l+cHYVq/bFExtROy+G6740IQCcx0DRBeR+
	C9JnFXSDJranpou6d66qWixdiLI38av8XGmrxM12YwVxTctPmAG2WyLuxRa5chZjwfk=
X-Gm-Gg: AYBFou30w+E2ffKf+w00zVWupci8TTe9jKV3zYFILGQEAY2QyScmrzmpuz6pQ78NV5r
	Zw2RthhyeO/WKVUIWLUli0GyO2VLeS4MWPLfyNRoCF/yn6jOB+JAIdmzF548mInw7lOiAACk6D8
	RvbaOL5608DTf9De1DpIDLfbZKz9gmLtryrF7zZJxzsnnpo8RA+IQgegyijUZMw8LhqtCzUrHNq
	c/2YF3fLrmvaZ0W22mGMWgqA6IId/AM4iwXTo7Ze7zgdkSM6jWRBi/5hSx9CqL371IBH9iGzGXO
	cCxhEULam+kI9tsT6+0vHejmseD5V6LOOn5m9s3nEAMhWwxHVwD328Y+RBkFrY3YkA7AvuZoc6B
	rcdfChEr60qg4B1L9Uu+f5W15w7lIC01PXJLw93qRPI0v272w7ilVnF1AMFNecpE0aqAxxddPFO
	5t3h/mmVrawrNAuoXPDVlLEZech5Nw1SmLj/Qu4pcJjuzhLlyQ77Fx2VGLpw1rN9ZOmZjGIju7t
	5v+ka9PntxQ9baUsd/qEw1vmcOlaq4YZj2/fnnL6jzXJ4Cfb3hzkLTyqihxlQt0/8t4/qLhgPXn
	jAgYDiCQW3eYb718eFpCuW1bJE/W4pyn
X-Received: by 2002:a05:600c:8b01:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ac16fa4f73mr240104835e9.8.1793621746179;
        Mon, 02 Nov 2026 04:15:46 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:45 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:17 +0000
Subject: [PATCH v3 03/18] perf cs-etm: Turn on context packet timestamps in
 per-thread mode
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-3-dbcb0c281b9b@linaro.org>
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

Practically this costs nothing and preempts future changes that will be
made to support decoding trace in order with Perf MMAP and JIT events.
It also helps keep samples in order when we add support for multiple
per-thread mode threads in the next commit.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index acfdb3f53821..47b4e386cc53 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -453,13 +453,26 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 */
 	evsel__set_sample_bit(cs_etm_evsel, CPU);
 
-	/*
-	 * Also the case of per-cpu mmaps, need the contextID in order to be notified
-	 * when a context switch happened.
-	 */
 	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
+		/*
+		 * Timestamps are required to interleave samples from different
+		 * CPUs.
+		 */
 		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		/* Context IDs are required to associate trace to a process */
 		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
+	} else {
+		/*
+		 * Disable periodic timestamps but generate timestamps for trace
+		 * synchronization. Even in per-thread mode with a single
+		 * process we still need to correlate trace to a specific mmap
+		 * around execs, which can be done with only timestamps of trace
+		 * synchronization.
+		 *
+		 * Use MAX to support the kernel widening the field in the
+		 * future.
+		 */
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);
 	}
 
 	/*

-- 
2.43.0

